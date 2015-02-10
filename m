From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Feb 2015 10:13:12 +0000
Subject: Re: [PATCH v2 1/1] staging: ozwpan: Remove allocation from delaration line
Message-Id: <20150210101312.GG5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210092412.GA12753@sloth>
In-Reply-To: <20150210092412.GA12753@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Looks good.  Thanks!

> diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan/ozhcd.c
> index 8543bb2..96e95bf 100644
> --- a/drivers/staging/ozwpan/ozhcd.c
> +++ b/drivers/staging/ozwpan/ozhcd.c
> @@ -280,8 +280,9 @@ static void oz_free_urb_link(struct oz_urb_link *urbl)
>   */
>  static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
>  {
> -	struct oz_endpoint *ep > -		kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
> +	struct oz_endpoint *ep;
> +
> +	ep = kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
>  	if (ep) {

Also notice how in the original code, we had to mangle the code to make
it fit into 80 characters so the new code looks much better.

regards,
dan
carpenter

