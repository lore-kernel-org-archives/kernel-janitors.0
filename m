From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 08:38:52 +0000
Subject: Re: [PATCH 2/3] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <20120504083852.GA22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336056521-4589-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1336056521-4589-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 03, 2012 at 05:48:41PM +0300, Tomas Melin wrote:
> Code indentation fixes, corrected comments.
> 
> Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
> ---
>  drivers/staging/comedi/drivers/adv_pci1710.c |   52 +++++++++++++-------------
>  1 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
> index 2048b19..a4c7dbb 100644
> --- a/drivers/staging/comedi/drivers/adv_pci1710.c
> +++ b/drivers/staging/comedi/drivers/adv_pci1710.c
> @@ -1163,43 +1163,43 @@ static int check_channel_list(struct comedi_device *dev,
>  	if (n_chan = 1)
>  		return 1; /* seglen=1 */
>  
> -	chansegment[0] = chanlist[0];	/*  first channel is every time ok */
> -	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {	/*  build part of chanlist */
> -		/*  printk("%d. %d %d\n",i,CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
> +	/* n_chan must be >1
           ^^^^^^^^^^^^^^^^^
This kind of comment is just repeated what was already obvious from
the previous few lines of code.  Just remove it.

> +	 * first channel is every time ok
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is a good comment because it tells us some assumptions we might
not have known.

> +	 * build part of chanlist
           ^^^^^^^^^^^^^^^^^^^^^^
This is not really a helpful comment.  It tells what the code does
which is already pretty obvious.  It's not really needed.

> +	 */
> +	chansegment[0] = chanlist[0];
> +	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
>  		if (chanlist[0] = chanlist[i])
> -			break;	/*  we detect loop, this must by finish */
> -		if (CR_CHAN(chanlist[i]) & 1)	/*  odd channel cann't by differencial */
> +			break; /* detected loop, done */
> +		if (CR_CHAN(chanlist[i]) & 1)
>  			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
>  				comedi_error(dev,
> -					     "Odd channel can't be differential input!\n");
> +				"Odd channel can't be differential input!\n");

Don't indent like this.  The original was better even though
checkpatch.pl complains.

regards,
dan carpenter


