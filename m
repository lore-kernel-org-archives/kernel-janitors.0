From: Jim Nelson <james4765@verizon.net>
Date: Sat, 18 Dec 2004 03:46:47 +0000
Subject: [KJ] Re: [PATCH] esp: replace cli()/sti() with
Message-Id: <41C3A827.9090301@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98479980476308504=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217231915.14919.49991.15433@localhost.localdomain> <41C385FC.3010109@ppp0.net>
In-Reply-To: <41C385FC.3010109@ppp0.net>
To: Jan Dittmer <jdittmer@ppp0.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

--===============98479980476308504==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jan Dittmer wrote:
> James Nelson wrote:
> 
>>This is an attempt to make the esp driver SMP-correct.
> 
> 
> You're trying to protect the info data, correct? Could you please
> add a comment to the locks which data structures need to be
> protected by them?!
> Just blindly replacing cli/sti with spin_(un)lock doesn't make it
> SMP save.
> 

*sigh* Thought it wouldn't be that easy.



> 
>>diff -urN --exclude='*~' linux-2.6.10-rc3-mm1-original/drivers/char/esp.c linux-2.6.10-rc3-mm1/drivers/char/esp.c
>>--- linux-2.6.10-rc3-mm1-original/drivers/char/esp.c	2004-12-03 16:52:13.000000000 -0500
>>+++ linux-2.6.10-rc3-mm1/drivers/char/esp.c	2004-12-17 18:11:31.275037730 -0500
>>@@ -212,14 +214,14 @@
>> 	if (serial_paranoia_check(info, tty->name, "rs_stop"))
>> 		return;
>> 	
>>-	save_flags(flags); cli();
>>+	spin_lock_irqsave(&esp_lock, flags);
> 
> 
> info can change between return and lock
> 

Okay.  I see what you are talking about.  I'll dig into it tomorrow (after some 
sleep).

OTOH, this would have been SMP-incorrect even before cli()/sti() was dropped in 2.5 .

> 
>> 	if (info->IER & UART_IER_THRI) {
>> 		info->IER &= ~UART_IER_THRI;
>> 		serial_out(info, UART_ESI_CMD1, ESI_SET_SRV_MASK);
>> 		serial_out(info, UART_ESI_CMD2, info->IER);
>> 	}
>> 
>>-	restore_flags(flags);
>>+	spin_unlock_irqrestore(&esp_lock, flags);
>> }
>> 
>> static void rs_start(struct tty_struct *tty)
>>@@ -230,13 +232,13 @@
>> 	if (serial_paranoia_check(info, tty->name, "rs_start"))
>> 		return;
>> 	
>>-	save_flags(flags); cli();
>>+	spin_lock_irqsave(&esp_lock, flags);
> 
> 
> same here.
> 
> 
>> 	if (info->xmit_cnt && info->xmit_buf && !(info->IER & UART_IER_THRI)) {
>> 		info->IER |= UART_IER_THRI;
>> 		serial_out(info, UART_ESI_CMD1, ESI_SET_SRV_MASK);
>> 		serial_out(info, UART_ESI_CMD2, info->IER);
>> 	}
>>-	restore_flags(flags);
>>+	spin_unlock_irqrestore(&esp_lock, flags);
>> }
>> 
>> /*
> 
> 
> Didn't read the rest. Are you sure you didn't introduce a deadlock in
> the interrupt handler? {transmit,receiver}_chars_{pio,dma} also try to take
> the lock.
> 

Hm.  I made the assumption (silly me) that the code was inherently SMP-correct, 
and just needed the function calls replaced.

Live and learn.

Jim

> Jan
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 


--===============98479980476308504==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98479980476308504==--
