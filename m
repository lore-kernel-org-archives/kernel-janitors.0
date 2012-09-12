From: Daniel Cotey <puff65537@bansheeslibrary.com>
Date: Wed, 12 Sep 2012 18:31:14 +0000
Subject: Re: [patch] Staging: silicom: remove S_IWOTH from proc declaration
Message-Id: <20120913023411.GA1529@elbert.example.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912075733.GA26524@elgon.mountain>
In-Reply-To: <20120912075733.GA26524@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 10:57:33AM +0300, Dan Carpenter wrote:
> We don't need these to be world writable or group writable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is linux-next stuff.  The code in bp_proc.c is ifdefed out, and I
> wasn't able to compile it.
> 
> diff --git a/drivers/staging/silicom/bp_proc.c b/drivers/staging/silicom/bp_proc.c
> index 4fe862d..6ad4b27 100644
> --- a/drivers/staging/silicom/bp_proc.c
> +++ b/drivers/staging/silicom/bp_proc.c
> @@ -106,8 +106,7 @@ bypass_proc_create_entry_sd(struct pfs_unit *pfs_unit_curr,
>  	pfs_unit_curr->proc_entry = create_proc_entry(pfs_unit_curr->proc_name,
>  						      S_IFREG | S_IRUSR |
>  						      S_IWUSR | S_IRGRP |
> -						      S_IWGRP | S_IROTH |
> -						      S_IWOTH, parent_pfs);
> +						      S_IROTH, parent_pfs);
>  	if (pfs_unit_curr->proc_entry = 0) {
>  
>  		return -1;
> diff --git a/drivers/staging/silicom/bp_mod.c b/drivers/staging/silicom/bp_mod.c
> index 0d96196..6e999c7 100644
> --- a/drivers/staging/silicom/bp_mod.c
> +++ b/drivers/staging/silicom/bp_mod.c
> @@ -7724,8 +7724,7 @@ bypass_proc_create_entry_sd(struct pfs_unit_sd *pfs_unit_curr,
>  	pfs_unit_curr->proc_entry = create_proc_entry(pfs_unit_curr->proc_name,
>  						      S_IFREG | S_IRUSR |
>  						      S_IWUSR | S_IRGRP |
> -						      S_IWGRP | S_IROTH |
> -						      S_IWOTH, parent_pfs);
> +						      S_IROTH, parent_pfs);
>  	if (pfs_unit_curr->proc_entry = 0) {
>  
>  		return -1;

I need to check my test setup tonight, but I do think apps need group write.

Regards,
  Daniel Cotey

