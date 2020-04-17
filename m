From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Fri, 17 Apr 2020 02:56:11 +0000
Subject: Re: [PATCH] extcon: remove redundant assignment to variable idx
Message-Id: <f88c8ae7-a9bc-1bc2-9c21-d8395fa33409@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200415230903epcas1p2bc2dd8edb6ca123086f44cb158406439@epcas1p2.samsung.com>
        <20200415230821.1567410-1-colin.king@canonical.com>
In-Reply-To: <20200415230821.1567410-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/16/20 8:08 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable idx is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/extcon/extcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
> index 2dfbfec572f9..0a6438cbb3f3 100644
> --- a/drivers/extcon/extcon.c
> +++ b/drivers/extcon/extcon.c
> @@ -900,7 +900,7 @@ int extcon_register_notifier(struct extcon_dev *edev, unsigned int id,
>  			     struct notifier_block *nb)
>  {
>  	unsigned long flags;
> -	int ret, idx = -EINVAL;
> +	int ret, idx;
>  
>  	if (!edev || !nb)
>  		return -EINVAL;
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
