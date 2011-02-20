From: <aaro.koskinen@nokia.com>
Date: Sun, 20 Feb 2011 19:36:18 +0000
Subject: RE: [PATCH 0/2] Staging: xgifb: Remove CRIT[FLAGS | BEGIN | END]
Message-Id: <CA1B555B4D79E3448D96A7C9847C7D98027F2A@008-AM1MPN1-032.mgdnok.nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martinez.javier@gmail.com, gregkh@suse.de
Cc: wfp5p@virginia.edu, apatard@mandriva.com, randy.dunlap@oracle.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

From: Javier Martinez Canillas [martinez.javier@gmail.com]:
> xgifb staging driver uses a set of defines that hides the synchronization
> mechanism used to access critical sections. Also, the use of spinlocks
> can be disabled in compile time.
>
> Since the spinlocks ABI only are used in contexts were critical section exists
> (UP with preemption enabled and SMP machines), I think we should always have
> the spinlocks enabled and let the spinlock ABI choose to include the spinlocks
> or not. In the other hand if the driver doesn't need locking at all, then
> maybe we should just delete the spinlock logic.

I think these should be just deleted. The acceleration functions are used by the framebuffer
layer which should take care of concurrent access. Or can you point out some real scenario
where the spinlocks are needed?

A.
