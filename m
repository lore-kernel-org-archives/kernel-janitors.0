From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Aug 2014 08:22:56 +0000
Subject: Re: [patch 119/197] scripts/coccinelle/free: Delete NULL test before freeing functions
Message-Id: <53E5DA60.90902@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53e53fd1.zO3IbUqJ421c7VXf%akpm@linux-foundation.org>
In-Reply-To: <53e53fd1.zO3IbUqJ421c7VXf%akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> +@r depends on context || report || org @
> +expression E;
> +position p;
> +@@
> +
> +* if (E)
> +*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb\)(E);

How do you think about to add the construct "@p" also behind the function name
"usb_free_urb"?


Is my previous update suggestion for such an issue worth for another look, too?

Regards,
Markus
