From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Fri, 03 Jul 2015 09:06:32 +0000
Subject: Re: [patch] mptfusion: prevent some memory corruption
Message-Id: <mqdbnft7gpz.fsf@c203.arch.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150703085303.GA11901@mwanda>
In-Reply-To: <20150703085303.GA11901@mwanda> (Dan Carpenter's message of "Fri,
	3 Jul 2015 11:53:03 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> These are signed values the come from the user, we put a cap on the
> upper bounds but not on the lower bounds.
>
> We use "karg.dataSgeOffset" to calculate "sz".  We verify "sz" and
> proceed as if that means that "karg.dataSgeOffset" is correct but this
> fails to consider that the "sz" calculations can have integer overflows.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> During my QC process, I realized that I sent a similar patch last year,
> but never received a response.
>
> http://permalink.gmane.org/gmane.linux.kernel.janitors/32590
>
> Looking at both of them, I guess I prefer today's patch because it is
> simpler.
>
> diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mptctl.c
> index 70bb753..fc73937 100644
> --- a/drivers/message/fusion/mptctl.c
> +++ b/drivers/message/fusion/mptctl.c
> @@ -1859,6 +1859,15 @@ mptctl_do_mpt_command (struct mpt_ioctl_command karg, void __user *mfPtr)
>  	}
>  	spin_unlock_irqrestore(&ioc->taskmgmt_lock, flags);
>  
> +	/* Basic sanity checks to prevent underflows or integer overflows */
> +	if (karg.maxReplyBytes < 0 ||
> +	    karg.dataInSize < 0 ||
> +	    karg.dataOutSize < 0 ||
> +	    karg.dataSgeOffset < 0 ||
> +	    karg.maxSenseBytes < 0 ||
> +	    karg.dataSgeOffset > ioc->req_sz / 4)
> +		return -EINVAL;
> +
>  	/* Verify that the final request frame will not be too large.
>  	 */
>  	sz = karg.dataSgeOffset * 4;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Acked-by: Johannes Thumshirn <jthumshirn@suse.de>

-- 
Johannes Thumshirn                                       Storage
jthumshirn@suse.de                             +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: F. Imendörffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG Nürnberg)
