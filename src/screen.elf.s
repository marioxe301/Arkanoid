
screen.elf:     file format elf32-bigmips


Disassembly of section .text:

00400000 <start>:
  400000:	3c1d7fff 	lui	sp,0x7fff
  400004:	37bdfffc 	ori	sp,sp,0xfffc
  400008:	0c100004 	jal	400010 <main>
  40000c:	08100003 	j	40000c <start+0xc>

00400010 <main>:
  400010:	27bdfee0 	addiu	sp,sp,-288
  400014:	27a40010 	addiu	a0,sp,16
  400018:	afbf011c 	sw	ra,284(sp)
  40001c:	0c10004e 	jal	400138 <Inicializar>
  400020:	0c100018 	jal	400060 <DibujarLimites>
  400024:	27a40010 	addiu	a0,sp,16
  400028:	0c10006d 	jal	4001b4 <DibujarElementos>
  40002c:	24040003 	li	a0,3
  400030:	0c1000da 	jal	400368 <DibujarVidas>
  400034:	0c10028f 	jal	400a3c <keypad_init>
  400038:	0c100293 	jal	400a4c <keypad_getkey>
  40003c:	00403025 	move	a2,v0
  400040:	27a50010 	addiu	a1,sp,16
  400044:	27a40017 	addiu	a0,sp,23
  400048:	0c1001a3 	jal	40068c <MovimientoPlataforma>
  40004c:	27a40010 	addiu	a0,sp,16
  400050:	0c1001f8 	jal	4007e0 <MovimientoPelota>
  400054:	24040046 	li	a0,70
  400058:	0c100284 	jal	400a10 <delay_ms>
  40005c:	1000fff6 	b	400038 <main+0x28>

00400060 <DibujarLimites>:
  400060:	27bdffe0 	addiu	sp,sp,-32
  400064:	afbf001c 	sw	ra,28(sp)
  400068:	afb20018 	sw	s2,24(sp)
  40006c:	afb00010 	sw	s0,16(sp)
  400070:	afb10014 	sw	s1,20(sp)
  400074:	0c100304 	jal	400c10 <clear_screen>
  400078:	00002825 	move	a1,zero
  40007c:	24040007 	li	a0,7
  400080:	0c1002be 	jal	400af8 <set_color>
  400084:	24050023 	li	a1,35
  400088:	24040002 	li	a0,2
  40008c:	0c1002cc 	jal	400b30 <set_cursor>
  400090:	3c041001 	lui	a0,0x1001
  400094:	24840000 	addiu	a0,a0,0
  400098:	0c1002f6 	jal	400bd8 <puts>
  40009c:	24100004 	li	s0,4
  4000a0:	2412001b 	li	s2,27
  4000a4:	321100ff 	andi	s1,s0,0xff
  4000a8:	24050004 	li	a1,4
  4000ac:	02202025 	move	a0,s1
  4000b0:	0c1002cc 	jal	400b30 <set_cursor>
  4000b4:	240400db 	li	a0,219
  4000b8:	0c1002d5 	jal	400b54 <put_char>
  4000bc:	2405004c 	li	a1,76
  4000c0:	02202025 	move	a0,s1
  4000c4:	0c1002cc 	jal	400b30 <set_cursor>
  4000c8:	26100001 	addiu	s0,s0,1
  4000cc:	240400db 	li	a0,219
  4000d0:	0c1002d5 	jal	400b54 <put_char>
  4000d4:	1612fff3 	bne	s0,s2,4000a4 <DibujarLimites+0x44>
  4000d8:	24100005 	li	s0,5
  4000dc:	2411004c 	li	s1,76
  4000e0:	320500ff 	andi	a1,s0,0xff
  4000e4:	24040004 	li	a0,4
  4000e8:	0c1002cc 	jal	400b30 <set_cursor>
  4000ec:	26100001 	addiu	s0,s0,1
  4000f0:	240400df 	li	a0,223
  4000f4:	0c1002d5 	jal	400b54 <put_char>
  4000f8:	1611fff9 	bne	s0,s1,4000e0 <DibujarLimites+0x80>
  4000fc:	24100005 	li	s0,5
  400100:	2411004c 	li	s1,76
  400104:	320500ff 	andi	a1,s0,0xff
  400108:	2404001a 	li	a0,26
  40010c:	0c1002cc 	jal	400b30 <set_cursor>
  400110:	26100001 	addiu	s0,s0,1
  400114:	240400dc 	li	a0,220
  400118:	0c1002d5 	jal	400b54 <put_char>
  40011c:	1611fff9 	bne	s0,s1,400104 <DibujarLimites+0xa4>
  400120:	8fbf001c 	lw	ra,28(sp)
  400124:	8fb20018 	lw	s2,24(sp)
  400128:	8fb10014 	lw	s1,20(sp)
  40012c:	8fb00010 	lw	s0,16(sp)
  400130:	27bd0020 	addiu	sp,sp,32
  400134:	03e00008 	jr	ra

00400138 <Inicializar>:
  400138:	24020025 	li	v0,37
  40013c:	24030019 	li	v1,25
  400140:	a0820007 	sb	v0,7(a0)
  400144:	a0830008 	sb	v1,8(a0)
  400148:	a0820000 	sb	v0,0(a0)
  40014c:	24030003 	li	v1,3
  400150:	24020018 	li	v0,24
  400154:	a0830105 	sb	v1,261(a0)
  400158:	a0820001 	sb	v0,1(a0)
  40015c:	a0800006 	sb	zero,6(a0)
  400160:	a0800005 	sb	zero,5(a0)
  400164:	a0800004 	sb	zero,4(a0)
  400168:	a0800003 	sb	zero,3(a0)
  40016c:	a0800002 	sb	zero,2(a0)
  400170:	24030007 	li	v1,7
  400174:	24060049 	li	a2,73
  400178:	2407000b 	li	a3,11
  40017c:	00802825 	move	a1,a0
  400180:	2402000a 	li	v0,10
  400184:	a0a20009 	sb	v0,9(a1)
  400188:	24420003 	addiu	v0,v0,3
  40018c:	304200ff 	andi	v0,v0,0xff
  400190:	a0a0000b 	sb	zero,11(a1)
  400194:	a0a3000a 	sb	v1,10(a1)
  400198:	24a50003 	addiu	a1,a1,3
  40019c:	1446fff9 	bne	v0,a2,400184 <Inicializar+0x4c>
  4001a0:	24630001 	addiu	v1,v1,1
  4001a4:	306300ff 	andi	v1,v1,0xff
  4001a8:	2484003f 	addiu	a0,a0,63
  4001ac:	1467fff3 	bne	v1,a3,40017c <Inicializar+0x44>
  4001b0:	03e00008 	jr	ra

