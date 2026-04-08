
build/main.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	10 c0       	rjmp	.+32     	; 0x22 <__ctors_end>
       2:	1f c0       	rjmp	.+62     	; 0x42 <__bad_interrupt>
       4:	41 c1       	rjmp	.+642    	; 0x288 <__vector_2>
       6:	1d c0       	rjmp	.+58     	; 0x42 <__bad_interrupt>
       8:	1c c0       	rjmp	.+56     	; 0x42 <__bad_interrupt>
       a:	d5 c1       	rjmp	.+938    	; 0x3b6 <__vector_5>
       c:	1a c0       	rjmp	.+52     	; 0x42 <__bad_interrupt>
       e:	19 c0       	rjmp	.+50     	; 0x42 <__bad_interrupt>
      10:	18 c0       	rjmp	.+48     	; 0x42 <__bad_interrupt>
      12:	17 c0       	rjmp	.+46     	; 0x42 <__bad_interrupt>
      14:	16 c0       	rjmp	.+44     	; 0x42 <__bad_interrupt>
      16:	15 c0       	rjmp	.+42     	; 0x42 <__bad_interrupt>
      18:	14 c0       	rjmp	.+40     	; 0x42 <__bad_interrupt>
      1a:	13 c0       	rjmp	.+38     	; 0x42 <__bad_interrupt>
      1c:	57 c1       	rjmp	.+686    	; 0x2cc <__vector_14>

0000001e <SWVers>:
      1e:	30 2e 34 30                                         0.40

00000022 <__ctors_end>:
      22:	11 24       	eor	r1, r1
      24:	1f be       	out	0x3f, r1	; 63

00000026 <__init_sp>:
      26:	cf e5       	ldi	r28, 0x5F	; 95
      28:	d2 e0       	ldi	r29, 0x02	; 2
      2a:	de bf       	out	0x3e, r29	; 62
      2c:	cd bf       	out	0x3d, r28	; 61

0000002e <__do_clear_bss>:
      2e:	20 e0       	ldi	r18, 0x00	; 0

00000030 <.Loc.1>:
      30:	a0 e6       	ldi	r26, 0x60	; 96

00000032 <.Loc.2>:
      32:	b0 e0       	ldi	r27, 0x00	; 0

00000034 <.Loc.3>:
      34:	01 c0       	rjmp	.+2      	; 0x38 <.Loc.5>

00000036 <.Loc.4>:
      36:	1d 92       	st	X+, r1

00000038 <.Loc.5>:
      38:	a1 3b       	cpi	r26, 0xB1	; 177

0000003a <.Loc.6>:
      3a:	b2 07       	cpc	r27, r18

0000003c <.Loc.7>:
      3c:	e1 f7       	brne	.-8      	; 0x36 <.Loc.4>

0000003e <__call_main>:
      3e:	cf d3       	rcall	.+1950   	; 0x7de <main>
      40:	7b ca       	rjmp	.-2826   	; 0xfffff538 <__eeprom_end+0xff7ef533>

00000042 <__bad_interrupt>:
      42:	de cf       	rjmp	.-68     	; 0x0 <__vectors>

00000044 <usiuartx_bit_reverse>:
      44:	98 2f       	mov	r25, r24
      46:	96 95       	lsr	r25
      48:	95 75       	andi	r25, 0x55	; 85
      4a:	88 0f       	add	r24, r24
      4c:	8a 7a       	andi	r24, 0xAA	; 170
      4e:	98 2b       	or	r25, r24
      50:	89 2f       	mov	r24, r25
      52:	86 95       	lsr	r24
      54:	86 95       	lsr	r24
      56:	83 73       	andi	r24, 0x33	; 51
      58:	99 0f       	add	r25, r25
      5a:	99 0f       	add	r25, r25
      5c:	9c 7c       	andi	r25, 0xCC	; 204
      5e:	89 2b       	or	r24, r25
      60:	82 95       	swap	r24
      62:	08 95       	ret

00000064 <usiuartx_tx_array>:
      64:	ef 92       	push	r14
      66:	ff 92       	push	r15
      68:	0f 93       	push	r16
      6a:	1f 93       	push	r17
      6c:	cf 93       	push	r28
      6e:	df 93       	push	r29
      70:	8c 01       	movw	r16, r24
      72:	ee 24       	eor	r14, r14
      74:	ea 94       	dec	r14
      76:	ff 24       	eor	r15, r15
      78:	f3 94       	inc	r15
      7a:	d6 2f       	mov	r29, r22
      7c:	d8 0f       	add	r29, r24

0000007e <.L6>:
      7e:	f8 01       	movw	r30, r16
      80:	80 81       	ld	r24, Z
      82:	0f 5f       	subi	r16, 0xFF	; 255
      84:	1f 4f       	sbci	r17, 0xFF	; 255
      86:	c0 91 8a 00 	lds	r28, 0x008A	; 0x80008a <usiuartx_tx_head>
      8a:	cf 5f       	subi	r28, 0xFF	; 255
      8c:	cf 71       	andi	r28, 0x1F	; 31

0000008e <.L3>:
      8e:	90 91 8b 00 	lds	r25, 0x008B	; 0x80008b <usiuartx_tx_tail>
      92:	c9 17       	cp	r28, r25
      94:	e1 f3       	breq	.-8      	; 0x8e <.L3>
      96:	d6 df       	rcall	.-84     	; 0x44 <usiuartx_bit_reverse>
      98:	ec 2f       	mov	r30, r28
      9a:	f0 e0       	ldi	r31, 0x00	; 0
      9c:	e6 59       	subi	r30, 0x96	; 150
      9e:	ff 4f       	sbci	r31, 0xFF	; 255
      a0:	80 83       	st	Z, r24
      a2:	c0 93 8a 00 	sts	0x008A, r28	; 0x80008a <usiuartx_tx_head>
      a6:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
      aa:	80 fd       	sbrc	r24, 0
      ac:	18 c0       	rjmp	.+48     	; 0xde <.L4>

000000ae <.L5>:
      ae:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
      b2:	82 fd       	sbrc	r24, 2
      b4:	fc cf       	rjmp	.-8      	; 0xae <.L5>
      b6:	f8 94       	cli
      b8:	12 be       	out	0x32, r1	; 50
      ba:	fc bc       	out	0x2c, r15	; 44
      bc:	f3 be       	out	0x33, r15	; 51
      be:	82 e0       	ldi	r24, 0x02	; 2
      c0:	88 bf       	out	0x38, r24	; 56
      c2:	89 b7       	in	r24, 0x39	; 57
      c4:	82 60       	ori	r24, 0x02	; 2
      c6:	89 bf       	out	0x39, r24	; 57
      c8:	84 e5       	ldi	r24, 0x54	; 84
      ca:	8d b9       	out	0x0d, r24	; 13
      cc:	ef b8       	out	0x0f, r14	; 15
      ce:	ee b8       	out	0x0e, r14	; 14
      d0:	b9 9a       	sbi	0x17, 1	; 23
      d2:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
      d6:	81 60       	ori	r24, 0x01	; 1
      d8:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>
      dc:	78 94       	sei

000000de <.L4>:
      de:	d0 13       	cpse	r29, r16
      e0:	ce cf       	rjmp	.-100    	; 0x7e <.L6>
      e2:	df 91       	pop	r29
      e4:	cf 91       	pop	r28
      e6:	1f 91       	pop	r17
      e8:	0f 91       	pop	r16
      ea:	ff 90       	pop	r15
      ec:	ef 90       	pop	r14
      ee:	08 95       	ret

000000f0 <clcCRC16>:
      f0:	38 2f       	mov	r19, r24
      f2:	e8 2f       	mov	r30, r24
      f4:	f9 2f       	mov	r31, r25
      f6:	8f ef       	ldi	r24, 0xFF	; 255
      f8:	9f ef       	ldi	r25, 0xFF	; 255

000000fa <.L12>:
      fa:	21 91       	ld	r18, Z+
      fc:	82 27       	eor	r24, r18
      fe:	28 e0       	ldi	r18, 0x08	; 8

00000100 <.L11>:
     100:	dc 01       	movw	r26, r24
     102:	b6 95       	lsr	r27
     104:	a7 95       	ror	r26
     106:	48 2f       	mov	r20, r24
     108:	cd 01       	movw	r24, r26
     10a:	40 ff       	sbrs	r20, 0
     10c:	04 c0       	rjmp	.+8      	; 0x116 <.L15>
     10e:	41 e0       	ldi	r20, 0x01	; 1
     110:	84 27       	eor	r24, r20
     112:	40 ea       	ldi	r20, 0xA0	; 160
     114:	94 27       	eor	r25, r20

00000116 <.L15>:
     116:	21 50       	subi	r18, 0x01	; 1
     118:	99 f7       	brne	.-26     	; 0x100 <.L11>
     11a:	2e 2f       	mov	r18, r30
     11c:	23 1b       	sub	r18, r19
     11e:	26 17       	cp	r18, r22
     120:	60 f3       	brcs	.-40     	; 0xfa <.L12>
     122:	08 95       	ret

00000124 <send_modbus_array>:
     124:	1f 93       	push	r17
     126:	cf 93       	push	r28
     128:	df 93       	push	r29
     12a:	ec 01       	movw	r28, r24
     12c:	16 2f       	mov	r17, r22
     12e:	6e ef       	ldi	r22, 0xFE	; 254
     130:	61 0f       	add	r22, r17
     132:	de df       	rcall	.-68     	; 0xf0 <clcCRC16>
     134:	9e 01       	movw	r18, r28
     136:	21 0f       	add	r18, r17
     138:	31 1d       	adc	r19, r1
     13a:	f9 01       	movw	r30, r18
     13c:	32 97       	sbiw	r30, 0x02	; 2
     13e:	81 93       	st	Z+, r24
     140:	90 83       	st	Z, r25
     142:	61 2f       	mov	r22, r17
     144:	ce 01       	movw	r24, r28
     146:	df 91       	pop	r29
     148:	cf 91       	pop	r28
     14a:	1f 91       	pop	r17
     14c:	8b cf       	rjmp	.-234    	; 0x64 <usiuartx_tx_array>

0000014e <clcCRC8.constprop.0>:
     14e:	fc 01       	movw	r30, r24
     150:	90 81       	ld	r25, Z
     152:	28 e0       	ldi	r18, 0x08	; 8
     154:	31 e3       	ldi	r19, 0x31	; 49

00000156 <.L20>:
     156:	89 2f       	mov	r24, r25
     158:	88 0f       	add	r24, r24
     15a:	97 ff       	sbrs	r25, 7
     15c:	03 c0       	rjmp	.+6      	; 0x164 <.L30>
     15e:	98 2f       	mov	r25, r24
     160:	93 27       	eor	r25, r19
     162:	01 c0       	rjmp	.+2      	; 0x166 <.L22>

00000164 <.L30>:
     164:	98 2f       	mov	r25, r24

00000166 <.L22>:
     166:	21 50       	subi	r18, 0x01	; 1
     168:	b1 f7       	brne	.-20     	; 0x156 <.L20>
     16a:	81 81       	ldd	r24, Z+1	; 0x01
     16c:	89 27       	eor	r24, r25
     16e:	98 e0       	ldi	r25, 0x08	; 8
     170:	31 e3       	ldi	r19, 0x31	; 49

00000172 <.L25>:
     172:	28 2f       	mov	r18, r24
     174:	22 0f       	add	r18, r18
     176:	87 ff       	sbrs	r24, 7
     178:	03 c0       	rjmp	.+6      	; 0x180 <.L32>
     17a:	82 2f       	mov	r24, r18
     17c:	83 27       	eor	r24, r19
     17e:	01 c0       	rjmp	.+2      	; 0x182 <.L27>

00000180 <.L32>:
     180:	82 2f       	mov	r24, r18

00000182 <.L27>:
     182:	91 50       	subi	r25, 0x01	; 1
     184:	b1 f7       	brne	.-20     	; 0x172 <.L25>
     186:	08 95       	ret

00000188 <oneWireWriteBit1.constprop.0>:
     188:	8f b7       	in	r24, 0x3f	; 63
     18a:	f8 94       	cli
     18c:	bc 9a       	sbi	0x17, 4	; 23
     18e:	c4 98       	cbi	0x18, 4	; 24
     190:	90 e1       	ldi	r25, 0x10	; 16

00000192 <.L1^B1>:
     192:	9a 95       	dec	r25
     194:	f1 f7       	brne	.-4      	; 0x192 <.L1^B1>
     196:	bc 98       	cbi	0x17, 4	; 23
     198:	c4 98       	cbi	0x18, 4	; 24
     19a:	9a ea       	ldi	r25, 0xAA	; 170

0000019c <.L1^B2>:
     19c:	9a 95       	dec	r25
     19e:	f1 f7       	brne	.-4      	; 0x19c <.L1^B2>
     1a0:	00 c0       	rjmp	.+0      	; 0x1a2 <L0^A>

000001a2 <L0^A>:
     1a2:	8f bf       	out	0x3f, r24	; 63
     1a4:	08 95       	ret

000001a6 <oneWireWriteBit0.constprop.0>:
     1a6:	8f b7       	in	r24, 0x3f	; 63
     1a8:	f8 94       	cli
     1aa:	bc 9a       	sbi	0x17, 4	; 23
     1ac:	c4 98       	cbi	0x18, 4	; 24
     1ae:	90 ea       	ldi	r25, 0xA0	; 160

000001b0 <.L1^B3>:
     1b0:	9a 95       	dec	r25
     1b2:	f1 f7       	brne	.-4      	; 0x1b0 <.L1^B3>
     1b4:	bc 98       	cbi	0x17, 4	; 23
     1b6:	c4 98       	cbi	0x18, 4	; 24
     1b8:	9a e1       	ldi	r25, 0x1A	; 26

000001ba <.L1^B4>:
     1ba:	9a 95       	dec	r25
     1bc:	f1 f7       	brne	.-4      	; 0x1ba <.L1^B4>
     1be:	00 c0       	rjmp	.+0      	; 0x1c0 <L0^A>

000001c0 <L0^A>:
     1c0:	8f bf       	out	0x3f, r24	; 63
     1c2:	08 95       	ret

000001c4 <oneWireSendByte.constprop.0>:
     1c4:	cf 93       	push	r28
     1c6:	df 93       	push	r29
     1c8:	d8 2f       	mov	r29, r24
     1ca:	c8 e0       	ldi	r28, 0x08	; 8

000001cc <.L39>:
     1cc:	d0 ff       	sbrs	r29, 0
     1ce:	07 c0       	rjmp	.+14     	; 0x1de <.L37>
     1d0:	db df       	rcall	.-74     	; 0x188 <oneWireWriteBit1.constprop.0>

000001d2 <.L38>:
     1d2:	d6 95       	lsr	r29
     1d4:	c1 50       	subi	r28, 0x01	; 1
     1d6:	d1 f7       	brne	.-12     	; 0x1cc <.L39>
     1d8:	df 91       	pop	r29
     1da:	cf 91       	pop	r28
     1dc:	08 95       	ret

000001de <.L37>:
     1de:	e3 df       	rcall	.-58     	; 0x1a6 <oneWireWriteBit0.constprop.0>
     1e0:	f8 cf       	rjmp	.-16     	; 0x1d2 <.L38>

000001e2 <oneWireMatchRom.constprop.0>:
     1e2:	0f 93       	push	r16
     1e4:	1f 93       	push	r17
     1e6:	cf 93       	push	r28
     1e8:	df 93       	push	r29
     1ea:	ec 01       	movw	r28, r24
     1ec:	85 e5       	ldi	r24, 0x55	; 85
     1ee:	ea df       	rcall	.-44     	; 0x1c4 <oneWireSendByte.constprop.0>
     1f0:	8e 01       	movw	r16, r28
     1f2:	08 5f       	subi	r16, 0xF8	; 248
     1f4:	1f 4f       	sbci	r17, 0xFF	; 255

000001f6 <.L42>:
     1f6:	fe 01       	movw	r30, r28
     1f8:	21 96       	adiw	r28, 0x01	; 1
     1fa:	80 81       	ld	r24, Z
     1fc:	e3 df       	rcall	.-58     	; 0x1c4 <oneWireSendByte.constprop.0>
     1fe:	c0 17       	cp	r28, r16
     200:	d1 07       	cpc	r29, r17
     202:	c9 f7       	brne	.-14     	; 0x1f6 <.L42>
     204:	df 91       	pop	r29
     206:	cf 91       	pop	r28
     208:	1f 91       	pop	r17
     20a:	0f 91       	pop	r16
     20c:	08 95       	ret

0000020e <oneWireReadBit.constprop.0>:
     20e:	9f b7       	in	r25, 0x3f	; 63
     210:	f8 94       	cli
     212:	bc 9a       	sbi	0x17, 4	; 23
     214:	c4 98       	cbi	0x18, 4	; 24
     216:	20 e1       	ldi	r18, 0x10	; 16

00000218 <.L1^B5>:
     218:	2a 95       	dec	r18
     21a:	f1 f7       	brne	.-4      	; 0x218 <.L1^B5>
     21c:	bc 98       	cbi	0x17, 4	; 23
     21e:	c4 98       	cbi	0x18, 4	; 24
     220:	88 e1       	ldi	r24, 0x18	; 24

00000222 <.L1^B6>:
     222:	8a 95       	dec	r24
     224:	f1 f7       	brne	.-4      	; 0x222 <.L1^B6>
     226:	86 b3       	in	r24, 0x16	; 22
     228:	22 e9       	ldi	r18, 0x92	; 146

0000022a <.L1^B7>:
     22a:	2a 95       	dec	r18
     22c:	f1 f7       	brne	.-4      	; 0x22a <.L1^B7>
     22e:	00 c0       	rjmp	.+0      	; 0x230 <L0^A>

00000230 <L0^A>:
     230:	9f bf       	out	0x3f, r25	; 63
     232:	80 71       	andi	r24, 0x10	; 16
     234:	08 95       	ret

00000236 <oneWireReceiveByte.constprop.0>:
     236:	cf 93       	push	r28
     238:	df 93       	push	r29
     23a:	c0 e0       	ldi	r28, 0x00	; 0
     23c:	d8 e0       	ldi	r29, 0x08	; 8

0000023e <.L47>:
     23e:	c6 95       	lsr	r28
     240:	e6 df       	rcall	.-52     	; 0x20e <oneWireReadBit.constprop.0>
     242:	81 11       	cpse	r24, r1
     244:	c0 68       	ori	r28, 0x80	; 128
     246:	d1 50       	subi	r29, 0x01	; 1
     248:	d1 f7       	brne	.-12     	; 0x23e <.L47>
     24a:	8c 2f       	mov	r24, r28
     24c:	df 91       	pop	r29
     24e:	cf 91       	pop	r28
     250:	08 95       	ret

00000252 <oneWireDetectPresence.constprop.0>:
     252:	9f b7       	in	r25, 0x3f	; 63
     254:	f8 94       	cli
     256:	bc 9a       	sbi	0x17, 4	; 23
     258:	c4 98       	cbi	0x18, 4	; 24
     25a:	ef eb       	ldi	r30, 0xBF	; 191
     25c:	f3 e0       	ldi	r31, 0x03	; 3

0000025e <.L1^B8>:
     25e:	31 97       	sbiw	r30, 0x01	; 1
     260:	f1 f7       	brne	.-4      	; 0x25e <.L1^B8>
     262:	00 c0       	rjmp	.+0      	; 0x264 <L0^A>

00000264 <L0^A>:
     264:	00 00       	nop
     266:	bc 98       	cbi	0x17, 4	; 23
     268:	c4 98       	cbi	0x18, 4	; 24
     26a:	fa eb       	ldi	r31, 0xBA	; 186

0000026c <.L1^B9>:
     26c:	fa 95       	dec	r31
     26e:	f1 f7       	brne	.-4      	; 0x26c <.L1^B9>
     270:	00 c0       	rjmp	.+0      	; 0x272 <L0^A>

00000272 <L0^A>:
     272:	86 b3       	in	r24, 0x16	; 22
     274:	e3 e3       	ldi	r30, 0x33	; 51
     276:	f3 e0       	ldi	r31, 0x03	; 3

00000278 <.L1^B10>:
     278:	31 97       	sbiw	r30, 0x01	; 1
     27a:	f1 f7       	brne	.-4      	; 0x278 <.L1^B10>
     27c:	00 c0       	rjmp	.+0      	; 0x27e <L0^A>

0000027e <L0^A>:
     27e:	00 00       	nop
     280:	9f bf       	out	0x3f, r25	; 63
     282:	80 95       	com	r24
     284:	80 71       	andi	r24, 0x10	; 16
     286:	08 95       	ret

00000288 <__vector_2>:
     288:	8f 93       	push	r24
     28a:	8f b7       	in	r24, 0x3f	; 63
     28c:	8f 93       	push	r24
     28e:	b0 99       	sbic	0x16, 0	; 22
     290:	19 c0       	rjmp	.+50     	; 0x2c4 <.L53>
     292:	81 e1       	ldi	r24, 0x11	; 17
     294:	82 bf       	out	0x32, r24	; 50
     296:	82 b7       	in	r24, 0x32	; 50
     298:	88 56       	subi	r24, 0x68	; 104
     29a:	82 bf       	out	0x32, r24	; 50
     29c:	81 e0       	ldi	r24, 0x01	; 1
     29e:	8c bd       	out	0x2c, r24	; 44
     2a0:	83 bf       	out	0x33, r24	; 51
     2a2:	82 e0       	ldi	r24, 0x02	; 2
     2a4:	88 bf       	out	0x38, r24	; 56
     2a6:	89 b7       	in	r24, 0x39	; 57
     2a8:	82 60       	ori	r24, 0x02	; 2
     2aa:	89 bf       	out	0x39, r24	; 57
     2ac:	84 e5       	ldi	r24, 0x54	; 84
     2ae:	8d b9       	out	0x0d, r24	; 13
     2b0:	87 ef       	ldi	r24, 0xF7	; 247
     2b2:	8e b9       	out	0x0e, r24	; 14
     2b4:	8b b7       	in	r24, 0x3b	; 59
     2b6:	8f 7d       	andi	r24, 0xDF	; 223
     2b8:	8b bf       	out	0x3b, r24	; 59
     2ba:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     2be:	84 60       	ori	r24, 0x04	; 4
     2c0:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>

000002c4 <.L53>:
     2c4:	8f 91       	pop	r24
     2c6:	8f bf       	out	0x3f, r24	; 63
     2c8:	8f 91       	pop	r24
     2ca:	18 95       	reti

