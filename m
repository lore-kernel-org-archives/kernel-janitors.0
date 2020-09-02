From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 02 Sep 2020 07:24:00 +0000
Subject: Re: [PATCH] coccinelle: ifnullfree: add vfree(), kvfree*() functions
Message-Id: <alpine.DEB.2.22.394.2009020921500.2528@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1962328576-1599031440=:2528"
List-Id: <kernel-janitors.vger.kernel.org>
References: <99e82f65-e02e-988a-4e78-4d438ff8e28e@web.de>
In-Reply-To: <99e82f65-e02e-988a-4e78-4d438ff8e28e@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1962328576-1599031440=:2528
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Wed, 2 Sep 2020, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/free/ifnullfree.cocci
> > @@ -20,8 +20,14 @@ expression E;
> >  - if (E != NULL)
> >  (
> >    kfree(E);
> > +|
> > +  kvfree(E);
> >  |
> >    kfree_sensitive(E);
> > +|
> > +  kvfree_sensitive(E, ...);
> > +|
> > +  vfree(E);
> >  |
> >    debugfs_remove(E);
> >  |
>
> Would you ever get into the development mood to move the source code search
> specification “(E);” out of the SmPL disjunction (as it happened for the rule “r”)?
>
>
> > @@ -42,9 +48,10 @@ position p;
> >  @@
> >
> >  * if (E != NULL)
> > -*	\(kfree@p\|kfree_sensitive@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|
> > +*	\(kfree@p\|kvfree@p\|kfree_sensitive@p\|kvfree_sensitive@p\|vfree@p\|
> > +*         debugfs_remove@p\|debugfs_remove_recursive@p\|
> >  *         usb_free_urb@p\|kmem_cache_destroy@p\|mempool_destroy@p\|
> > -*         dma_pool_destroy@p\)(E);
> > +*         dma_pool_destroy@p\)(E, ...);
> …
>
> How do you think about to attach the position variable to the opening parenthesis
> instead of each function name?
>
> +*         dma_pool_destroy\)(@p E, ...);

While it probably impacts few people, this is a really bad idea for org
mode, because org mode colors the thing that the position variable is
attached to.  Having the ( colored would not be very visible.

But even for report mode, this is probably not a good idea for the rare
case where the function name and the argument list are on different lines.

julia

>
>
> Would the number of function call parameters influence such SmPL code any more?
>
> Regards,
> Markus
>
--8323329-1962328576-1599031440=:2528--
