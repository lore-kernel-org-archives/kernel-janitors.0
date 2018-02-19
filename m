From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 19 Feb 2018 03:52:28 +0000
Subject: Re: [PATCH 1/3] pata_arasan_cf: Delete an error message for a failed memory allocation in arasan_cf_
Message-Id: <20180219034028.GH28462@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
 <05b48a33-81ae-b1b1-428c-4a9a0c9a4fe8@users.sourceforge.net>
In-Reply-To: <05b48a33-81ae-b1b1-428c-4a9a0c9a4fe8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 16-02-18, 16:57, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 16:01:12 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/ata/pata_arasan_cf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
> index b4d54771c9fe..be5fbcedecbf 100644
> --- a/drivers/ata/pata_arasan_cf.c
> +++ b/drivers/ata/pata_arasan_cf.c
> @@ -809,10 +809,8 @@ static int arasan_cf_probe(struct platform_device *pdev)
>  	}
>  
>  	acdev = devm_kzalloc(&pdev->dev, sizeof(*acdev), GFP_KERNEL);
> -	if (!acdev) {
> -		dev_warn(&pdev->dev, "kzalloc fail\n");
> +	if (!acdev)
>  		return -ENOMEM;
> -	}
>  
>  	if (pdata)
>  		quirk = pdata->quirk;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