000002cc <__vector_14>:
     2cc:	1f 92       	push	r1
     2ce:	1f b6       	in	r1, 0x3f	; 63
     2d0:	1f 92       	push	r1
     2d2:	11 24       	eor	r1, r1
     2d4:	8f 93       	push	r24
     2d6:	9f 93       	push	r25
     2d8:	ef 93       	push	r30
     2da:	ff 93       	push	r31
     2dc:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     2e0:	80 ff       	sbrs	r24, 0
     2e2:	4f c0       	rjmp	.+158    	; 0x382 <.L56>
     2e4:	c3 9a       	sbi	0x18, 3	; 24
     2e6:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     2ea:	81 ff       	sbrs	r24, 1
     2ec:	16 c0       	rjmp	.+44     	; 0x31a <.L57>
     2ee:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     2f2:	8d 7f       	andi	r24, 0xFD	; 253
     2f4:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>
     2f8:	8b ef       	ldi	r24, 0xFB	; 251
     2fa:	8e b9       	out	0x0e, r24	; 14
     2fc:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <r15>
     300:	88 0f       	add	r24, r24
     302:	88 0f       	add	r24, r24
     304:	88 0f       	add	r24, r24
     306:	87 60       	ori	r24, 0x07	; 7

00000308 <.L62>:
     308:	8f b9       	out	0x0f, r24	; 15

0000030a <.L55>:
     30a:	ff 91       	pop	r31
     30c:	ef 91       	pop	r30
     30e:	9f 91       	pop	r25
     310:	8f 91       	pop	r24
     312:	1f 90       	pop	r1
     314:	1f be       	out	0x3f, r1	; 63
     316:	1f 90       	pop	r1
     318:	18 95       	reti

0000031a <.L57>:
     31a:	90 91 8a 00 	lds	r25, 0x008A	; 0x80008a <usiuartx_tx_head>
     31e:	80 91 8b 00 	lds	r24, 0x008B	; 0x80008b <usiuartx_tx_tail>
     322:	98 17       	cp	r25, r24
     324:	c9 f0       	breq	.+50     	; 0x358 <.L59>
     326:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     32a:	82 60       	ori	r24, 0x02	; 2
     32c:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>
     330:	e0 91 8b 00 	lds	r30, 0x008B	; 0x80008b <usiuartx_tx_tail>
     334:	ef 5f       	subi	r30, 0xFF	; 255
     336:	ef 71       	andi	r30, 0x1F	; 31
     338:	e0 93 8b 00 	sts	0x008B, r30	; 0x80008b <usiuartx_tx_tail>
     33c:	f0 e0       	ldi	r31, 0x00	; 0
     33e:	e6 59       	subi	r30, 0x96	; 150
     340:	ff 4f       	sbci	r31, 0xFF	; 255
     342:	80 81       	ld	r24, Z
     344:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <r15>
     348:	8b ef       	ldi	r24, 0xFB	; 251
     34a:	8e b9       	out	0x0e, r24	; 14
     34c:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <r15>
     350:	86 95       	lsr	r24
     352:	86 95       	lsr	r24
     354:	80 68       	ori	r24, 0x80	; 128
     356:	d8 cf       	rjmp	.-80     	; 0x308 <.L62>

00000358 <.L59>:
     358:	c3 98       	cbi	0x18, 3	; 24
     35a:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     35e:	8e 7f       	andi	r24, 0xFE	; 254

00000360 <.L63>:
     360:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>

00000364 <.L61>:
     364:	13 be       	out	0x33, r1	; 51
     366:	88 b3       	in	r24, 0x18	; 24
     368:	83 60       	ori	r24, 0x03	; 3
     36a:	88 bb       	out	0x18, r24	; 24
     36c:	87 b3       	in	r24, 0x17	; 23
     36e:	8c 7f       	andi	r24, 0xFC	; 252
     370:	87 bb       	out	0x17, r24	; 23
     372:	1d b8       	out	0x0d, r1	; 13
     374:	80 e2       	ldi	r24, 0x20	; 32
     376:	8a bf       	out	0x3a, r24	; 58
     378:	8b b7       	in	r24, 0x3b	; 59
     37a:	80 62       	ori	r24, 0x20	; 32
     37c:	8b bf       	out	0x3b, r24	; 59
     37e:	a8 9a       	sbi	0x15, 0	; 21
     380:	c4 cf       	rjmp	.-120    	; 0x30a <.L55>

00000382 <.L56>:
     382:	c3 98       	cbi	0x18, 3	; 24
     384:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     388:	8b 7f       	andi	r24, 0xFB	; 251
     38a:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <USI_UART_status>
     38e:	e0 91 ad 00 	lds	r30, 0x00AD	; 0x8000ad <usiuartx_rx_head>
     392:	ef 5f       	subi	r30, 0xFF	; 255
     394:	ef 71       	andi	r30, 0x1F	; 31
     396:	80 91 ac 00 	lds	r24, 0x00AC	; 0x8000ac <usiuartx_rx_tail>
     39a:	8e 13       	cpse	r24, r30
     39c:	04 c0       	rjmp	.+8      	; 0x3a6 <.L60>
     39e:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <USI_UART_status>
     3a2:	88 60       	ori	r24, 0x08	; 8
     3a4:	dd cf       	rjmp	.-70     	; 0x360 <.L63>

000003a6 <.L60>:
     3a6:	e0 93 ad 00 	sts	0x00AD, r30	; 0x8000ad <usiuartx_rx_head>
     3aa:	8f b1       	in	r24, 0x0f	; 15
     3ac:	f0 e0       	ldi	r31, 0x00	; 0
     3ae:	e4 57       	subi	r30, 0x74	; 116
     3b0:	ff 4f       	sbci	r31, 0xFF	; 255
     3b2:	80 83       	st	Z, r24
     3b4:	d7 cf       	rjmp	.-82     	; 0x364 <.L61>

000003b6 <__vector_5>:
     3b6:	8f 93       	push	r24
     3b8:	8f b7       	in	r24, 0x3f	; 63
     3ba:	8f 93       	push	r24
     3bc:	82 b7       	in	r24, 0x32	; 50
     3be:	8e 5c       	subi	r24, 0xCE	; 206
     3c0:	82 bf       	out	0x32, r24	; 50
     3c2:	8f 91       	pop	r24
     3c4:	8f bf       	out	0x3f, r24	; 63
     3c6:	8f 91       	pop	r24
     3c8:	18 95       	reti

000003ca <ass_i2c_delay_half>:
     3ca:	92 e3       	ldi	r25, 0x32	; 50

000003cc <_Lidelay>:
     3cc:	9a 95       	dec	r25
     3ce:	f1 f7       	brne	.-4      	; 0x3cc <_Lidelay>
     3d0:	08 95       	ret

000003d2 <ass_i2c_wait_scl_high>:
     3d2:	b0 e0       	ldi	r27, 0x00	; 0
     3d4:	a8 ec       	ldi	r26, 0xC8	; 200

000003d6 <_Lwait_stretch>:
     3d6:	00 24       	eor	r0, r0

000003d8 <_Lwait_stretch_inner_loop>:
     3d8:	09 d0       	rcall	.+18     	; 0x3ec <_Lcheck_scl_level>
     3da:	32 f4       	brpl	.+12     	; 0x3e8 <_Lstretch_done>
     3dc:	0a 94       	dec	r0
     3de:	e1 f7       	brne	.-8      	; 0x3d8 <_Lwait_stretch_inner_loop>
     3e0:	11 97       	sbiw	r26, 0x01	; 1
     3e2:	c9 f7       	brne	.-14     	; 0x3d6 <_Lwait_stretch>
     3e4:	28 94       	sen
     3e6:	08 c0       	rjmp	.+16     	; 0x3f8 <i2c_init>

000003e8 <_Lstretch_done>:
     3e8:	a8 94       	cln
     3ea:	06 c0       	rjmp	.+12     	; 0x3f8 <i2c_init>

000003ec <_Lcheck_scl_level>:
     3ec:	a8 94       	cln
     3ee:	b2 99       	sbic	0x16, 2	; 22
     3f0:	01 c0       	rjmp	.+2      	; 0x3f4 <_Lscl_high>
     3f2:	28 94       	sen

000003f4 <_Lscl_high>:
     3f4:	00 00       	nop
     3f6:	08 95       	ret

000003f8 <i2c_init>:
     3f8:	bc 98       	cbi	0x17, 4	; 23
     3fa:	ba 98       	cbi	0x17, 2	; 23
     3fc:	c4 9a       	sbi	0x18, 4	; 24
     3fe:	c2 9a       	sbi	0x18, 2	; 24
     400:	88 27       	eor	r24, r24
     402:	99 27       	eor	r25, r25
     404:	b4 9b       	sbis	0x16, 4	; 22
     406:	03 c0       	rjmp	.+6      	; 0x40e <_Li2c_init_sda_low>
     408:	b2 9b       	sbis	0x16, 2	; 22
     40a:	04 c0       	rjmp	.+8      	; 0x414 <_Li2c_init_scl_low>
     40c:	08 95       	ret

0000040e <_Li2c_init_sda_low>:
     40e:	81 e0       	ldi	r24, 0x01	; 1
     410:	99 27       	eor	r25, r25
     412:	08 95       	ret

00000414 <_Li2c_init_scl_low>:
     414:	82 e0       	ldi	r24, 0x02	; 2
     416:	99 27       	eor	r25, r25
     418:	08 95       	ret
     41a:	83 e0       	ldi	r24, 0x03	; 3
     41c:	08 95       	ret

0000041e <i2c_start>:
     41e:	f8 94       	cli
     420:	b2 9b       	sbis	0x16, 2	; 22
     422:	d7 df       	rcall	.-82     	; 0x3d2 <ass_i2c_wait_scl_high>
     424:	c4 98       	cbi	0x18, 4	; 24
     426:	bc 9a       	sbi	0x17, 4	; 23
     428:	d0 df       	rcall	.-96     	; 0x3ca <ass_i2c_delay_half>
     42a:	2a d0       	rcall	.+84     	; 0x480 <ass_i2c_write>
     42c:	18 f0       	brcs	.+6      	; 0x434 <_Li2c_start_ok>
     42e:	81 e0       	ldi	r24, 0x01	; 1
     430:	99 27       	eor	r25, r25
     432:	08 95       	ret

00000434 <_Li2c_start_ok>:
     434:	80 e0       	ldi	r24, 0x00	; 0
     436:	99 27       	eor	r25, r25
     438:	08 95       	ret
     43a:	81 e0       	ldi	r24, 0x01	; 1
     43c:	08 95       	ret

0000043e <i2c_rep_start>:
     43e:	f8 94       	cli
     440:	c2 98       	cbi	0x18, 2	; 24
     442:	ba 9a       	sbi	0x17, 2	; 23
     444:	c2 df       	rcall	.-124    	; 0x3ca <ass_i2c_delay_half>
     446:	bc 98       	cbi	0x17, 4	; 23
     448:	c4 9a       	sbi	0x18, 4	; 24
     44a:	bf df       	rcall	.-130    	; 0x3ca <ass_i2c_delay_half>
     44c:	ba 98       	cbi	0x17, 2	; 23
     44e:	c2 9a       	sbi	0x18, 2	; 24
     450:	bc df       	rcall	.-136    	; 0x3ca <ass_i2c_delay_half>
     452:	b2 9b       	sbis	0x16, 2	; 22
     454:	be df       	rcall	.-132    	; 0x3d2 <ass_i2c_wait_scl_high>
     456:	c4 98       	cbi	0x18, 4	; 24
     458:	bc 9a       	sbi	0x17, 4	; 23
     45a:	b7 df       	rcall	.-146    	; 0x3ca <ass_i2c_delay_half>
     45c:	11 c0       	rjmp	.+34     	; 0x480 <ass_i2c_write>
     45e:	81 e0       	ldi	r24, 0x01	; 1
     460:	08 95       	ret

00000462 <ass_i2c_stop>:
     462:	c2 98       	cbi	0x18, 2	; 24
     464:	ba 9a       	sbi	0x17, 2	; 23
     466:	c4 98       	cbi	0x18, 4	; 24
     468:	bc 9a       	sbi	0x17, 4	; 23
     46a:	af df       	rcall	.-162    	; 0x3ca <ass_i2c_delay_half>
     46c:	ba 98       	cbi	0x17, 2	; 23
     46e:	c2 9a       	sbi	0x18, 2	; 24
     470:	ac df       	rcall	.-168    	; 0x3ca <ass_i2c_delay_half>
     472:	b2 9b       	sbis	0x16, 2	; 22
     474:	ae df       	rcall	.-164    	; 0x3d2 <ass_i2c_wait_scl_high>
     476:	bc 98       	cbi	0x17, 4	; 23
     478:	c4 9a       	sbi	0x18, 4	; 24
     47a:	a7 df       	rcall	.-178    	; 0x3ca <ass_i2c_delay_half>
     47c:	78 94       	sei
     47e:	08 95       	ret

00000480 <ass_i2c_write>:
     480:	08 94       	sec
     482:	88 1f       	adc	r24, r24
     484:	01 c0       	rjmp	.+2      	; 0x488 <_Li2c_write_first>

00000486 <_Li2c_write_bit>:
     486:	88 0f       	add	r24, r24

00000488 <_Li2c_write_first>:
     488:	d9 f0       	breq	.+54     	; 0x4c0 <_Li2c_get_ack>
     48a:	c2 98       	cbi	0x18, 2	; 24
     48c:	ba 9a       	sbi	0x17, 2	; 23
     48e:	00 00       	nop
     490:	00 00       	nop
     492:	00 00       	nop
     494:	20 f4       	brcc	.+8      	; 0x49e <_Li2c_write_low>
     496:	00 00       	nop
     498:	bc 98       	cbi	0x17, 4	; 23
     49a:	c4 9a       	sbi	0x18, 4	; 24
     49c:	03 c0       	rjmp	.+6      	; 0x4a4 <_Li2c_write_high>

0000049e <_Li2c_write_low>:
     49e:	c4 98       	cbi	0x18, 4	; 24
     4a0:	bc 9a       	sbi	0x17, 4	; 23
     4a2:	00 c0       	rjmp	.+0      	; 0x4a4 <_Li2c_write_high>

000004a4 <_Li2c_write_high>:
     4a4:	92 df       	rcall	.-220    	; 0x3ca <ass_i2c_delay_half>
     4a6:	ba 98       	cbi	0x17, 2	; 23
     4a8:	c2 9a       	sbi	0x18, 2	; 24
     4aa:	a8 94       	cln
     4ac:	00 00       	nop
     4ae:	00 00       	nop
     4b0:	00 00       	nop
     4b2:	b2 9b       	sbis	0x16, 2	; 22
     4b4:	8e df       	rcall	.-228    	; 0x3d2 <ass_i2c_wait_scl_high>
     4b6:	12 f4       	brpl	.+4      	; 0x4bc <_Ldelay_scl_high>

000004b8 <_Li2c_write_return_false>:
     4b8:	88 27       	eor	r24, r24
     4ba:	15 c0       	rjmp	.+42     	; 0x4e6 <_Li2c_write_return>

000004bc <_Ldelay_scl_high>:
     4bc:	86 df       	rcall	.-244    	; 0x3ca <ass_i2c_delay_half>
     4be:	e3 cf       	rjmp	.-58     	; 0x486 <_Li2c_write_bit>

000004c0 <_Li2c_get_ack>:
     4c0:	c2 98       	cbi	0x18, 2	; 24
     4c2:	ba 9a       	sbi	0x17, 2	; 23
     4c4:	00 00       	nop
     4c6:	00 00       	nop
     4c8:	bc 98       	cbi	0x17, 4	; 23
     4ca:	c4 9a       	sbi	0x18, 4	; 24
     4cc:	7e df       	rcall	.-260    	; 0x3ca <ass_i2c_delay_half>
     4ce:	99 27       	eor	r25, r25
     4d0:	88 27       	eor	r24, r24
     4d2:	ba 98       	cbi	0x17, 2	; 23
     4d4:	c2 9a       	sbi	0x18, 2	; 24

000004d6 <_Li2c_ack_wait>:
     4d6:	a8 94       	cln
     4d8:	00 00       	nop
     4da:	b2 9b       	sbis	0x16, 2	; 22
     4dc:	7a df       	rcall	.-268    	; 0x3d2 <ass_i2c_wait_scl_high>
     4de:	62 f3       	brmi	.-40     	; 0x4b8 <_Li2c_write_return_false>
     4e0:	b4 9b       	sbis	0x16, 4	; 22
     4e2:	81 e0       	ldi	r24, 0x01	; 1
     4e4:	72 df       	rcall	.-284    	; 0x3ca <ass_i2c_delay_half>

000004e6 <_Li2c_write_return>:
     4e6:	00 00       	nop
     4e8:	00 00       	nop
     4ea:	c2 98       	cbi	0x18, 2	; 24
     4ec:	ba 9a       	sbi	0x17, 2	; 23
     4ee:	08 95       	ret
     4f0:	81 e0       	ldi	r24, 0x01	; 1
     4f2:	08 95       	ret

000004f4 <scd41SetAmbientPressure>:
     4f4:	cf 93       	push	r28
     4f6:	df 93       	push	r29
     4f8:	00 d0       	rcall	.+0      	; 0x4fa <L0^A>

000004fa <L0^A>:
     4fa:	0f 92       	push	r0
     4fc:	cd b7       	in	r28, 0x3d	; 61
     4fe:	de b7       	in	r29, 0x3e	; 62
     500:	89 83       	std	Y+1, r24	; 0x01
     502:	9a 83       	std	Y+2, r25	; 0x02
     504:	79 df       	rcall	.-270    	; 0x3f8 <i2c_init>
     506:	84 ec       	ldi	r24, 0xC4	; 196
     508:	8a df       	rcall	.-236    	; 0x41e <i2c_start>
     50a:	80 ee       	ldi	r24, 0xE0	; 224
     50c:	b9 df       	rcall	.-142    	; 0x480 <ass_i2c_write>
     50e:	80 e0       	ldi	r24, 0x00	; 0
     510:	b7 df       	rcall	.-146    	; 0x480 <ass_i2c_write>
     512:	89 81       	ldd	r24, Y+1	; 0x01
     514:	8b 83       	std	Y+3, r24	; 0x03
     516:	8a 81       	ldd	r24, Y+2	; 0x02
     518:	b3 df       	rcall	.-154    	; 0x480 <ass_i2c_write>
     51a:	8b 81       	ldd	r24, Y+3	; 0x03
     51c:	b1 df       	rcall	.-158    	; 0x480 <ass_i2c_write>
     51e:	ce 01       	movw	r24, r28
     520:	01 96       	adiw	r24, 0x01	; 1
     522:	15 de       	rcall	.-982    	; 0x14e <clcCRC8.constprop.0>
     524:	ad df       	rcall	.-166    	; 0x480 <ass_i2c_write>
     526:	9d df       	rcall	.-198    	; 0x462 <ass_i2c_stop>
     528:	0f 90       	pop	r0
     52a:	0f 90       	pop	r0
     52c:	0f 90       	pop	r0
     52e:	df 91       	pop	r29
     530:	cf 91       	pop	r28
     532:	08 95       	ret

00000534 <i2c_read>:
     534:	71 e0       	ldi	r23, 0x01	; 1

00000536 <_Li2c_read_bit>:
     536:	c2 98       	cbi	0x18, 2	; 24
     538:	ba 9a       	sbi	0x17, 2	; 23
     53a:	bc 98       	cbi	0x17, 4	; 23
     53c:	c4 9a       	sbi	0x18, 4	; 24
     53e:	00 00       	nop
     540:	00 00       	nop
     542:	00 00       	nop
     544:	42 df       	rcall	.-380    	; 0x3ca <ass_i2c_delay_half>
     546:	ba 98       	cbi	0x17, 2	; 23
     548:	c2 9a       	sbi	0x18, 2	; 24
     54a:	3f df       	rcall	.-386    	; 0x3ca <ass_i2c_delay_half>
     54c:	a8 94       	cln
     54e:	00 00       	nop
     550:	00 00       	nop
     552:	00 00       	nop
     554:	b2 9b       	sbis	0x16, 2	; 22
     556:	3d df       	rcall	.-390    	; 0x3d2 <ass_i2c_wait_scl_high>
     558:	d2 f0       	brmi	.+52     	; 0x58e <_Li2c_read_return>
     55a:	88 94       	clc
     55c:	b4 99       	sbic	0x16, 4	; 22
     55e:	08 94       	sec
     560:	77 1f       	adc	r23, r23
     562:	48 f7       	brcc	.-46     	; 0x536 <_Li2c_read_bit>

00000564 <_Li2c_put_ack>:
     564:	c2 98       	cbi	0x18, 2	; 24
     566:	ba 9a       	sbi	0x17, 2	; 23
     568:	80 30       	cpi	r24, 0x00	; 0
     56a:	19 f0       	breq	.+6      	; 0x572 <_Li2c_put_ack_low>
     56c:	bc 98       	cbi	0x17, 4	; 23
     56e:	c4 9a       	sbi	0x18, 4	; 24
     570:	02 c0       	rjmp	.+4      	; 0x576 <_Li2c_put_ack_high>

00000572 <_Li2c_put_ack_low>:
     572:	c4 98       	cbi	0x18, 4	; 24
     574:	bc 9a       	sbi	0x17, 4	; 23

00000576 <_Li2c_put_ack_high>:
     576:	00 00       	nop
     578:	00 00       	nop
     57a:	00 00       	nop
     57c:	26 df       	rcall	.-436    	; 0x3ca <ass_i2c_delay_half>
     57e:	ba 98       	cbi	0x17, 2	; 23
     580:	c2 9a       	sbi	0x18, 2	; 24
     582:	a8 94       	cln
     584:	00 00       	nop
     586:	00 00       	nop
     588:	b2 9b       	sbis	0x16, 2	; 22
     58a:	23 df       	rcall	.-442    	; 0x3d2 <ass_i2c_wait_scl_high>
     58c:	1e df       	rcall	.-452    	; 0x3ca <ass_i2c_delay_half>

0000058e <_Li2c_read_return>:
     58e:	00 00       	nop
     590:	00 00       	nop
     592:	c2 98       	cbi	0x18, 2	; 24
     594:	ba 9a       	sbi	0x17, 2	; 23
     596:	87 2f       	mov	r24, r23
     598:	99 27       	eor	r25, r25
     59a:	08 95       	ret
     59c:	80 e2       	ldi	r24, 0x20	; 32
     59e:	08 95       	ret

