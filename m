From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 17 Dec 2006 20:02:55 +0000
Subject: Re: [KJ] [PATCH] he: tiny space savings
Message-Id: <20061217200255.GA5236@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061217125622.GA4973@martell.zuzino.mipt.ru> <20061217182806.GD10316@stusta.de>
In-Reply-To: <20061217182806.GD10316@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: netdev@vger.kernel.org, Andi Drebes <webmaster@programmierforen.de>, kernel-janitors@lists.osdl.org

On Sun, Dec 17, 2006 at 07:28:06PM +0100, Adrian Bunk wrote:
> On Sun, Dec 17, 2006 at 03:56:22PM +0300, Alexey Dobriyan wrote:
> > From: Andi Drebes <webmaster@programmierforen.de>
> >    text    data     bss     dec     hex filename
> >   20015     480      28   20523    502b drivers/atm/he.o
> >   19997     480      28   20505    5019 drivers/atm/he.o
> >
> > Signed-off-by: Andi Drebes <webmaster@programmierforen.de>
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >
> >  drivers/atm/he.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > --- a/drivers/atm/he.c
> > +++ b/drivers/atm/he.c
> > @@ -101,7 +101,7 @@ #endif /* HE_DEBUG */
> >
> >  /* version definition */
> >
> > -static char *version = "$Id: he.c,v 1.18 2003/05/06 22:57:15 chas Exp $";
> > +static const char version[] = "$Id: he.c,v 1.18 2003/05/06 22:57:15 chas Exp $";
> >...
>
> Can't we kill this ancient and outdated version string instead?

"version" is involved in he_proc_read(). I think, no.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
