From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Wed, 11 Apr 2007 15:44:40 +0000
Subject: Re: [KJ] [PATCH] SPIN_LOCK_UNLOCKED cleanup in
Message-Id: <Pine.LNX.4.61.0704111744080.32056@yvahk01.tjqt.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411152846.GA11449@arun.site>
In-Reply-To: <20070411152846.GA11449@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, alan@redhat.com


On Apr 11 2007 20:58, Milind Arun Choudhary wrote:
>
>remove SPIN_LOCK_UNLOCKED, use DEFINE_SPINLOCK instead

Don't we have some more places where spinlocks could be janitorified?
Otherwise, ok!


Jan
-- 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