000005a0 <sht31ReadValue>:
     5a0:	ef 92       	push	r14
     5a2:	ff 92       	push	r15
     5a4:	0f 93       	push	r16
     5a6:	1f 93       	push	r17
     5a8:	cf 93       	push	r28
     5aa:	df 93       	push	r29
     5ac:	00 d0       	rcall	.+0      	; 0x5ae <L0^A>

000005ae <L0^A>:
     5ae:	00 d0       	rcall	.+0      	; 0x5b0 <L0^A>

000005b0 <L0^A>:
     5b0:	00 d0       	rcall	.+0      	; 0x5b2 <L0^A>

000005b2 <L0^A>:
     5b2:	0f 92       	push	r0
     5b4:	cd b7       	in	r28, 0x3d	; 61
     5b6:	de b7       	in	r29, 0x3e	; 62
     5b8:	8f 83       	std	Y+7, r24	; 0x07
     5ba:	1e df       	rcall	.-452    	; 0x3f8 <i2c_init>
     5bc:	88 e8       	ldi	r24, 0x88	; 136
     5be:	2f df       	rcall	.-418    	; 0x41e <i2c_start>
     5c0:	84 e2       	ldi	r24, 0x24	; 36
     5c2:	5e df       	rcall	.-324    	; 0x480 <ass_i2c_write>
     5c4:	80 e0       	ldi	r24, 0x00	; 0
     5c6:	5c df       	rcall	.-328    	; 0x480 <ass_i2c_write>
     5c8:	8f e3       	ldi	r24, 0x3F	; 63
     5ca:	9c e9       	ldi	r25, 0x9C	; 156

000005cc <.L1^B11>:
     5cc:	01 97       	sbiw	r24, 0x01	; 1
     5ce:	f1 f7       	brne	.-4      	; 0x5cc <.L1^B11>
     5d0:	00 c0       	rjmp	.+0      	; 0x5d2 <L0^A>

000005d2 <L0^A>:
     5d2:	00 00       	nop
     5d4:	89 e8       	ldi	r24, 0x89	; 137
     5d6:	33 df       	rcall	.-410    	; 0x43e <i2c_rep_start>
     5d8:	8e 01       	movw	r16, r28
     5da:	0f 5f       	subi	r16, 0xFF	; 255
     5dc:	1f 4f       	sbci	r17, 0xFF	; 255
     5de:	7e 01       	movw	r14, r28
     5e0:	96 e0       	ldi	r25, 0x06	; 6
     5e2:	e9 0e       	add	r14, r25
     5e4:	f1 1c       	adc	r15, r1

000005e6 <.L76>:
     5e6:	80 e0       	ldi	r24, 0x00	; 0
     5e8:	a5 df       	rcall	.-182    	; 0x534 <i2c_read>
     5ea:	f8 01       	movw	r30, r16
     5ec:	80 e2       	ldi	r24, 0x20	; 32
     5ee:	81 93       	st	Z+, r24
     5f0:	8f 01       	movw	r16, r30
     5f2:	ee 15       	cp	r30, r14
     5f4:	ff 05       	cpc	r31, r15
     5f6:	b9 f7       	brne	.-18     	; 0x5e6 <.L76>
     5f8:	81 e0       	ldi	r24, 0x01	; 1
     5fa:	9c df       	rcall	.-200    	; 0x534 <i2c_read>
     5fc:	32 df       	rcall	.-412    	; 0x462 <ass_i2c_stop>
     5fe:	9f 81       	ldd	r25, Y+7	; 0x07
     600:	91 30       	cpi	r25, 0x01	; 1
     602:	51 f1       	breq	.+84     	; 0x658 <.L77>
     604:	69 81       	ldd	r22, Y+1	; 0x01
     606:	7a 81       	ldd	r23, Y+2	; 0x02
     608:	76 27       	eor	r23, r22
     60a:	67 27       	eor	r22, r23
     60c:	76 27       	eor	r23, r22
     60e:	80 e0       	ldi	r24, 0x00	; 0
     610:	90 e0       	ldi	r25, 0x00	; 0
     612:	85 d6       	rcall	.+3338   	; 0x131e <__floatunsisf>
     614:	20 e0       	ldi	r18, 0x00	; 0
     616:	3f ef       	ldi	r19, 0xFF	; 255
     618:	4f e7       	ldi	r20, 0x7F	; 127
     61a:	57 e4       	ldi	r21, 0x47	; 71
     61c:	f3 d5       	rcall	.+3046   	; 0x1204 <__divsf3>
     61e:	20 e0       	ldi	r18, 0x00	; 0
     620:	30 e0       	ldi	r19, 0x00	; 0
     622:	4f e2       	ldi	r20, 0x2F	; 47
     624:	53 e4       	ldi	r21, 0x43	; 67
     626:	03 d7       	rcall	.+3590   	; 0x142e <__mulsf3>
     628:	20 e0       	ldi	r18, 0x00	; 0
     62a:	30 e0       	ldi	r19, 0x00	; 0
     62c:	44 e3       	ldi	r20, 0x34	; 52
     62e:	52 e4       	ldi	r21, 0x42	; 66
     630:	84 d5       	rcall	.+2824   	; 0x113a <__subsf3>

00000632 <.L80>:
     632:	20 e0       	ldi	r18, 0x00	; 0
     634:	30 e0       	ldi	r19, 0x00	; 0
     636:	48 ec       	ldi	r20, 0xC8	; 200
     638:	52 e4       	ldi	r21, 0x42	; 66
     63a:	f9 d6       	rcall	.+3570   	; 0x142e <__mulsf3>
     63c:	4b d6       	rcall	.+3222   	; 0x12d4 <__fixunssfsi>
     63e:	27 96       	adiw	r28, 0x07	; 7
     640:	0f b6       	in	r0, 0x3f	; 63
     642:	f8 94       	cli
     644:	de bf       	out	0x3e, r29	; 62
     646:	0f be       	out	0x3f, r0	; 63
     648:	cd bf       	out	0x3d, r28	; 61
     64a:	df 91       	pop	r29
     64c:	cf 91       	pop	r28
     64e:	1f 91       	pop	r17
     650:	0f 91       	pop	r16
     652:	ff 90       	pop	r15
     654:	ef 90       	pop	r14
     656:	08 95       	ret

00000658 <.L77>:
     658:	6c 81       	ldd	r22, Y+4	; 0x04
     65a:	7d 81       	ldd	r23, Y+5	; 0x05
     65c:	76 27       	eor	r23, r22
     65e:	67 27       	eor	r22, r23
     660:	76 27       	eor	r23, r22
     662:	80 e0       	ldi	r24, 0x00	; 0
     664:	90 e0       	ldi	r25, 0x00	; 0
     666:	5b d6       	rcall	.+3254   	; 0x131e <__floatunsisf>
     668:	20 e0       	ldi	r18, 0x00	; 0
     66a:	3f ef       	ldi	r19, 0xFF	; 255
     66c:	4f e7       	ldi	r20, 0x7F	; 127
     66e:	57 e4       	ldi	r21, 0x47	; 71
     670:	c9 d5       	rcall	.+2962   	; 0x1204 <__divsf3>
     672:	20 e0       	ldi	r18, 0x00	; 0
     674:	30 e0       	ldi	r19, 0x00	; 0
     676:	48 ec       	ldi	r20, 0xC8	; 200
     678:	52 e4       	ldi	r21, 0x42	; 66
     67a:	d9 d6       	rcall	.+3506   	; 0x142e <__mulsf3>
     67c:	da cf       	rjmp	.-76     	; 0x632 <.L80>

0000067e <scd41ReadValue>:
     67e:	ef 92       	push	r14
     680:	ff 92       	push	r15
     682:	0f 93       	push	r16
     684:	1f 93       	push	r17
     686:	cf 93       	push	r28
     688:	df 93       	push	r29
     68a:	cd b7       	in	r28, 0x3d	; 61
     68c:	de b7       	in	r29, 0x3e	; 62
     68e:	2a 97       	sbiw	r28, 0x0a	; 10
     690:	0f b6       	in	r0, 0x3f	; 63
     692:	f8 94       	cli
     694:	de bf       	out	0x3e, r29	; 62
     696:	0f be       	out	0x3f, r0	; 63
     698:	cd bf       	out	0x3d, r28	; 61
     69a:	8a 87       	std	Y+10, r24	; 0x0a
     69c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <cache_valid>
     6a0:	81 11       	cpse	r24, r1
     6a2:	42 c0       	rjmp	.+132    	; 0x728 <.L82>
     6a4:	a9 de       	rcall	.-686    	; 0x3f8 <i2c_init>
     6a6:	84 ec       	ldi	r24, 0xC4	; 196
     6a8:	ba de       	rcall	.-652    	; 0x41e <i2c_start>
     6aa:	8c ee       	ldi	r24, 0xEC	; 236
     6ac:	e9 de       	rcall	.-558    	; 0x480 <ass_i2c_write>
     6ae:	85 e0       	ldi	r24, 0x05	; 5
     6b0:	e7 de       	rcall	.-562    	; 0x480 <ass_i2c_write>
     6b2:	8f ec       	ldi	r24, 0xCF	; 207
     6b4:	97 e0       	ldi	r25, 0x07	; 7

000006b6 <.L1^B12>:
     6b6:	01 97       	sbiw	r24, 0x01	; 1
     6b8:	f1 f7       	brne	.-4      	; 0x6b6 <.L1^B12>
     6ba:	00 c0       	rjmp	.+0      	; 0x6bc <L0^A>

000006bc <L0^A>:
     6bc:	00 00       	nop
     6be:	85 ec       	ldi	r24, 0xC5	; 197
     6c0:	be de       	rcall	.-644    	; 0x43e <i2c_rep_start>
     6c2:	8e 01       	movw	r16, r28
     6c4:	0f 5f       	subi	r16, 0xFF	; 255
     6c6:	1f 4f       	sbci	r17, 0xFF	; 255
     6c8:	7e 01       	movw	r14, r28
     6ca:	99 e0       	ldi	r25, 0x09	; 9
     6cc:	e9 0e       	add	r14, r25
     6ce:	f1 1c       	adc	r15, r1

000006d0 <.L83>:
     6d0:	80 e0       	ldi	r24, 0x00	; 0
     6d2:	30 df       	rcall	.-416    	; 0x534 <i2c_read>
     6d4:	f8 01       	movw	r30, r16
     6d6:	80 e2       	ldi	r24, 0x20	; 32
     6d8:	81 93       	st	Z+, r24
     6da:	8f 01       	movw	r16, r30
     6dc:	ee 15       	cp	r30, r14
     6de:	ff 05       	cpc	r31, r15
     6e0:	b9 f7       	brne	.-18     	; 0x6d0 <.L83>
     6e2:	81 e0       	ldi	r24, 0x01	; 1
     6e4:	27 df       	rcall	.-434    	; 0x534 <i2c_read>
     6e6:	bd de       	rcall	.-646    	; 0x462 <ass_i2c_stop>
     6e8:	89 81       	ldd	r24, Y+1	; 0x01
     6ea:	9a 81       	ldd	r25, Y+2	; 0x02
     6ec:	98 27       	eor	r25, r24
     6ee:	89 27       	eor	r24, r25
     6f0:	98 27       	eor	r25, r24
     6f2:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <cached_co2>
     6f6:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <cached_co2+0x1>
     6fa:	8c 81       	ldd	r24, Y+4	; 0x04
     6fc:	9d 81       	ldd	r25, Y+5	; 0x05
     6fe:	98 27       	eor	r25, r24
     700:	89 27       	eor	r24, r25
     702:	98 27       	eor	r25, r24
     704:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <cached_temp>
     708:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <cached_temp+0x1>
     70c:	8f 81       	ldd	r24, Y+7	; 0x07
     70e:	98 85       	ldd	r25, Y+8	; 0x08
     710:	98 27       	eor	r25, r24
     712:	89 27       	eor	r24, r25
     714:	98 27       	eor	r25, r24
     716:	80 93 61 00 	sts	0x0061, r24	; 0x800061 <cached_humi>
     71a:	90 93 62 00 	sts	0x0062, r25	; 0x800062 <cached_humi+0x1>
     71e:	81 e0       	ldi	r24, 0x01	; 1
     720:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <cache_valid>
     724:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <cache_read_mask>

00000728 <.L82>:
     728:	10 91 60 00 	lds	r17, 0x0060	; 0x800060 <cache_read_mask>
     72c:	9a 85       	ldd	r25, Y+10	; 0x0a
     72e:	91 30       	cpi	r25, 0x01	; 1
     730:	e9 f0       	breq	.+58     	; 0x76c <.L84>
     732:	92 30       	cpi	r25, 0x02	; 2
     734:	d1 f1       	breq	.+116    	; 0x7aa <.L85>
     736:	60 91 65 00 	lds	r22, 0x0065	; 0x800065 <cached_co2>
     73a:	70 91 66 00 	lds	r23, 0x0066	; 0x800066 <cached_co2+0x1>
     73e:	80 e0       	ldi	r24, 0x00	; 0
     740:	90 e0       	ldi	r25, 0x00	; 0
     742:	21 2f       	mov	r18, r17
     744:	21 60       	ori	r18, 0x01	; 1

00000746 <.L86>:
     746:	20 93 60 00 	sts	0x0060, r18	; 0x800060 <cache_read_mask>
     74a:	27 30       	cpi	r18, 0x07	; 7
     74c:	11 f4       	brne	.+4      	; 0x752 <.L87>
     74e:	10 92 67 00 	sts	0x0067, r1	; 0x800067 <cache_valid>

00000752 <.L87>:
     752:	2a 96       	adiw	r28, 0x0a	; 10
     754:	0f b6       	in	r0, 0x3f	; 63
     756:	f8 94       	cli
     758:	de bf       	out	0x3e, r29	; 62
     75a:	0f be       	out	0x3f, r0	; 63
     75c:	cd bf       	out	0x3d, r28	; 61
     75e:	df 91       	pop	r29
     760:	cf 91       	pop	r28
     762:	1f 91       	pop	r17
     764:	0f 91       	pop	r16
     766:	ff 90       	pop	r15
     768:	ef 90       	pop	r14
     76a:	08 95       	ret

0000076c <.L84>:
     76c:	60 91 63 00 	lds	r22, 0x0063	; 0x800063 <cached_temp>
     770:	70 91 64 00 	lds	r23, 0x0064	; 0x800064 <cached_temp+0x1>
     774:	80 e0       	ldi	r24, 0x00	; 0
     776:	90 e0       	ldi	r25, 0x00	; 0
     778:	d2 d5       	rcall	.+2980   	; 0x131e <__floatunsisf>
     77a:	20 e0       	ldi	r18, 0x00	; 0
     77c:	30 e0       	ldi	r19, 0x00	; 0
     77e:	40 e8       	ldi	r20, 0x80	; 128
     780:	57 e3       	ldi	r21, 0x37	; 55
     782:	55 d6       	rcall	.+3242   	; 0x142e <__mulsf3>
     784:	20 e0       	ldi	r18, 0x00	; 0
     786:	30 e0       	ldi	r19, 0x00	; 0
     788:	4f e2       	ldi	r20, 0x2F	; 47
     78a:	53 e4       	ldi	r21, 0x43	; 67
     78c:	50 d6       	rcall	.+3232   	; 0x142e <__mulsf3>
     78e:	20 e0       	ldi	r18, 0x00	; 0
     790:	30 e0       	ldi	r19, 0x00	; 0
     792:	44 e3       	ldi	r20, 0x34	; 52
     794:	52 e4       	ldi	r21, 0x42	; 66
     796:	d1 d4       	rcall	.+2466   	; 0x113a <__subsf3>
     798:	20 e0       	ldi	r18, 0x00	; 0
     79a:	30 e0       	ldi	r19, 0x00	; 0
     79c:	48 ec       	ldi	r20, 0xC8	; 200
     79e:	52 e4       	ldi	r21, 0x42	; 66
     7a0:	46 d6       	rcall	.+3212   	; 0x142e <__mulsf3>
     7a2:	98 d5       	rcall	.+2864   	; 0x12d4 <__fixunssfsi>
     7a4:	21 2f       	mov	r18, r17
     7a6:	22 60       	ori	r18, 0x02	; 2
     7a8:	ce cf       	rjmp	.-100    	; 0x746 <.L86>

000007aa <.L85>:
     7aa:	60 91 61 00 	lds	r22, 0x0061	; 0x800061 <cached_humi>
     7ae:	70 91 62 00 	lds	r23, 0x0062	; 0x800062 <cached_humi+0x1>
     7b2:	80 e0       	ldi	r24, 0x00	; 0
     7b4:	90 e0       	ldi	r25, 0x00	; 0
     7b6:	b3 d5       	rcall	.+2918   	; 0x131e <__floatunsisf>
     7b8:	20 e0       	ldi	r18, 0x00	; 0
     7ba:	30 e0       	ldi	r19, 0x00	; 0
     7bc:	40 e8       	ldi	r20, 0x80	; 128
     7be:	57 e3       	ldi	r21, 0x37	; 55
     7c0:	36 d6       	rcall	.+3180   	; 0x142e <__mulsf3>
     7c2:	20 e0       	ldi	r18, 0x00	; 0
     7c4:	30 e0       	ldi	r19, 0x00	; 0
     7c6:	48 ec       	ldi	r20, 0xC8	; 200
     7c8:	52 e4       	ldi	r21, 0x42	; 66
     7ca:	31 d6       	rcall	.+3170   	; 0x142e <__mulsf3>
     7cc:	20 e0       	ldi	r18, 0x00	; 0
     7ce:	30 e0       	ldi	r19, 0x00	; 0
     7d0:	48 ec       	ldi	r20, 0xC8	; 200
     7d2:	52 e4       	ldi	r21, 0x42	; 66
     7d4:	2c d6       	rcall	.+3160   	; 0x142e <__mulsf3>
     7d6:	7e d5       	rcall	.+2812   	; 0x12d4 <__fixunssfsi>
     7d8:	21 2f       	mov	r18, r17
     7da:	24 60       	ori	r18, 0x04	; 4
     7dc:	b4 cf       	rjmp	.-152    	; 0x746 <.L86>

000007de <main>:
     7de:	cd b7       	in	r28, 0x3d	; 61
     7e0:	de b7       	in	r29, 0x3e	; 62
     7e2:	c7 54       	subi	r28, 0x47	; 71
     7e4:	d1 40       	sbci	r29, 0x01	; 1
     7e6:	0f b6       	in	r0, 0x3f	; 63
     7e8:	f8 94       	cli
     7ea:	de bf       	out	0x3e, r29	; 62
     7ec:	0f be       	out	0x3f, r0	; 63
     7ee:	cd bf       	out	0x3d, r28	; 61
     7f0:	f8 94       	cli
     7f2:	80 e0       	ldi	r24, 0x00	; 0
     7f4:	90 e0       	ldi	r25, 0x00	; 0
     7f6:	6b d4       	rcall	.+2262   	; 0x10ce <eeprom_read_byte>
     7f8:	68 2e       	mov	r6, r24
     7fa:	ba 98       	cbi	0x17, 2	; 23
     7fc:	bc 98       	cbi	0x17, 4	; 23
     7fe:	c4 98       	cbi	0x18, 4	; 24
     800:	8f eb       	ldi	r24, 0xBF	; 191
     802:	93 e0       	ldi	r25, 0x03	; 3

00000804 <.L1^B13>:
     804:	01 97       	sbiw	r24, 0x01	; 1
     806:	f1 f7       	brne	.-4      	; 0x804 <.L1^B13>
     808:	00 c0       	rjmp	.+0      	; 0x80a <L0^A>

0000080a <L0^A>:
     80a:	00 00       	nop
     80c:	10 92 ac 00 	sts	0x00AC, r1	; 0x8000ac <usiuartx_rx_tail>
     810:	10 92 ad 00 	sts	0x00AD, r1	; 0x8000ad <usiuartx_rx_head>
     814:	10 92 8b 00 	sts	0x008B, r1	; 0x80008b <usiuartx_tx_tail>
     818:	10 92 8a 00 	sts	0x008A, r1	; 0x80008a <usiuartx_tx_head>
     81c:	bb 9a       	sbi	0x17, 3	; 23
     81e:	c3 98       	cbi	0x18, 3	; 24
     820:	88 b3       	in	r24, 0x18	; 24
     822:	83 60       	ori	r24, 0x03	; 3
     824:	88 bb       	out	0x18, r24	; 24
     826:	87 b3       	in	r24, 0x17	; 23
     828:	8c 7f       	andi	r24, 0xFC	; 252
     82a:	87 bb       	out	0x17, r24	; 23
     82c:	1d b8       	out	0x0d, r1	; 13
     82e:	80 e2       	ldi	r24, 0x20	; 32
     830:	8a bf       	out	0x3a, r24	; 58
     832:	8b b7       	in	r24, 0x3b	; 59
     834:	80 62       	ori	r24, 0x20	; 32
     836:	8b bf       	out	0x3b, r24	; 59
     838:	a8 9a       	sbi	0x15, 0	; 21
     83a:	78 94       	sei
     83c:	ce 01       	movw	r24, r28
     83e:	85 5c       	subi	r24, 0xC5	; 197
     840:	9e 4f       	sbci	r25, 0xFE	; 254
     842:	ca 5b       	subi	r28, 0xBA	; 186
     844:	de 4f       	sbci	r29, 0xFE	; 254
     846:	88 83       	st	Y, r24
     848:	c6 54       	subi	r28, 0x46	; 70
     84a:	d1 40       	sbci	r29, 0x01	; 1
     84c:	c9 5b       	subi	r28, 0xB9	; 185
     84e:	de 4f       	sbci	r29, 0xFE	; 254
     850:	98 83       	st	Y, r25
     852:	c7 54       	subi	r28, 0x47	; 71
     854:	d1 40       	sbci	r29, 0x01	; 1
     856:	8e 01       	movw	r16, r28
     858:	0f 5d       	subi	r16, 0xDF	; 223
     85a:	1e 4f       	sbci	r17, 0xFE	; 254
     85c:	83 e0       	ldi	r24, 0x03	; 3
     85e:	28 2e       	mov	r2, r24

00000860 <.L90>:
     860:	a8 95       	wdr
     862:	90 91 ad 00 	lds	r25, 0x00AD	; 0x8000ad <usiuartx_rx_head>
     866:	80 91 ac 00 	lds	r24, 0x00AC	; 0x8000ac <usiuartx_rx_tail>
     86a:	98 17       	cp	r25, r24
     86c:	c9 f3       	breq	.-14     	; 0x860 <.L90>
     86e:	af e0       	ldi	r26, 0x0F	; 15
     870:	b7 e2       	ldi	r27, 0x27	; 39

