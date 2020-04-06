From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 06 Apr 2020 18:50:51 +0000
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in ingenic_drm_probe()
Message-Id: <alpine.DEB.2.21.2004062049410.10239@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1274042975-1586199051=:10239"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1274042975-1586199051=:10239
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 6 Apr 2020, Christophe JAILLET wrote:

> Le 05/04/2020 à 19:54, Julia Lawall a écrit :
> >
> > On Sun, 5 Apr 2020, Christophe JAILLET wrote:
> >
> > > Le 05/04/2020 à 11:30, Markus Elfring a écrit :
> > > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > > Date: Sun, 5 Apr 2020 11:25:30 +0200
> > > >
> > > > The function “platform_get_irq” can log an error already.
> > > > Thus omit a redundant message for the exception handling in the
> > > > calling function.
> > > >
> > > > This issue was detected by using the Coccinelle software.
> > > >
> > > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > > ---
> > > >    drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
> > > >    1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > > > b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > > > index 9dfe7cb530e1..06ca752b76ee 100644
> > > > --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > > > @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device
> > > > *pdev)
> > > >    	}
> > > >
> > > >    	irq = platform_get_irq(pdev, 0);
> > > > -	if (irq < 0) {
> > > > -		dev_err(dev, "Failed to get platform irq");
> > > Some 'dev_err' or equivalent functions sometimes don't have a trailing
> > > '\n'.
> > > (just like here)
> > > Do you think that it worth fixing? Or is it to low level value?
> > >
> > > According to a few grep, there seems to be quite a lot of them to fix.
> > >
> > > Julia, can 'coccinelle' be used for that?
> > Yes, it should be possible by writing some script code.
> >
> > Something like
> >
> > @initialize:python@
> > @@
> > ... // define check_for_missing_nl (returning a boolean) and add_newline
> >
> > @r@
> > constant str : script:python() { check_for_missing_nl str };
>
> I can not have this work.
> According to my understanding of [1], this syntax is only allowed for
> 'position'.

Maybe you have an older version of Coccinelle?  If you get the latest
version from github it should work.

>
> Nevertheless, I wrote another script (see below), which triggers ~2800 times
> in ./drivers only.
> Some are false positives, but most look valid.
>
> Not sure that fixing this kind of stuff really make sense.

Yes, it seems like a lot...

julia

>
> A better approach could be to teach ./checkpatch.pl, but I don't have the
> knowledge for that.
>
>
> CJ
>
> [1]: http://coccinelle.lip6.fr/docs/main_grammar.pdf (SmPL Grammar 1.0.8)
>
> > expression e;
> > @@
> >
> > dev_err(e,str,...)
> >
> > @script:python s@
> > str << r.str;
> > strnl;
> > @@
> >
> > coccinelle.strnl = add_newline str
> >
> > @@
> > constant r.str;
> > identifier s.strnl;
> > @@
> >
> > dev_err(e,
> > - str
> > + strnl
> >    ,...)
> >
> > One would have to be a bit careful in add_newline to keep the "s even
> > though the code pretends that strnl is an identifier.
> >
> > julia
> >
> > > CJ
> > >
> > > > +	if (irq < 0)
> > > >    		return irq;
> > > > -	}
> > > >
> > > >    	if (soc_info->needs_dev_clk) {
> > > >    		priv->lcd_clk = devm_clk_get(dev, "lcd");
> > > > --
> > > > 2.26.0
> > > >
> > > >
> > >
>
> >>>>>>>>>>>>>>>>>>>>>>>>>>>
>
> @initialize:python@
> @@
>
> @r@
> constant str;
> expression e;
> position p;
> @@
> (
>         pr_emerg@p(str, ...)
> |
>         pr_alert@p(str, ...)
> |
>         pr_crit@p(str, ...)
> |
>         pr_err@p(str, ...)
> |
>         pr_warn@p(str, ...)
> |
>         pr_notice@p(str, ...)
> |
>         pr_info@p(str, ...)
> |
>         dev_emerg@p(e, str, ...)
> |
>         dev_alert@p(e, str, ...)
> |
>         dev_crit@p(e, str, ...)
> |
>         dev_err@p(e, str, ...)
> |
>         dev_warn@p(e, str, ...)
> |
>         dev_notice@p(e, str, ...)
> |
>         dev_info@p(e, str, ...)
> )
>
> @script:python depends on r@
> str << r.str;
> p << r.p;
> @@
> if not str.endswith("\\n\""):
>     print(p[0].file + ":" + p[0].line + ": " + str)
>
>
--8323329-1274042975-1586199051=:10239--
