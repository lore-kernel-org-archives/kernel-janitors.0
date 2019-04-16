From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 06:58:27 +0000
Subject: Re: [PATCH] crypto: caam: fix spelling mistake "cannote" -> "cannot"
Message-Id: <cd43bdfe-2748-ec47-3ceb-4da84f67cd89@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415124021.4659-1-colin.king@canonical.com>
In-Reply-To: <20190415124021.4659-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 6:10 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message in the qi_error_list
> array. Fix this.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/crypto/caam/error.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/caam/error.c b/drivers/crypto/caam/error.c
> index 21a70fd32f5d..a4129a35a330 100644
> --- a/drivers/crypto/caam/error.c
> +++ b/drivers/crypto/caam/error.c
> @@ -138,7 +138,7 @@ static const struct {
>   	{ 0x46, "Annotation length exceeds offset (reuse mode)"},
>   	{ 0x48, "Annotation output enabled but ASA limited by ASAR (reuse mode)"},
>   	{ 0x49, "Data offset correction exceeds input frame data length (reuse mode)"},
> -	{ 0x4B, "Annotation output enabled but ASA cannote be expanded (frame list)"},
> +	{ 0x4B, "Annotation output enabled but ASA cannot be expanded (frame list)"},
>   	{ 0x51, "Unsupported IF reuse mode"},
>   	{ 0x52, "Unsupported FL use mode"},
>   	{ 0x53, "Unsupported RJD use mode"},
