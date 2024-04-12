import {ethers} from 'ethers'
export class ProofBuilder {

    static getProofInputs(secret) {
        const burnAddress = ethers.sha256(secret).slice(0,-24)
        const burnAddressBytes = ethers.toBeArray(burnAddress)
        const concatBytes = new Uint8Array([...secret,...burnAddressBytes])
        const nullifier = ethers.sha256(concatBytes)
        const nullifierBytes = ethers.toBeArray(nullifier)


        const proofInputs = {burnAddressBytes, nullifierBytes, nullifier}
        return {proofInputs, burnAddress}

    }

}

const secret = new Uint8Array([223,2,3,64,160,235,45,12,98,202,111,134,57,86,76,30,208,94,40,196,212,31,56,207,174,228,240,24,98,250,227,179])
console.log(ProofBuilder.getProofInputs(secret))