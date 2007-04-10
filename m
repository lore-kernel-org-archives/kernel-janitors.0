From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 10 Apr 2007 21:42:38 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <ada7isjq52p.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site>
	<Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
	<Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
	<Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr> (Jan Engelhardt's message of "Tue, 10 Apr 2007 23:28:11 +0200 (MEST)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: "Robert P. J. Day" <rpjday@mindspring.com>, Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

 > >but that's where you would use the more explicit
 > >__RAW_SPIN_LOCK_UNLOCKED, no?  AFAIK, you really can remove the macro
 > >SPIN_LOCK_UNLOCKED in its entirety.
 > 
 > I don't remember LDD speaking about __RAW_*. (And other than not
 > having looked into the code to date, I don't know the difference.)

Don't worry about the __RAW_SPIN_LOCK_UNLOCKED stuff, that's obviously
not for generic code to use.  The right answer (as I said before) is
to use DEFINE_SPINLOCK().

 - R.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
