module vjvm

pub struct ByteVec {
mut:
	data []byte = []byte{cap:64}
	len int
}

pub fn (mut b ByteVec) put_byte(bt int) {
	b.resize(1)
	b.put(bt)
}

pub fn (mut b ByteVec) put_2byte(bt1 int, bt2 int) {
	b.resize(2)
	b.put(bt1, bt2)
}

fn (mut b ByteVec) resize(incoming_data_len int) {
	if b.len + incoming_data_len > b.data.len {
		b.data.grow_cap(if b.data.len * 2 > b.data.len + incoming_data_len { b.data.len } else { incoming_data_len })
	}
}

fn (mut b ByteVec) put(bts ...int) {
	for bt in bts {
		b.data << byte(bt)
		b.len += 1
	}
}