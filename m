From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 10 Apr 2007 21:58:37 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <ada3b37q4c2.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site>
	<Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
	<Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
	<Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr>
	<ada7isjq52p.fsf@cisco.com>
	<Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6> (Robert P. J. Day's message of "Tue, 10 Apr 2007 17:45:07 -0400 (EDT)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

 > > Don't worry about the __RAW_SPIN_LOCK_UNLOCKED stuff, that's
 > > obviously not for generic code to use.  The right answer (as I said
 > > before) is to use DEFINE_SPINLOCK().
 > 
 > that works fine if you're defining a single spinlock, but what do you
 > do in cases like this:
 > 
 > arch/sparc/lib/atomic32.c:      [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
 > 
 > that is, when you're assigning an array of them?  you still need some
 > kind of generic, unnamed spinlock in those circumstances, no?

Wow, I didn't realize there was code doing that.  I guess for that
handful of cases, you indeed would probably want to convert them to
raw_spinlock_t and use __RAW_SPIN_LOCK_UNLOCKED.  But in the vast
majority of cases, DEFINE_SPINLOCK() is the right think to do.

 - R.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
