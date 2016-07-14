From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 14 Jul 2016 11:40:02 +0000
Subject: Re: [patch] ide: missing break statement in set_timings_mdma()
Message-Id: <1468496402.20552.107.camel@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714104802.GI18175@mwanda>
In-Reply-To: <20160714104802.GI18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, 2016-07-14 at 13:48 +0300, Dan Carpenter wrote:
> There was clearly supposed to be a break statement here.  Currently we
> use the k2 ata timings instead of sh ata ones we intended.  Probably no
> one has this hardware anymore so it likely doesn't make a difference
> beyond the static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Should probably also:

CC: stable@vger.kernel.org

> diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
> index 7f0434f..0c5d3a9 100644
> --- a/drivers/ide/pmac.c
> +++ b/drivers/ide/pmac.c
> @@ -707,6 +707,7 @@ set_timings_mdma(ide_drive_t *drive, int intf_type, u32 *timings, u32 *timings2,
>  		*timings = ((*timings) & ~TR_133_PIOREG_MDMA_MASK) | tr;
>  		*timings2 = (*timings2) & ~TR_133_UDMAREG_UDMA_EN;
>  		}
> +		break;
>  	case controller_un_ata6:
>  	case controller_k2_ata6: {
>  		/* 100Mhz cell */
