From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 02 May 2012 20:08:13 +0000
Subject: Re: [PATCH 1/2] Staging: Comedi adv_pci1710 : Corrected over 80 column warnings
Message-Id: <20120502200813.GB26017@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975274-5933-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975274-5933-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 02, 2012 at 07:14:34PM +0300, Tomas Melin wrote:
> Various comments and code lines longer than 80 chars fixed in file adv_pci1710.c.
> 
> Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
> ---
>  drivers/staging/comedi/drivers/adv_pci1710.c |   27 ++++++++++++-------------
>  1 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
> index 8318c82..dd40fd3 100644
> --- a/drivers/staging/comedi/drivers/adv_pci1710.c
> +++ b/drivers/staging/comedi/drivers/adv_pci1710.c
> @@ -982,14 +982,13 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
>  #ifdef PCI171X_EXTDEBUG
>  		pci171x_cmdtest_out(1, cmd);
>  #endif
> -		DPRINTK
> -		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
> -		     err);
> +		DPRINTK(
> +		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
> +		err);

Ick, no, that's not ok.

It seems checkpatch doesn't realize this is a string, and should be ok.

If anything the line should look like:
		DPRINTK("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
			err);

Care to redo this?

thanks,

greg k-h
