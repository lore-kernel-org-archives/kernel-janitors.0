From: Jan Dittmer <jdittmer@ppp0.net>
Date: Sat, 18 Dec 2004 08:54:49 +0000
Subject: Re: [KJ] Re: [PATCH] lcd: replace cli()/sti() with
Message-Id: <41C3F059.7000804@ppp0.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41C380D0.9020001@ppp0.net>
In-Reply-To: <41C380D0.9020001@ppp0.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Fri, Dec 17, 2004 at 10:02:16PM -0500, Jim Nelson wrote:
> 
>>Jan Dittmer wrote:
>>
>>>James Nelson wrote:
>>>
>>>
>>>>Remove the cli()/sti() calls in drivers/char/lcd.c
>>>
>>>
>>>Why is this cli() there in the first place? ioctl is already
>>>called under lock_kernel.
>>
>>First - a warning.  Newbie on the loose, running around, asking for a whack 
>>with the cluebat.
> 
> 
> OK.  Quick lesson (for both of you actually; Jan's response wasn't accurate).

Thanks.

> So you still need to disable interrupts, even if you're running under the
> BKL -- interrupt routines can't acquire the BKL (because it's magic) and
> acquiring the BKL doesn't disable interrupts.

But still, two ioctl()s can't run in parallel, can they? The driver isn't
using any interrupts (I'm aware that this asumption isn't necessarily
true in the future due to ioctl_unlocked work, etc.).

Jan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
