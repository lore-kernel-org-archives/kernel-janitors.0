From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 10 Apr 2007 21:13:02 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <adafy78orvl.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site>
	<Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr> (Jan Engelhardt's message of "Tue, 10 Apr 2007 22:50:28 +0200 (MEST)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Milind Arun Choudhary <milindchoudhary@GMAIL.COM>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

 > Fact is, we cannot remove SPIN_LOCK_UNLOCKED. It's needed for
 > variables outside functions:
 > 
 > static spinlock_t foobar = SPIN_LOCK_UNLOCKED;

DEFINE_SPINLOCK() is provided to define variables that way.

 - R.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
