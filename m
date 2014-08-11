From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 11 Aug 2014 13:00:52 +0000
Subject: Re: [PATCH] scripts/coccinelle/free/ifnullfree.cocci: simplify and extend to of_node_put
Message-Id: <53E8BE84.3080505@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407752653-16883-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407752653-16883-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>  @r depends on context || report || org @
> @@ -37,7 +35,8 @@ position p;
>  @@
>  
>  * if (E)
> -*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb\)(E);
> +*  \(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb@p\|
> +*    of_node_put@p\)(E);

Why do you want to limit this semantic patch pattern to such a small list of
function names?

Would you like to consider also the hundreds of other functions which perform
input parameter validation?
Are you interested to make the checked list more complete with further
(eventually automatic?) extensions?

Regards,
Markus
