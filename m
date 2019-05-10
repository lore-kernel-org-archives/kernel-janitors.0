From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 10 May 2019 09:14:31 +0000
Subject: Re: [PATCH] reset: fix potential null pointer dereference on pointer dev
Message-Id: <1557479671.7859.2.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190509160036.19433-1-colin.king@canonical.com>
In-Reply-To: <20190509160036.19433-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Colin,

[added Bartosz to Cc:]

On Thu, 2019-05-09 at 17:00 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer dev is being dereferenced when passed to the inlined
> functon dev_name, however, dev is later being null checked.
> Thus there is a potential null pointer dereference on a null
> dev. Fix this by performing the null check on dev before
> dereferencing it.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 6691dffab0ab ("reset: add support for non-DT systems")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/reset/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 81ea77cba123..83f1a1d5ee67 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -691,12 +691,13 @@ __reset_control_get_from_lookup(struct device *dev, const char *con_id,
>  {
>  	const struct reset_control_lookup *lookup;
>  	struct reset_controller_dev *rcdev;
> -	const char *dev_id = dev_name(dev);
> +	const char *dev_id;
>  	struct reset_control *rstc = NULL;
>  
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);

Thank you for the patch. I think this check should be removed instead,
though, as __reset_control_get_from_lookup is only ever called from
__reset_control_get, right after checking dev->of_node. So dev can not
be NULL here.

regards
Philipp
