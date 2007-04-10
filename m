From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Tue, 10 Apr 2007 21:28:11 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site> <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
 <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org


On Apr 10 2007 17:25, Robert P. J. Day wrote:
>On Tue, 10 Apr 2007, Jan Engelhardt wrote:
>> On Apr 10 2007 23:46, Milind Arun Choudhary wrote:
>>
>> >"use spin_lock_init instead of SPIN_LOCK_UNLOCKED"
>>
>> Fact is, we cannot remove SPIN_LOCK_UNLOCKED. It's needed for
>> variables outside functions:
>>
>> static spinlock_t foobar = SPIN_LOCK_UNLOCKED;
>
>but that's where you would use the more explicit
>__RAW_SPIN_LOCK_UNLOCKED, no?  AFAIK, you really can remove the macro
>SPIN_LOCK_UNLOCKED in its entirety.

I don't remember LDD speaking about __RAW_*. (And other than not
having looked into the code to date, I don't know the difference.)


Jan
-- 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
