module vjvm

pub struct ByteVec {
pub mut:
	data []byte = []byte{cap: 64}
	len  int
}

pub fn (mut b ByteVec) put_byte(bt byte) {
	b.resize(1)
	b.put(bt)
}

pub fn (mut b ByteVec) put_2byte(bt1 byte, bt2 byte) {
	b.resize(2)
	b.put(bt1, bt2)
}

pub fn (mut b ByteVec) put_i16(s i16) {
	b.resize(2)
	b.put(ushift(s, 8), s)
}

pub fn (mut b ByteVec) put_byte_i16(bt byte, s i16) {
	b.resize(3)
	b.put(bt, ushift(s, 8), s)
}

pub fn (mut b ByteVec) put_byte_byte_i16(bt1 byte, bt2 byte, s i16) {
	b.resize(4)
	b.put(bt1, bt2, ushift(s, 8), s)
}

pub fn (mut b ByteVec) put_int(i int) {
	b.resize(4)
	b.put(ushift(i, 24), ushift(i, 16), ushift(i, 8), i)
}

pub fn (mut b ByteVec) put_byte_i16_i16(bt byte, s1 i16, s2 i16) {
	b.resize(5)
	b.put(bt, ushift(s1, 8), s1, ushift(s2, 8), s2)
}

pub fn (mut b ByteVec) put_i64(i i64) {
	b.resize(8)
	mut int_value := int(u64(i) >> 32)
	b.put(ushift(int_value, 24), ushift(int_value, 16), ushift(int_value, 8), int_value)
	int_value = int(i)
	b.put(ushift(int_value, 24), ushift(int_value, 16), ushift(int_value, 8), int_value)
}

pub fn (mut b ByteVec) put_utf8(s string) {
	bytes := s.bytes()
	len := bytes.len
	b.resize(2 + len)
	b.put(ushift(len, 8), len)
	b.put(...bytes.map(int(it)))
}

pub fn (mut b ByteVec) put_bytes(bts []int, offset int, len int) {
	b.resize(len)
	b.put(...bts[offset..offset + len])
}

fn (mut b ByteVec) resize(incoming_data_len int) {
	if b.len + incoming_data_len > b.data.cap {
		b.data.grow_cap(if b.data.len * 2 > b.data.len + incoming_data_len {
			b.data.len
		} else {
			incoming_data_len
		})
	}
}

fn (mut b ByteVec) put(bts ...int) {
	for bt in bts {
		b.data << byte(bt)
		b.len += 1
	}
}

fn ushift(v int, bits int) int {
	return int(u32(v) >> bits)
}
