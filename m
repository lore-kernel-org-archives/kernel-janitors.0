From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 05 Apr 2020 17:54:34 +0000
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in ingenic_drm_probe()
Message-Id: <alpine.DEB.2.21.2004051948120.3208@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-662989409-1586109274=:3208"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-662989409-1586109274=:3208
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sun, 5 Apr 2020, Christophe JAILLET wrote:

> Le 05/04/2020 à 11:30, Markus Elfring a écrit :
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 5 Apr 2020 11:25:30 +0200
> >
> > The function “platform_get_irq” can log an error already.
> > Thus omit a redundant message for the exception handling in the
> > calling function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >   drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > index 9dfe7cb530e1..06ca752b76ee 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device
> > *pdev)
> >   	}
> >
> >   	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0) {
> > -		dev_err(dev, "Failed to get platform irq");
>
> Some 'dev_err' or equivalent functions sometimes don't have a trailing '\n'.
> (just like here)
> Do you think that it worth fixing? Or is it to low level value?
>
> According to a few grep, there seems to be quite a lot of them to fix.
>
> Julia, can 'coccinelle' be used for that?

Yes, it should be possible by writing some script code.

Something like

@initialize:python@
@@
... // define check_for_missing_nl (returning a boolean) and add_newline

@r@
constant str : script:python() { check_for_missing_nl str };
expression e;
@@

dev_err(e,str,...)

@script:python s@
str << r.str;
strnl;
@@

coccinelle.strnl = add_newline str

@@
constant r.str;
identifier s.strnl;
@@

dev_err(e,
- str
+ strnl
  ,...)

One would have to be a bit careful in add_newline to keep the "s even
though the code pretends that strnl is an identifier.

julia

>
> CJ
>
> > +	if (irq < 0)
> >   		return irq;
> > -	}
> >
> >   	if (soc_info->needs_dev_clk) {
> >   		priv->lcd_clk = devm_clk_get(dev, "lcd");
> > --
> > 2.26.0
> >
> >
>
>
--8323329-662989409-1586109274=:3208--