004001b4 <DibujarElementos>:
  4001b4:	27bdffd0 	addiu	sp,sp,-48
  4001b8:	27a50010 	addiu	a1,sp,16
  4001bc:	afb00018 	sw	s0,24(sp)
  4001c0:	00808025 	move	s0,a0
  4001c4:	27a40011 	addiu	a0,sp,17
  4001c8:	afbf002c 	sw	ra,44(sp)
  4001cc:	afb40028 	sw	s4,40(sp)
  4001d0:	afb30024 	sw	s3,36(sp)
  4001d4:	afb20020 	sw	s2,32(sp)
  4001d8:	afb1001c 	sw	s1,28(sp)
  4001dc:	0c1002c4 	jal	400b10 <get_color>
  4001e0:	00002825 	move	a1,zero
  4001e4:	2404000e 	li	a0,14
  4001e8:	0c1002be 	jal	400af8 <set_color>
  4001ec:	92050007 	lbu	a1,7(s0)
  4001f0:	92040008 	lbu	a0,8(s0)
  4001f4:	24a5fffe 	addiu	a1,a1,-2
  4001f8:	30a500ff 	andi	a1,a1,0xff
  4001fc:	0c1002cc 	jal	400b30 <set_cursor>
  400200:	240400e0 	li	a0,224
  400204:	0c1002d5 	jal	400b54 <put_char>
  400208:	92050007 	lbu	a1,7(s0)
  40020c:	92040008 	lbu	a0,8(s0)
  400210:	24a5ffff 	addiu	a1,a1,-1
  400214:	30a500ff 	andi	a1,a1,0xff
  400218:	0c1002cc 	jal	400b30 <set_cursor>
  40021c:	240400df 	li	a0,223
  400220:	0c1002d5 	jal	400b54 <put_char>
  400224:	92050007 	lbu	a1,7(s0)
  400228:	92040008 	lbu	a0,8(s0)
  40022c:	261300fc 	addiu	s3,s0,252
  400230:	0c1002cc 	jal	400b30 <set_cursor>
  400234:	240400df 	li	a0,223
  400238:	0c1002d5 	jal	400b54 <put_char>
  40023c:	92050007 	lbu	a1,7(s0)
  400240:	92040008 	lbu	a0,8(s0)
  400244:	24a50001 	addiu	a1,a1,1
  400248:	30a500ff 	andi	a1,a1,0xff
  40024c:	0c1002cc 	jal	400b30 <set_cursor>
  400250:	240400df 	li	a0,223
  400254:	0c1002d5 	jal	400b54 <put_char>
  400258:	92050007 	lbu	a1,7(s0)
  40025c:	92040008 	lbu	a0,8(s0)
  400260:	24a50002 	addiu	a1,a1,2
  400264:	30a500ff 	andi	a1,a1,0xff
  400268:	0c1002cc 	jal	400b30 <set_cursor>
  40026c:	240400e1 	li	a0,225
  400270:	0c1002d5 	jal	400b54 <put_char>
  400274:	93a50010 	lbu	a1,16(sp)
  400278:	93a40011 	lbu	a0,17(sp)
  40027c:	24140015 	li	s4,21
  400280:	0c1002be 	jal	400af8 <set_color>
  400284:	27a50010 	addiu	a1,sp,16
  400288:	27a40011 	addiu	a0,sp,17
  40028c:	0c1002c4 	jal	400b10 <get_color>
  400290:	00002825 	move	a1,zero
  400294:	24040007 	li	a0,7
  400298:	0c1002be 	jal	400af8 <set_color>
  40029c:	92050000 	lbu	a1,0(s0)
  4002a0:	92040001 	lbu	a0,1(s0)
  4002a4:	0c1002cc 	jal	400b30 <set_cursor>
  4002a8:	240400e2 	li	a0,226
  4002ac:	0c1002d5 	jal	400b54 <put_char>
  4002b0:	93a50010 	lbu	a1,16(sp)
  4002b4:	93a40011 	lbu	a0,17(sp)
  4002b8:	0c1002be 	jal	400af8 <set_color>
  4002bc:	27a50010 	addiu	a1,sp,16
  4002c0:	27a40011 	addiu	a0,sp,17
  4002c4:	0c1002c4 	jal	400b10 <get_color>
  4002c8:	24050007 	li	a1,7
  4002cc:	24040004 	li	a0,4
  4002d0:	0c1002be 	jal	400af8 <set_color>
  4002d4:	02008825 	move	s1,s0
  4002d8:	00009025 	move	s2,zero
  4002dc:	92250009 	lbu	a1,9(s1)
  4002e0:	9224000a 	lbu	a0,10(s1)
  4002e4:	24a5ffff 	addiu	a1,a1,-1
  4002e8:	30a500ff 	andi	a1,a1,0xff
  4002ec:	0c1002cc 	jal	400b30 <set_cursor>
  4002f0:	240400e6 	li	a0,230
  4002f4:	0c1002d5 	jal	400b54 <put_char>
  4002f8:	92250009 	lbu	a1,9(s1)
  4002fc:	9224000a 	lbu	a0,10(s1)
  400300:	26520001 	addiu	s2,s2,1
  400304:	0c1002cc 	jal	400b30 <set_cursor>
  400308:	240400e7 	li	a0,231
  40030c:	0c1002d5 	jal	400b54 <put_char>
  400310:	92250009 	lbu	a1,9(s1)
  400314:	9224000a 	lbu	a0,10(s1)
  400318:	24a50001 	addiu	a1,a1,1
  40031c:	30a500ff 	andi	a1,a1,0xff
  400320:	0c1002cc 	jal	400b30 <set_cursor>
  400324:	240400e8 	li	a0,232
  400328:	0c1002d5 	jal	400b54 <put_char>
  40032c:	26310003 	addiu	s1,s1,3
  400330:	1654ffea 	bne	s2,s4,4002dc <DibujarElementos+0x128>
  400334:	2610003f 	addiu	s0,s0,63
  400338:	1613ffe6 	bne	s0,s3,4002d4 <DibujarElementos+0x120>
  40033c:	93a50010 	lbu	a1,16(sp)
  400340:	93a40011 	lbu	a0,17(sp)
  400344:	0c1002be 	jal	400af8 <set_color>
  400348:	8fbf002c 	lw	ra,44(sp)
  40034c:	8fb40028 	lw	s4,40(sp)
  400350:	8fb30024 	lw	s3,36(sp)
  400354:	8fb20020 	lw	s2,32(sp)
  400358:	8fb1001c 	lw	s1,28(sp)
  40035c:	8fb00018 	lw	s0,24(sp)
  400360:	27bd0030 	addiu	sp,sp,48
  400364:	03e00008 	jr	ra

