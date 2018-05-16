From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 16 May 2018 10:12:58 +0000
Subject: Re: PATCH v2] PM / OPP: silence an uninitialized variable warning
Message-Id: <20180516100058.5c5ehayaa7m4urkm@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516095241.GA27540@mwanda>
In-Reply-To: <20180516095241.GA27540@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 16-05-18, 12:52, Dan Carpenter wrote:
> Smatch complains that it's possible we print "rate" in the debug output
> when it hasn't been initialized.  It should be zero on that path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix it a different way
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 7026e9f484ea..6d15f05bfc28 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -287,7 +287,7 @@ static int _opp_add_static_v2(struct opp_table *opp_table, struct device *dev,
>  			      struct device_node *np)
>  {
>  	struct dev_pm_opp *new_opp;
> -	u64 rate;
> +	u64 rate = 0;
>  	u32 val;
>  	int ret;
>  	bool rate_not_available = false;

Applied and added the Fixes tag as well.

-- 
viresh
