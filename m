From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 11 Aug 2014 13:05:21 +0000
Subject: Re: [PATCH] scripts/coccinelle/free/ifnullfree.cocci: simplify and extend to of_node_put
Message-Id: <alpine.DEB.2.10.1408111503550.2518@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407752653-16883-1-git-send-email-Julia.Lawall@lip6.fr>
 <53E8BE84.3080505@users.sourceforge.net>
In-Reply-To: <53E8BE84.3080505@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr



On Mon, 11 Aug 2014, SF Markus Elfring wrote:

> >  @r depends on context || report || org @
> > @@ -37,7 +35,8 @@ position p;
> >  @@
> >
> >  * if (E)
> > -*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb\)(E);
> > +*  \(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb@p\|
> > +*    of_node_put@p\)(E);
>
> Why do you want to limit this semantic patch pattern to such a small list of
> function names?

Because these are the ones that kernel developers have cited as
interesting for this kind of transformation.

> Would you like to consider also the hundreds of other functions which perform
> input parameter validation?

Personally, no.  I think I have explained why several times already.

julia

> Are you interested to make the checked list more complete with further
> (eventually automatic?) extensions?
>
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