00400368 <DibujarVidas>:
  400368:	27bdffd8 	addiu	sp,sp,-40
  40036c:	27a50010 	addiu	a1,sp,16
  400370:	afb1001c 	sw	s1,28(sp)
  400374:	00808825 	move	s1,a0
  400378:	27a40011 	addiu	a0,sp,17
  40037c:	afbf0024 	sw	ra,36(sp)
  400380:	afb20020 	sw	s2,32(sp)
  400384:	afb00018 	sw	s0,24(sp)
  400388:	0c1002c4 	jal	400b10 <get_color>
  40038c:	00002825 	move	a1,zero
  400390:	24040007 	li	a0,7
  400394:	0c1002be 	jal	400af8 <set_color>
  400398:	24050023 	li	a1,35
  40039c:	2404001c 	li	a0,28
  4003a0:	0c1002cc 	jal	400b30 <set_cursor>
  4003a4:	3c041001 	lui	a0,0x1001
  4003a8:	2484000c 	addiu	a0,a0,12
  4003ac:	3c121001 	lui	s2,0x1001
  4003b0:	0c1002f6 	jal	400bd8 <puts>
  4003b4:	00008025 	move	s0,zero
  4003b8:	26520014 	addiu	s2,s2,20
  4003bc:	0211102b 	sltu	v0,s0,s1
  4003c0:	14400009 	bnez	v0,4003e8 <DibujarVidas+0x80>
  4003c4:	93a50010 	lbu	a1,16(sp)
  4003c8:	93a40011 	lbu	a0,17(sp)
  4003cc:	0c1002be 	jal	400af8 <set_color>
  4003d0:	8fbf0024 	lw	ra,36(sp)
  4003d4:	8fb20020 	lw	s2,32(sp)
  4003d8:	8fb1001c 	lw	s1,28(sp)
  4003dc:	8fb00018 	lw	s0,24(sp)
  4003e0:	27bd0028 	addiu	sp,sp,40
  4003e4:	03e00008 	jr	ra
  4003e8:	00002825 	move	a1,zero
  4003ec:	24040004 	li	a0,4
  4003f0:	0c1002be 	jal	400af8 <set_color>
  4003f4:	24040003 	li	a0,3
  4003f8:	0c1002d5 	jal	400b54 <put_char>
  4003fc:	02402025 	move	a0,s2
  400400:	0c1002f6 	jal	400bd8 <puts>
  400404:	26100001 	addiu	s0,s0,1
  400408:	1000ffec 	b	4003bc <DibujarVidas+0x54>

0040040c <LimiteLaterales>:
  40040c:	24030049 	li	v1,73
  400410:	24020001 	li	v0,1
  400414:	10830002 	beq	a0,v1,400420 <LimiteLaterales+0x14>
  400418:	38840007 	xori	a0,a0,0x7
  40041c:	2c820001 	sltiu	v0,a0,1
  400420:	03e00008 	jr	ra

00400424 <DibujarPlataforma>:
  400424:	27bdffe0 	addiu	sp,sp,-32
  400428:	27a50010 	addiu	a1,sp,16
  40042c:	afb00018 	sw	s0,24(sp)
  400430:	00808025 	move	s0,a0
  400434:	27a40011 	addiu	a0,sp,17
  400438:	afbf001c 	sw	ra,28(sp)
  40043c:	0c1002c4 	jal	400b10 <get_color>
  400440:	00002825 	move	a1,zero
  400444:	2404000e 	li	a0,14
  400448:	0c1002be 	jal	400af8 <set_color>
  40044c:	92050000 	lbu	a1,0(s0)
  400450:	92040001 	lbu	a0,1(s0)
  400454:	24a5fffe 	addiu	a1,a1,-2
  400458:	30a500ff 	andi	a1,a1,0xff
  40045c:	0c1002cc 	jal	400b30 <set_cursor>
  400460:	240400e0 	li	a0,224
  400464:	0c1002d5 	jal	400b54 <put_char>
  400468:	92050000 	lbu	a1,0(s0)
  40046c:	92040001 	lbu	a0,1(s0)
  400470:	24a5ffff 	addiu	a1,a1,-1
  400474:	30a500ff 	andi	a1,a1,0xff
  400478:	0c1002cc 	jal	400b30 <set_cursor>
  40047c:	240400df 	li	a0,223
  400480:	0c1002d5 	jal	400b54 <put_char>
  400484:	92050000 	lbu	a1,0(s0)
  400488:	92040001 	lbu	a0,1(s0)
  40048c:	0c1002cc 	jal	400b30 <set_cursor>
  400490:	240400df 	li	a0,223
  400494:	0c1002d5 	jal	400b54 <put_char>
  400498:	92050000 	lbu	a1,0(s0)
  40049c:	92040001 	lbu	a0,1(s0)
  4004a0:	24a50001 	addiu	a1,a1,1
  4004a4:	30a500ff 	andi	a1,a1,0xff
  4004a8:	0c1002cc 	jal	400b30 <set_cursor>
  4004ac:	240400df 	li	a0,223
  4004b0:	0c1002d5 	jal	400b54 <put_char>
  4004b4:	92050000 	lbu	a1,0(s0)
  4004b8:	92040001 	lbu	a0,1(s0)
  4004bc:	24a50002 	addiu	a1,a1,2
  4004c0:	30a500ff 	andi	a1,a1,0xff
  4004c4:	0c1002cc 	jal	400b30 <set_cursor>
  4004c8:	240400e1 	li	a0,225
  4004cc:	0c1002d5 	jal	400b54 <put_char>
  4004d0:	93a50010 	lbu	a1,16(sp)
  4004d4:	93a40011 	lbu	a0,17(sp)
  4004d8:	0c1002be 	jal	400af8 <set_color>
  4004dc:	8fbf001c 	lw	ra,28(sp)
  4004e0:	8fb00018 	lw	s0,24(sp)
  4004e4:	27bd0020 	addiu	sp,sp,32
  4004e8:	03e00008 	jr	ra

