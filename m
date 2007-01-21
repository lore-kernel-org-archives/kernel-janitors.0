From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 21 Jan 2007 09:02:24 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <20070121090224.GA11957@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 21, 2007 at 03:36:33AM -0500, Robert P. J. Day wrote:
> p.s.  the source file drivers/scsi/BusLogic.c repeatedly refers to the
> token "true", but it's not clear where *that's" being defined.  goes
> gcc actually recognize the token "true"?  that's supposed to be
> defined in C99's <stdbool.h>, but that's clearly not being used here.

When in doubt see preprocessor output:

	make drivers/scsi/BusLogic.i

	# 1 "/home/linux/linux-irq-flags-t/include/linux/stddef.h" 1
	# 15 "/home/linux/linux-irq-flags-t/include/linux/stddef.h"
	enum {
	 false = 0,
	 true = 1
	};

Indeed, "true" is right there.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
