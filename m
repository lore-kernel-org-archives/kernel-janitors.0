From: Borislav Petkov <bp@alien8.de>
Date: Tue, 09 Jan 2018 19:19:29 +0000
Subject: Re: [PATCH] EDAC, mv64x60: Fix an error handling path
Message-Id: <20180109191929.bojygwazpcib37d3@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180107205400.14068-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180107205400.14068-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jan 07, 2018 at 09:54:00PM +0100, Christophe JAILLET wrote:
> We should not call 'edac_mc_del_mc()' if a corresponding call to
> 'edac_mc_add_mc()' has not been performed yet.
> 
> So here, we should go to err instead of err2 to branch at the right place
> of the error handling path.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/edac/mv64x60_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
> index ec5d695bbb72..3c68bb525d5d 100644
> --- a/drivers/edac/mv64x60_edac.c
> +++ b/drivers/edac/mv64x60_edac.c
> @@ -758,7 +758,7 @@ static int mv64x60_mc_err_probe(struct platform_device *pdev)
>  		/* Non-ECC RAM? */
>  		printk(KERN_WARNING "%s: No ECC DIMMs discovered\n", __func__);
>  		res = -ENODEV;
> -		goto err2;
> +		goto err;
>  	}
>  
>  	edac_dbg(3, "init mci\n");
> -- 

Applied, thanks.

Btw, while at it, please fix that too:

714         mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
715                             sizeof(struct mv64x60_mc_pdata));
716         if (!mci) {
717                 printk(KERN_ERR "%s: No memory for CPU err\n", __func__);
718                 devres_release_group(&pdev->dev, mv64x60_mc_err_probe);
719                 return -ENOMEM;
720         }

That devres_release_group() happens here and at the function end, at the
"err:" label. So make that above jump to a rls_grp: or so label which
does devres_release_group().

Also the order is wrong - on entry we do:

devres_open_group
edac_mc_alloc

and on exit, the order should be reverse:

edac_mc_free
devres_release_group

and not what we do now:

819 err:
820         devres_release_group(&pdev->dev, mv64x60_mc_err_probe);
821         edac_mc_free(mci);
822         return res;

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