00000872 <.L1^B14>:
     872:	11 97       	sbiw	r26, 0x01	; 1
     874:	f1 f7       	brne	.-4      	; 0x872 <.L1^B14>
     876:	00 c0       	rjmp	.+0      	; 0x878 <L0^A>

00000878 <L0^A>:
	...

0000087a <.L91>:
     87a:	90 91 ad 00 	lds	r25, 0x00AD	; 0x8000ad <usiuartx_rx_head>
     87e:	80 91 ac 00 	lds	r24, 0x00AC	; 0x8000ac <usiuartx_rx_tail>
     882:	98 17       	cp	r25, r24
     884:	69 f3       	breq	.-38     	; 0x860 <.L90>
     886:	47 e0       	ldi	r20, 0x07	; 7
     888:	50 e0       	ldi	r21, 0x00	; 0
     88a:	ca 5b       	subi	r28, 0xBA	; 186
     88c:	de 4f       	sbci	r29, 0xFE	; 254
     88e:	68 81       	ld	r22, Y
     890:	c6 54       	subi	r28, 0x46	; 70
     892:	d1 40       	sbci	r29, 0x01	; 1
     894:	c9 5b       	subi	r28, 0xB9	; 185
     896:	de 4f       	sbci	r29, 0xFE	; 254
     898:	78 81       	ld	r23, Y
     89a:	c7 54       	subi	r28, 0x47	; 71
     89c:	d1 40       	sbci	r29, 0x01	; 1
     89e:	ce 01       	movw	r24, r28
     8a0:	86 5c       	subi	r24, 0xC6	; 198
     8a2:	9e 4f       	sbci	r25, 0xFE	; 254
     8a4:	2f d6       	rcall	.+3166   	; 0x1504 <memmove>

000008a6 <.L92>:
     8a6:	90 91 ad 00 	lds	r25, 0x00AD	; 0x8000ad <usiuartx_rx_head>
     8aa:	80 91 ac 00 	lds	r24, 0x00AC	; 0x8000ac <usiuartx_rx_tail>
     8ae:	98 17       	cp	r25, r24
     8b0:	d1 f3       	breq	.-12     	; 0x8a6 <.L92>
     8b2:	e0 91 ac 00 	lds	r30, 0x00AC	; 0x8000ac <usiuartx_rx_tail>
     8b6:	ef 5f       	subi	r30, 0xFF	; 255
     8b8:	ef 71       	andi	r30, 0x1F	; 31
     8ba:	e0 93 ac 00 	sts	0x00AC, r30	; 0x8000ac <usiuartx_rx_tail>
     8be:	f0 e0       	ldi	r31, 0x00	; 0
     8c0:	e4 57       	subi	r30, 0x74	; 116
     8c2:	ff 4f       	sbci	r31, 0xFF	; 255
     8c4:	80 81       	ld	r24, Z
     8c6:	be db       	rcall	.-2180   	; 0x44 <usiuartx_bit_reverse>
     8c8:	cf 5b       	subi	r28, 0xBF	; 191
     8ca:	de 4f       	sbci	r29, 0xFE	; 254
     8cc:	88 83       	st	Y, r24
     8ce:	c1 54       	subi	r28, 0x41	; 65
     8d0:	d1 40       	sbci	r29, 0x01	; 1
     8d2:	c6 5c       	subi	r28, 0xC6	; 198
     8d4:	de 4f       	sbci	r29, 0xFE	; 254
     8d6:	98 81       	ld	r25, Y
     8d8:	ca 53       	subi	r28, 0x3A	; 58
     8da:	d1 40       	sbci	r29, 0x01	; 1
     8dc:	96 11       	cpse	r25, r6
     8de:	cd cf       	rjmp	.-102    	; 0x87a <.L91>
     8e0:	c5 5c       	subi	r28, 0xC5	; 197
     8e2:	de 4f       	sbci	r29, 0xFE	; 254
     8e4:	a8 80       	ld	r10, Y
     8e6:	cb 53       	subi	r28, 0x3B	; 59
     8e8:	d1 40       	sbci	r29, 0x01	; 1
     8ea:	9d ef       	ldi	r25, 0xFD	; 253
     8ec:	9a 0d       	add	r25, r10
     8ee:	92 30       	cpi	r25, 0x02	; 2
     8f0:	18 f0       	brcs	.+6      	; 0x8f8 <.L94>
     8f2:	b6 e0       	ldi	r27, 0x06	; 6
     8f4:	ab 12       	cpse	r10, r27
     8f6:	c1 cf       	rjmp	.-126    	; 0x87a <.L91>

000008f8 <.L94>:
     8f8:	c0 5c       	subi	r28, 0xC0	; 192
     8fa:	de 4f       	sbci	r29, 0xFE	; 254
     8fc:	e8 80       	ld	r14, Y
     8fe:	c0 54       	subi	r28, 0x40	; 64
     900:	d1 40       	sbci	r29, 0x01	; 1
     902:	f8 2e       	mov	r15, r24
     904:	66 e0       	ldi	r22, 0x06	; 6
     906:	ce 01       	movw	r24, r28
     908:	86 5c       	subi	r24, 0xC6	; 198
     90a:	9e 4f       	sbci	r25, 0xFE	; 254
     90c:	f1 db       	rcall	.-2078   	; 0xf0 <clcCRC16>
     90e:	8e 15       	cp	r24, r14
     910:	9f 05       	cpc	r25, r15
     912:	09 f0       	breq	.+2      	; 0x916 <L0^A+0x2>

00000914 <L0^A>:
     914:	b2 cf       	rjmp	.-156    	; 0x87a <.L91>
     916:	c4 5c       	subi	r28, 0xC4	; 196
     918:	de 4f       	sbci	r29, 0xFE	; 254
     91a:	e8 80       	ld	r14, Y
     91c:	f9 80       	ldd	r15, Y+1	; 0x01
     91e:	cc 53       	subi	r28, 0x3C	; 60
     920:	d1 40       	sbci	r29, 0x01	; 1
     922:	c1 5c       	subi	r28, 0xC1	; 193
     924:	de 4f       	sbci	r29, 0xFE	; 254
     926:	b8 80       	ld	r11, Y
     928:	cf 53       	subi	r28, 0x3F	; 63
     92a:	d1 40       	sbci	r29, 0x01	; 1
     92c:	c2 5c       	subi	r28, 0xC2	; 194
     92e:	de 4f       	sbci	r29, 0xFE	; 254
     930:	88 81       	ld	r24, Y
     932:	ce 53       	subi	r28, 0x3E	; 62
     934:	d1 40       	sbci	r29, 0x01	; 1
     936:	f8 01       	movw	r30, r16
     938:	60 82       	st	Z, r6
     93a:	f4 e0       	ldi	r31, 0x04	; 4
     93c:	af 16       	cp	r10, r31
     93e:	09 f4       	brne	.+2      	; 0x942 <L0^A+0x2>

00000940 <L0^A>:
     940:	46 c0       	rjmp	.+140    	; 0x9ce <.L95>
     942:	26 e0       	ldi	r18, 0x06	; 6
     944:	a2 16       	cp	r10, r18
     946:	09 f4       	brne	.+2      	; 0x94a <L0^A+0x2>

00000948 <L0^A>:
     948:	d9 c2       	rjmp	.+1458   	; 0xefc <.L96>
     94a:	d8 01       	movw	r26, r16
     94c:	11 96       	adiw	r26, 0x01	; 1
     94e:	2c 92       	st	X, r2
     950:	e1 14       	cp	r14, r1
     952:	f1 04       	cpc	r15, r1
     954:	59 f4       	brne	.+22     	; 0x96c <.L97>
     956:	b1 e0       	ldi	r27, 0x01	; 1
     958:	bb 12       	cpse	r11, r27
     95a:	8f cf       	rjmp	.-226    	; 0x87a <.L91>
     95c:	22 e0       	ldi	r18, 0x02	; 2
     95e:	f8 01       	movw	r30, r16
     960:	22 83       	std	Z+2, r18	; 0x02
     962:	13 82       	std	Z+3, r1	; 0x03
     964:	14 82       	std	Z+4, r1	; 0x04

00000966 <.L200>:
     966:	67 e0       	ldi	r22, 0x07	; 7

00000968 <.L196>:
     968:	c8 01       	movw	r24, r16
     96a:	fd c2       	rjmp	.+1530   	; 0xf66 <.L197>

0000096c <.L97>:
     96c:	e1 14       	cp	r14, r1
     96e:	31 e0       	ldi	r19, 0x01	; 1
     970:	f3 06       	cpc	r15, r19
     972:	c9 f4       	brne	.+50     	; 0x9a6 <.L99>
     974:	42 e0       	ldi	r20, 0x02	; 2
     976:	b4 12       	cpse	r11, r20
     978:	80 cf       	rjmp	.-256    	; 0x87a <.L91>
     97a:	84 e0       	ldi	r24, 0x04	; 4
     97c:	d8 01       	movw	r26, r16
     97e:	12 96       	adiw	r26, 0x02	; 2
     980:	8d 93       	st	X+, r24
     982:	ee e1       	ldi	r30, 0x1E	; 30
     984:	f0 e0       	ldi	r31, 0x00	; 0
     986:	e4 91       	lpm	r30, Z
     988:	ed 93       	st	X+, r30
     98a:	ef e1       	ldi	r30, 0x1F	; 31
     98c:	f0 e0       	ldi	r31, 0x00	; 0
     98e:	e4 91       	lpm	r30, Z
     990:	ed 93       	st	X+, r30
     992:	e0 e2       	ldi	r30, 0x20	; 32
     994:	f0 e0       	ldi	r31, 0x00	; 0
     996:	e4 91       	lpm	r30, Z
     998:	ed 93       	st	X+, r30
     99a:	e1 e2       	ldi	r30, 0x21	; 33
     99c:	f0 e0       	ldi	r31, 0x00	; 0
     99e:	e4 91       	lpm	r30, Z
     9a0:	ec 93       	st	X, r30

000009a2 <.L201>:
     9a2:	69 e0       	ldi	r22, 0x09	; 9
     9a4:	e1 cf       	rjmp	.-62     	; 0x968 <.L196>

000009a6 <.L99>:
     9a6:	e1 14       	cp	r14, r1
     9a8:	b2 e0       	ldi	r27, 0x02	; 2
     9aa:	fb 06       	cpc	r15, r27
     9ac:	09 f0       	breq	.+2      	; 0x9b0 <L0^A+0x2>

000009ae <L0^A>:
     9ae:	65 cf       	rjmp	.-310    	; 0x87a <.L91>
     9b0:	e1 e0       	ldi	r30, 0x01	; 1
     9b2:	be 12       	cpse	r11, r30
     9b4:	62 cf       	rjmp	.-316    	; 0x87a <.L91>
     9b6:	82 e0       	ldi	r24, 0x02	; 2
     9b8:	d8 01       	movw	r26, r16
     9ba:	12 96       	adiw	r26, 0x02	; 2
     9bc:	8c 93       	st	X, r24
     9be:	80 e0       	ldi	r24, 0x00	; 0
     9c0:	90 e0       	ldi	r25, 0x00	; 0
     9c2:	85 d3       	rcall	.+1802   	; 0x10ce <eeprom_read_byte>
     9c4:	68 2e       	mov	r6, r24
     9c6:	f8 01       	movw	r30, r16
     9c8:	13 82       	std	Z+3, r1	; 0x03
     9ca:	84 83       	std	Z+4, r24	; 0x04
     9cc:	cc cf       	rjmp	.-104    	; 0x966 <.L200>

000009ce <.L95>:
     9ce:	de 2c       	mov	r13, r14
     9d0:	cf 2c       	mov	r12, r15
     9d2:	d8 01       	movw	r26, r16
     9d4:	11 96       	adiw	r26, 0x01	; 1
     9d6:	ac 92       	st	X, r10
     9d8:	e1 14       	cp	r14, r1
     9da:	f1 04       	cpc	r15, r1
     9dc:	61 f5       	brne	.+88     	; 0xa36 <.L101>
     9de:	b1 e0       	ldi	r27, 0x01	; 1
     9e0:	bb 12       	cpse	r11, r27
     9e2:	4b cf       	rjmp	.-362    	; 0x87a <.L91>
     9e4:	22 e0       	ldi	r18, 0x02	; 2
     9e6:	f8 01       	movw	r30, r16
     9e8:	22 83       	std	Z+2, r18	; 0x02
     9ea:	13 82       	std	Z+3, r1	; 0x03
     9ec:	30 e2       	ldi	r19, 0x20	; 32
     9ee:	34 83       	std	Z+4, r19	; 0x04
     9f0:	67 e0       	ldi	r22, 0x07	; 7
     9f2:	c8 01       	movw	r24, r16
     9f4:	97 db       	rcall	.-2258   	; 0x124 <send_modbus_array>

000009f6 <.L102>:
     9f6:	c6 01       	movw	r24, r12
     9f8:	80 55       	subi	r24, 0x50	; 80
     9fa:	92 41       	sbci	r25, 0x12	; 18
     9fc:	02 97       	sbiw	r24, 0x02	; 2
     9fe:	08 f0       	brcs	.+2      	; 0xa02 <L0^A+0x2>

00000a00 <L0^A>:
     a00:	e3 c0       	rjmp	.+454    	; 0xbc8 <.L162>
     a02:	c1 5c       	subi	r28, 0xC1	; 193
     a04:	de 4f       	sbci	r29, 0xFE	; 254
     a06:	88 81       	ld	r24, Y
     a08:	cf 53       	subi	r28, 0x3F	; 63
     a0a:	d1 40       	sbci	r29, 0x01	; 1
     a0c:	82 30       	cpi	r24, 0x02	; 2
     a0e:	09 f0       	breq	.+2      	; 0xa12 <L0^A+0x2>

00000a10 <L0^A>:
     a10:	34 cf       	rjmp	.-408    	; 0x87a <.L91>
     a12:	84 e0       	ldi	r24, 0x04	; 4
     a14:	f8 01       	movw	r30, r16
     a16:	82 83       	std	Z+2, r24	; 0x02
     a18:	80 e0       	ldi	r24, 0x00	; 0
     a1a:	f2 e1       	ldi	r31, 0x12	; 18
     a1c:	ef 16       	cp	r14, r31
     a1e:	f0 e5       	ldi	r31, 0x50	; 80
     a20:	ff 06       	cpc	r15, r31
     a22:	09 f0       	breq	.+2      	; 0xa26 <.L193>
     a24:	81 e0       	ldi	r24, 0x01	; 1

00000a26 <.L193>:
     a26:	bc dd       	rcall	.-1160   	; 0x5a0 <sht31ReadValue>
     a28:	7c d4       	rcall	.+2296   	; 0x1322 <__floatsisf>
     a2a:	20 e0       	ldi	r18, 0x00	; 0
     a2c:	30 e0       	ldi	r19, 0x00	; 0
     a2e:	48 ec       	ldi	r20, 0xC8	; 200
     a30:	52 e4       	ldi	r21, 0x42	; 66
     a32:	e8 d3       	rcall	.+2000   	; 0x1204 <__divsf3>
     a34:	ec c1       	rjmp	.+984    	; 0xe0e <.L202>

00000a36 <.L101>:
     a36:	e1 14       	cp	r14, r1
     a38:	41 e0       	ldi	r20, 0x01	; 1
     a3a:	f4 06       	cpc	r15, r20
     a3c:	09 f0       	breq	.+2      	; 0xa40 <L0^A+0x2>

00000a3e <L0^A>:
     a3e:	57 c1       	rjmp	.+686    	; 0xcee <.L103>
     a40:	81 e0       	ldi	r24, 0x01	; 1
     a42:	b8 12       	cpse	r11, r24
     a44:	1a cf       	rjmp	.-460    	; 0x87a <.L91>
     a46:	82 e0       	ldi	r24, 0x02	; 2
     a48:	d8 01       	movw	r26, r16
     a4a:	12 96       	adiw	r26, 0x02	; 2
     a4c:	8d 93       	st	X+, r24
     a4e:	1c 92       	st	X, r1
     a50:	f8 94       	cli
     a52:	4e 01       	movw	r8, r28
     a54:	bf ef       	ldi	r27, 0xFF	; 255
     a56:	8b 1a       	sub	r8, r27
     a58:	9b 0a       	sbc	r9, r27
     a5a:	c4 01       	movw	r24, r8

00000a5c <.L104>:
     a5c:	fc 01       	movw	r30, r24
     a5e:	11 92       	st	Z+, r1
     a60:	df 01       	movw	r26, r30
     a62:	38 e0       	ldi	r19, 0x08	; 8

00000a64 <.L0^B1>:
     a64:	1d 92       	st	X+, r1
     a66:	3a 95       	dec	r19
     a68:	e9 f7       	brne	.-6      	; 0xa64 <.L0^B1>
     a6a:	09 96       	adiw	r24, 0x09	; 9
     a6c:	08 17       	cp	r16, r24
     a6e:	19 07       	cpc	r17, r25
     a70:	a9 f7       	brne	.-22     	; 0xa5c <.L104>
     a72:	ef db       	rcall	.-2082   	; 0x252 <oneWireDetectPresence.constprop.0>
     a74:	58 2e       	mov	r5, r24
     a76:	81 15       	cp	r24, r1
     a78:	09 f4       	brne	.+2      	; 0xa7c <L0^A+0x2>

00000a7a <L0^A>:
     a7a:	8d c0       	rjmp	.+282    	; 0xb96 <.L105>
     a7c:	fe 01       	movw	r30, r28
     a7e:	32 96       	adiw	r30, 0x02	; 2
     a80:	cc 5b       	subi	r28, 0xBC	; 188
     a82:	de 4f       	sbci	r29, 0xFE	; 254
     a84:	18 82       	st	Y, r1
     a86:	c4 54       	subi	r28, 0x44	; 68
     a88:	d1 40       	sbci	r29, 0x01	; 1
     a8a:	ce 5b       	subi	r28, 0xBE	; 190
     a8c:	de 4f       	sbci	r29, 0xFE	; 254
     a8e:	e8 83       	st	Y, r30
     a90:	c2 54       	subi	r28, 0x42	; 66
     a92:	d1 40       	sbci	r29, 0x01	; 1
     a94:	cd 5b       	subi	r28, 0xBD	; 189
     a96:	de 4f       	sbci	r29, 0xFE	; 254
     a98:	f8 83       	st	Y, r31
     a9a:	c3 54       	subi	r28, 0x43	; 67
     a9c:	d1 40       	sbci	r29, 0x01	; 1
     a9e:	51 2c       	mov	r5, r1

00000aa0 <.L118>:
     aa0:	88 e0       	ldi	r24, 0x08	; 8
     aa2:	ce 5b       	subi	r28, 0xBE	; 190
     aa4:	de 4f       	sbci	r29, 0xFE	; 254
     aa6:	a8 81       	ld	r26, Y
     aa8:	c2 54       	subi	r28, 0x42	; 66
     aaa:	d1 40       	sbci	r29, 0x01	; 1
     aac:	cd 5b       	subi	r28, 0xBD	; 189
     aae:	de 4f       	sbci	r29, 0xFE	; 254
     ab0:	b8 81       	ld	r27, Y
     ab2:	c3 54       	subi	r28, 0x43	; 67
     ab4:	d1 40       	sbci	r29, 0x01	; 1

00000ab6 <.L0^B2>:
     ab6:	01 90       	ld	r0, Z+
     ab8:	0d 92       	st	X+, r0
     aba:	8a 95       	dec	r24
     abc:	e1 f7       	brne	.-8      	; 0xab6 <.L0^B2>
     abe:	c9 db       	rcall	.-2158   	; 0x252 <oneWireDetectPresence.constprop.0>
     ac0:	80 ef       	ldi	r24, 0xF0	; 240
     ac2:	80 db       	rcall	.-2304   	; 0x1c4 <oneWireSendByte.constprop.0>
     ac4:	44 24       	eor	r4, r4
     ac6:	43 94       	inc	r4
     ac8:	74 2c       	mov	r7, r4
     aca:	ce 5b       	subi	r28, 0xBE	; 190
     acc:	de 4f       	sbci	r29, 0xFE	; 254
     ace:	a8 80       	ld	r10, Y
     ad0:	c2 54       	subi	r28, 0x42	; 66
     ad2:	d1 40       	sbci	r29, 0x01	; 1
     ad4:	cd 5b       	subi	r28, 0xBD	; 189
     ad6:	de 4f       	sbci	r29, 0xFE	; 254
     ad8:	b8 80       	ld	r11, Y
     ada:	c3 54       	subi	r28, 0x43	; 67
     adc:	d1 40       	sbci	r29, 0x01	; 1
     ade:	31 2c       	mov	r3, r1

00000ae0 <.L117>:
     ae0:	96 db       	rcall	.-2260   	; 0x20e <oneWireReadBit.constprop.0>
     ae2:	cb 5b       	subi	r28, 0xBB	; 187
     ae4:	de 4f       	sbci	r29, 0xFE	; 254
     ae6:	88 83       	st	Y, r24
     ae8:	c5 54       	subi	r28, 0x45	; 69
     aea:	d1 40       	sbci	r29, 0x01	; 1
     aec:	90 db       	rcall	.-2272   	; 0x20e <oneWireReadBit.constprop.0>
     aee:	cb 5b       	subi	r28, 0xBB	; 187
     af0:	de 4f       	sbci	r29, 0xFE	; 254
     af2:	48 81       	ld	r20, Y
     af4:	c5 54       	subi	r28, 0x45	; 69
     af6:	d1 40       	sbci	r29, 0x01	; 1
     af8:	41 15       	cp	r20, r1
     afa:	b1 f0       	breq	.+44     	; 0xb28 <.L106>
     afc:	81 15       	cp	r24, r1
     afe:	09 f4       	brne	.+2      	; 0xb02 <L0^A+0x2>

00000b00 <L0^A>:
     b00:	ab c0       	rjmp	.+342    	; 0xc58 <.L187>
     b02:	33 24       	eor	r3, r3
     b04:	3a 94       	dec	r3
     b06:	28 c0       	rjmp	.+80     	; 0xb58 <.L107>

