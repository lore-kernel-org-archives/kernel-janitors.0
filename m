From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 20 Nov 2004 00:35:38 +0000
Subject: Re: [KJ] [PATCH] convert atmel_cs wireless driver to module_param
Message-Id: <20041120003538.GA1256@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11774867407235545=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109213307.GD9496@dice.seeling33.de>
In-Reply-To: <20041109213307.GD9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============11774867407235545==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 20 Nov 2004, stefan@binarchy.net wrote:

> On Fri, Nov 19, 2004 at 09:09:51PM +0100, maximilian attems wrote:
> > On Tue, 09 Nov 2004, Stefan Sperling wrote:
> > > 
> > > Replaces MODULE_PARM with module_param calls in atmel_cs wireless driver.
> > > 
> > > --- drivers/net/wireless/atmel_cs.c.orig	2004-11-09 20:40:21.974926616 +0100
> > > +++ drivers/net/wireless/atmel_cs.c	2004-11-08 23:10:14.000000000 +0100
> > please as described in Documentation/SubmittingPatches
> > add one level. thanks :)
>  
> ouch!
> 
> > you send on the same driver multiple patches,
> > is the newere one the better, what's their differences?
> 
> sorry, my mistake. the newer one is better.
> The difference is file permissions for /sys entries.
> The older patch exposed more variables as writable (0644),
> while the newer one should only make debug and verbosity flags
> writeable.
> 
> Unfortunately I had a hard drive crash last week and I thus cannot quickly
> re-send the patches with -p1.
> So I'd suggest editing the diff directly, like so:
> --- a/drivers/net/wireless/atmel_cs.c.orig	2004-11-09 20:40:21.974926616 +0100
> +++ b/drivers/net/wireless/atmel_cs.c	2004-11-08 23:10:14.000000000 +0100
> 
> regards
> stefan
> 
shure the ones for next kjt are corrected,
but please keep it in mind for the next one.
please ping me if one of the patches in kjt is wrong or missing.
kjt will be out in some hours hopefully. ;)

a++ maks

--===============11774867407235545==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11774867407235545==--
