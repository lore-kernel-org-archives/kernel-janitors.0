From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 14 Dec 2015 07:17:35 +0000
Subject: Re: [PATCH 1/2] zram: Less checks in zram_bvec_write() after error detection
Message-Id: <alpine.DEB.2.02.1512140813550.2047@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <566B13C1.50907@users.sourceforge.net> <566B14DA.1080709@users.sourceforge.net> <20151214002702.GA718@swordfish> <566E6895.5050603@users.sourceforge.net>
In-Reply-To: <566E6895.5050603@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, kernel-janitors@vger.kernel.org

> I suggest to make the affected exception handling a bit more efficient.
> Such source code fine-tuning has got a few special consequences.

Exception handling is by definition exceptional, and thus its efficiency 
is rarely important.  What is important is that it should be correct, and 
ideally clearly correct, so that someone can check its correctness easily.  
Optimizations, if they have any effect at all, typically make the 
correctness less obvious.

julia
