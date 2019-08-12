From: Zhou Wang <wangzhou1@hisilicon.com>
Date: Mon, 12 Aug 2019 13:06:58 +0000
Subject: Re: [PATCH][crypto-next] crypto: hisilicon: fix spelling mistake "HZIP_COMSUMED_BYTE" -> "HZIP_CONSU
Message-Id: <5D516472.4000905@hisilicon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190812111525.574-1-colin.king@canonical.com>
In-Reply-To: <20190812111525.574-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.or
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019/8/12 19:15, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the hzip_dfx_regs array, fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/hisilicon/zip/zip_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/hisilicon/zip/zip_main.c b/drivers/crypto/hisilicon/zip/zip_main.c
> index 6e0ca75585d4..00ecae387fdd 100644
> --- a/drivers/crypto/hisilicon/zip/zip_main.c
> +++ b/drivers/crypto/hisilicon/zip/zip_main.c
> @@ -206,7 +206,7 @@ static struct debugfs_reg32 hzip_dfx_regs[] = {
>  	{"HZIP_AVG_DELAY                 ",  0x28ull},
>  	{"HZIP_MEM_VISIBLE_DATA          ",  0x30ull},
>  	{"HZIP_MEM_VISIBLE_ADDR          ",  0x34ull},
> -	{"HZIP_COMSUMED_BYTE             ",  0x38ull},
> +	{"HZIP_CONSUMED_BYTE             ",  0x38ull},

Yes, thanks.

Zhou

>  	{"HZIP_PRODUCED_BYTE             ",  0x40ull},
>  	{"HZIP_COMP_INF                  ",  0x70ull},
>  	{"HZIP_PRE_OUT                   ",  0x78ull},
> 