004004ec <BorrarPlataforma>:
  4004ec:	27bdffe0 	addiu	sp,sp,-32
  4004f0:	27a50010 	addiu	a1,sp,16
  4004f4:	afb00018 	sw	s0,24(sp)
  4004f8:	00808025 	move	s0,a0
  4004fc:	27a40011 	addiu	a0,sp,17
  400500:	afbf001c 	sw	ra,28(sp)
  400504:	0c1002c4 	jal	400b10 <get_color>
  400508:	00002825 	move	a1,zero
  40050c:	00002025 	move	a0,zero
  400510:	0c1002be 	jal	400af8 <set_color>
  400514:	92050000 	lbu	a1,0(s0)
  400518:	92040001 	lbu	a0,1(s0)
  40051c:	24a5fffe 	addiu	a1,a1,-2
  400520:	30a500ff 	andi	a1,a1,0xff
  400524:	0c1002cc 	jal	400b30 <set_cursor>
  400528:	24040020 	li	a0,32
  40052c:	0c1002d5 	jal	400b54 <put_char>
  400530:	92050000 	lbu	a1,0(s0)
  400534:	92040001 	lbu	a0,1(s0)
  400538:	24a5ffff 	addiu	a1,a1,-1
  40053c:	30a500ff 	andi	a1,a1,0xff
  400540:	0c1002cc 	jal	400b30 <set_cursor>
  400544:	24040020 	li	a0,32
  400548:	0c1002d5 	jal	400b54 <put_char>
  40054c:	92050000 	lbu	a1,0(s0)
  400550:	92040001 	lbu	a0,1(s0)
  400554:	0c1002cc 	jal	400b30 <set_cursor>
  400558:	24040020 	li	a0,32
  40055c:	0c1002d5 	jal	400b54 <put_char>
  400560:	92050000 	lbu	a1,0(s0)
  400564:	92040001 	lbu	a0,1(s0)
  400568:	24a50001 	addiu	a1,a1,1
  40056c:	30a500ff 	andi	a1,a1,0xff
  400570:	0c1002cc 	jal	400b30 <set_cursor>
  400574:	24040020 	li	a0,32
  400578:	0c1002d5 	jal	400b54 <put_char>
  40057c:	92050000 	lbu	a1,0(s0)
  400580:	92040001 	lbu	a0,1(s0)
  400584:	24a50002 	addiu	a1,a1,2
  400588:	30a500ff 	andi	a1,a1,0xff
  40058c:	0c1002cc 	jal	400b30 <set_cursor>
  400590:	24040020 	li	a0,32
  400594:	0c1002d5 	jal	400b54 <put_char>
  400598:	93a50010 	lbu	a1,16(sp)
  40059c:	93a40011 	lbu	a0,17(sp)
  4005a0:	0c1002be 	jal	400af8 <set_color>
  4005a4:	8fbf001c 	lw	ra,28(sp)
  4005a8:	8fb00018 	lw	s0,24(sp)
  4005ac:	27bd0020 	addiu	sp,sp,32
  4005b0:	03e00008 	jr	ra

004005b4 <ColisionPlataforma>:
  4005b4:	90a60000 	lbu	a2,0(a1)
  4005b8:	24030001 	li	v1,1
  4005bc:	00001025 	move	v0,zero
  4005c0:	14c30005 	bne	a2,v1,4005d8 <ColisionPlataforma+0x24>
  4005c4:	90820001 	lbu	v0,1(a0)
  4005c8:	90a30001 	lbu	v1,1(a1)
  4005cc:	2442ffff 	addiu	v0,v0,-1
  4005d0:	00431026 	xor	v0,v0,v1
  4005d4:	2c420001 	sltiu	v0,v0,1
  4005d8:	03e00008 	jr	ra

004005dc <DibujarPelota>:
  4005dc:	27bdffe0 	addiu	sp,sp,-32
  4005e0:	27a50010 	addiu	a1,sp,16
  4005e4:	afb00018 	sw	s0,24(sp)
  4005e8:	00808025 	move	s0,a0
  4005ec:	27a40011 	addiu	a0,sp,17
  4005f0:	afbf001c 	sw	ra,28(sp)
  4005f4:	0c1002c4 	jal	400b10 <get_color>
  4005f8:	00002825 	move	a1,zero
  4005fc:	24040007 	li	a0,7
  400600:	0c1002be 	jal	400af8 <set_color>
  400604:	92050000 	lbu	a1,0(s0)
  400608:	92040001 	lbu	a0,1(s0)
  40060c:	0c1002cc 	jal	400b30 <set_cursor>
  400610:	240400e2 	li	a0,226
  400614:	0c1002d5 	jal	400b54 <put_char>
  400618:	93a50010 	lbu	a1,16(sp)
  40061c:	93a40011 	lbu	a0,17(sp)
  400620:	0c1002be 	jal	400af8 <set_color>
  400624:	8fbf001c 	lw	ra,28(sp)
  400628:	8fb00018 	lw	s0,24(sp)
  40062c:	27bd0020 	addiu	sp,sp,32
  400630:	03e00008 	jr	ra

00400634 <BorrarPelota>:
  400634:	27bdffe0 	addiu	sp,sp,-32
  400638:	27a50010 	addiu	a1,sp,16
  40063c:	afb00018 	sw	s0,24(sp)
  400640:	00808025 	move	s0,a0
  400644:	27a40011 	addiu	a0,sp,17
  400648:	afbf001c 	sw	ra,28(sp)
  40064c:	0c1002c4 	jal	400b10 <get_color>
  400650:	00002825 	move	a1,zero
  400654:	00002025 	move	a0,zero
  400658:	0c1002be 	jal	400af8 <set_color>
  40065c:	92050000 	lbu	a1,0(s0)
  400660:	92040001 	lbu	a0,1(s0)
  400664:	0c1002cc 	jal	400b30 <set_cursor>
  400668:	24040020 	li	a0,32
  40066c:	0c1002d5 	jal	400b54 <put_char>
  400670:	93a50010 	lbu	a1,16(sp)
  400674:	93a40011 	lbu	a0,17(sp)
  400678:	0c1002be 	jal	400af8 <set_color>
  40067c:	8fbf001c 	lw	ra,28(sp)
  400680:	8fb00018 	lw	s0,24(sp)
  400684:	27bd0020 	addiu	sp,sp,32
  400688:	03e00008 	jr	ra

