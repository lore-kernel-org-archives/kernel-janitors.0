From: Mukesh Ojha <mojha@codeaurora.org>
Date: Sun, 31 Mar 2019 09:35:02 +0000
Subject: Re: [PATCH] spi: oc-tiny: fix negative loop bound error on for loop
Message-Id: <2461a0c8-9d60-d8c3-3021-4a97d91f70ee@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330212300.11675-1-colin.king@canonical.com>
In-Reply-To: <20190330212300.11675-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 3/31/2019 2:53 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the for-loop using an unsigned int for the loop counter
> which is problematic when comparing it to the signed int
> gt->gpio_cs_count.  This is an issue because if the signed int is
> negative (for example, the call to of_gpio_count failed) then
> the negative loop bound is implicitly cast to an unsigned int on
> the comparison to loop counter i and will yield a very large value,
> eventually causing an array bounds overflow on hw->gpio_cs.
>
> Fix this by simply making the loop counter i a signed int;
>
> Fixes: ca632f556697 ("spi: reorganize drivers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/spi/spi-oc-tiny.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-oc-tiny.c b/drivers/spi/spi-oc-tiny.c
> index 085f580be7ec..81f74b938dc9 100644
> --- a/drivers/spi/spi-oc-tiny.c
> +++ b/drivers/spi/spi-oc-tiny.c
> @@ -206,7 +206,7 @@ static int tiny_spi_of_probe(struct platform_device *pdev)
>   {
>   	struct tiny_spi *hw = platform_get_drvdata(pdev);
>   	struct device_node *np = pdev->dev.of_node;
> -	unsigned int i;
> +	int i;


same here as well you are putting wrapper over a original issue by not 
checking the returned value.
Please fix that in both patches.



Thanks.
Mukesh

>   	u32 val;
>   
>   	if (!np)
