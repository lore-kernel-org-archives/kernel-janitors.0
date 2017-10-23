From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Mon, 23 Oct 2017 13:44:01 +0000
Subject: Re: [PATCH 2/2] xen-tpmfront: Combine two condition checks into one statement in vtpm_send()
Message-Id: <20171023134401.n5mx6f6gjfhxtnxu@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf592c7d-8fbc-833b-fa1a-ff9e91c3734c@users.sourceforge.net>
 <f1d76752-d5b4-649d-b11d-63348d439505@users.sourceforge.net>
In-Reply-To: <f1d76752-d5b4-649d-b11d-63348d439505@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-integrity@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Oct 22, 2017 at 01:30:46PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 13:15:16 +0200
> 
> A return was performed with the same error code after two condition checks.
> Thus use a single statement instead.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/char/tpm/xen-tpmfront.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
> index 873a5631937a..0d02743e7a87 100644
> --- a/drivers/char/tpm/xen-tpmfront.c
> +++ b/drivers/char/tpm/xen-tpmfront.c
> @@ -82,10 +82,7 @@ static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
>  	u32 ordinal;
>  	unsigned long duration;
>  
> -	if (offset > PAGE_SIZE)
> -		return -EINVAL;
> -
> -	if (offset + count > PAGE_SIZE)
> +	if (offset > PAGE_SIZE || offset + count > PAGE_SIZE)
>  		return -EINVAL;
>  
>  	/* Wait for completion of any existing command or cancellation */
> -- 
> 2.14.2
> 

This is fine.

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
