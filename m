From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Oct 2015 09:55:38 +0000
Subject: Re: [PATCH 1/2] coccinelle: ifnullfree: improve and extend ifnullfree
Message-Id: <56236C9A.8060906@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445102605-22408-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445102605-22408-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Remove removal and re-addition of freeing functions.

I find such a wording confusing for a commit message.


> Add position variable on usb_free_urb in the non-patch case.

Is it interesting that this fix corresponds to a bug report from 2014-08-09?
https://lkml.org/lkml/2014/8/9/33
https://systeme.lip6.fr/pipermail/cocci/2014-August/001038.html


>  @r depends on context || report || org @
> @@ -36,8 +32,8 @@ expression E;
>  position p;
>  @@
>  
> -* if (E)
> -*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb\)(E);
> +* if (E != NULL)
> +*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb@p\)(E);

How do you think about to extend the shown function name pattern
also with suffixes like the following (besides "destroy")?
* put
* release
* unref
* unregister

Regards,
Markus
