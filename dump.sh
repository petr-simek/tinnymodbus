#!/bin/bash
docker run --rm -v $(pwd):/build -w /build gcc-avr sh -c "avr-objdump -d build/softi2c.o > build/softi2c.s"
