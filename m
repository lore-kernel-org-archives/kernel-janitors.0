From: Borislav Petkov <bp@alien8.de>
Date: Thu, 21 Jan 2016 12:32:05 +0000
Subject: Re: [patch] amd64_edac: shift wrapping issue in f1x_get_norm_dct_addr()
Message-Id: <20160121123205.GE21930@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160120095451.GB19898@mwanda>
In-Reply-To: <20160120095451.GB19898@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Aravind Gopalakrishnan <aravind.gopalakrishnan@amd.com>
Cc: Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 20, 2016 at 12:54:51PM +0300, Dan Carpenter wrote:
> dct_sel_base_off is declared as a u64 but we're only using the lower 32
> bits because of a shift wrapping bug.
> 
> Fixes: c8e518d5673d ('amd64_edac: Sanitize f10_get_base_addr_offset')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  Not tested.
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 9eee13e..d87a475 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -1452,7 +1452,7 @@ static u64 f1x_get_norm_dct_addr(struct amd64_pvt *pvt, u8 range,
>  	u64 chan_off;
>  	u64 dram_base		= get_dram_base(pvt, range);
>  	u64 hole_off		= f10_dhar_offset(pvt);
> -	u64 dct_sel_base_off	= (pvt->dct_sel_hi & 0xFFFFFC00) << 16;
> +	u64 dct_sel_base_off	= (u64)(pvt->dct_sel_hi & 0xFFFFFC00) << 16;

Good catch.

So this could possibly give us the wrong channel address and thus not
find the CS row. Hmm, so on my boxes, DctSelBaseOffset[47:26] is not big
enough so that its high 16-bits are 0 and truncation doesn't hurt there.

@Aravind: do you have a box with

setpci -s 18.2 0x114.l

bits [31:16] not 0?

If so, you might want to run with and without this fix above as it
should fix system address to CS row mapping.

Anyway, applied and tagged for stable.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
