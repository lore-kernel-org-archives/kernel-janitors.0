From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 10 Apr 2007 21:25:16 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site> <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

On Tue, 10 Apr 2007, Jan Engelhardt wrote:

>
> On Apr 10 2007 23:46, Milind Arun Choudhary wrote:
>
> >"use spin_lock_init instead of SPIN_LOCK_UNLOCKED"
>
> Fact is, we cannot remove SPIN_LOCK_UNLOCKED. It's needed for
> variables outside functions:
>
> static spinlock_t foobar = SPIN_LOCK_UNLOCKED;

but that's where you would use the more explicit
__RAW_SPIN_LOCK_UNLOCKED, no?  AFAIK, you really can remove the macro
SPIN_LOCK_UNLOCKED in its entirety.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