00000b08 <.L166>:
     b08:	cc 5b       	subi	r28, 0xBC	; 188
     b0a:	de 4f       	sbci	r29, 0xFE	; 254
     b0c:	38 82       	st	Y, r3
     b0e:	c4 54       	subi	r28, 0x44	; 68
     b10:	d1 40       	sbci	r29, 0x01	; 1
     b12:	ce 5b       	subi	r28, 0xBE	; 190
     b14:	de 4f       	sbci	r29, 0xFE	; 254
     b16:	88 83       	st	Y, r24
     b18:	c2 54       	subi	r28, 0x42	; 66
     b1a:	d1 40       	sbci	r29, 0x01	; 1
     b1c:	cd 5b       	subi	r28, 0xBD	; 189
     b1e:	de 4f       	sbci	r29, 0xFE	; 254
     b20:	98 83       	st	Y, r25
     b22:	c3 54       	subi	r28, 0x43	; 67
     b24:	d1 40       	sbci	r29, 0x01	; 1
     b26:	bc cf       	rjmp	.-136    	; 0xaa0 <.L118>

00000b28 <.L106>:
     b28:	d5 01       	movw	r26, r10
     b2a:	9c 91       	ld	r25, X
     b2c:	81 15       	cp	r24, r1
     b2e:	09 f4       	brne	.+2      	; 0xb32 <L0^A+0x2>

00000b30 <L0^A>:
     b30:	98 c0       	rjmp	.+304    	; 0xc62 <.L188>
     b32:	87 2d       	mov	r24, r7
     b34:	80 95       	com	r24
     b36:	98 23       	and	r25, r24
     b38:	9c 93       	st	X, r25

00000b3a <.L111>:
     b3a:	97 21       	and	r25, r7
     b3c:	09 f4       	brne	.+2      	; 0xb40 <L0^A+0x2>

00000b3e <L0^A>:
     b3e:	ae c0       	rjmp	.+348    	; 0xc9c <.L114>
     b40:	23 db       	rcall	.-2490   	; 0x188 <oneWireWriteBit1.constprop.0>

00000b42 <.L115>:
     b42:	43 94       	inc	r4
     b44:	77 0c       	add	r7, r7
     b46:	29 f4       	brne	.+10     	; 0xb52 <.L116>
     b48:	bf ef       	ldi	r27, 0xFF	; 255
     b4a:	ab 1a       	sub	r10, r27
     b4c:	bb 0a       	sbc	r11, r27
     b4e:	77 24       	eor	r7, r7
     b50:	73 94       	inc	r7

00000b52 <.L116>:
     b52:	e1 e4       	ldi	r30, 0x41	; 65
     b54:	4e 12       	cpse	r4, r30
     b56:	c4 cf       	rjmp	.-120    	; 0xae0 <.L117>

00000b58 <.L107>:
     b58:	85 2d       	mov	r24, r5
     b5a:	90 e0       	ldi	r25, 0x00	; 0
     b5c:	69 e0       	ldi	r22, 0x09	; 9
     b5e:	70 e0       	ldi	r23, 0x00	; 0
     b60:	cc d2       	rcall	.+1432   	; 0x10fa <__mulhi3>
     b62:	f4 01       	movw	r30, r8
     b64:	e8 0f       	add	r30, r24
     b66:	f9 1f       	adc	r31, r25
     b68:	20 e1       	ldi	r18, 0x10	; 16
     b6a:	20 83       	st	Z, r18
     b6c:	53 94       	inc	r5
     b6e:	85 2d       	mov	r24, r5
     b70:	90 e0       	ldi	r25, 0x00	; 0
     b72:	69 e0       	ldi	r22, 0x09	; 9
     b74:	70 e0       	ldi	r23, 0x00	; 0
     b76:	c1 d2       	rcall	.+1410   	; 0x10fa <__mulhi3>
     b78:	88 0d       	add	r24, r8
     b7a:	99 1d       	adc	r25, r9
     b7c:	01 96       	adiw	r24, 0x01	; 1
     b7e:	ce 5b       	subi	r28, 0xBE	; 190
     b80:	de 4f       	sbci	r29, 0xFE	; 254
     b82:	e8 81       	ld	r30, Y
     b84:	c2 54       	subi	r28, 0x42	; 66
     b86:	d1 40       	sbci	r29, 0x01	; 1
     b88:	cd 5b       	subi	r28, 0xBD	; 189
     b8a:	de 4f       	sbci	r29, 0xFE	; 254
     b8c:	f8 81       	ld	r31, Y
     b8e:	c3 54       	subi	r28, 0x43	; 67
     b90:	d1 40       	sbci	r29, 0x01	; 1
     b92:	31 10       	cpse	r3, r1
     b94:	b9 cf       	rjmp	.-142    	; 0xb08 <.L166>

00000b96 <.L105>:
     b96:	c4 01       	movw	r24, r8
     b98:	01 96       	adiw	r24, 0x01	; 1
     b9a:	50 e0       	ldi	r21, 0x00	; 0

00000b9c <.L119>:
     b9c:	55 11       	cpse	r21, r5
     b9e:	80 c0       	rjmp	.+256    	; 0xca0 <.L168>
     ba0:	80 e0       	ldi	r24, 0x00	; 0

00000ba2 <.L122>:
     ba2:	78 94       	sei
     ba4:	81 11       	cpse	r24, r1
     ba6:	9a c0       	rjmp	.+308    	; 0xcdc <.L123>

00000ba8 <.L125>:
     ba8:	d4 01       	movw	r26, r8
     baa:	9c 91       	ld	r25, X
     bac:	90 31       	cpi	r25, 0x10	; 16
     bae:	09 f4       	brne	.+2      	; 0xbb2 <.L124>
     bb0:	8f 5f       	subi	r24, 0xFF	; 255

00000bb2 <.L124>:
     bb2:	b9 e0       	ldi	r27, 0x09	; 9
     bb4:	8b 0e       	add	r8, r27
     bb6:	91 1c       	adc	r9, r1
     bb8:	08 15       	cp	r16, r8
     bba:	19 05       	cpc	r17, r9
     bbc:	a9 f7       	brne	.-22     	; 0xba8 <.L125>
     bbe:	f8 01       	movw	r30, r16
     bc0:	84 83       	std	Z+4, r24	; 0x04
     bc2:	67 e0       	ldi	r22, 0x07	; 7

00000bc4 <.L199>:
     bc4:	c8 01       	movw	r24, r16
     bc6:	ae da       	rcall	.-2724   	; 0x124 <send_modbus_array>

00000bc8 <.L162>:
     bc8:	f0 e6       	ldi	r31, 0x60	; 96
     bca:	cf 1a       	sub	r12, r31
     bcc:	f2 e1       	ldi	r31, 0x12	; 18
     bce:	df 0a       	sbc	r13, r31
     bd0:	23 e0       	ldi	r18, 0x03	; 3
     bd2:	c2 16       	cp	r12, r18
     bd4:	d1 04       	cpc	r13, r1
     bd6:	08 f0       	brcs	.+2      	; 0xbda <L0^A+0x2>

00000bd8 <L0^A>:
     bd8:	b8 c0       	rjmp	.+368    	; 0xd4a <.L160>
     bda:	c1 5c       	subi	r28, 0xC1	; 193
     bdc:	de 4f       	sbci	r29, 0xFE	; 254
     bde:	88 81       	ld	r24, Y
     be0:	cf 53       	subi	r28, 0x3F	; 63
     be2:	d1 40       	sbci	r29, 0x01	; 1
     be4:	82 30       	cpi	r24, 0x02	; 2
     be6:	09 f0       	breq	.+2      	; 0xbea <L0^A+0x2>

00000be8 <L0^A>:
     be8:	48 ce       	rjmp	.-880    	; 0x87a <.L91>
     bea:	84 e0       	ldi	r24, 0x04	; 4
     bec:	f8 01       	movw	r30, r16
     bee:	82 83       	std	Z+2, r24	; 0x02
     bf0:	80 91 af 00 	lds	r24, 0x00AF	; 0x8000af <scd41_done>
     bf4:	81 11       	cpse	r24, r1
     bf6:	1a c0       	rjmp	.+52     	; 0xc2c <.L142>
     bf8:	83 e0       	ldi	r24, 0x03	; 3
     bfa:	90 e0       	ldi	r25, 0x00	; 0
     bfc:	68 d2       	rcall	.+1232   	; 0x10ce <eeprom_read_byte>
     bfe:	c8 2e       	mov	r12, r24
     c00:	84 e0       	ldi	r24, 0x04	; 4
     c02:	90 e0       	ldi	r25, 0x00	; 0
     c04:	64 d2       	rcall	.+1224   	; 0x10ce <eeprom_read_byte>
     c06:	9c 2d       	mov	r25, r12
     c08:	9c 01       	movw	r18, r24
     c0a:	2c 5b       	subi	r18, 0xBC	; 188
     c0c:	32 40       	sbci	r19, 0x02	; 2
     c0e:	2d 3b       	cpi	r18, 0xBD	; 189
     c10:	32 40       	sbci	r19, 0x02	; 2
     c12:	08 f4       	brcc	.+2      	; 0xc16 <.L143>
     c14:	6f dc       	rcall	.-1826   	; 0x4f4 <scd41SetAmbientPressure>

00000c16 <.L143>:
     c16:	f0 db       	rcall	.-2080   	; 0x3f8 <i2c_init>
     c18:	84 ec       	ldi	r24, 0xC4	; 196
     c1a:	01 dc       	rcall	.-2046   	; 0x41e <i2c_start>
     c1c:	81 e2       	ldi	r24, 0x21	; 33
     c1e:	30 dc       	rcall	.-1952   	; 0x480 <ass_i2c_write>
     c20:	8c ea       	ldi	r24, 0xAC	; 172
     c22:	2e dc       	rcall	.-1956   	; 0x480 <ass_i2c_write>
     c24:	1e dc       	rcall	.-1988   	; 0x462 <ass_i2c_stop>
     c26:	81 e0       	ldi	r24, 0x01	; 1
     c28:	80 93 af 00 	sts	0x00AF, r24	; 0x8000af <scd41_done>

00000c2c <.L142>:
     c2c:	80 e0       	ldi	r24, 0x00	; 0
     c2e:	22 e1       	ldi	r18, 0x12	; 18
     c30:	e2 16       	cp	r14, r18
     c32:	20 e6       	ldi	r18, 0x60	; 96
     c34:	f2 06       	cpc	r15, r18
     c36:	39 f0       	breq	.+14     	; 0xc46 <.L194>
     c38:	82 e0       	ldi	r24, 0x02	; 2
     c3a:	32 e1       	ldi	r19, 0x12	; 18
     c3c:	e3 16       	cp	r14, r19
     c3e:	31 e6       	ldi	r19, 0x61	; 97
     c40:	f3 06       	cpc	r15, r19
     c42:	09 f4       	brne	.+2      	; 0xc46 <.L194>
     c44:	81 e0       	ldi	r24, 0x01	; 1

00000c46 <.L194>:
     c46:	1b dd       	rcall	.-1482   	; 0x67e <scd41ReadValue>
     c48:	69 d2       	rcall	.+1234   	; 0x111c <__bswapsi2>
     c4a:	d8 01       	movw	r26, r16
     c4c:	13 96       	adiw	r26, 0x03	; 3
     c4e:	6d 93       	st	X+, r22
     c50:	7d 93       	st	X+, r23
     c52:	8d 93       	st	X+, r24
     c54:	9d 93       	st	X+, r25
     c56:	a5 ce       	rjmp	.-694    	; 0x9a2 <.L201>

00000c58 <.L187>:
     c58:	f5 01       	movw	r30, r10
     c5a:	90 81       	ld	r25, Z
     c5c:	97 29       	or	r25, r7

00000c5e <.L191>:
     c5e:	90 83       	st	Z, r25
     c60:	6c cf       	rjmp	.-296    	; 0xb3a <.L111>

00000c62 <.L188>:
     c62:	cc 5b       	subi	r28, 0xBC	; 188
     c64:	de 4f       	sbci	r29, 0xFE	; 254
     c66:	b8 81       	ld	r27, Y
     c68:	c4 54       	subi	r28, 0x44	; 68
     c6a:	d1 40       	sbci	r29, 0x01	; 1
     c6c:	b4 11       	cpse	r27, r4
     c6e:	03 c0       	rjmp	.+6      	; 0xc76 <.L112>
     c70:	97 29       	or	r25, r7
     c72:	f5 01       	movw	r30, r10
     c74:	f4 cf       	rjmp	.-24     	; 0xc5e <.L191>

00000c76 <.L112>:
     c76:	cc 5b       	subi	r28, 0xBC	; 188
     c78:	de 4f       	sbci	r29, 0xFE	; 254
     c7a:	f8 81       	ld	r31, Y
     c7c:	c4 54       	subi	r28, 0x44	; 68
     c7e:	d1 40       	sbci	r29, 0x01	; 1
     c80:	f4 15       	cp	r31, r4
     c82:	38 f4       	brcc	.+14     	; 0xc92 <.L113>
     c84:	87 2d       	mov	r24, r7
     c86:	80 95       	com	r24
     c88:	98 23       	and	r25, r24
     c8a:	d5 01       	movw	r26, r10
     c8c:	9c 93       	st	X, r25

00000c8e <.L192>:
     c8e:	34 2c       	mov	r3, r4
     c90:	54 cf       	rjmp	.-344    	; 0xb3a <.L111>

00000c92 <.L113>:
     c92:	89 2f       	mov	r24, r25
     c94:	87 21       	and	r24, r7
     c96:	09 f0       	breq	.+2      	; 0xc9a <L0^A+0x2>

00000c98 <L0^A>:
     c98:	50 cf       	rjmp	.-352    	; 0xb3a <.L111>
     c9a:	f9 cf       	rjmp	.-14     	; 0xc8e <.L192>

00000c9c <.L114>:
     c9c:	84 da       	rcall	.-2808   	; 0x1a6 <oneWireWriteBit0.constprop.0>
     c9e:	51 cf       	rjmp	.-350    	; 0xb42 <.L115>

00000ca0 <.L168>:
     ca0:	fc 01       	movw	r30, r24
     ca2:	40 e0       	ldi	r20, 0x00	; 0
     ca4:	9c 01       	movw	r18, r24
     ca6:	29 5f       	subi	r18, 0xF9	; 249
     ca8:	3f 4f       	sbci	r19, 0xFF	; 255

00000caa <.L121>:
     caa:	71 91       	ld	r23, Z+
     cac:	68 e0       	ldi	r22, 0x08	; 8

00000cae <.L120>:
     cae:	a7 2f       	mov	r26, r23
     cb0:	a4 27       	eor	r26, r20
     cb2:	46 95       	lsr	r20
     cb4:	a0 ff       	sbrs	r26, 0
     cb6:	02 c0       	rjmp	.+4      	; 0xcbc <.L190>
     cb8:	ac e8       	ldi	r26, 0x8C	; 140
     cba:	4a 27       	eor	r20, r26

00000cbc <.L190>:
     cbc:	76 95       	lsr	r23
     cbe:	61 50       	subi	r22, 0x01	; 1
     cc0:	b1 f7       	brne	.-20     	; 0xcae <.L120>
     cc2:	2e 17       	cp	r18, r30
     cc4:	3f 07       	cpc	r19, r31
     cc6:	89 f7       	brne	.-30     	; 0xcaa <.L121>
     cc8:	09 96       	adiw	r24, 0x09	; 9
     cca:	fc 01       	movw	r30, r24
     ccc:	32 97       	sbiw	r30, 0x02	; 2
     cce:	20 81       	ld	r18, Z
     cd0:	42 13       	cpse	r20, r18
     cd2:	02 c0       	rjmp	.+4      	; 0xcd8 <.L167>
     cd4:	5f 5f       	subi	r21, 0xFF	; 255
     cd6:	62 cf       	rjmp	.-316    	; 0xb9c <.L119>

00000cd8 <.L167>:
     cd8:	8f ef       	ldi	r24, 0xFF	; 255
     cda:	63 cf       	rjmp	.-314    	; 0xba2 <.L122>

00000cdc <.L123>:
     cdc:	d8 01       	movw	r26, r16
     cde:	11 96       	adiw	r26, 0x01	; 1
     ce0:	8c 91       	ld	r24, X
     ce2:	80 58       	subi	r24, 0x80	; 128
     ce4:	8d 93       	st	X+, r24
     ce6:	81 e1       	ldi	r24, 0x11	; 17
     ce8:	8c 93       	st	X, r24
     cea:	65 e0       	ldi	r22, 0x05	; 5
     cec:	6b cf       	rjmp	.-298    	; 0xbc4 <.L199>

00000cee <.L103>:
     cee:	c6 01       	movw	r24, r12
     cf0:	91 50       	subi	r25, 0x01	; 1
     cf2:	81 97       	sbiw	r24, 0x21	; 33
     cf4:	08 f0       	brcs	.+2      	; 0xcf8 <L0^A+0x2>

00000cf6 <L0^A>:
     cf6:	65 c0       	rjmp	.+202    	; 0xdc2 <.L127>
     cf8:	b4 e0       	ldi	r27, 0x04	; 4
     cfa:	bb 12       	cpse	r11, r27
     cfc:	be cd       	rjmp	.-1156   	; 0x87a <.L91>
     cfe:	88 e0       	ldi	r24, 0x08	; 8
     d00:	f8 01       	movw	r30, r16
     d02:	82 83       	std	Z+2, r24	; 0x02
     d04:	d1 2c       	mov	r13, r1
     d06:	c6 01       	movw	r24, r12
     d08:	69 e0       	ldi	r22, 0x09	; 9
     d0a:	70 e0       	ldi	r23, 0x00	; 0
     d0c:	f6 d1       	rcall	.+1004   	; 0x10fa <__mulhi3>
     d0e:	fe 01       	movw	r30, r28
     d10:	31 96       	adiw	r30, 0x01	; 1
     d12:	e8 0f       	add	r30, r24
     d14:	f9 1f       	adc	r31, r25
     d16:	80 81       	ld	r24, Z
     d18:	80 31       	cpi	r24, 0x10	; 16
     d1a:	09 f0       	breq	.+2      	; 0xd1e <L0^A+0x2>

00000d1c <L0^A>:
     d1c:	4a c0       	rjmp	.+148    	; 0xdb2 <.L128>
     d1e:	c6 01       	movw	r24, r12
     d20:	69 e0       	ldi	r22, 0x09	; 9
     d22:	70 e0       	ldi	r23, 0x00	; 0
     d24:	ea d1       	rcall	.+980    	; 0x10fa <__mulhi3>
     d26:	fc 01       	movw	r30, r24
     d28:	31 96       	adiw	r30, 0x01	; 1
     d2a:	9e 01       	movw	r18, r28
     d2c:	2f 5f       	subi	r18, 0xFF	; 255
     d2e:	3f 4f       	sbci	r19, 0xFF	; 255
     d30:	e2 0f       	add	r30, r18
     d32:	f3 1f       	adc	r31, r19
     d34:	88 e0       	ldi	r24, 0x08	; 8
     d36:	de 01       	movw	r26, r28
     d38:	ac 5d       	subi	r26, 0xDC	; 220
     d3a:	be 4f       	sbci	r27, 0xFE	; 254

00000d3c <.L0^B3>:
     d3c:	01 90       	ld	r0, Z+
     d3e:	0d 92       	st	X+, r0
     d40:	8a 95       	dec	r24
     d42:	e1 f7       	brne	.-8      	; 0xd3c <.L0^B3>
     d44:	6d e0       	ldi	r22, 0x0D	; 13

00000d46 <.L195>:
     d46:	c8 01       	movw	r24, r16
     d48:	ed d9       	rcall	.-3110   	; 0x124 <send_modbus_array>

00000d4a <.L160>:
     d4a:	b2 e1       	ldi	r27, 0x12	; 18
     d4c:	eb 16       	cp	r14, r27
     d4e:	b0 e2       	ldi	r27, 0x20	; 32
     d50:	fb 06       	cpc	r15, r27
     d52:	09 f0       	breq	.+2      	; 0xd56 <L0^A+0x2>

00000d54 <L0^A>:
     d54:	92 cd       	rjmp	.-1244   	; 0x87a <.L91>
     d56:	c1 5c       	subi	r28, 0xC1	; 193
     d58:	de 4f       	sbci	r29, 0xFE	; 254
     d5a:	88 81       	ld	r24, Y
     d5c:	cf 53       	subi	r28, 0x3F	; 63
     d5e:	d1 40       	sbci	r29, 0x01	; 1
     d60:	82 30       	cpi	r24, 0x02	; 2
     d62:	09 f0       	breq	.+2      	; 0xd66 <L0^A+0x2>

00000d64 <L0^A>:
     d64:	8a cd       	rjmp	.-1260   	; 0x87a <.L91>
     d66:	84 e0       	ldi	r24, 0x04	; 4
     d68:	f8 01       	movw	r30, r16
     d6a:	82 83       	std	Z+2, r24	; 0x02
     d6c:	80 91 ae 00 	lds	r24, 0x00AE	; 0x8000ae <bh1750_done>
     d70:	81 11       	cpse	r24, r1
     d72:	13 c0       	rjmp	.+38     	; 0xd9a <.L147>
     d74:	f8 94       	cli
     d76:	86 e4       	ldi	r24, 0x46	; 70
     d78:	52 db       	rcall	.-2396   	; 0x41e <i2c_start>
     d7a:	80 e1       	ldi	r24, 0x10	; 16
     d7c:	81 db       	rcall	.-2302   	; 0x480 <ass_i2c_write>
     d7e:	71 db       	rcall	.-2334   	; 0x462 <ass_i2c_stop>
     d80:	78 94       	sei
     d82:	ff e7       	ldi	r31, 0x7F	; 127
     d84:	20 e2       	ldi	r18, 0x20	; 32
     d86:	35 e0       	ldi	r19, 0x05	; 5

00000d88 <.L1^B15>:
     d88:	f1 50       	subi	r31, 0x01	; 1
     d8a:	20 40       	sbci	r18, 0x00	; 0
     d8c:	30 40       	sbci	r19, 0x00	; 0
     d8e:	e1 f7       	brne	.-8      	; 0xd88 <.L1^B15>
     d90:	00 c0       	rjmp	.+0      	; 0xd92 <L0^A>

00000d92 <L0^A>:
     d92:	00 00       	nop
     d94:	81 e0       	ldi	r24, 0x01	; 1
     d96:	80 93 ae 00 	sts	0x00AE, r24	; 0x8000ae <bh1750_done>

