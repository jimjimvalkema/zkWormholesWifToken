use dep::std;
use dep::std::slice;

fn main(secret: [u8; 32], burnAddress:[u8; 20], nullifier: pub [u8; 32]) {
    let mut concat = [0; 52];
    //TODO do cleaner or outside of circuit
    for i in 0..52 {
        if i < 32 {
            concat[i] = secret[i];
        } else {
            concat[i] = burnAddress[i-32];
        }
    }
    let computedNullifier = std::hash::sha256(concat);
    assert(nullifier == computedNullifier);
}

#[test]
fn test_main() {
    let secret = [223,2,3,64,160,235,45,12,98,202,111,134,57,86,76,30,208,94,40,196,212,31,56,207,174,228,240,24,98,250,227,179];
    let burnAddress = [122, 211, 109, 126, 143, 7, 99, 63, 216, 180, 141, 219, 51, 75, 63, 89, 76, 125, 100, 202];
    let nullifier = [209, 253, 76, 152, 195, 228, 5, 78, 51, 129, 141, 114, 117, 105, 76, 104, 129, 124, 230, 218, 198, 254, 120, 129, 41, 245, 173, 29, 70, 250, 211, 138];
    main(secret, burnAddress, nullifier);

    //sha256(secret, burnAddy)

    // Uncomment to make test fail
    // main(1, 1);
}
