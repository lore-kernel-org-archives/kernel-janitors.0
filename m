From: Simon Horman <horms@verge.net.au>
Date: Mon, 16 Apr 2007 07:45:59 +0000
Subject: Re: [KJ] [Fastboot] Trivial patch:changing const char foo* to const
Message-Id: <20070416074559.GB28064@verge.net.au>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 16, 2007 at 12:49:43PM +0530, surya.prabhakar@wipro.com wrote:
> Files modified 
> 
> arch/i386/boot/compressed/relocs.c
> arch/i386/kernel/vmi.c
> 
> As suggested by Jeff Garzik, 
> ----
> >The string form [const] char *foo = "blah";
> >creates two variables in the final assembly output, a static string,
> >and
> >a char pointer to the static string. The alternate string form
> >[const] char foo[] = "blah"; is better because it declares a single
> >variable.
> ------
> 
> Cleaned up for the new modifications. 
> 
> 
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>

Looks find to me.

-- 
Horms
  H: http://www.vergenet.net/~horms/
  W: http://www.valinux.co.jp/en/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
