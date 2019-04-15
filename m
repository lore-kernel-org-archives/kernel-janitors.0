From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 15 Apr 2019 14:53:28 +0000
Subject: Re: [PATCH] wimax/i2400m: fix spelling mistake "accesibility" -> "accessibility"
Message-Id: <95c23c24-cb22-ab5f-52f8-a22a428c9a2f@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415101555.10584-1-colin.king@canonical.com>
In-Reply-To: <20190415101555.10584-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 3:45 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the I2400M_MS_ACCESSIBILITY_ERROR message
> string, fix this.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/net/wimax/i2400m/control.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wimax/i2400m/control.c b/drivers/net/wimax/i2400m/control.c
> index ef298d8525c5..6837fac3987b 100644
> --- a/drivers/net/wimax/i2400m/control.c
> +++ b/drivers/net/wimax/i2400m/control.c
> @@ -254,7 +254,7 @@ static const struct
>   	[I2400M_MS_ILLEGAL_VALUE] = { "illegal value", -EINVAL },
>   	[I2400M_MS_MISSING_PARAMS] = { "missing parameters", -ENOMSG },
>   	[I2400M_MS_VERSION_ERROR] = { "bad version", -EIO },
> -	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accesibility error", -EIO },
> +	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accessibility error", -EIO },
>   	[I2400M_MS_BUSY] = { "busy", -EBUSY },
>   	[I2400M_MS_CORRUPTED_TLV] = { "corrupted TLV", -EILSEQ },
>   	[I2400M_MS_UNINITIALIZED] = { "uninitialized", -EILSEQ },