0040068c <MovimientoPlataforma>:
  40068c:	27bdffe0 	addiu	sp,sp,-32
  400690:	24020001 	li	v0,1
  400694:	afb10018 	sw	s1,24(sp)
  400698:	afb00014 	sw	s0,20(sp)
  40069c:	afbf001c 	sw	ra,28(sp)
  4006a0:	00808025 	move	s0,a0
  4006a4:	00a08825 	move	s1,a1
  4006a8:	14c2001e 	bne	a2,v0,400724 <MovimientoPlataforma+0x98>
  4006ac:	90840000 	lbu	a0,0(a0)
  4006b0:	2484ffff 	addiu	a0,a0,-1
  4006b4:	308400ff 	andi	a0,a0,0xff
  4006b8:	0c100103 	jal	40040c <LimiteLaterales>
  4006bc:	1440001d 	bnez	v0,400734 <MovimientoPlataforma+0xa8>
  4006c0:	90a20006 	lbu	v0,6(a1)
  4006c4:	02002025 	move	a0,s0
  4006c8:	14400011 	bnez	v0,400710 <MovimientoPlataforma+0x84>
  4006cc:	0c10013b 	jal	4004ec <BorrarPlataforma>
  4006d0:	02202025 	move	a0,s1
  4006d4:	0c10018d 	jal	400634 <BorrarPelota>
  4006d8:	92020000 	lbu	v0,0(s0)
  4006dc:	2442ffff 	addiu	v0,v0,-1
  4006e0:	a2020000 	sb	v0,0(s0)
  4006e4:	92220000 	lbu	v0,0(s1)
  4006e8:	2442ffff 	addiu	v0,v0,-1
  4006ec:	a2220000 	sb	v0,0(s1)
  4006f0:	02202025 	move	a0,s1
  4006f4:	0c100177 	jal	4005dc <DibujarPelota>
  4006f8:	8fbf001c 	lw	ra,28(sp)
  4006fc:	8fb10018 	lw	s1,24(sp)
  400700:	02002025 	move	a0,s0
  400704:	8fb00014 	lw	s0,20(sp)
  400708:	27bd0020 	addiu	sp,sp,32
  40070c:	08100109 	j	400424 <DibujarPlataforma>
  400710:	0c10013b 	jal	4004ec <BorrarPlataforma>
  400714:	92020000 	lbu	v0,0(s0)
  400718:	2442ffff 	addiu	v0,v0,-1
  40071c:	a2020000 	sb	v0,0(s0)
  400720:	1000fff3 	b	4006f0 <MovimientoPlataforma+0x64>
  400724:	24030002 	li	v1,2
  400728:	10c30007 	beq	a2,v1,400748 <MovimientoPlataforma+0xbc>
  40072c:	24030008 	li	v1,8
  400730:	10c3001a 	beq	a2,v1,40079c <MovimientoPlataforma+0x110>
  400734:	8fbf001c 	lw	ra,28(sp)
  400738:	8fb10018 	lw	s1,24(sp)
  40073c:	8fb00014 	lw	s0,20(sp)
  400740:	27bd0020 	addiu	sp,sp,32
  400744:	03e00008 	jr	ra
  400748:	90840000 	lbu	a0,0(a0)
  40074c:	24840001 	addiu	a0,a0,1
  400750:	308400ff 	andi	a0,a0,0xff
  400754:	0c100103 	jal	40040c <LimiteLaterales>
  400758:	1440fff6 	bnez	v0,400734 <MovimientoPlataforma+0xa8>
  40075c:	90a20006 	lbu	v0,6(a1)
  400760:	02002025 	move	a0,s0
  400764:	14400009 	bnez	v0,40078c <MovimientoPlataforma+0x100>
  400768:	0c10013b 	jal	4004ec <BorrarPlataforma>
  40076c:	02202025 	move	a0,s1
  400770:	0c10018d 	jal	400634 <BorrarPelota>
  400774:	92020000 	lbu	v0,0(s0)
  400778:	24420001 	addiu	v0,v0,1
  40077c:	a2020000 	sb	v0,0(s0)
  400780:	92220000 	lbu	v0,0(s1)
  400784:	24420001 	addiu	v0,v0,1
  400788:	1000ffd8 	b	4006ec <MovimientoPlataforma+0x60>
  40078c:	0c10013b 	jal	4004ec <BorrarPlataforma>
  400790:	92020000 	lbu	v0,0(s0)
  400794:	24420001 	addiu	v0,v0,1
  400798:	1000ffe0 	b	40071c <MovimientoPlataforma+0x90>
  40079c:	a0a20006 	sb	v0,6(a1)
  4007a0:	a0a20002 	sb	v0,2(a1)
  4007a4:	a0a20004 	sb	v0,4(a1)
  4007a8:	1000ffe2 	b	400734 <MovimientoPlataforma+0xa8>

004007ac <LimitesMapa>:
  4007ac:	24030006 	li	v1,6
  4007b0:	24020001 	li	v0,1
  4007b4:	10830009 	beq	a0,v1,4007dc <LimitesMapa+0x30>
  4007b8:	2406004a 	li	a2,74
  4007bc:	24020002 	li	v0,2
  4007c0:	10860006 	beq	a0,a2,4007dc <LimitesMapa+0x30>
  4007c4:	24020003 	li	v0,3
  4007c8:	10a30004 	beq	a1,v1,4007dc <LimitesMapa+0x30>
  4007cc:	24030018 	li	v1,24
  4007d0:	24020004 	li	v0,4
  4007d4:	10a30001 	beq	a1,v1,4007dc <LimitesMapa+0x30>
  4007d8:	24020005 	li	v0,5
  4007dc:	03e00008 	jr	ra

