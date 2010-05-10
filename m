From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Mon, 10 May 2010 16:52:10 +0000
Subject: Re: [PATCH 4/4] Add scripts/coccinelle/resource_size.cocci
Message-Id: <o2y84144f021005100952z1a7e991dt21341fb8f7c76af@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk>
	 <1273508667-5152-5-git-send-email-npalix@diku.dk>
In-Reply-To: <1273508667-5152-5-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Mon, May 10, 2010 at 7:24 PM, Nicolas Palix <npalix@diku.dk> wrote:
> @@ -0,0 +1,94 @@
> +///
> +/// Use resource_size function on resource object
> +/// instead of explicit computation.
> +///
> +// =A0Confidence: High
> +// =A0Copyright: (C) 2009, 2010 Nicolas Palix, DIKU. =A0GPLv2.
> +// =A0Copyright: (C) 2009, 2010 Julia Lawall, DIKU. =A0GPLv2.
> +// =A0Copyright: (C) 2009, 2010 Gilles Muller, INRIA/LiP6. =A0GPLv2.
> +// =A0URL: http://coccinelle.lip6.fr/
> +// =A0Options:
> +//
> +// =A0Keywords: resource_size
> +// =A0Version min: 2.6.27 resource_size

I guess we don't need this versioning in mainline?
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
