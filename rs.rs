use std::slice;

#[no_mangle]
#[cfg(_loop)]
pub extern "C" fn add2(values: *const f64, length: i64) -> f64 {
    let mut ret = 0.0;
    let slice = unsafe { slice::from_raw_parts(values, length as usize) };
    for v in slice {
        ret += v * v;
    }

    ret
}


#[no_mangle]
#[cfg(algorithm)]
pub extern "C" fn add2(values: *const f64, length: i64) -> f64 {
    let slice = unsafe { slice::from_raw_parts(values, length as usize) };
    slice
        .iter()
        . map(|x| x*x)
        . sum()
}
