From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Apr 2020 09:30:30 +0000
Subject: Re: [PATCH] scsi: fnic: Use kmalloc instead of vmalloc for a small memory allocation
Message-Id: <20200424093030.GO2659@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: satishkh@cisco.com, sebaddel@cisco.com, kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 23, 2020 at 10:46:20PM +0200, Christophe JAILLET wrote:
> 'struct fc_trace_flag_type' is just a few bytes long. There is no need
> to allocate such a structure with vmalloc. Using kmalloc instead.
> 
> While at it, axe a useless test when freeing the memory.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/scsi/fnic/fnic_debugfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/fnic/fnic_debugfs.c b/drivers/scsi/fnic/fnic_debugfs.c
> index 13f7d88d6e57..8d6ce3470594 100644
> --- a/drivers/scsi/fnic/fnic_debugfs.c
> +++ b/drivers/scsi/fnic/fnic_debugfs.c
> @@ -58,8 +58,7 @@ int fnic_debugfs_init(void)
>  						fnic_trace_debugfs_root);
>  
>  	/* Allocate memory to structure */
> -	fc_trc_flag = (struct fc_trace_flag_type *)
> -		vmalloc(sizeof(struct fc_trace_flag_type));
> +	fc_trc_flag = kmalloc(sizeof(*fc_trc_flag), GFP_KERNEL);
>  
>  	if (fc_trc_flag) {

I hate success handling... This test should be reversed so that we do
error handling. It should return -ENOMEM instead of 0 on allocation
failure, otherwise it leads to a NULL dereference down the road.
Although, of course in current kernel small size allocations like this
never fail in real life.

The other thing I wonder is if we should just replace the vmalloc()
implementation with kvmalloc().  IOW rename vmalloc() to __vmalloc() and
"#define vmalloc kvmalloc" (not literally).  That was allocations of
less than a page would always be done with kmalloc().

regards,
dan carpenter
