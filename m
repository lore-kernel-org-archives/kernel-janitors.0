From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 11 Sep 2017 00:43:05 +0000
Subject: Re: [PATCH] extcon: make extcon_info static const, fixes warning
Message-Id: <59B5DC19.4020805@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20170909165107epcas3p169935c5e37c5b21a9ffecf4cf01d5256@epcas3p1.samsung.com>
        <20170909165100.30701-1-colin.king@canonical.com>
In-Reply-To: <20170909165100.30701-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2017년 09월 10일 01:51, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array extcon_info is read only, local to the source and does not
> need to be in global scope, so make it static const.
> 
> Cleans up sparse warning:
> symbol 'extcon_info' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/extcon/extcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
> index 35e9fb885486..cb38c2747684 100644
> --- a/drivers/extcon/extcon.c
> +++ b/drivers/extcon/extcon.c
> @@ -36,7 +36,7 @@
>  
>  #define SUPPORTED_CABLE_MAX	32
>  
> -struct __extcon_info {
> +static const struct __extcon_info {
>  	unsigned int type;
>  	unsigned int id;
>  	const char *name;
> 

Applied it for v4.15. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
