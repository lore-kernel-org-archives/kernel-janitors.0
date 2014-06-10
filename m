From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Date: Tue, 10 Jun 2014 07:56:15 +0000
Subject: Re: [patch] [media] davinci: vpfe: dm365: remove duplicate RSZ_LPF_INT_MASK
Message-Id: <CA+V-a8uqoA2pi45K6o3XXnyXL4MMU692uQjE_GdGE=Sfgzf2mg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609151046.GE9600@mwanda>
In-Reply-To: <20140609151046.GE9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Mon, Jun 9, 2014 at 4:10 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The RSZ_LPF_INT_MASK define is cut and pasted twice so we can remove the
> second instance.
>
Applied.

Regards,
--Prabhakar Lad

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
> index 010fdb2..81176fb 100644
> --- a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
> +++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
> @@ -479,7 +479,6 @@
>  #define RSZ_TYP_Y_SHIFT                        0
>  #define RSZ_TYP_C_SHIFT                        1
>  #define RSZ_LPF_INT_MASK               0x3f
> -#define RSZ_LPF_INT_MASK               0x3f
>  #define RSZ_LPF_INT_C_SHIFT            6
>  #define RSZ_H_PHS_MASK                 0x3fff
>  #define RSZ_H_DIF_MASK                 0x3fff
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
