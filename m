From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 08 Apr 2010 14:30:04 +0000
Subject: Re: [patch] wd7000: typo spin_unlock_irq() => spin_lock_irq()
Message-Id: <alpine.LNX.2.00.1004081629350.8345@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100401155516.GF5265@bicker>
In-Reply-To: <20100401155516.GF5265@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Miroslav Zagorac <zaga@fly.cc.fer.hr>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Adam Buchbinder <adam.buchbinder@gmail.com>, jgarzik@pobox.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 1 Apr 2010, Dan Carpenter wrote:

> This was introduced back in 2005 at the very start of the git era by:
> 	df0ae2497ddefd72a87f3a3b34ff32455d7d4ae0
> 	[SCSI] allow sleeping in ->eh_host_reset_handler()
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Also this driver was written before some of our youngest kernel hackers
> were born.  Neat.  :)
> 
> diff --git a/drivers/scsi/wd7000.c b/drivers/scsi/wd7000.c
> index 2f6e9d8..bdfe59d 100644
> --- a/drivers/scsi/wd7000.c
> +++ b/drivers/scsi/wd7000.c
> @@ -1588,7 +1588,7 @@ static int wd7000_host_reset(struct scsi_cmnd *SCpnt)
>  {
>  	Adapter *host = (Adapter *) SCpnt->device->host->hostdata;
>  
> -	spin_unlock_irq(SCpnt->device->host->host_lock);
> +	spin_lock_irq(SCpnt->device->host->host_lock);
>  

Doesn't seem to be present in today's linux-next, so I have queued it in 
my tree so that it doesn't get lost.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
