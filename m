From: Julian Andres Klode <jak@jak-linux.org>
Date: Thu, 07 Nov 2013 11:10:14 +0000
Subject: Re: [patch] staging: nvec: potential NULL dereference on error path
Message-Id: <CAEA6rAzT2eZ-VGUP8gSjNbooKCdkxnixO-nEFA_hPcrUjWR4UQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075418.GL21844@elgon.mountain>
In-Reply-To: <20131107075418.GL21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-tegra@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, ac100@lists.launchpad.net

(Replying to all now)

On Thu, Nov 7, 2013 at 8:54 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We assume nvec->rx can be NULL earlier so I have added a check here as
> well.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 3066ee2..c64e069 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -681,7 +681,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>                         dev_err(nvec->dev,
>                                 "RX buffer overflow on %p: "
>                                 "Trying to write byte %u of %u\n",
> -                               nvec->rx, nvec->rx->pos, NVEC_MSG_SIZE);
> +                               nvec->rx, nvec->rx ? nvec->rx->pos : -1,
> +                               NVEC_MSG_SIZE);
>                 break;
>         default:
>                 nvec->state = 0;

In the TX case, we print 0 if nvec->tx is NULL, so using -1 if
nvec->rx is NULL would be inconsistent.

-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.
