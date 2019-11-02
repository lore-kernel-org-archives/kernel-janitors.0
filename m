From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 02 Nov 2019 10:30:45 +0000
Subject: Re: [PATCH] staging: wfx: Fix a memory leak in 'wfx_upload_beacon'
Message-Id: <20191102103045.GA135025@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101172151.14295-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191101172151.14295-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 01, 2019 at 06:21:51PM +0100, Christophe JAILLET wrote:
> The current code is a no-op, because all it can do is 'dev_kfree_skb(NULL)'
> Revert the test to free skb, if not NULL.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is purely speculative.
> 
> The 'if  (...)' could also be removed completely if we refactor the code
> and return directly at the beginning of the function.
> Or the 'return -ENOMEM' should be 'err = -ENOMEM; goto done;' in order to
> avoid a mixup of goto and direct return.
> ---
>  drivers/staging/wfx/sta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
> index 688586e823c0..e14da8dce388 100644
> --- a/drivers/staging/wfx/sta.c
> +++ b/drivers/staging/wfx/sta.c
> @@ -906,7 +906,7 @@ static int wfx_upload_beacon(struct wfx_vif *wvif)
>  	wfx_fwd_probe_req(wvif, false);
>  
>  done:
> -	if (!skb)
> +	if (skb)
>  		dev_kfree_skb(skb);

Just remove the "if" check entirely, as dev_kfree_skb() can handle NULL
being passed to it.

thanks,

greg k-h
