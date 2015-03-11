From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 11 Mar 2015 17:43:30 +0000
Subject: Re: [patch] Input: sx8654 - signedness bug in sx8654_irq()
Message-Id: <20150311174330.GC3640@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311093707.GC3564@mwanda>
In-Reply-To: <20150311093707.GC3564@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015 at 12:37:07PM +0300, Dan Carpenter wrote:
> "irqsrc" needs to be signed for the error handling to work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Applied, thank you.

> diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
> index 8e531ac..aecb9ad 100644
> --- a/drivers/input/touchscreen/sx8654.c
> +++ b/drivers/input/touchscreen/sx8654.c
> @@ -79,7 +79,7 @@ struct sx8654 {
>  static irqreturn_t sx8654_irq(int irq, void *handle)
>  {
>  	struct sx8654 *sx8654 = handle;
> -	u8 irqsrc;
> +	int irqsrc;
>  	u8 data[4];
>  	unsigned int x, y;
>  	int retval;

-- 
Dmitry
