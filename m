From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 28 Mar 2018 08:33:37 +0000
Subject: Re: [PATCH] staging: vt6655: check for memory allocation failures
Message-Id: <20180328083337.GA15316@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180328063144epcas1p305216b582520b884b09c93a7ad591660@epcas1p3.samsung.com>
 <1522218691-7917-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522218691-7917-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, baijiaju1990@gmail.com, forest@alittletooquiet.net, santhameena13@gmail.com

On Wed, Mar 28, 2018 at 03:31:31PM +0900, Ji-Hun Kim wrote:
> There are no null pointer checking on rd_info and td_info values which
> are allocated by kzalloc. It has potential null pointer dereferencing
> issues. Add return when allocation is failed.
> 
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
> ---
>  drivers/staging/vt6655/device_main.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index fbc4bc6..5d0ba94 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -539,7 +539,8 @@ static void device_init_rd0_ring(struct vnt_private *priv)
>  	     i ++, curr += sizeof(struct vnt_rx_desc)) {
>  		desc = &priv->aRD0Ring[i];
>  		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> -
> +		if (WARN_ON(!desc->rd_info))
> +			return;

Eeek, no, this crashes any machine that runs with "panic on warn".  You
don't crash if you can not allocate any memory, you recover and move on.
You don't even need to print anything out, as the call itself will do
that if this happens.

So this patch isn't ok at all, sorry.

greg k-h
