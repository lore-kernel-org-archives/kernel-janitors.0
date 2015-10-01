From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Oct 2015 15:13:31 +0000
Subject: Re: [patch] mfd: 64 bit bug in bxtwc_val_store()
Message-Id: <20151001151330.GF7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150928095636.GB11367@mwanda>
In-Reply-To: <20150928095636.GB11367@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 01, 2015 at 12:51:00PM +0100, Lee Jones wrote:
> I will fix the subject line for this patch, but in future please use
> the format akin to the individual subsystem.
> 
> In the MFD case this is:
> 
>   mfd: <device>: <Summary starting with an uppercase character>
> 

I looked at the subjects to every other patch to that file and I
followed the same pattern.

$ git log --oneline drivers/mfd/intel_soc_pmic_bxtwc.c
b412836 mfd: add Intel Broxton Whiskey Cove PMIC driver
$

regards,
dan carpenter

