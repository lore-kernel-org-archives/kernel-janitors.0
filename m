From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2019 14:51:17 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix potential infinite loop because loop counter being too small
Message-Id: <20191101145117.GB10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101142604.17610-1-colin.king@canonical.com>
In-Reply-To: <20191101142604.17610-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 01, 2019 at 02:26:04PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the for-loop counter i is a u8 however it is being checked
> against a maximum value priv->ieee80211->LinkDetectInfo.SlotNum which is a
> u16. Hence there is a potential wrap-around of counter i back to zero if
> priv->ieee80211->LinkDetectInfo.SlotNum is greater than 255.  Fix this by
> making i a u16.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 48f1591ed5b4..fd91b7c5ca81 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -3210,7 +3210,7 @@ static void rtl819x_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
>  			     u32 *TotalRxDataNum)
>  {
>  	u16			SlotIndex;
> -	u8			i;
> +	u16			i;

The iterator "i" should just be an int unless we know that it needs to
be an unsigned long long.

regards,
dan carpenter
