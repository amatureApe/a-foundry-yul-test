object "Basic" {
  code {
    datacopy(0, dataoffset("Runtime"), datasize("Runtime"))
    return(0, datasize("Runtime"))
  }
  object "Runtime" {
    code {
        let counter := sload(0x0)
        if eq(calldatasize(), 0) {
            mstore(0x0, counter)
            return(0, 0x20)
        }
        counter := add(counter, 1)
        sstore(0x0, counter)
        return(0, 0)
    }
  }
}