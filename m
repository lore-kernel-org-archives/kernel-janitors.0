From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 11 Feb 2007 09:24:17 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <20070211092417.GD16712@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 11, 2007 at 03:55:26AM -0500, Robert P. J. Day wrote:
> On Sun, 11 Feb 2007, Alexey Dobriyan wrote:
>
> > On Sat, Feb 10, 2007 at 05:32:10PM -0500, Robert P. J. Day wrote:
> > >
> > >   i've put some ideas in the wiki:
> > >
> > > http://fsdev.net/wiki/index.php?title=Memory_zeroing_macros
> >
> > Sheesh... No way in hell such macroses are going to be accepted.
>
> i didn't think so, but at the very least, we can probably standardize
> on memzero(), yes?

No! If anything we can put bzero() back but adding second idiom for
clearing memory may be not worth it.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
