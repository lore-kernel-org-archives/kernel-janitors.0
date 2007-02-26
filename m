From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Mon, 26 Feb 2007 07:54:49 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <3b44d3fb0702252342x6121dab8v1ea0ab6743a2018e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/25/07, Douglas Schilling Landgraf <dougsland@gmail.com> wrote:
> Use strncpy instead of strcpy.
>
> Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>
>
> Index: linux-2.6.20.1/drivers/net/3c505.c
> =================================> --- linux-2.6.20.1.orig/drivers/net/3c505.c
> +++ linux-2.6.20.1/drivers/net/3c505.c
> @@ -1154,8 +1154,8 @@ static struct net_device_stats *elp_get_
>  static void netdev_get_drvinfo(struct net_device *dev,
>                                struct ethtool_drvinfo *info)
>  {
> -       strcpy(info->driver, DRV_NAME);
> -       strcpy(info->version, DRV_VERSION);
> +       strncpy(info->driver, DRV_NAME, sizeof(info->driver)-1);
> +       strncpy(info->version, DRV_VERSION, sizeof(info->driver)-1);

          ^^^^^^^^^^
shouldn't this be info-version instead

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
