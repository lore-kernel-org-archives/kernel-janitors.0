From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Apr 2017 19:15:50 +0000
Subject: Re: [PATCH] mmc: cavium: Fix a shift wrapping bug
Message-Id: <CAPDyKFqqK6kx1NzZyo_91OzH-ODxkD3z0UjeKijyh1DxOVbY_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413194748.GE591@mwanda>
In-Reply-To: <20170413194748.GE591@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Glauber <jglauber@cavium.com>, David Daney <david.daney@cavium.com>, "Steven J. Hill" <Steven.Hill@cavium.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 13 April 2017 at 21:47, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> "dat" is a u64 and "shift" starts as 54 so this is a shift wrapping bug.
>
> Fixes: 8047c753f3d3 ("mmc: cavium: Add core MMC driver for Cavium SOCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied for next!

Kind regards
Uffe

>
> diff --git a/drivers/mmc/host/cavium.c b/drivers/mmc/host/cavium.c
> index d842b6986189..54ff1363b564 100644
> --- a/drivers/mmc/host/cavium.c
> +++ b/drivers/mmc/host/cavium.c
> @@ -733,7 +733,7 @@ static void do_write_request(struct cvm_mmc_host *host, struct mmc_request *mrq)
>                 }
>
>                 while (smi->consumed < smi->length && shift >= 0) {
> -                       dat |= ((u8 *)smi->addr)[smi->consumed] << shift;
> +                       dat |= (u64)((u8 *)smi->addr)[smi->consumed] << shift;
>                         bytes_xfered++;
>                         smi->consumed++;
>                         shift -= 8;
