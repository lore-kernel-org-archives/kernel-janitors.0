From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 11 Dec 2020 08:03:01 +0000
Subject: Re: mmc: atmel-mci: Reduce =?utf-8?Q?scope?= =?utf-8?Q?_for_the_variable_=E2=80=9Cslot=E2=80=9D?= in
Message-Id: <20201211080301.GC1781038@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net>
 <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
 <20201210170723.GD1578121@piout.net>
 <2667790c-fad2-aaa9-36e8-6be66949ac8d@web.de>
 <20201210182150.GE1578121@piout.net>
 <4c0d8efe-de25-f168-8b8d-b7f1ede6c6b1@web.de>
In-Reply-To: <4c0d8efe-de25-f168-8b8d-b7f1ede6c6b1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Dan Carpenter <dan.carpenter@oracle.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On 11/12/2020 07:34:41+0100, Markus Elfring wrote:
> >> How do you think about a patch like “staging: speakup: remove redundant initialization
> >> of pointer p_key” for comparison?
> >> https://lore.kernel.org/patchwork/patch/1199128/
> >> https://lore.kernel.org/driverdev-devel/20200223153954.420731-1-colin.king@canonical.com/
> >>
> >> Would you tolerate to omit the initialisation for the variable “slot”?
> >
> > If you were able to provide one good technical reason.
> 
> I find that the positions of variable definitions (and similar assignments) influence
> the generation of executable code.
> 

And you are wrong, it doesn't. Before:

