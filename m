From: Nick Piggin <nickpiggin@yahoo.com.au>
Date: Thu, 12 Oct 2006 05:54:22 +0000
Subject: Re: [KJ] [PATCH] drivers/mmc/mmc.c: Replacing yield() with a
Message-Id: <452DD88E.4030707@yahoo.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com> <1160571491.3000.372.camel@laptopd505.fenrus.org>
In-Reply-To: <1160571491.3000.372.camel@laptopd505.fenrus.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: Amol Lad <amol@verismonetworks.com>, linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Arjan van de Ven wrote:
> On Wed, 2006-10-11 at 18:15 +0530, Amol Lad wrote:
> 
>>In 2.6, the semantics of calling yield() changed from "sleep for a
>>bit" to "I really don't want to run for a while".  This matches POSIX
>>better, but there's a lot of drivers still using yield() when they mean
>>cond_resched(), schedule() or even schedule_timeout().
>>
>>For this driver cond_resched() seems to be a better
>>alternative
>>
> 
> 
> are you sure?
> 
> 
>>Tested compile only
>>
>>Signed-off-by: Amol Lad <amol@verismonetworks.com>
>>---
>>diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/mmc/mmc.c linux-2.6.19-rc1/drivers/mmc/mmc.c
>>--- linux-2.6.19-rc1-orig/drivers/mmc/mmc.c	2006-10-05 14:00:46.000000000 +0530
>>+++ linux-2.6.19-rc1/drivers/mmc/mmc.c	2006-10-11 17:57:02.000000000 +0530
>>@@ -454,7 +454,7 @@ static void mmc_deselect_cards(struct mm
>> static inline void mmc_delay(unsigned int ms)
>> {
>> 	if (ms < HZ / 1000) {
>>-		yield();
>>+		cond_resched();
>> 		mdelay(ms);
> 
> 
> 
> this probably wants msleep(), especially with hrtimers comming up; there
> the sleeps are always exact...

The condition looks broken too. It should be
if (ms < 1000 / HZ) {...}

Shouldn't it?
-- 
SUSE Labs, Novell Inc.
Send instant messages to your online friends http://au.messenger.yahoo.com 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