004007e0 <MovimientoPelota>:
  4007e0:	27bdffe8 	addiu	sp,sp,-24
  4007e4:	afb00010 	sw	s0,16(sp)
  4007e8:	afbf0014 	sw	ra,20(sp)
  4007ec:	90820002 	lbu	v0,2(a0)
  4007f0:	00808025 	move	s0,a0
  4007f4:	10400025 	beqz	v0,40088c <MovimientoPelota+0xac>
  4007f8:	90830004 	lbu	v1,4(a0)
  4007fc:	10600023 	beqz	v1,40088c <MovimientoPelota+0xac>
  400800:	90850001 	lbu	a1,1(a0)
  400804:	90840000 	lbu	a0,0(a0)
  400808:	0c1001eb 	jal	4007ac <LimitesMapa>
  40080c:	24030001 	li	v1,1
  400810:	1443000f 	bne	v0,v1,400850 <MovimientoPelota+0x70>
  400814:	a2000002 	sb	zero,2(s0)
  400818:	a2020003 	sb	v0,3(s0)
  40081c:	02002025 	move	a0,s0
  400820:	0c10018d 	jal	400634 <BorrarPelota>
  400824:	92020000 	lbu	v0,0(s0)
  400828:	2442ffff 	addiu	v0,v0,-1
  40082c:	a2020000 	sb	v0,0(s0)
  400830:	92020001 	lbu	v0,1(s0)
  400834:	2442ffff 	addiu	v0,v0,-1
  400838:	8fbf0014 	lw	ra,20(sp)
  40083c:	a2020001 	sb	v0,1(s0)
  400840:	02002025 	move	a0,s0
  400844:	8fb00010 	lw	s0,16(sp)
  400848:	27bd0018 	addiu	sp,sp,24
  40084c:	08100177 	j	4005dc <DibujarPelota>
  400850:	24040002 	li	a0,2
  400854:	10440007 	beq	v0,a0,400874 <MovimientoPelota+0x94>
  400858:	24040003 	li	a0,3
  40085c:	10440008 	beq	v0,a0,400880 <MovimientoPelota+0xa0>
  400860:	24040004 	li	a0,4
  400864:	1444ffed 	bne	v0,a0,40081c <MovimientoPelota+0x3c>
  400868:	a2000005 	sb	zero,5(s0)
  40086c:	a2030004 	sb	v1,4(s0)
  400870:	1000ffea 	b	40081c <MovimientoPelota+0x3c>
  400874:	a2030002 	sb	v1,2(s0)
  400878:	a2000003 	sb	zero,3(s0)
  40087c:	1000ffe7 	b	40081c <MovimientoPelota+0x3c>
  400880:	a2030005 	sb	v1,5(s0)
  400884:	a2000004 	sb	zero,4(s0)
  400888:	1000ffe4 	b	40081c <MovimientoPelota+0x3c>
  40088c:	92030003 	lbu	v1,3(s0)
  400890:	1060005a 	beqz	v1,4009fc <MovimientoPelota+0x21c>
  400894:	92030004 	lbu	v1,4(s0)
  400898:	10600046 	beqz	v1,4009b4 <MovimientoPelota+0x1d4>
  40089c:	92050001 	lbu	a1,1(s0)
  4008a0:	92040000 	lbu	a0,0(s0)
  4008a4:	0c1001eb 	jal	4007ac <LimitesMapa>
  4008a8:	24030001 	li	v1,1
  4008ac:	14430007 	bne	v0,v1,4008cc <MovimientoPelota+0xec>
  4008b0:	a2000002 	sb	zero,2(s0)
  4008b4:	a2020003 	sb	v0,3(s0)
  4008b8:	02002025 	move	a0,s0
  4008bc:	0c10018d 	jal	400634 <BorrarPelota>
  4008c0:	92020000 	lbu	v0,0(s0)
  4008c4:	24420001 	addiu	v0,v0,1
  4008c8:	1000ffd8 	b	40082c <MovimientoPelota+0x4c>
  4008cc:	24040002 	li	a0,2
  4008d0:	10440007 	beq	v0,a0,4008f0 <MovimientoPelota+0x110>
  4008d4:	24040003 	li	a0,3
  4008d8:	10440008 	beq	v0,a0,4008fc <MovimientoPelota+0x11c>
  4008dc:	24040004 	li	a0,4
  4008e0:	1444fff5 	bne	v0,a0,4008b8 <MovimientoPelota+0xd8>
  4008e4:	a2000005 	sb	zero,5(s0)
  4008e8:	a2030004 	sb	v1,4(s0)
  4008ec:	1000fff2 	b	4008b8 <MovimientoPelota+0xd8>
  4008f0:	a2030002 	sb	v1,2(s0)
  4008f4:	a2000003 	sb	zero,3(s0)
  4008f8:	1000ffef 	b	4008b8 <MovimientoPelota+0xd8>
  4008fc:	a2030005 	sb	v1,5(s0)
  400900:	a2000004 	sb	zero,4(s0)
  400904:	1000ffec 	b	4008b8 <MovimientoPelota+0xd8>
  400908:	24040002 	li	a0,2
  40090c:	10440007 	beq	v0,a0,40092c <MovimientoPelota+0x14c>
  400910:	24040003 	li	a0,3
  400914:	10440008 	beq	v0,a0,400938 <MovimientoPelota+0x158>
  400918:	24040004 	li	a0,4
  40091c:	1444002f 	bne	v0,a0,4009dc <MovimientoPelota+0x1fc>
  400920:	a2000005 	sb	zero,5(s0)
  400924:	a2030004 	sb	v1,4(s0)
  400928:	1000002c 	b	4009dc <MovimientoPelota+0x1fc>
  40092c:	a2030002 	sb	v1,2(s0)
  400930:	a2000003 	sb	zero,3(s0)
  400934:	10000029 	b	4009dc <MovimientoPelota+0x1fc>
  400938:	a2030005 	sb	v1,5(s0)
  40093c:	a2000004 	sb	zero,4(s0)
  400940:	10000026 	b	4009dc <MovimientoPelota+0x1fc>
  400944:	92020005 	lbu	v0,5(s0)
  400948:	1040002d 	beqz	v0,400a00 <MovimientoPelota+0x220>
  40094c:	92050001 	lbu	a1,1(s0)
  400950:	92040000 	lbu	a0,0(s0)
  400954:	0c1001eb 	jal	4007ac <LimitesMapa>
  400958:	24030001 	li	v1,1
  40095c:	14430006 	bne	v0,v1,400978 <MovimientoPelota+0x198>
  400960:	a2020003 	sb	v0,3(s0)
  400964:	02002025 	move	a0,s0
  400968:	0c10018d 	jal	400634 <BorrarPelota>
  40096c:	92020000 	lbu	v0,0(s0)
  400970:	24420001 	addiu	v0,v0,1
  400974:	1000001d 	b	4009ec <MovimientoPelota+0x20c>
  400978:	24040002 	li	a0,2
  40097c:	10440007 	beq	v0,a0,40099c <MovimientoPelota+0x1bc>
  400980:	24040003 	li	a0,3
  400984:	10440008 	beq	v0,a0,4009a8 <MovimientoPelota+0x1c8>
  400988:	24040004 	li	a0,4
  40098c:	1444fff5 	bne	v0,a0,400964 <MovimientoPelota+0x184>
  400990:	a2000005 	sb	zero,5(s0)
  400994:	a2030004 	sb	v1,4(s0)
  400998:	1000fff2 	b	400964 <MovimientoPelota+0x184>
  40099c:	a2030002 	sb	v1,2(s0)
  4009a0:	a2000003 	sb	zero,3(s0)
  4009a4:	1000ffef 	b	400964 <MovimientoPelota+0x184>
  4009a8:	a2030005 	sb	v1,5(s0)
  4009ac:	a2000004 	sb	zero,4(s0)
  4009b0:	1000ffec 	b	400964 <MovimientoPelota+0x184>
  4009b4:	1040ffe3 	beqz	v0,400944 <MovimientoPelota+0x164>
  4009b8:	92020005 	lbu	v0,5(s0)
  4009bc:	10400010 	beqz	v0,400a00 <MovimientoPelota+0x220>
  4009c0:	92050001 	lbu	a1,1(s0)
  4009c4:	92040000 	lbu	a0,0(s0)
  4009c8:	0c1001eb 	jal	4007ac <LimitesMapa>
  4009cc:	24030001 	li	v1,1
  4009d0:	1443ffcd 	bne	v0,v1,400908 <MovimientoPelota+0x128>
  4009d4:	a2000002 	sb	zero,2(s0)
  4009d8:	a2020003 	sb	v0,3(s0)
  4009dc:	02002025 	move	a0,s0
  4009e0:	0c10018d 	jal	400634 <BorrarPelota>
  4009e4:	92020000 	lbu	v0,0(s0)
  4009e8:	2442ffff 	addiu	v0,v0,-1
  4009ec:	a2020000 	sb	v0,0(s0)
  4009f0:	92020001 	lbu	v0,1(s0)
  4009f4:	24420001 	addiu	v0,v0,1
  4009f8:	1000ff8f 	b	400838 <MovimientoPelota+0x58>
  4009fc:	1440ffee 	bnez	v0,4009b8 <MovimientoPelota+0x1d8>
  400a00:	8fbf0014 	lw	ra,20(sp)
  400a04:	8fb00010 	lw	s0,16(sp)
  400a08:	27bd0018 	addiu	sp,sp,24
  400a0c:	03e00008 	jr	ra

