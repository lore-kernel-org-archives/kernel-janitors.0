From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Sun, 01 Apr 2007 19:04:09 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <Pine.LNX.4.61.0704012103330.16977@yvahk01.tjqt.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
 <9c9aa5d00703312224t1948b24bhe34199f19cbda4fb@mail.gmail.com>
 <20070401061707.GB943@1wt.eu>
In-Reply-To: <20070401061707.GB943@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Willy Tarreau <w@1wt.eu>
Cc: Pedram M <pmessri@gmail.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org


On Apr 1 2007 08:17, Willy Tarreau wrote:
>
>   - your patch was cut and cannot apply to anything. A proper patch starts
>     with line beginning with "---" line, followed by a line with "+++",
>     both indicating the file your patch is supposed to apply to. Make your
>     patch with one level directory for the kernel so that it can apply with
>     "patch -p1". For instance:
>
>        $ diff -u linux-2.6.20/Makefile linux-2.6.20-mine/Makefile
>
>     Another solution is to use '.' as the directory, in order to add one
>     directory level for "patch -p1" to be happy :
>
>        $ diff -u ./Makefile.orig ./Makefile

Suggesting quilt.



Jan
-- 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