c044a0f0 <atmci_request_end>:
{
c044a0f0:	e92d4070 	push	{r4, r5, r6, lr}
c044a0f4:	e1a04000 	mov	r4, r0
	WARN_ON(host->cmd || host->data);
c044a0f8:	e5902024 	ldr	r2, [r0, #36]	; 0x24
{
c044a0fc:	e1a06001 	mov	r6, r1
	struct mmc_host		*prev_mmc = host->cur_slot->mmc;
c044a100:	e590301c 	ldr	r3, [r0, #28]
	WARN_ON(host->cmd || host->data);
c044a104:	e3520000 	cmp	r2, #0
	struct mmc_host		*prev_mmc = host->cur_slot->mmc;
c044a108:	e5935000 	ldr	r5, [r3]
	WARN_ON(host->cmd || host->data);
c044a10c:	0a00002d 	beq	c044a1c8 <atmci_request_end+0xd8>
c044a110:	e3000000 	movw	r0, #0
			c044a110: R_ARM_MOVW_ABS_NC	.LC0
c044a114:	e3a03000 	mov	r3, #0
c044a118:	e3400000 	movt	r0, #0
			c044a118: R_ARM_MOVT_ABS	.LC0
c044a11c:	e3a02009 	mov	r2, #9
c044a120:	e300161c 	movw	r1, #1564	; 0x61c
c044a124:	ebfffffe 	bl	0 <warn_slowpath_fmt>
			c044a124: R_ARM_CALL	warn_slowpath_fmt
	del_timer(&host->timer);
c044a128:	e28400a4 	add	r0, r4, #164	; 0xa4
c044a12c:	ebfffffe 	bl	0 <del_timer>
			c044a12c: R_ARM_CALL	del_timer
	if (host->need_clock_update) {
c044a130:	e5d430a0 	ldrb	r3, [r4, #160]	; 0xa0
c044a134:	e3530000 	cmp	r3, #0
c044a138:	0a000005 	beq	c044a154 <atmci_request_end+0x64>
		atmci_writel(host, ATMCI_MR, host->mode_reg);
c044a13c:	e59420b8 	ldr	r2, [r4, #184]	; 0xb8
c044a140:	e5943000 	ldr	r3, [r4]
	asm volatile("str %1, %0"
c044a144:	e5832004 	str	r2, [r3, #4]
		if (host->caps.has_cfg_reg)
c044a148:	e5d420da 	ldrb	r2, [r4, #218]	; 0xda
c044a14c:	e3520000 	cmp	r2, #0
c044a150:	1a000019 	bne	c044a1bc <atmci_request_end+0xcc>
	host->cur_slot->mrq = NULL;
c044a154:	e594101c 	ldr	r1, [r4, #28]
	return READ_ONCE(head->next) = head;
c044a158:	e1a03004 	mov	r3, r4
c044a15c:	e3a02000 	mov	r2, #0
c044a160:	e5812010 	str	r2, [r1, #16]
	host->mrq = NULL;
c044a164:	e5842020 	str	r2, [r4, #32]
c044a168:	e5b31098 	ldr	r1, [r3, #152]!	; 0x98
	if (!list_empty(&host->queue)) {
c044a16c:	e1510003 	cmp	r1, r3
		host->state = STATE_IDLE;
c044a170:	05842094 	streq	r2, [r4, #148]	; 0x94
	if (!list_empty(&host->queue)) {
c044a174:	0a00000c 	beq	c044a1ac <atmci_request_end+0xbc>
		slot = list_entry(host->queue.next,
c044a178:	e5943098 	ldr	r3, [r4, #152]	; 0x98


After:

c044a0f0 <atmci_request_end>:
{
c044a0f0:	e92d4070 	push	{r4, r5, r6, lr}
c044a0f4:	e1a04000 	mov	r4, r0
	WARN_ON(host->cmd || host->data);
c044a0f8:	e5902024 	ldr	r2, [r0, #36]	; 0x24
{
c044a0fc:	e1a06001 	mov	r6, r1
	struct mmc_host		*prev_mmc = host->cur_slot->mmc;
c044a100:	e590301c 	ldr	r3, [r0, #28]
	WARN_ON(host->cmd || host->data);
c044a104:	e3520000 	cmp	r2, #0
	struct mmc_host		*prev_mmc = host->cur_slot->mmc;
c044a108:	e5935000 	ldr	r5, [r3]
	WARN_ON(host->cmd || host->data);
c044a10c:	0a00002d 	beq	c044a1c8 <atmci_request_end+0xd8>
c044a110:	e3000000 	movw	r0, #0
			c044a110: R_ARM_MOVW_ABS_NC	.LC0
c044a114:	e3a03000 	mov	r3, #0
c044a118:	e3400000 	movt	r0, #0
			c044a118: R_ARM_MOVT_ABS	.LC0
c044a11c:	e3a02009 	mov	r2, #9
c044a120:	e300161b 	movw	r1, #1563	; 0x61b
c044a124:	ebfffffe 	bl	0 <warn_slowpath_fmt>
			c044a124: R_ARM_CALL	warn_slowpath_fmt
	del_timer(&host->timer);
c044a128:	e28400a4 	add	r0, r4, #164	; 0xa4
c044a12c:	ebfffffe 	bl	0 <del_timer>
			c044a12c: R_ARM_CALL	del_timer
	if (host->need_clock_update) {
c044a130:	e5d430a0 	ldrb	r3, [r4, #160]	; 0xa0
c044a134:	e3530000 	cmp	r3, #0
c044a138:	0a000005 	beq	c044a154 <atmci_request_end+0x64>
		atmci_writel(host, ATMCI_MR, host->mode_reg);
c044a13c:	e59420b8 	ldr	r2, [r4, #184]	; 0xb8
c044a140:	e5943000 	ldr	r3, [r4]
	asm volatile("str %1, %0"
c044a144:	e5832004 	str	r2, [r3, #4]
		if (host->caps.has_cfg_reg)
c044a148:	e5d420da 	ldrb	r2, [r4, #218]	; 0xda
c044a14c:	e3520000 	cmp	r2, #0
c044a150:	1a000019 	bne	c044a1bc <atmci_request_end+0xcc>
	host->cur_slot->mrq = NULL;
c044a154:	e594101c 	ldr	r1, [r4, #28]
	return READ_ONCE(head->next) = head;
c044a158:	e1a03004 	mov	r3, r4
c044a15c:	e3a02000 	mov	r2, #0
c044a160:	e5812010 	str	r2, [r1, #16]
	host->mrq = NULL;
c044a164:	e5842020 	str	r2, [r4, #32]
c044a168:	e5b31098 	ldr	r1, [r3, #152]!	; 0x98
	if (!list_empty(&host->queue)) {
c044a16c:	e1510003 	cmp	r1, r3
		host->state = STATE_IDLE;
c044a170:	05842094 	streq	r2, [r4, #148]	; 0x94
	if (!list_empty(&host->queue)) {
c044a174:	0a00000c 	beq	c044a1ac <atmci_request_end+0xbc>
		struct atmel_mci_slot *slot = list_entry(host->queue.next,
c044a178:	e5943098 	ldr	r3, [r4, #152]	; 0x98


Do you realize your patch is just unnecessary churn now?

Is it too difficult for you to actually compile the driver and look
at the changes before submitting patches?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
