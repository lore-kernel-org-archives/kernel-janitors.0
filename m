From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Wed, 01 Aug 2007 01:12:49 +0000
Subject: Re: [PATCH 60] drivers/net/wireless/prism54/oid_mgt.c: kmalloc + memset conversion to kzalloc
Message-Id: <43e72e890707311812t3bf67684p6af4d0c21d44608e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	 <200707312334.51067.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312334.51067.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org

On 7/31/07, Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:
> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

Acked-by: Luis R. Rodriguez <mcgrof@gmail.com>

>  drivers/net/wireless/prism54/oid_mgt.c | 25377 -> 25297 (-80 bytes)
>  drivers/net/wireless/prism54/oid_mgt.o | 128460 -> 128284 (-176 bytes)
>
>  drivers/net/wireless/prism54/oid_mgt.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> --- linux-2.6.23-rc1-mm1-a/drivers/net/wireless/prism54/oid_mgt.c       2007-07-26 13:07:43.000000000 +0200
> +++ linux-2.6.23-rc1-mm1-b/drivers/net/wireless/prism54/oid_mgt.c       2007-07-30 00:27:44.000000000 +0200
> @@ -244,13 +244,11 @@ mgt_init(islpci_private *priv)
>         /* Alloc the cache */
>         for (i = 0; i < OID_NUM_LAST; i++) {
>                 if (isl_oid[i].flags & OID_FLAG_CACHED) {
> -                       priv->mib[i] = kmalloc(isl_oid[i].size *
> +                       priv->mib[i] = kzalloc(isl_oid[i].size *
>                                                (isl_oid[i].range + 1),
>                                                GFP_KERNEL);
>                         if (!priv->mib[i])
>                                 return -ENOMEM;
> -                       memset(priv->mib[i], 0,
> -                              isl_oid[i].size * (isl_oid[i].range + 1));
>                 } else
>                         priv->mib[i] = NULL;
>         }
>
