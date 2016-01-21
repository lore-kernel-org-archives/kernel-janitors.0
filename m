From: David Vrabel <david.vrabel@citrix.com>
Date: Thu, 21 Jan 2016 10:45:59 +0000
Subject: Re: [Xen-devel] [PATCH] cleancache: constify cleancache_ops structure
Message-Id: <56A0B6E7.9040201@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450904784-17139-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450904784-17139-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>

On 23/12/15 21:06, Julia Lawall wrote:
> The cleancache_ops structure is never modified, so declare it as const.
> 
> This also removes the __read_mostly declaration on the cleancache_ops
> variable declaration, since it seems redundant with const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> 
> Not sure that the __read_mostly change is correct.  Does it apply to the
> variable, or to what the variable points to?

The variable, so...

> --- a/mm/cleancache.c
> +++ b/mm/cleancache.c
> @@ -22,7 +22,7 @@
>   * cleancache_ops is set by cleancache_register_ops to contain the pointers
>   * to the cleancache "backend" implementation functions.
>   */
> -static struct cleancache_ops *cleancache_ops __read_mostly;
> +static const struct cleancache_ops *cleancache_ops;

...you want to retain the __read_mostly here.

David
