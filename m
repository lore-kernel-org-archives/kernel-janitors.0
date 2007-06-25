From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 25 Jun 2007 11:51:12 +0000
Subject: Re: [KJ] why two different implementations for /dev/zero?
Message-Id: <20070625115112.GH22063@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706250718430.4102@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706250718430.4102@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 25, 2007 at 07:22:06AM -0400, Robert P. J. Day wrote:
> where the non-MMU version is noticeably simpler and would appear to
> work just fine in both cases.  is there a compelling reason for the
> more complex MMU version?  is it faster?

The comments certainly imply that it's faster.  Have you tried
benchmarking it?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
