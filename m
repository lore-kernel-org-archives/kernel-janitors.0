From: Jim Nelson <james4765@verizon.net>
Date: Wed, 22 Dec 2004 03:45:29 +0000
Subject: [KJ] Re: lcd: fix memory leak, code cleanup
Message-Id: <41C8EDD9.7070007@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79538502646873388=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041221015120.29110.98832.48706@localhost.localdomain> <20041221120607.GA30293@nd47.coderock.org>
In-Reply-To: <20041221120607.GA30293@nd47.coderock.org>
To: Domen Puncer <domen@coderock.org>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

--===============79538502646873388==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:
> On 20/12/04 19:50 -0600, James Nelson wrote:
> 
>>This patch addresses the following issues:
>>
>>Fix log-spamming and cryptic error messages, and add KERN_ constants.
>>Convert some ints to unsigned ints.
>>Add checks for CAP_SYS_ADMIN for FLASH_Burn and FLASH_Erase ioctls.
>>Identify use of global variable.
>>Fix memory leak in FLASH_Burn ioctl.
>>Fix error return codes in lcd_ioctl().
>>Move variable "index" in lcd_ioctl() to smaller scope to reduce memory usage.
>>Convert cli()/sti() to spin_lock_irqsave()/spin_unlock_irqrestore().
>>Fix legibility issues in FLASH_Burn ioctl.
>>
> 
> 
> 
>>-				cli();
>>+				spin_lock_irqsave(&lcd_lock, flags);
>> 				for (index = 0; index < (128); index++) {
>> 
>> 					WRITE_FLASH(kFlash_Addr1,
>>@@ -480,32 +485,30 @@
>> 						    kFlash_Data2);
>> 					WRITE_FLASH(kFlash_Addr1,
>> 						    kFlash_Prog);
>>-					*((volatile unsigned char *)
>>-					  burn_addr) =
>>-		 (volatile unsigned char) rom[index];
>>-
>>-					while ((!dqpoll
>>-						(burn_addr,
>>-						 (volatile unsigned char)
>>-						 rom[index]))
>>-					       && (!timeout(burn_addr))) {
>>-					}
>>+					*((volatile unsigned char *)burn_addr) =
>>+					  (volatile unsigned char) rom[index];
>>+
>>+					while ((!dqpoll (burn_addr,
>>+						(volatile unsigned char)
>>+						rom[index])) &&
>>+						(!timeout(burn_addr))) { }
>> 					burn_addr++;
>> 				}
>>-				restore_flags(flags);
>>-				if (*
>>-				    ((volatile unsigned char *) (burn_addr
>>-								 - 1)) ==
>>-				    (volatile unsigned char) rom[index -
>>-								 1]) {
>>+				spin_unlock_irqrestore(&lcd_lock, flags);
> 
> 
> 
> Although this will work, i think local_irq_{disable,enable} is the right
> solution (we don't protect any data, just make sure timings are right).
> 

Since the Cobalt systems are single-processor, there's no functional difference 
between disabling global and local interrupts.

> For making it SMP safe, easiest/sane solution seems semaphore in
> lcd_dev, which is down_interruptible(), at beginning of read, write
> and ioctl.
> 
> Comments?
> 
> 
> 	Domen
>

True, but it would requre making struct lcd_display a global variable, and involve 
reworking just about the whole driver, since it is declared as a local variable in 
individual ioctl case statements, and others use the variable defined at the top 
of the ioctl function.  OTOH, it would reduce stack usage...

I was trying to minimize any mucking about with the functional parts of the 
driver, since I don't have the hardware to test it.

Since ioctls are still protected by the BKL right now (and this thing is pretty 
much nothing but an ioctl interface), I don't see too much of a problem with this 
driver.  More complete drivers, however, would definitely benefit from it, and is 
something I'll keep in mind.

Jim

--===============79538502646873388==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79538502646873388==--
