From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 07 Nov 2016 01:19:57 +0000
Subject: Re: [PATCH] drm/sun4i: Propagate error to the caller
Message-Id: <20161107011957.GK3327@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org

Hi Christophe,

2016-11-04 Christophe JAILLET <christophe.jaillet@wanadoo.fr>:

> If 'sun4i_layers_init()' returns an error, propagate it instead of
> returning -EINVAL unconditionally.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Gustavo