00000d9a <.L147>:
     d9a:	f8 94       	cli
     d9c:	2d db       	rcall	.-2470   	; 0x3f8 <i2c_init>
     d9e:	78 94       	sei
     da0:	80 ec       	ldi	r24, 0xC0	; 192
     da2:	d8 01       	movw	r26, r16
     da4:	13 96       	adiw	r26, 0x03	; 3
     da6:	8d 93       	st	X+, r24
     da8:	80 e4       	ldi	r24, 0x40	; 64
     daa:	8d 93       	st	X+, r24
     dac:	1d 92       	st	X+, r1
     dae:	1c 92       	st	X, r1
     db0:	f8 cd       	rjmp	.-1040   	; 0x9a2 <.L201>

00000db2 <.L128>:
     db2:	84 e8       	ldi	r24, 0x84	; 132
     db4:	d8 01       	movw	r26, r16
     db6:	11 96       	adiw	r26, 0x01	; 1
     db8:	8d 93       	st	X+, r24
     dba:	82 e0       	ldi	r24, 0x02	; 2
     dbc:	8c 93       	st	X, r24
     dbe:	65 e0       	ldi	r22, 0x05	; 5
     dc0:	c2 cf       	rjmp	.-124    	; 0xd46 <.L195>

00000dc2 <.L127>:
     dc2:	c6 01       	movw	r24, r12
     dc4:	92 50       	subi	r25, 0x02	; 2
     dc6:	81 97       	sbiw	r24, 0x21	; 33
     dc8:	08 f0       	brcs	.+2      	; 0xdcc <L0^A+0x2>

00000dca <L0^A>:
     dca:	0f c1       	rjmp	.+542    	; 0xfea <.L130>
     dcc:	b2 e0       	ldi	r27, 0x02	; 2
     dce:	bb 12       	cpse	r11, r27
     dd0:	54 cd       	rjmp	.-1368   	; 0x87a <.L91>
     dd2:	f8 01       	movw	r30, r16
     dd4:	a2 82       	std	Z+2, r10	; 0x02
     dd6:	d1 2c       	mov	r13, r1
     dd8:	c6 01       	movw	r24, r12
     dda:	69 e0       	ldi	r22, 0x09	; 9
     ddc:	70 e0       	ldi	r23, 0x00	; 0
     dde:	8d d1       	rcall	.+794    	; 0x10fa <__mulhi3>
     de0:	fe 01       	movw	r30, r28
     de2:	31 96       	adiw	r30, 0x01	; 1
     de4:	e8 0f       	add	r30, r24
     de6:	f9 1f       	adc	r31, r25
     de8:	80 81       	ld	r24, Z
     dea:	80 31       	cpi	r24, 0x10	; 16
     dec:	09 f0       	breq	.+2      	; 0xdf0 <L0^A+0x2>

00000dee <L0^A>:
     dee:	80 c0       	rjmp	.+256    	; 0xef0 <.L131>
     df0:	f8 94       	cli
     df2:	2f da       	rcall	.-2978   	; 0x252 <oneWireDetectPresence.constprop.0>
     df4:	81 11       	cpse	r24, r1
     df6:	12 c0       	rjmp	.+36     	; 0xe1c <.L132>

00000df8 <.L135>:
     df8:	6d ef       	ldi	r22, 0xFD	; 253
     dfa:	7f ef       	ldi	r23, 0xFF	; 255

00000dfc <.L133>:
     dfc:	78 94       	sei
     dfe:	80 e0       	ldi	r24, 0x00	; 0
     e00:	90 e0       	ldi	r25, 0x00	; 0
     e02:	8d d2       	rcall	.+1306   	; 0x131e <__floatunsisf>
     e04:	20 e0       	ldi	r18, 0x00	; 0
     e06:	30 e0       	ldi	r19, 0x00	; 0
     e08:	40 e8       	ldi	r20, 0x80	; 128
     e0a:	5d e3       	ldi	r21, 0x3D	; 61
     e0c:	10 d3       	rcall	.+1568   	; 0x142e <__mulsf3>

00000e0e <.L202>:
     e0e:	d8 01       	movw	r26, r16
     e10:	13 96       	adiw	r26, 0x03	; 3
     e12:	9d 93       	st	X+, r25
     e14:	8d 93       	st	X+, r24
     e16:	7d 93       	st	X+, r23
     e18:	6c 93       	st	X, r22
     e1a:	c3 cd       	rjmp	.-1146   	; 0x9a2 <.L201>

00000e1c <.L132>:
     e1c:	c6 01       	movw	r24, r12
     e1e:	69 e0       	ldi	r22, 0x09	; 9
     e20:	70 e0       	ldi	r23, 0x00	; 0
     e22:	6b d1       	rcall	.+726    	; 0x10fa <__mulhi3>
     e24:	01 96       	adiw	r24, 0x01	; 1
     e26:	7c 01       	movw	r14, r24
     e28:	9e 01       	movw	r18, r28
     e2a:	2f 5f       	subi	r18, 0xFF	; 255
     e2c:	3f 4f       	sbci	r19, 0xFF	; 255
     e2e:	e2 0e       	add	r14, r18
     e30:	f3 1e       	adc	r15, r19
     e32:	c7 01       	movw	r24, r14
     e34:	d6 d9       	rcall	.-3156   	; 0x1e2 <oneWireMatchRom.constprop.0>
     e36:	84 e4       	ldi	r24, 0x44	; 68
     e38:	c5 d9       	rcall	.-3190   	; 0x1c4 <oneWireSendByte.constprop.0>

00000e3a <.L134>:
     e3a:	e9 d9       	rcall	.-3118   	; 0x20e <oneWireReadBit.constprop.0>
     e3c:	81 15       	cp	r24, r1
     e3e:	e9 f3       	breq	.-6      	; 0xe3a <.L134>
     e40:	08 da       	rcall	.-3056   	; 0x252 <oneWireDetectPresence.constprop.0>
     e42:	81 15       	cp	r24, r1
     e44:	c9 f2       	breq	.-78     	; 0xdf8 <.L135>
     e46:	c7 01       	movw	r24, r14
     e48:	cc d9       	rcall	.-3176   	; 0x1e2 <oneWireMatchRom.constprop.0>
     e4a:	8e eb       	ldi	r24, 0xBE	; 190
     e4c:	bb d9       	rcall	.-3210   	; 0x1c4 <oneWireSendByte.constprop.0>
     e4e:	f3 d9       	rcall	.-3098   	; 0x236 <oneWireReceiveByte.constprop.0>
     e50:	f8 2e       	mov	r15, r24
     e52:	cf 5c       	subi	r28, 0xCF	; 207
     e54:	de 4f       	sbci	r29, 0xFE	; 254
     e56:	88 83       	st	Y, r24
     e58:	c1 53       	subi	r28, 0x31	; 49
     e5a:	d1 40       	sbci	r29, 0x01	; 1
     e5c:	ec d9       	rcall	.-3112   	; 0x236 <oneWireReceiveByte.constprop.0>
     e5e:	e8 2e       	mov	r14, r24
     e60:	ce 5c       	subi	r28, 0xCE	; 206
     e62:	de 4f       	sbci	r29, 0xFE	; 254
     e64:	88 83       	st	Y, r24
     e66:	c2 53       	subi	r28, 0x32	; 50
     e68:	d1 40       	sbci	r29, 0x01	; 1
     e6a:	e5 d9       	rcall	.-3126   	; 0x236 <oneWireReceiveByte.constprop.0>
     e6c:	cd 5c       	subi	r28, 0xCD	; 205
     e6e:	de 4f       	sbci	r29, 0xFE	; 254
     e70:	88 83       	st	Y, r24
     e72:	c3 53       	subi	r28, 0x33	; 51
     e74:	d1 40       	sbci	r29, 0x01	; 1
     e76:	df d9       	rcall	.-3138   	; 0x236 <oneWireReceiveByte.constprop.0>
     e78:	cc 5c       	subi	r28, 0xCC	; 204
     e7a:	de 4f       	sbci	r29, 0xFE	; 254
     e7c:	88 83       	st	Y, r24
     e7e:	c4 53       	subi	r28, 0x34	; 52
     e80:	d1 40       	sbci	r29, 0x01	; 1
     e82:	d9 d9       	rcall	.-3150   	; 0x236 <oneWireReceiveByte.constprop.0>
     e84:	cb 5c       	subi	r28, 0xCB	; 203
     e86:	de 4f       	sbci	r29, 0xFE	; 254
     e88:	88 83       	st	Y, r24
     e8a:	c5 53       	subi	r28, 0x35	; 53
     e8c:	d1 40       	sbci	r29, 0x01	; 1
     e8e:	d3 d9       	rcall	.-3162   	; 0x236 <oneWireReceiveByte.constprop.0>
     e90:	ca 5c       	subi	r28, 0xCA	; 202
     e92:	de 4f       	sbci	r29, 0xFE	; 254
     e94:	88 83       	st	Y, r24
     e96:	c6 53       	subi	r28, 0x36	; 54
     e98:	d1 40       	sbci	r29, 0x01	; 1
     e9a:	cd d9       	rcall	.-3174   	; 0x236 <oneWireReceiveByte.constprop.0>
     e9c:	c9 5c       	subi	r28, 0xC9	; 201
     e9e:	de 4f       	sbci	r29, 0xFE	; 254
     ea0:	88 83       	st	Y, r24
     ea2:	c7 53       	subi	r28, 0x37	; 55
     ea4:	d1 40       	sbci	r29, 0x01	; 1
     ea6:	c7 d9       	rcall	.-3186   	; 0x236 <oneWireReceiveByte.constprop.0>
     ea8:	c8 5c       	subi	r28, 0xC8	; 200
     eaa:	de 4f       	sbci	r29, 0xFE	; 254
     eac:	88 83       	st	Y, r24
     eae:	c8 53       	subi	r28, 0x38	; 56
     eb0:	d1 40       	sbci	r29, 0x01	; 1
     eb2:	c1 d9       	rcall	.-3198   	; 0x236 <oneWireReceiveByte.constprop.0>
     eb4:	fe 01       	movw	r30, r28
     eb6:	ef 5c       	subi	r30, 0xCF	; 207
     eb8:	fe 4f       	sbci	r31, 0xFE	; 254
     eba:	9e 01       	movw	r18, r28
     ebc:	27 5c       	subi	r18, 0xC7	; 199
     ebe:	3e 4f       	sbci	r19, 0xFE	; 254
     ec0:	90 e0       	ldi	r25, 0x00	; 0

00000ec2 <.L137>:
     ec2:	51 91       	ld	r21, Z+
     ec4:	48 e0       	ldi	r20, 0x08	; 8

00000ec6 <.L136>:
     ec6:	69 2f       	mov	r22, r25
     ec8:	65 27       	eor	r22, r21
     eca:	96 95       	lsr	r25
     ecc:	60 ff       	sbrs	r22, 0
     ece:	02 c0       	rjmp	.+4      	; 0xed4 <.L189>
     ed0:	6c e8       	ldi	r22, 0x8C	; 140
     ed2:	96 27       	eor	r25, r22

00000ed4 <.L189>:
     ed4:	56 95       	lsr	r21
     ed6:	41 50       	subi	r20, 0x01	; 1
     ed8:	b1 f7       	brne	.-20     	; 0xec6 <.L136>
     eda:	e2 17       	cp	r30, r18
     edc:	f3 07       	cpc	r31, r19
     ede:	89 f7       	brne	.-30     	; 0xec2 <.L137>
     ee0:	6e ef       	ldi	r22, 0xFE	; 254
     ee2:	7f ef       	ldi	r23, 0xFF	; 255
     ee4:	98 13       	cpse	r25, r24
     ee6:	8a cf       	rjmp	.-236    	; 0xdfc <.L133>
     ee8:	8f 2d       	mov	r24, r15
     eea:	9e 2d       	mov	r25, r14
     eec:	bc 01       	movw	r22, r24
     eee:	86 cf       	rjmp	.-244    	; 0xdfc <.L133>

00000ef0 <.L131>:
     ef0:	84 e8       	ldi	r24, 0x84	; 132
     ef2:	f8 01       	movw	r30, r16
     ef4:	81 83       	std	Z+1, r24	; 0x01
     ef6:	b2 82       	std	Z+2, r11	; 0x02

00000ef8 <.L198>:
     ef8:	65 e0       	ldi	r22, 0x05	; 5
     efa:	36 cd       	rjmp	.-1428   	; 0x968 <.L196>

00000efc <.L96>:
     efc:	f8 01       	movw	r30, r16
     efe:	a1 82       	std	Z+1, r10	; 0x01
     f00:	e1 14       	cp	r14, r1
     f02:	f1 04       	cpc	r15, r1
     f04:	09 f0       	breq	.+2      	; 0xf08 <L0^A+0x2>

00000f06 <L0^A>:
     f06:	31 c0       	rjmp	.+98     	; 0xf6a <.L148>
     f08:	81 11       	cpse	r24, r1
     f0a:	1e c0       	rjmp	.+60     	; 0xf48 <.L149>
     f0c:	f1 e0       	ldi	r31, 0x01	; 1
     f0e:	bf 12       	cpse	r11, r31
     f10:	1b c0       	rjmp	.+54     	; 0xf48 <.L149>
     f12:	68 e0       	ldi	r22, 0x08	; 8
     f14:	ce 01       	movw	r24, r28
     f16:	86 5c       	subi	r24, 0xC6	; 198
     f18:	9e 4f       	sbci	r25, 0xFE	; 254
     f1a:	a4 d8       	rcall	.-3768   	; 0x64 <usiuartx_tx_array>
     f1c:	2f e7       	ldi	r18, 0x7F	; 127
     f1e:	38 e3       	ldi	r19, 0x38	; 56
     f20:	41 e0       	ldi	r20, 0x01	; 1

00000f22 <.L1^B16>:
     f22:	21 50       	subi	r18, 0x01	; 1
     f24:	30 40       	sbci	r19, 0x00	; 0
     f26:	40 40       	sbci	r20, 0x00	; 0
     f28:	e1 f7       	brne	.-8      	; 0xf22 <.L1^B16>
     f2a:	00 c0       	rjmp	.+0      	; 0xf2c <L0^A>

00000f2c <L0^A>:
     f2c:	00 00       	nop
     f2e:	f8 94       	cli
     f30:	e2 e4       	ldi	r30, 0x42	; 66
     f32:	ef 93       	push	r30
     f34:	ef e4       	ldi	r30, 0x4F	; 79
     f36:	ef 93       	push	r30
     f38:	ef e4       	ldi	r30, 0x4F	; 79
     f3a:	ef 93       	push	r30
     f3c:	e4 e5       	ldi	r30, 0x54	; 84
     f3e:	ef 93       	push	r30
     f40:	e0 e0       	ldi	r30, 0x00	; 0
     f42:	fe e0       	ldi	r31, 0x0E	; 14
     f44:	09 94       	ijmp
     f46:	99 cc       	rjmp	.-1742   	; 0x87a <.L91>

00000f48 <.L149>:
     f48:	86 e8       	ldi	r24, 0x86	; 134
     f4a:	c5 5c       	subi	r28, 0xC5	; 197
     f4c:	de 4f       	sbci	r29, 0xFE	; 254
     f4e:	88 83       	st	Y, r24
     f50:	cb 53       	subi	r28, 0x3B	; 59
     f52:	d1 40       	sbci	r29, 0x01	; 1
     f54:	c4 5c       	subi	r28, 0xC4	; 196
     f56:	de 4f       	sbci	r29, 0xFE	; 254
     f58:	28 82       	st	Y, r2
     f5a:	cc 53       	subi	r28, 0x3C	; 60
     f5c:	d1 40       	sbci	r29, 0x01	; 1
     f5e:	65 e0       	ldi	r22, 0x05	; 5
     f60:	ce 01       	movw	r24, r28
     f62:	86 5c       	subi	r24, 0xC6	; 198
     f64:	9e 4f       	sbci	r25, 0xFE	; 254

00000f66 <.L197>:
     f66:	de d8       	rcall	.-3652   	; 0x124 <send_modbus_array>
     f68:	88 cc       	rjmp	.-1776   	; 0x87a <.L91>

00000f6a <.L148>:
     f6a:	e1 14       	cp	r14, r1
     f6c:	91 e0       	ldi	r25, 0x01	; 1
     f6e:	f9 06       	cpc	r15, r25
     f70:	89 f4       	brne	.+34     	; 0xf94 <.L151>
     f72:	81 11       	cpse	r24, r1
     f74:	34 c0       	rjmp	.+104    	; 0xfde <.L156>
     f76:	8f ef       	ldi	r24, 0xFF	; 255
     f78:	8b 0d       	add	r24, r11
     f7a:	8e 3f       	cpi	r24, 0xFE	; 254
     f7c:	80 f5       	brcc	.+96     	; 0xfde <.L156>
     f7e:	6b 2d       	mov	r22, r11
     f80:	80 e0       	ldi	r24, 0x00	; 0
     f82:	90 e0       	ldi	r25, 0x00	; 0
     f84:	ac d0       	rcall	.+344    	; 0x10de <eeprom_write_byte>
     f86:	68 e0       	ldi	r22, 0x08	; 8
     f88:	ce 01       	movw	r24, r28
     f8a:	86 5c       	subi	r24, 0xC6	; 198
     f8c:	9e 4f       	sbci	r25, 0xFE	; 254
     f8e:	6a d8       	rcall	.-3884   	; 0x64 <usiuartx_tx_array>
     f90:	6b 2c       	mov	r6, r11
     f92:	73 cc       	rjmp	.-1818   	; 0x87a <.L91>

00000f94 <.L151>:
     f94:	f2 e1       	ldi	r31, 0x12	; 18
     f96:	ef 16       	cp	r14, r31
     f98:	f3 e6       	ldi	r31, 0x63	; 99
     f9a:	ff 06       	cpc	r15, r31
     f9c:	09 f0       	breq	.+2      	; 0xfa0 <L0^A+0x2>

00000f9e <L0^A>:
     f9e:	46 c0       	rjmp	.+140    	; 0x102c <.L154>
     fa0:	c2 5c       	subi	r28, 0xC2	; 194
     fa2:	de 4f       	sbci	r29, 0xFE	; 254
     fa4:	e8 80       	ld	r14, Y
     fa6:	f9 80       	ldd	r15, Y+1	; 0x01
     fa8:	ce 53       	subi	r28, 0x3E	; 62
     faa:	d1 40       	sbci	r29, 0x01	; 1
     fac:	fe 24       	eor	r15, r14
     fae:	ef 24       	eor	r14, r15
     fb0:	fe 24       	eor	r15, r14
     fb2:	c7 01       	movw	r24, r14
     fb4:	8c 5b       	subi	r24, 0xBC	; 188
     fb6:	92 40       	sbci	r25, 0x02	; 2
     fb8:	8d 3b       	cpi	r24, 0xBD	; 189
     fba:	92 40       	sbci	r25, 0x02	; 2
     fbc:	80 f4       	brcc	.+32     	; 0xfde <.L156>
     fbe:	c7 01       	movw	r24, r14
     fc0:	99 da       	rcall	.-2766   	; 0x4f4 <scd41SetAmbientPressure>
     fc2:	6f 2d       	mov	r22, r15
     fc4:	83 e0       	ldi	r24, 0x03	; 3
     fc6:	90 e0       	ldi	r25, 0x00	; 0
     fc8:	8a d0       	rcall	.+276    	; 0x10de <eeprom_write_byte>
     fca:	6e 2d       	mov	r22, r14
     fcc:	84 e0       	ldi	r24, 0x04	; 4
     fce:	90 e0       	ldi	r25, 0x00	; 0
     fd0:	86 d0       	rcall	.+268    	; 0x10de <eeprom_write_byte>
     fd2:	68 e0       	ldi	r22, 0x08	; 8
     fd4:	ce 01       	movw	r24, r28
     fd6:	86 5c       	subi	r24, 0xC6	; 198
     fd8:	9e 4f       	sbci	r25, 0xFE	; 254
     fda:	44 d8       	rcall	.-3960   	; 0x64 <usiuartx_tx_array>
     fdc:	4e cc       	rjmp	.-1892   	; 0x87a <.L91>

00000fde <.L156>:
     fde:	e6 e8       	ldi	r30, 0x86	; 134
     fe0:	d8 01       	movw	r26, r16
     fe2:	11 96       	adiw	r26, 0x01	; 1
     fe4:	ed 93       	st	X+, r30
     fe6:	2c 92       	st	X, r2
     fe8:	87 cf       	rjmp	.-242    	; 0xef8 <.L198>

00000fea <.L130>:
     fea:	32 e1       	ldi	r19, 0x12	; 18
     fec:	e3 16       	cp	r14, r19
     fee:	f1 04       	cpc	r15, r1
     ff0:	09 f0       	breq	.+2      	; 0xff4 <L0^A+0x2>

00000ff2 <L0^A>:
     ff2:	01 cd       	rjmp	.-1534   	; 0x9f6 <.L102>
     ff4:	f1 e0       	ldi	r31, 0x01	; 1
     ff6:	bf 12       	cpse	r11, r31
     ff8:	40 cc       	rjmp	.-1920   	; 0x87a <.L91>
     ffa:	82 e0       	ldi	r24, 0x02	; 2
     ffc:	d8 01       	movw	r26, r16
     ffe:	12 96       	adiw	r26, 0x02	; 2
    1000:	8c 93       	st	X, r24
    1002:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <i2c_inited.0>
    1006:	81 11       	cpse	r24, r1
    1008:	03 c0       	rjmp	.+6      	; 0x1010 <.L139>
    100a:	f6 d9       	rcall	.-3092   	; 0x3f8 <i2c_init>
    100c:	b0 92 b0 00 	sts	0x00B0, r11	; 0x8000b0 <i2c_inited.0>

00001010 <.L139>:
    1010:	82 e0       	ldi	r24, 0x02	; 2
    1012:	05 da       	rcall	.-3062   	; 0x41e <i2c_start>
    1014:	81 e0       	ldi	r24, 0x01	; 1
    1016:	f8 01       	movw	r30, r16
    1018:	83 83       	std	Z+3, r24	; 0x03
    101a:	23 da       	rcall	.-3002   	; 0x462 <ass_i2c_stop>
    101c:	84 e0       	ldi	r24, 0x04	; 4
    101e:	ff d9       	rcall	.-3074   	; 0x41e <i2c_start>
    1020:	82 e0       	ldi	r24, 0x02	; 2
    1022:	d8 01       	movw	r26, r16
    1024:	14 96       	adiw	r26, 0x04	; 4
    1026:	8c 93       	st	X, r24
    1028:	1c da       	rcall	.-3016   	; 0x462 <ass_i2c_stop>
    102a:	9d cc       	rjmp	.-1734   	; 0x966 <.L200>