00400a10 <delay_ms>:
  400a10:	3c08ffff 	lui	t0,0xffff
  400a14:	8d090008 	lw	t1,8(t0)
  400a18:	00000000 	nop
  400a1c:	01244820 	add	t1,t1,a0

00400a20 <.dm_loop>:
  400a20:	8d0a0008 	lw	t2,8(t0)
  400a24:	00000000 	nop
  400a28:	0149582b 	sltu	t3,t2,t1
  400a2c:	1560fffc 	bnez	t3,400a20 <.dm_loop>
  400a30:	00000000 	nop
  400a34:	03e00008 	jr	ra
  400a38:	00000000 	nop

00400a3c <keypad_init>:
  400a3c:	3c081001 	lui	t0,0x1001
  400a40:	ad000018 	sw	zero,24(t0)
  400a44:	03e00008 	jr	ra
  400a48:	00000000 	nop

00400a4c <keypad_getkey>:
  400a4c:	3c08ffff 	lui	t0,0xffff
  400a50:	81080004 	lb	t0,4(t0)
  400a54:	24090008 	li	t1,8
  400a58:	240b0001 	li	t3,1
  400a5c:	00005025 	move	t2,zero

00400a60 <.gk_loop>:
  400a60:	11490018 	beq	t2,t1,400ac4 <.gk_end_loop>
  400a64:	00000000 	nop
  400a68:	010b6024 	and	t4,t0,t3
  400a6c:	000b5840 	sll	t3,t3,0x1
  400a70:	11800011 	beqz	t4,400ab8 <.gk_inc_loop>
  400a74:	00000000 	nop
  400a78:	3c081001 	lui	t0,0x1001
  400a7c:	8d080018 	lw	t0,24(t0)
  400a80:	3c09ffff 	lui	t1,0xffff
  400a84:	8d290008 	lw	t1,8(t1)
  400a88:	00000000 	nop
  400a8c:	0128582b 	sltu	t3,t1,t0
  400a90:	11600002 	beqz	t3,400a9c <.set_key>
  400a94:	00000000 	nop
  400a98:	00001025 	move	v0,zero

00400a9c <.set_key>:
  400a9c:	252900c8 	addiu	t1,t1,200
  400aa0:	3c081001 	lui	t0,0x1001
  400aa4:	ad090018 	sw	t1,24(t0)
  400aa8:	01401025 	move	v0,t2
  400aac:	24420001 	addiu	v0,v0,1
  400ab0:	03e00008 	jr	ra
  400ab4:	00000000 	nop

00400ab8 <.gk_inc_loop>:
  400ab8:	254a0001 	addiu	t2,t2,1
  400abc:	08100298 	j	400a60 <.gk_loop>
  400ac0:	00000000 	nop

00400ac4 <.gk_end_loop>:
  400ac4:	00001025 	move	v0,zero
  400ac8:	03e00008 	jr	ra
  400acc:	00000000 	nop

00400ad0 <divide>:
  400ad0:	acc00000 	sw	zero,0(a2)
  400ad4:	0085102b 	sltu	v0,a0,a1
  400ad8:	10400002 	beqz	v0,400ae4 <divide+0x14>
  400adc:	ace40000 	sw	a0,0(a3)
  400ae0:	03e00008 	jr	ra
  400ae4:	8cc20000 	lw	v0,0(a2)
  400ae8:	00852023 	subu	a0,a0,a1
  400aec:	24420001 	addiu	v0,v0,1
  400af0:	acc20000 	sw	v0,0(a2)
  400af4:	1000fff7 	b	400ad4 <divide+0x4>

