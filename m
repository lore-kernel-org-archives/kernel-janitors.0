From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Tue, 18 Aug 2015 09:58:46 +0000
Subject: Re: [patch] cxlflash: shift wrapping bug in afu_link_reset()
Message-Id: <mqdsi7g3okp.fsf@c203.arch.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150818085743.GA3965@mwanda>
In-Reply-To: <20150818085743.GA3965@mwanda> (Dan Carpenter's message of "Tue,
	18 Aug 2015 11:57:43 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>, "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> "port_sel" is a u64 so the shifting should also be a 64 bit shift.
>
> Fixes: c21e0bbfc485 ('cxlflash: Base support for IBM CXL Flash Adapter')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
> index 0720d2f..f97421d 100644
> --- a/drivers/scsi/cxlflash/main.c
> +++ b/drivers/scsi/cxlflash/main.c
> @@ -1179,7 +1179,7 @@ static void afu_link_reset(struct afu *afu, int port, u64 *fc_regs)
>  
>  	/* first switch the AFU to the other links, if any */
>  	port_sel = readq_be(&afu->afu_map->global.regs.afu_port_sel);
> -	port_sel &= ~(1 << port);
> +	port_sel &= ~(1ULL << port);
>  	writeq_be(port_sel, &afu->afu_map->global.regs.afu_port_sel);
>  	cxlflash_afu_sync(afu, 0, 0, AFU_GSYNC);
>  
> @@ -1196,7 +1196,7 @@ static void afu_link_reset(struct afu *afu, int port, u64 *fc_regs)
>  		       __func__, port);
>  
>  	/* switch back to include this port */
> -	port_sel |= (1 << port);
> +	port_sel |= (1ULL << port);
>  	writeq_be(port_sel, &afu->afu_map->global.regs.afu_port_sel);
>  	cxlflash_afu_sync(afu, 0, 0, AFU_GSYNC);
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>

-- 
Johannes Thumshirn                                           Storage
jthumshirn@suse.de                                 +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600  D0D0 0393 969D 2D76 0850
