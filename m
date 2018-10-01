From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 01 Oct 2018 09:43:46 +0000
Subject: Re: [PATCH -next] PM / OPP: Make function _add_opp_dev_unlocked() static
Message-Id: <20181001093146.s3hkigpohpdt34p6@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 25-09-18, 14:39, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/opp/core.c:762:19: warning:
>  symbol '_add_opp_dev_unlocked' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/opp/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index aaef20c..cdf918a 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -759,8 +759,8 @@ static void _remove_opp_dev(struct opp_device *opp_dev,
>  	kfree(opp_dev);
>  }
>  
> -struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> -					 struct opp_table *opp_table)
> +static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> +						struct opp_table *opp_table)
>  {
>  	struct opp_device *opp_dev;
>  	int ret;

Merged this into the original commit where the warning was introduced. Thanks.

-- 
viresh