00400af8 <set_color>:
  400af8:	00052900 	sll	a1,a1,0x4
  400afc:	3084000f 	andi	a0,a0,0xf
  400b00:	00a42825 	or	a1,a1,a0
  400b04:	3c021001 	lui	v0,0x1001
  400b08:	a045001e 	sb	a1,30(v0)
  400b0c:	03e00008 	jr	ra

00400b10 <get_color>:
  400b10:	3c031001 	lui	v1,0x1001
  400b14:	9062001e 	lbu	v0,30(v1)
  400b18:	3042000f 	andi	v0,v0,0xf
  400b1c:	a0820000 	sb	v0,0(a0)
  400b20:	9062001e 	lbu	v0,30(v1)
  400b24:	00021102 	srl	v0,v0,0x4
  400b28:	a0a20000 	sb	v0,0(a1)
  400b2c:	03e00008 	jr	ra

00400b30 <set_cursor>:
  400b30:	2c820028 	sltiu	v0,a0,40
  400b34:	10400006 	beqz	v0,400b50 <set_cursor+0x20>
  400b38:	2ca20050 	sltiu	v0,a1,80
  400b3c:	10400004 	beqz	v0,400b50 <set_cursor+0x20>
  400b40:	3c021001 	lui	v0,0x1001
  400b44:	a044001d 	sb	a0,29(v0)
  400b48:	3c021001 	lui	v0,0x1001
  400b4c:	a045001c 	sb	a1,28(v0)
  400b50:	03e00008 	jr	ra

00400b54 <put_char>:
  400b54:	3c071001 	lui	a3,0x1001
  400b58:	2403000a 	li	v1,10
  400b5c:	90e2001d 	lbu	v0,29(a3)
  400b60:	3c061001 	lui	a2,0x1001
  400b64:	14830006 	bne	a0,v1,400b80 <put_char+0x2c>
  400b68:	2c430027 	sltiu	v1,v0,39
  400b6c:	10600002 	beqz	v1,400b78 <put_char+0x24>
  400b70:	24420001 	addiu	v0,v0,1
  400b74:	a0e2001d 	sb	v0,29(a3)
  400b78:	a0c0001c 	sb	zero,28(a2)
  400b7c:	03e00008 	jr	ra
  400b80:	3c031001 	lui	v1,0x1001
  400b84:	9063001e 	lbu	v1,30(v1)
  400b88:	90c5001c 	lbu	a1,28(a2)
  400b8c:	00031a00 	sll	v1,v1,0x8
  400b90:	00642025 	or	a0,v1,a0
  400b94:	00021880 	sll	v1,v0,0x2
  400b98:	00621821 	addu	v1,v1,v0
  400b9c:	00031900 	sll	v1,v1,0x4
  400ba0:	00651821 	addu	v1,v1,a1
  400ba4:	00031840 	sll	v1,v1,0x1
  400ba8:	3408b800 	li	t0,0xb800
  400bac:	01031821 	addu	v1,t0,v1
  400bb0:	a4640000 	sh	a0,0(v1)
  400bb4:	2ca3004f 	sltiu	v1,a1,79
  400bb8:	10600003 	beqz	v1,400bc8 <put_char+0x74>
  400bbc:	24a50001 	addiu	a1,a1,1
  400bc0:	a0c5001c 	sb	a1,28(a2)
  400bc4:	03e00008 	jr	ra
  400bc8:	24420001 	addiu	v0,v0,1
  400bcc:	a0c0001c 	sb	zero,28(a2)
  400bd0:	a0e2001d 	sb	v0,29(a3)
  400bd4:	03e00008 	jr	ra

00400bd8 <puts>:
  400bd8:	00804825 	move	t1,a0
  400bdc:	80840000 	lb	a0,0(a0)
  400be0:	14800001 	bnez	a0,400be8 <puts+0x10>
  400be4:	03e00008 	jr	ra
  400be8:	27bdffe8 	addiu	sp,sp,-24
  400bec:	afbf0014 	sw	ra,20(sp)
  400bf0:	308400ff 	andi	a0,a0,0xff
  400bf4:	25290001 	addiu	t1,t1,1
  400bf8:	0c1002d5 	jal	400b54 <put_char>
  400bfc:	81240000 	lb	a0,0(t1)
  400c00:	1480fffb 	bnez	a0,400bf0 <puts+0x18>
  400c04:	8fbf0014 	lw	ra,20(sp)
  400c08:	27bd0018 	addiu	sp,sp,24
  400c0c:	03e00008 	jr	ra

00400c10 <clear_screen>:
  400c10:	3c021001 	lui	v0,0x1001
  400c14:	9042001e 	lbu	v0,30(v0)
  400c18:	3403b800 	li	v1,0xb800
  400c1c:	00021200 	sll	v0,v0,0x8
  400c20:	34420020 	ori	v0,v0,0x20
  400c24:	3404cac0 	li	a0,0xcac0
  400c28:	a4620000 	sh	v0,0(v1)
  400c2c:	24630002 	addiu	v1,v1,2
  400c30:	1464fffd 	bne	v1,a0,400c28 <clear_screen+0x18>
  400c34:	3c021001 	lui	v0,0x1001
  400c38:	a040001d 	sb	zero,29(v0)
  400c3c:	3c021001 	lui	v0,0x1001
  400c40:	a040001c 	sb	zero,28(v0)
  400c44:	03e00008 	jr	ra

Disassembly of section .data:

10010000 <next_key_time-0x18>:
10010000:	41524b41 	0x41524b41
10010004:	4e4f4944 	c3	0x4f4944
10010008:	00000000 	nop
1001000c:	56494441 	0x56494441
10010010:	533a2000 	0x533a2000
10010014:	20000000 	addi	zero,zero,0

10010018 <next_key_time>:
10010018:	00000000 	nop

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_gp+0x4>
   4:	0f676e75 	jal	d9db9d4 <clear_screen+0xd5dadc4>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401

Disassembly of section .bss:

1001001c <cursor_col>:
	...

1001001d <cursor_row>:
	...

1001001e <chr_attr>:
	...