0000102c <.L154>:
    102c:	42 e1       	ldi	r20, 0x12	; 18
    102e:	e4 16       	cp	r14, r20
    1030:	44 e6       	ldi	r20, 0x64	; 100
    1032:	f4 06       	cpc	r15, r20
    1034:	09 f0       	breq	.+2      	; 0x1038 <L0^A+0x2>

00001036 <L0^A>:
    1036:	21 cc       	rjmp	.-1982   	; 0x87a <.L91>
    1038:	c2 5c       	subi	r28, 0xC2	; 194
    103a:	de 4f       	sbci	r29, 0xFE	; 254
    103c:	e8 80       	ld	r14, Y
    103e:	f9 80       	ldd	r15, Y+1	; 0x01
    1040:	ce 53       	subi	r28, 0x3E	; 62
    1042:	d1 40       	sbci	r29, 0x01	; 1
    1044:	fe 24       	eor	r15, r14
    1046:	ef 24       	eor	r14, r15
    1048:	fe 24       	eor	r15, r14
    104a:	c7 01       	movw	r24, r14
    104c:	80 59       	subi	r24, 0x90	; 144
    104e:	91 40       	sbci	r25, 0x01	; 1
    1050:	81 34       	cpi	r24, 0x41	; 65
    1052:	96 40       	sbci	r25, 0x06	; 6
    1054:	20 f6       	brcc	.-120    	; 0xfde <.L156>
    1056:	cf 5c       	subi	r28, 0xCF	; 207
    1058:	de 4f       	sbci	r29, 0xFE	; 254
    105a:	f9 82       	std	Y+1, r15	; 0x01
    105c:	e8 82       	st	Y, r14
    105e:	c1 53       	subi	r28, 0x31	; 49
    1060:	d1 40       	sbci	r29, 0x01	; 1
    1062:	ca d9       	rcall	.-3180   	; 0x3f8 <i2c_init>
    1064:	84 ec       	ldi	r24, 0xC4	; 196
    1066:	db d9       	rcall	.-3146   	; 0x41e <i2c_start>
    1068:	86 e3       	ldi	r24, 0x36	; 54
    106a:	0a da       	rcall	.-3052   	; 0x480 <ass_i2c_write>
    106c:	8f e2       	ldi	r24, 0x2F	; 47
    106e:	08 da       	rcall	.-3056   	; 0x480 <ass_i2c_write>
    1070:	8f 2d       	mov	r24, r15
    1072:	06 da       	rcall	.-3060   	; 0x480 <ass_i2c_write>
    1074:	8e 2d       	mov	r24, r14
    1076:	04 da       	rcall	.-3064   	; 0x480 <ass_i2c_write>
    1078:	ce 01       	movw	r24, r28
    107a:	8f 5c       	subi	r24, 0xCF	; 207
    107c:	9e 4f       	sbci	r25, 0xFE	; 254
    107e:	67 d8       	rcall	.-3890   	; 0x14e <clcCRC8.constprop.0>
    1080:	ff d9       	rcall	.-3074   	; 0x480 <ass_i2c_write>
    1082:	2f ef       	ldi	r18, 0xFF	; 255
    1084:	33 ec       	ldi	r19, 0xC3	; 195
    1086:	49 e0       	ldi	r20, 0x09	; 9

00001088 <.L1^B17>:
    1088:	21 50       	subi	r18, 0x01	; 1
    108a:	30 40       	sbci	r19, 0x00	; 0
    108c:	40 40       	sbci	r20, 0x00	; 0
    108e:	e1 f7       	brne	.-8      	; 0x1088 <.L1^B17>
    1090:	00 c0       	rjmp	.+0      	; 0x1092 <L0^A>

00001092 <L0^A>:
    1092:	00 00       	nop
    1094:	85 ec       	ldi	r24, 0xC5	; 197
    1096:	d3 d9       	rcall	.-3162   	; 0x43e <i2c_rep_start>
    1098:	80 e0       	ldi	r24, 0x00	; 0
    109a:	4c da       	rcall	.-2920   	; 0x534 <i2c_read>
    109c:	80 e0       	ldi	r24, 0x00	; 0
    109e:	4a da       	rcall	.-2924   	; 0x534 <i2c_read>
    10a0:	81 e0       	ldi	r24, 0x01	; 1
    10a2:	48 da       	rcall	.-2928   	; 0x534 <i2c_read>
    10a4:	de d9       	rcall	.-3140   	; 0x462 <ass_i2c_stop>
    10a6:	c4 5c       	subi	r28, 0xC4	; 196
    10a8:	de 4f       	sbci	r29, 0xFE	; 254
    10aa:	88 81       	ld	r24, Y
    10ac:	cc 53       	subi	r28, 0x3C	; 60
    10ae:	d1 40       	sbci	r29, 0x01	; 1
    10b0:	d8 01       	movw	r26, r16
    10b2:	12 96       	adiw	r26, 0x02	; 2
    10b4:	8d 93       	st	X+, r24
    10b6:	c3 5c       	subi	r28, 0xC3	; 195
    10b8:	de 4f       	sbci	r29, 0xFE	; 254
    10ba:	88 81       	ld	r24, Y
    10bc:	cd 53       	subi	r28, 0x3D	; 61
    10be:	d1 40       	sbci	r29, 0x01	; 1
    10c0:	8d 93       	st	X+, r24
    10c2:	e0 e2       	ldi	r30, 0x20	; 32
    10c4:	ed 93       	st	X+, r30
    10c6:	f0 e2       	ldi	r31, 0x20	; 32
    10c8:	fc 93       	st	X, r31
    10ca:	68 e0       	ldi	r22, 0x08	; 8
    10cc:	4d cc       	rjmp	.-1894   	; 0x968 <.L196>

000010ce <eeprom_read_byte>:
    10ce:	e1 99       	sbic	0x1c, 1	; 28
    10d0:	fe cf       	rjmp	.-4      	; 0x10ce <eeprom_read_byte>
    10d2:	9f bb       	out	0x1f, r25	; 31
    10d4:	8e bb       	out	0x1e, r24	; 30
    10d6:	e0 9a       	sbi	0x1c, 0	; 28
    10d8:	99 27       	eor	r25, r25
    10da:	8d b3       	in	r24, 0x1d	; 29
    10dc:	08 95       	ret

000010de <eeprom_write_byte>:
    10de:	26 2f       	mov	r18, r22

000010e0 <eeprom_write_r18>:
    10e0:	e1 99       	sbic	0x1c, 1	; 28
    10e2:	fe cf       	rjmp	.-4      	; 0x10e0 <eeprom_write_r18>
    10e4:	1c ba       	out	0x1c, r1	; 28
    10e6:	9f bb       	out	0x1f, r25	; 31
    10e8:	8e bb       	out	0x1e, r24	; 30
    10ea:	2d bb       	out	0x1d, r18	; 29
    10ec:	0f b6       	in	r0, 0x3f	; 63
    10ee:	f8 94       	cli
    10f0:	e2 9a       	sbi	0x1c, 2	; 28
    10f2:	e1 9a       	sbi	0x1c, 1	; 28
    10f4:	0f be       	out	0x3f, r0	; 63
    10f6:	01 96       	adiw	r24, 0x01	; 1
    10f8:	08 95       	ret

000010fa <__mulhi3>:
    10fa:	00 24       	eor	r0, r0

000010fc <.Loc.1>:
    10fc:	55 27       	eor	r21, r21

000010fe <.Loc.2>:
    10fe:	04 c0       	rjmp	.+8      	; 0x1108 <.L3^B1>

00001100 <.L1^B1>:
    1100:	08 0e       	add	r0, r24

00001102 <.Loc.4>:
    1102:	59 1f       	adc	r21, r25

00001104 <.L2^B1>:
    1104:	88 0f       	add	r24, r24

00001106 <.Loc.6>:
    1106:	99 1f       	adc	r25, r25

00001108 <.L3^B1>:
    1108:	00 97       	sbiw	r24, 0x00	; 0

0000110a <.Loc.8>:
    110a:	29 f0       	breq	.+10     	; 0x1116 <.L9^B1>

0000110c <.Loc.9>:
    110c:	76 95       	lsr	r23

0000110e <.Loc.10>:
    110e:	67 95       	ror	r22

00001110 <.Loc.11>:
    1110:	b8 f3       	brcs	.-18     	; 0x1100 <.L1^B1>

00001112 <.Loc.12>:
    1112:	71 05       	cpc	r23, r1

00001114 <.Loc.13>:
    1114:	b9 f7       	brne	.-18     	; 0x1104 <.L2^B1>

00001116 <.L9^B1>:
    1116:	80 2d       	mov	r24, r0

00001118 <.Loc.15>:
    1118:	95 2f       	mov	r25, r21

0000111a <.Loc.16>:
    111a:	08 95       	ret

0000111c <__bswapsi2>:
    111c:	69 27       	eor	r22, r25
    111e:	96 27       	eor	r25, r22
    1120:	69 27       	eor	r22, r25

00001122 <.Loc.1>:
    1122:	78 27       	eor	r23, r24
    1124:	87 27       	eor	r24, r23
    1126:	78 27       	eor	r23, r24

00001128 <.Loc.2>:
    1128:	08 95       	ret

0000112a <__negsi2>:
    112a:	90 95       	com	r25
    112c:	80 95       	com	r24
    112e:	70 95       	com	r23
    1130:	61 95       	neg	r22
    1132:	7f 4f       	sbci	r23, 0xFF	; 255
    1134:	8f 4f       	sbci	r24, 0xFF	; 255
    1136:	9f 4f       	sbci	r25, 0xFF	; 255

00001138 <.Loc.1>:
    1138:	08 95       	ret

0000113a <__subsf3>:
    113a:	50 58       	subi	r21, 0x80	; 128

0000113c <__addsf3>:
    113c:	bb 27       	eor	r27, r27
    113e:	aa 27       	eor	r26, r26
    1140:	0e d0       	rcall	.+28     	; 0x115e <__addsf3x>
    1142:	3b c1       	rjmp	.+630    	; 0x13ba <__fp_round>

00001144 <.L0^B1>:
    1144:	2c d1       	rcall	.+600    	; 0x139e <__fp_pscA>
    1146:	30 f0       	brcs	.+12     	; 0x1154 <.L_nan>
    1148:	31 d1       	rcall	.+610    	; 0x13ac <__fp_pscB>
    114a:	20 f0       	brcs	.+8      	; 0x1154 <.L_nan>
    114c:	31 f4       	brne	.+12     	; 0x115a <.L_inf>
    114e:	9f 3f       	cpi	r25, 0xFF	; 255
    1150:	11 f4       	brne	.+4      	; 0x1156 <.L_infB>
    1152:	1e f4       	brtc	.+6      	; 0x115a <.L_inf>

00001154 <.L_nan>:
    1154:	21 c1       	rjmp	.+578    	; 0x1398 <__fp_nan>

00001156 <.L_infB>:
    1156:	0e f4       	brtc	.+2      	; 0x115a <.L_inf>
    1158:	e0 95       	com	r30

0000115a <.L_inf>:
    115a:	e7 fb       	bst	r30, 7
    115c:	17 c1       	rjmp	.+558    	; 0x138c <__fp_inf>

0000115e <__addsf3x>:
    115e:	e9 2f       	mov	r30, r25
    1160:	3d d1       	rcall	.+634    	; 0x13dc <__fp_split3>
    1162:	80 f3       	brcs	.-32     	; 0x1144 <.L0^B1>
    1164:	ba 17       	cp	r27, r26
    1166:	62 07       	cpc	r22, r18
    1168:	73 07       	cpc	r23, r19
    116a:	84 07       	cpc	r24, r20
    116c:	95 07       	cpc	r25, r21
    116e:	18 f0       	brcs	.+6      	; 0x1176 <.L2^B1>
    1170:	71 f4       	brne	.+28     	; 0x118e <.L4^B1>
    1172:	9e f5       	brtc	.+102    	; 0x11da <.L_add>
    1174:	55 c1       	rjmp	.+682    	; 0x1420 <__fp_zero>

00001176 <.L2^B1>:
    1176:	0e f4       	brtc	.+2      	; 0x117a <.L3^B1>
    1178:	e0 95       	com	r30

0000117a <.L3^B1>:
    117a:	0b 2e       	mov	r0, r27
    117c:	ba 2f       	mov	r27, r26
    117e:	a0 2d       	mov	r26, r0
    1180:	0b 01       	movw	r0, r22
    1182:	b9 01       	movw	r22, r18
    1184:	90 01       	movw	r18, r0
    1186:	0c 01       	movw	r0, r24
    1188:	ca 01       	movw	r24, r20
    118a:	a0 01       	movw	r20, r0
    118c:	11 24       	eor	r1, r1

0000118e <.L4^B1>:
    118e:	ff 27       	eor	r31, r31
    1190:	59 1b       	sub	r21, r25

00001192 <.L5^B1>:
    1192:	99 f0       	breq	.+38     	; 0x11ba <.L7^B1>
    1194:	59 3f       	cpi	r21, 0xF9	; 249
    1196:	50 f4       	brcc	.+20     	; 0x11ac <.L6^B1>
    1198:	50 3e       	cpi	r21, 0xE0	; 224
    119a:	68 f1       	brcs	.+90     	; 0x11f6 <.L_ret>
    119c:	1a 16       	cp	r1, r26
    119e:	f0 40       	sbci	r31, 0x00	; 0
    11a0:	a2 2f       	mov	r26, r18
    11a2:	23 2f       	mov	r18, r19
    11a4:	34 2f       	mov	r19, r20
    11a6:	44 27       	eor	r20, r20
    11a8:	58 5f       	subi	r21, 0xF8	; 248
    11aa:	f3 cf       	rjmp	.-26     	; 0x1192 <.L5^B1>

000011ac <.L6^B1>:
    11ac:	46 95       	lsr	r20
    11ae:	37 95       	ror	r19
    11b0:	27 95       	ror	r18
    11b2:	a7 95       	ror	r26
    11b4:	f0 40       	sbci	r31, 0x00	; 0
    11b6:	53 95       	inc	r21
    11b8:	c9 f7       	brne	.-14     	; 0x11ac <.L6^B1>

000011ba <.L7^B1>:
    11ba:	7e f4       	brtc	.+30     	; 0x11da <.L_add>
    11bc:	1f 16       	cp	r1, r31
    11be:	ba 0b       	sbc	r27, r26
    11c0:	62 0b       	sbc	r22, r18
    11c2:	73 0b       	sbc	r23, r19
    11c4:	84 0b       	sbc	r24, r20
    11c6:	ba f0       	brmi	.+46     	; 0x11f6 <.L_ret>

000011c8 <.L8^B1>:
    11c8:	91 50       	subi	r25, 0x01	; 1
    11ca:	a1 f0       	breq	.+40     	; 0x11f4 <.L9^B1>
    11cc:	ff 0f       	add	r31, r31
    11ce:	bb 1f       	adc	r27, r27
    11d0:	66 1f       	adc	r22, r22
    11d2:	77 1f       	adc	r23, r23
    11d4:	88 1f       	adc	r24, r24
    11d6:	c2 f7       	brpl	.-16     	; 0x11c8 <.L8^B1>
    11d8:	0e c0       	rjmp	.+28     	; 0x11f6 <.L_ret>

000011da <.L_add>:
    11da:	ba 0f       	add	r27, r26
    11dc:	62 1f       	adc	r22, r18
    11de:	73 1f       	adc	r23, r19
    11e0:	84 1f       	adc	r24, r20
    11e2:	48 f4       	brcc	.+18     	; 0x11f6 <.L_ret>
    11e4:	87 95       	ror	r24
    11e6:	77 95       	ror	r23
    11e8:	67 95       	ror	r22
    11ea:	b7 95       	ror	r27
    11ec:	f7 95       	ror	r31
    11ee:	9e 3f       	cpi	r25, 0xFE	; 254
    11f0:	08 f0       	brcs	.+2      	; 0x11f4 <.L9^B1>
    11f2:	b3 cf       	rjmp	.-154    	; 0x115a <.L_inf>

000011f4 <.L9^B1>:
    11f4:	93 95       	inc	r25

000011f6 <.L_ret>:
    11f6:	88 0f       	add	r24, r24
    11f8:	08 f0       	brcs	.+2      	; 0x11fc <.L1^B1>
    11fa:	99 27       	eor	r25, r25

000011fc <.L1^B1>:
    11fc:	ee 0f       	add	r30, r30
    11fe:	97 95       	ror	r25
    1200:	87 95       	ror	r24
    1202:	08 95       	ret

00001204 <__divsf3>:
    1204:	0c d0       	rcall	.+24     	; 0x121e <__divsf3x>
    1206:	d9 c0       	rjmp	.+434    	; 0x13ba <__fp_round>

00001208 <.L0^B1>:
    1208:	d1 d0       	rcall	.+418    	; 0x13ac <__fp_pscB>
    120a:	40 f0       	brcs	.+16     	; 0x121c <.L_nan>
    120c:	c8 d0       	rcall	.+400    	; 0x139e <__fp_pscA>
    120e:	30 f0       	brcs	.+12     	; 0x121c <.L_nan>
    1210:	21 f4       	brne	.+8      	; 0x121a <.L_zr>
    1212:	5f 3f       	cpi	r21, 0xFF	; 255
    1214:	19 f0       	breq	.+6      	; 0x121c <.L_nan>

00001216 <.L_inf>:
    1216:	ba c0       	rjmp	.+372    	; 0x138c <__fp_inf>

00001218 <.L1^B1>:
    1218:	51 11       	cpse	r21, r1

0000121a <.L_zr>:
    121a:	03 c1       	rjmp	.+518    	; 0x1422 <__fp_szero>

0000121c <.L_nan>:
    121c:	bd c0       	rjmp	.+378    	; 0x1398 <__fp_nan>

0000121e <__divsf3x>:
    121e:	de d0       	rcall	.+444    	; 0x13dc <__fp_split3>
    1220:	98 f3       	brcs	.-26     	; 0x1208 <.L0^B1>

00001222 <__divsf3_pse>:
    1222:	99 23       	and	r25, r25
    1224:	c9 f3       	breq	.-14     	; 0x1218 <.L1^B1>
    1226:	55 23       	and	r21, r21
    1228:	b1 f3       	breq	.-20     	; 0x1216 <.L_inf>
    122a:	95 1b       	sub	r25, r21
    122c:	55 0b       	sbc	r21, r21
    122e:	bb 27       	eor	r27, r27
    1230:	aa 27       	eor	r26, r26

00001232 <.L2^B1>:
    1232:	62 17       	cp	r22, r18
    1234:	73 07       	cpc	r23, r19
    1236:	84 07       	cpc	r24, r20
    1238:	38 f0       	brcs	.+14     	; 0x1248 <.L3^B1>
    123a:	9f 5f       	subi	r25, 0xFF	; 255
    123c:	5f 4f       	sbci	r21, 0xFF	; 255
    123e:	22 0f       	add	r18, r18
    1240:	33 1f       	adc	r19, r19
    1242:	44 1f       	adc	r20, r20
    1244:	aa 1f       	adc	r26, r26
    1246:	a9 f3       	breq	.-22     	; 0x1232 <.L2^B1>

00001248 <.L3^B1>:
    1248:	33 d0       	rcall	.+102    	; 0x12b0 <.L_div>
    124a:	0e 2e       	mov	r0, r30
    124c:	3a f0       	brmi	.+14     	; 0x125c <.L5^B1>

0000124e <.L4^B1>:
    124e:	e0 e8       	ldi	r30, 0x80	; 128
    1250:	30 d0       	rcall	.+96     	; 0x12b2 <.L_div1>
    1252:	91 50       	subi	r25, 0x01	; 1
    1254:	50 40       	sbci	r21, 0x00	; 0
    1256:	e6 95       	lsr	r30
    1258:	00 1c       	adc	r0, r0
    125a:	ca f7       	brpl	.-14     	; 0x124e <.L4^B1>

0000125c <.L5^B1>:
    125c:	29 d0       	rcall	.+82     	; 0x12b0 <.L_div>
    125e:	fe 2f       	mov	r31, r30
    1260:	27 d0       	rcall	.+78     	; 0x12b0 <.L_div>
    1262:	66 0f       	add	r22, r22
    1264:	77 1f       	adc	r23, r23
    1266:	88 1f       	adc	r24, r24
    1268:	bb 1f       	adc	r27, r27
    126a:	26 17       	cp	r18, r22
    126c:	37 07       	cpc	r19, r23
    126e:	48 07       	cpc	r20, r24
    1270:	ab 07       	cpc	r26, r27
    1272:	b0 e8       	ldi	r27, 0x80	; 128
    1274:	09 f0       	breq	.+2      	; 0x1278 <.L4^B2>
    1276:	bb 0b       	sbc	r27, r27

00001278 <.L4^B2>:
    1278:	80 2d       	mov	r24, r0
    127a:	bf 01       	movw	r22, r30
    127c:	ff 27       	eor	r31, r31
    127e:	93 58       	subi	r25, 0x83	; 131
    1280:	5f 4f       	sbci	r21, 0xFF	; 255
    1282:	2a f0       	brmi	.+10     	; 0x128e <.L13^B1>
    1284:	9e 3f       	cpi	r25, 0xFE	; 254
    1286:	51 05       	cpc	r21, r1
    1288:	68 f0       	brcs	.+26     	; 0x12a4 <.L15^B1>
    128a:	80 c0       	rjmp	.+256    	; 0x138c <__fp_inf>

0000128c <.L12^B1>:
    128c:	ca c0       	rjmp	.+404    	; 0x1422 <__fp_szero>

0000128e <.L13^B1>:
    128e:	5f 3f       	cpi	r21, 0xFF	; 255
    1290:	ec f3       	brlt	.-6      	; 0x128c <.L12^B1>
    1292:	98 3e       	cpi	r25, 0xE8	; 232
    1294:	dc f3       	brlt	.-10     	; 0x128c <.L12^B1>

00001296 <.L14^B1>:
    1296:	86 95       	lsr	r24
    1298:	77 95       	ror	r23
    129a:	67 95       	ror	r22
    129c:	b7 95       	ror	r27
    129e:	f7 95       	ror	r31
    12a0:	9f 5f       	subi	r25, 0xFF	; 255
    12a2:	c9 f7       	brne	.-14     	; 0x1296 <.L14^B1>

