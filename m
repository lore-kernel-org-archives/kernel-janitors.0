From: Hannes Reinecke <hare@suse.de>
Date: Wed, 06 May 2020 12:27:58 +0000
Subject: Re: [PATCH] scsi: fnic: Use kmalloc instead of vmalloc for a small memory allocation
Message-Id: <9675b485-cc1e-d928-6888-00d1d666b599@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, satishkh@cisco.com, sebaddel@cisco.com, kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/23/20 10:46 PM, Christophe JAILLET wrote:
> 'struct fc_trace_flag_type' is just a few bytes long. There is no need
> to allocate such a structure with vmalloc. Using kmalloc instead.
> 
> While at it, axe a useless test when freeing the memory.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/scsi/fnic/fnic_debugfs.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/fnic/fnic_debugfs.c b/drivers/scsi/fnic/fnic_debugfs.c
> index 13f7d88d6e57..8d6ce3470594 100644
> --- a/drivers/scsi/fnic/fnic_debugfs.c
> +++ b/drivers/scsi/fnic/fnic_debugfs.c
> @@ -58,8 +58,7 @@ int fnic_debugfs_init(void)
>   						fnic_trace_debugfs_root);
>   
>   	/* Allocate memory to structure */
> -	fc_trc_flag = (struct fc_trace_flag_type *)
> -		vmalloc(sizeof(struct fc_trace_flag_type));
> +	fc_trc_flag = kmalloc(sizeof(*fc_trc_flag), GFP_KERNEL);
>   
>   	if (fc_trc_flag) {
>   		fc_trc_flag->fc_row_file = 0;
> @@ -87,8 +86,7 @@ void fnic_debugfs_terminate(void)
>   	debugfs_remove(fnic_trace_debugfs_root);
>   	fnic_trace_debugfs_root = NULL;
>   
> -	if (fc_trc_flag)
> -		vfree(fc_trc_flag);
> +	kfree(fc_trc_flag);
>   }
>   
>   /*
> 
Reviewed-by: Hannes Reinecke <har@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke            Teamlead Storage & Networking
hare@suse.de                               +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
