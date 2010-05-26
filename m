From: Jean Delvare <khali@linux-fr.org>
Date: Wed, 26 May 2010 12:43:43 +0000
Subject: Re: [patch v3 2/2] video/saa7134: remove duplicate break
Message-Id: <20100526144343.0c2369da@hyperion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525092149.GA13089@bicker>
In-Reply-To: <20100525092149.GA13089@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, hermann pitton <hermann-pitton@arcor.de>, Douglas Schilling Landgraf <dougsland@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 25 May 2010 11:21:50 +0200, Dan Carpenter wrote:
> The original code had two break statements in a row.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Jean Delvare <khali@linux-fr.org>

> ---
> v3: Put this in a seperate patch.
> 
> diff --git a/drivers/media/video/saa7134/saa7134-input.c b/drivers/media/video/saa7134/saa7134-input.c
> index e5565e2..7691bf2 100644
> --- a/drivers/media/video/saa7134/saa7134-input.c
> +++ b/drivers/media/video/saa7134/saa7134-input.c
> @@ -815,7 +815,6 @@ int saa7134_input_init1(struct saa7134_dev *dev)
>  		mask_keyup   = 0x020000;
>  		polling      = 50; /* ms */
>  		break;
> -	break;
>  	}
>  	if (NULL = ir_codes) {
>  		printk("%s: Oops: IR config error [card=%d]\n",
> 


-- 
Jean Delvare
