From: walter harms <wharms@bfs.de>
Date: Sun, 26 Feb 2017 09:03:06 +0000
Subject: Re: [PATCH] drm/msm/dsi: Fix the releasing of resources in error path in 'dsi_bus_clk_enable()'
Message-Id: <58B299CA.4060203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170226075206.25762-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170226075206.25762-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, yongjun_wei@trendmicro.com.cn, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org



Am 26.02.2017 08:52, schrieb Christophe JAILLET:
> If a 'clk_prepare_enable()' fails, then we need to disable_unprepare the
> clk already handled.
> 
> With the current implemenatation, we try to do that on the clk that has
> triggered the error, which is a no-op, and leave 'msm_host->bus_clks[0]'
> untouched.
> 
> Shift by one the index array to free resources correctly.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1fc07ce24686..eac4987f3946 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -438,7 +438,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>  	return 0;
>  err:
>  	for (; i > 0; i--)
> -		clk_disable_unprepare(msm_host->bus_clks[i]);
> +		clk_disable_unprepare(msm_host->bus_clks[i-1]);
>  
>  	return ret;
>  }

i guess it is technical correct but programmes are
very bad at counting backwards so its more future proof to
do something like:

for (j=0;j<i;j++)
	clk_disable_unprepare(msm_host->bus_clks[j]);

re,
 wh