000012a4 <.L15^B1>:
    12a4:	88 0f       	add	r24, r24
    12a6:	91 1d       	adc	r25, r1
    12a8:	96 95       	lsr	r25
    12aa:	87 95       	ror	r24
    12ac:	97 f9       	bld	r25, 7
    12ae:	08 95       	ret

000012b0 <.L_div>:
    12b0:	e1 e0       	ldi	r30, 0x01	; 1

000012b2 <.L_div1>:
    12b2:	66 0f       	add	r22, r22
    12b4:	77 1f       	adc	r23, r23
    12b6:	88 1f       	adc	r24, r24
    12b8:	bb 1f       	adc	r27, r27
    12ba:	62 17       	cp	r22, r18
    12bc:	73 07       	cpc	r23, r19
    12be:	84 07       	cpc	r24, r20
    12c0:	ba 07       	cpc	r27, r26
    12c2:	20 f0       	brcs	.+8      	; 0x12cc <.L2^B2>
    12c4:	62 1b       	sub	r22, r18
    12c6:	73 0b       	sbc	r23, r19
    12c8:	84 0b       	sbc	r24, r20
    12ca:	ba 0b       	sbc	r27, r26

000012cc <.L2^B2>:
    12cc:	ee 1f       	adc	r30, r30
    12ce:	88 f7       	brcc	.-30     	; 0x12b2 <.L_div1>
    12d0:	e0 95       	com	r30
    12d2:	08 95       	ret

000012d4 <__fixunssfsi>:
    12d4:	8b d0       	rcall	.+278    	; 0x13ec <__fp_splitA>
    12d6:	88 f0       	brcs	.+34     	; 0x12fa <.L_err>
    12d8:	9f 57       	subi	r25, 0x7F	; 127
    12da:	90 f0       	brcs	.+36     	; 0x1300 <.L_zr>
    12dc:	b9 2f       	mov	r27, r25
    12de:	99 27       	eor	r25, r25
    12e0:	b7 51       	subi	r27, 0x17	; 23
    12e2:	a0 f0       	brcs	.+40     	; 0x130c <.L4^B1>
    12e4:	d1 f0       	breq	.+52     	; 0x131a <.L_sign>

000012e6 <.L1^B1>:
    12e6:	66 0f       	add	r22, r22
    12e8:	77 1f       	adc	r23, r23
    12ea:	88 1f       	adc	r24, r24
    12ec:	99 1f       	adc	r25, r25
    12ee:	1a f0       	brmi	.+6      	; 0x12f6 <.L2^B1>
    12f0:	ba 95       	dec	r27
    12f2:	c9 f7       	brne	.-14     	; 0x12e6 <.L1^B1>
    12f4:	12 c0       	rjmp	.+36     	; 0x131a <.L_sign>

000012f6 <.L2^B1>:
    12f6:	b1 30       	cpi	r27, 0x01	; 1
    12f8:	81 f0       	breq	.+32     	; 0x131a <.L_sign>

000012fa <.L_err>:
    12fa:	92 d0       	rcall	.+292    	; 0x1420 <__fp_zero>
    12fc:	b1 e0       	ldi	r27, 0x01	; 1

000012fe <.L_ret>:
    12fe:	08 95       	ret

00001300 <.L_zr>:
    1300:	8f c0       	rjmp	.+286    	; 0x1420 <__fp_zero>

00001302 <.L3^B1>:
    1302:	67 2f       	mov	r22, r23
    1304:	78 2f       	mov	r23, r24
    1306:	88 27       	eor	r24, r24
    1308:	b8 5f       	subi	r27, 0xF8	; 248
    130a:	39 f0       	breq	.+14     	; 0x131a <.L_sign>

0000130c <.L4^B1>:
    130c:	b9 3f       	cpi	r27, 0xF9	; 249
    130e:	cc f3       	brlt	.-14     	; 0x1302 <.L3^B1>

00001310 <.L5^B1>:
    1310:	86 95       	lsr	r24
    1312:	77 95       	ror	r23
    1314:	67 95       	ror	r22
    1316:	b3 95       	inc	r27
    1318:	d9 f7       	brne	.-10     	; 0x1310 <.L5^B1>

0000131a <.L_sign>:
    131a:	8e f7       	brtc	.-30     	; 0x12fe <.L_ret>
    131c:	06 cf       	rjmp	.-500    	; 0x112a <__negsi2>

0000131e <__floatunsisf>:
    131e:	e8 94       	clt
    1320:	03 c0       	rjmp	.+6      	; 0x1328 <.L1^B1>

00001322 <__floatsisf>:
    1322:	97 fb       	bst	r25, 7
    1324:	0e f4       	brtc	.+2      	; 0x1328 <.L1^B1>
    1326:	01 df       	rcall	.-510    	; 0x112a <__negsi2>

00001328 <.L1^B1>:
    1328:	99 23       	and	r25, r25
    132a:	a9 f0       	breq	.+42     	; 0x1356 <.L4^B1>
    132c:	f9 2f       	mov	r31, r25
    132e:	96 e9       	ldi	r25, 0x96	; 150
    1330:	bb 27       	eor	r27, r27

00001332 <.L2^B1>:
    1332:	93 95       	inc	r25
    1334:	f6 95       	lsr	r31
    1336:	87 95       	ror	r24
    1338:	77 95       	ror	r23
    133a:	67 95       	ror	r22
    133c:	b7 95       	ror	r27
    133e:	f1 11       	cpse	r31, r1
    1340:	f8 cf       	rjmp	.-16     	; 0x1332 <.L2^B1>
    1342:	fa f4       	brpl	.+62     	; 0x1382 <.L_pack>
    1344:	bb 0f       	add	r27, r27
    1346:	11 f4       	brne	.+4      	; 0x134c <.L3^B1>
    1348:	60 ff       	sbrs	r22, 0
    134a:	1b c0       	rjmp	.+54     	; 0x1382 <.L_pack>

0000134c <.L3^B1>:
    134c:	6f 5f       	subi	r22, 0xFF	; 255
    134e:	7f 4f       	sbci	r23, 0xFF	; 255
    1350:	8f 4f       	sbci	r24, 0xFF	; 255
    1352:	9f 4f       	sbci	r25, 0xFF	; 255
    1354:	16 c0       	rjmp	.+44     	; 0x1382 <.L_pack>

00001356 <.L4^B1>:
    1356:	88 23       	and	r24, r24
    1358:	11 f0       	breq	.+4      	; 0x135e <.L5^B1>
    135a:	96 e9       	ldi	r25, 0x96	; 150
    135c:	11 c0       	rjmp	.+34     	; 0x1380 <.L8^B1>

0000135e <.L5^B1>:
    135e:	77 23       	and	r23, r23
    1360:	21 f0       	breq	.+8      	; 0x136a <.L6^B1>
    1362:	9e e8       	ldi	r25, 0x8E	; 142
    1364:	87 2f       	mov	r24, r23
    1366:	76 2f       	mov	r23, r22
    1368:	05 c0       	rjmp	.+10     	; 0x1374 <.L7^B1>

0000136a <.L6^B1>:
    136a:	66 23       	and	r22, r22
    136c:	71 f0       	breq	.+28     	; 0x138a <.L9^B1>
    136e:	96 e8       	ldi	r25, 0x86	; 134
    1370:	86 2f       	mov	r24, r22
    1372:	70 e0       	ldi	r23, 0x00	; 0

00001374 <.L7^B1>:
    1374:	60 e0       	ldi	r22, 0x00	; 0
    1376:	2a f0       	brmi	.+10     	; 0x1382 <.L_pack>

00001378 <.L10^B1>:
    1378:	9a 95       	dec	r25
    137a:	66 0f       	add	r22, r22
    137c:	77 1f       	adc	r23, r23
    137e:	88 1f       	adc	r24, r24

00001380 <.L8^B1>:
    1380:	da f7       	brpl	.-10     	; 0x1378 <.L10^B1>

00001382 <.L_pack>:
    1382:	88 0f       	add	r24, r24
    1384:	96 95       	lsr	r25
    1386:	87 95       	ror	r24
    1388:	97 f9       	bld	r25, 7

0000138a <.L9^B1>:
    138a:	08 95       	ret

0000138c <__fp_inf>:
    138c:	97 f9       	bld	r25, 7
    138e:	9f 67       	ori	r25, 0x7F	; 127
    1390:	80 e8       	ldi	r24, 0x80	; 128
    1392:	70 e0       	ldi	r23, 0x00	; 0
    1394:	60 e0       	ldi	r22, 0x00	; 0
    1396:	08 95       	ret

00001398 <__fp_nan>:
    1398:	9f ef       	ldi	r25, 0xFF	; 255
    139a:	80 ec       	ldi	r24, 0xC0	; 192
    139c:	08 95       	ret

0000139e <__fp_pscA>:
    139e:	00 24       	eor	r0, r0
    13a0:	0a 94       	dec	r0
    13a2:	16 16       	cp	r1, r22
    13a4:	17 06       	cpc	r1, r23
    13a6:	18 06       	cpc	r1, r24
    13a8:	09 06       	cpc	r0, r25
    13aa:	08 95       	ret

000013ac <__fp_pscB>:
    13ac:	00 24       	eor	r0, r0
    13ae:	0a 94       	dec	r0
    13b0:	12 16       	cp	r1, r18
    13b2:	13 06       	cpc	r1, r19
    13b4:	14 06       	cpc	r1, r20
    13b6:	05 06       	cpc	r0, r21
    13b8:	08 95       	ret

000013ba <__fp_round>:
    13ba:	09 2e       	mov	r0, r25
    13bc:	03 94       	inc	r0
    13be:	00 0c       	add	r0, r0
    13c0:	11 f4       	brne	.+4      	; 0x13c6 <.L1^B1>
    13c2:	88 23       	and	r24, r24
    13c4:	52 f0       	brmi	.+20     	; 0x13da <.L3^B1>

000013c6 <.L1^B1>:
    13c6:	bb 0f       	add	r27, r27
    13c8:	40 f4       	brcc	.+16     	; 0x13da <.L3^B1>
    13ca:	bf 2b       	or	r27, r31
    13cc:	11 f4       	brne	.+4      	; 0x13d2 <.L2^B1>
    13ce:	60 ff       	sbrs	r22, 0
    13d0:	04 c0       	rjmp	.+8      	; 0x13da <.L3^B1>

000013d2 <.L2^B1>:
    13d2:	6f 5f       	subi	r22, 0xFF	; 255
    13d4:	7f 4f       	sbci	r23, 0xFF	; 255
    13d6:	8f 4f       	sbci	r24, 0xFF	; 255
    13d8:	9f 4f       	sbci	r25, 0xFF	; 255

000013da <.L3^B1>:
    13da:	08 95       	ret

000013dc <__fp_split3>:
    13dc:	57 fd       	sbrc	r21, 7
    13de:	90 58       	subi	r25, 0x80	; 128
    13e0:	44 0f       	add	r20, r20
    13e2:	55 1f       	adc	r21, r21
    13e4:	59 f0       	breq	.+22     	; 0x13fc <.L4^B1>
    13e6:	5f 3f       	cpi	r21, 0xFF	; 255
    13e8:	71 f0       	breq	.+28     	; 0x1406 <.L5^B1>

000013ea <.L1^B1>:
    13ea:	47 95       	ror	r20

000013ec <__fp_splitA>:
    13ec:	88 0f       	add	r24, r24
    13ee:	97 fb       	bst	r25, 7
    13f0:	99 1f       	adc	r25, r25
    13f2:	61 f0       	breq	.+24     	; 0x140c <.L6^B1>
    13f4:	9f 3f       	cpi	r25, 0xFF	; 255
    13f6:	79 f0       	breq	.+30     	; 0x1416 <.L7^B1>

000013f8 <.L3^B1>:
    13f8:	87 95       	ror	r24
    13fa:	08 95       	ret

000013fc <.L4^B1>:
    13fc:	12 16       	cp	r1, r18
    13fe:	13 06       	cpc	r1, r19
    1400:	14 06       	cpc	r1, r20
    1402:	55 1f       	adc	r21, r21
    1404:	f2 cf       	rjmp	.-28     	; 0x13ea <.L1^B1>

00001406 <.L5^B1>:
    1406:	46 95       	lsr	r20
    1408:	f1 df       	rcall	.-30     	; 0x13ec <__fp_splitA>
    140a:	08 c0       	rjmp	.+16     	; 0x141c <.L8^B1>

0000140c <.L6^B1>:
    140c:	16 16       	cp	r1, r22
    140e:	17 06       	cpc	r1, r23
    1410:	18 06       	cpc	r1, r24
    1412:	99 1f       	adc	r25, r25
    1414:	f1 cf       	rjmp	.-30     	; 0x13f8 <.L3^B1>

00001416 <.L7^B1>:
    1416:	86 95       	lsr	r24
    1418:	71 05       	cpc	r23, r1
    141a:	61 05       	cpc	r22, r1

0000141c <.L8^B1>:
    141c:	08 94       	sec
    141e:	08 95       	ret

00001420 <__fp_zero>:
    1420:	e8 94       	clt

00001422 <__fp_szero>:
    1422:	bb 27       	eor	r27, r27
    1424:	66 27       	eor	r22, r22
    1426:	77 27       	eor	r23, r23
    1428:	cb 01       	movw	r24, r22
    142a:	97 f9       	bld	r25, 7
    142c:	08 95       	ret

0000142e <__mulsf3>:
    142e:	0a d0       	rcall	.+20     	; 0x1444 <__mulsf3x>
    1430:	c4 cf       	rjmp	.-120    	; 0x13ba <__fp_round>

00001432 <.L0^B1>:
    1432:	b5 df       	rcall	.-150    	; 0x139e <__fp_pscA>
    1434:	28 f0       	brcs	.+10     	; 0x1440 <.L1^B1>
    1436:	ba df       	rcall	.-140    	; 0x13ac <__fp_pscB>
    1438:	18 f0       	brcs	.+6      	; 0x1440 <.L1^B1>
    143a:	95 23       	and	r25, r21
    143c:	09 f0       	breq	.+2      	; 0x1440 <.L1^B1>
    143e:	a6 cf       	rjmp	.-180    	; 0x138c <__fp_inf>

00001440 <.L1^B1>:
    1440:	ab cf       	rjmp	.-170    	; 0x1398 <__fp_nan>

00001442 <.L2^B1>:
    1442:	ef cf       	rjmp	.-34     	; 0x1422 <__fp_szero>

00001444 <__mulsf3x>:
    1444:	cb df       	rcall	.-106    	; 0x13dc <__fp_split3>
    1446:	a8 f3       	brcs	.-22     	; 0x1432 <.L0^B1>

00001448 <__mulsf3_pse>:
    1448:	99 23       	and	r25, r25
    144a:	d9 f3       	breq	.-10     	; 0x1442 <.L2^B1>
    144c:	55 23       	and	r21, r21
    144e:	c9 f3       	breq	.-14     	; 0x1442 <.L2^B1>
    1450:	95 0f       	add	r25, r21
    1452:	50 e0       	ldi	r21, 0x00	; 0
    1454:	55 1f       	adc	r21, r21
    1456:	aa 27       	eor	r26, r26
    1458:	ee 27       	eor	r30, r30
    145a:	ff 27       	eor	r31, r31
    145c:	bb 27       	eor	r27, r27
    145e:	00 24       	eor	r0, r0
    1460:	08 94       	sec
    1462:	67 95       	ror	r22

00001464 <.L1^B2>:
    1464:	20 f4       	brcc	.+8      	; 0x146e <.L2^B2>
    1466:	e2 0f       	add	r30, r18
    1468:	f3 1f       	adc	r31, r19
    146a:	b4 1f       	adc	r27, r20
    146c:	0a 1e       	adc	r0, r26

0000146e <.L2^B2>:
    146e:	22 0f       	add	r18, r18
    1470:	33 1f       	adc	r19, r19
    1472:	44 1f       	adc	r20, r20
    1474:	aa 1f       	adc	r26, r26
    1476:	66 95       	lsr	r22
    1478:	a9 f7       	brne	.-22     	; 0x1464 <.L1^B2>
    147a:	77 95       	ror	r23

0000147c <.L3^B1>:
    147c:	30 f4       	brcc	.+12     	; 0x148a <.L4^B1>
    147e:	f3 0f       	add	r31, r19
    1480:	b4 1f       	adc	r27, r20
    1482:	0a 1e       	adc	r0, r26
    1484:	12 1e       	adc	r1, r18
    1486:	08 f4       	brcc	.+2      	; 0x148a <.L4^B1>
    1488:	63 95       	inc	r22

0000148a <.L4^B1>:
    148a:	33 0f       	add	r19, r19
    148c:	44 1f       	adc	r20, r20
    148e:	aa 1f       	adc	r26, r26
    1490:	22 1f       	adc	r18, r18
    1492:	76 95       	lsr	r23
    1494:	99 f7       	brne	.-26     	; 0x147c <.L3^B1>
    1496:	87 95       	ror	r24

00001498 <.L5^B1>:
    1498:	20 f4       	brcc	.+8      	; 0x14a2 <.L6^B1>
    149a:	b4 0f       	add	r27, r20
    149c:	0a 1e       	adc	r0, r26
    149e:	12 1e       	adc	r1, r18
    14a0:	63 1f       	adc	r22, r19

000014a2 <.L6^B1>:
    14a2:	44 0f       	add	r20, r20
    14a4:	aa 1f       	adc	r26, r26
    14a6:	22 1f       	adc	r18, r18
    14a8:	33 1f       	adc	r19, r19
    14aa:	86 95       	lsr	r24
    14ac:	a9 f7       	brne	.-22     	; 0x1498 <.L5^B1>
    14ae:	86 2f       	mov	r24, r22
    14b0:	71 2d       	mov	r23, r1
    14b2:	60 2d       	mov	r22, r0
    14b4:	11 24       	eor	r1, r1
    14b6:	9f 57       	subi	r25, 0x7F	; 127
    14b8:	50 40       	sbci	r21, 0x00	; 0
    14ba:	8a f0       	brmi	.+34     	; 0x14de <.L13^B1>
    14bc:	e1 f0       	breq	.+56     	; 0x14f6 <.L15^B1>

000014be <.L10^B1>:
    14be:	88 23       	and	r24, r24
    14c0:	4a f0       	brmi	.+18     	; 0x14d4 <.L11^B1>
    14c2:	ee 0f       	add	r30, r30
    14c4:	ff 1f       	adc	r31, r31
    14c6:	bb 1f       	adc	r27, r27
    14c8:	66 1f       	adc	r22, r22
    14ca:	77 1f       	adc	r23, r23
    14cc:	88 1f       	adc	r24, r24
    14ce:	91 50       	subi	r25, 0x01	; 1
    14d0:	50 40       	sbci	r21, 0x00	; 0
    14d2:	a9 f7       	brne	.-22     	; 0x14be <.L10^B1>

000014d4 <.L11^B1>:
    14d4:	9e 3f       	cpi	r25, 0xFE	; 254
    14d6:	51 05       	cpc	r21, r1
    14d8:	70 f0       	brcs	.+28     	; 0x14f6 <.L15^B1>
    14da:	58 cf       	rjmp	.-336    	; 0x138c <__fp_inf>

000014dc <.L12^B1>:
    14dc:	a2 cf       	rjmp	.-188    	; 0x1422 <__fp_szero>

000014de <.L13^B1>:
    14de:	5f 3f       	cpi	r21, 0xFF	; 255
    14e0:	ec f3       	brlt	.-6      	; 0x14dc <.L12^B1>
    14e2:	98 3e       	cpi	r25, 0xE8	; 232
    14e4:	dc f3       	brlt	.-10     	; 0x14dc <.L12^B1>

000014e6 <.L14^B1>:
    14e6:	86 95       	lsr	r24
    14e8:	77 95       	ror	r23
    14ea:	67 95       	ror	r22
    14ec:	b7 95       	ror	r27
    14ee:	f7 95       	ror	r31
    14f0:	e7 95       	ror	r30
    14f2:	9f 5f       	subi	r25, 0xFF	; 255
    14f4:	c1 f7       	brne	.-16     	; 0x14e6 <.L14^B1>

000014f6 <.L15^B1>:
    14f6:	fe 2b       	or	r31, r30
    14f8:	88 0f       	add	r24, r24
    14fa:	91 1d       	adc	r25, r1
    14fc:	96 95       	lsr	r25
    14fe:	87 95       	ror	r24
    1500:	97 f9       	bld	r25, 7
    1502:	08 95       	ret

00001504 <memmove>:
    1504:	68 17       	cp	r22, r24
    1506:	79 07       	cpc	r23, r25
    1508:	68 f4       	brcc	.+26     	; 0x1524 <.L_memmove_fwd>
    150a:	fb 01       	movw	r30, r22
    150c:	dc 01       	movw	r26, r24
    150e:	e4 0f       	add	r30, r20
    1510:	f5 1f       	adc	r31, r21
    1512:	a4 0f       	add	r26, r20
    1514:	b5 1f       	adc	r27, r21
    1516:	02 c0       	rjmp	.+4      	; 0x151c <.L_memmove_start>

00001518 <.L_memmove_loop>:
    1518:	02 90       	ld	r0, -Z
    151a:	0e 92       	st	-X, r0

0000151c <.L_memmove_start>:
    151c:	41 50       	subi	r20, 0x01	; 1
    151e:	50 40       	sbci	r21, 0x00	; 0
    1520:	d8 f7       	brcc	.-10     	; 0x1518 <.L_memmove_loop>
    1522:	08 95       	ret

00001524 <.L_memmove_fwd>:
    1524:	00 c0       	rjmp	.+0      	; 0x1526 <memcpy>

00001526 <memcpy>:
    1526:	fb 01       	movw	r30, r22
    1528:	dc 01       	movw	r26, r24
    152a:	02 c0       	rjmp	.+4      	; 0x1530 <.L_memcpy_start>

0000152c <.L_memcpy_loop>:
    152c:	01 90       	ld	r0, Z+
    152e:	0d 92       	st	X+, r0

00001530 <.L_memcpy_start>:
    1530:	41 50       	subi	r20, 0x01	; 1
    1532:	50 40       	sbci	r21, 0x00	; 0
    1534:	d8 f7       	brcc	.-10     	; 0x152c <.L_memcpy_loop>
    1536:	08 95       	ret

00001538 <_exit>:
    1538:	f8 94       	cli

0000153a <__stop_program>:
    153a:	ff cf       	rjmp	.-2      	; 0x153a <__stop_program>
