From: walter harms <wharms@bfs.de>
Date: Fri, 23 Jun 2006 14:44:30 +0000
Subject: Re: [KJ] megaraid patches ?
Message-Id: <449BFE4E.1080404@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4491546E.8030903@bfs.de>
In-Reply-To: <4491546E.8030903@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

oh no problem, my main purpose was to fix a driver that was broken with
undef proc_fs.

just one point:

+			char	buf[12] = { 0 };
+			sprintf(buf, "hba%d", adapter->host->host_no);

	char buf[12];
	snprintf(buf,sizeof buf, "hba%d",adapter->host->host_no);
to prevent a buffer overflow if host_no contains bogus numbers


Alexey Dobriyan wrote:
> On Thu, Jun 15, 2006 at 02:37:02PM +0200, walter harms wrote:
>> some time ago i submitted some megaraid patches.
>> i did not get any response.
>>
>> no missing spaces ? some one ?
> 
> megaraid vs /proc ? I recall bloated empty functions ;-). Also see, IMO,
> cleaner solution to unused-identifier-two-screen-above problem.
> 
> 	void f(void)
> 	{
> 	}
> 
> is enough because, according to C grammar,
> 
> function_definition
> 	:	declaration_specifiers declarator compound_statement
> =>	|	declaration_specifiers declarator declaration_list compound_statement
> 	;
> 
> compound_statement
> =>	:	'{' '}'
> 	|	'{' block_item_list '}'
> 	;
> 
> Below is _the_ patch I'm going to send.
> 
> [PATCH] megaraid: fix warnings when CONFIG_PROC_FS=n
> 
> From: walter harms <wharms@bfs.de>
> 
> Signed-off-by: walter harms <wharms@bfs.de>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  drivers/scsi/megaraid.c |   19 ++++++++++++++-----
>  drivers/scsi/megaraid.h |    5 +++--
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> --- linux-vanilla/drivers/scsi/megaraid.c
> +++ linux-wh/drivers/scsi/megaraid.c
> @@ -3181,6 +3181,13 @@ proc_rdrv(adapter_t *adapter, char *page
>  	return len;
>  }
>  
> +#else
> +
> +static void
> +mega_create_proc_entry(int index, struct proc_dir_entry *parent)
> +{
> +}
> +
>  #endif
>  
>  
> @@ -4344,7 +4351,7 @@ mega_support_cluster(adapter_t *adapter)
>  	return 0;
>  }
>  
> -
> +#ifdef CONFIG_PROC_FS
>  /**
>   * mega_adapinq()
>   * @adapter - pointer to our soft state
> @@ -4449,7 +4456,7 @@ mega_internal_dev_inquiry(adapter_t *ada
>  
>  	return rval;
>  }
> -
> +#endif
>  
>  /**
>   * mega_internal_command()
> @@ -4965,7 +4972,6 @@ megaraid_remove_one(struct pci_dev *pdev
>  {
>  	struct Scsi_Host *host = pci_get_drvdata(pdev);
>  	adapter_t *adapter = (adapter_t *)host->hostdata;
> -	char	buf[12] = { 0 };
>  
>  	scsi_remove_host(host);
>  
> @@ -5011,8 +5017,11 @@ megaraid_remove_one(struct pci_dev *pdev
>  		remove_proc_entry("raiddrives-30-39",
>  				adapter->controller_proc_dir_entry);
>  #endif
> -		sprintf(buf, "hba%d", adapter->host->host_no);
> -		remove_proc_entry(buf, mega_proc_dir_entry);
> +		{
> +			char	buf[12] = { 0 };
> +			sprintf(buf, "hba%d", adapter->host->host_no);
> +			remove_proc_entry(buf, mega_proc_dir_entry);
> +		}
>  	}
>  #endif
>  
> --- linux-vanilla/drivers/scsi/megaraid.h	2006-06-23 16:00:06.000000000 +0400
> +++ linux-wh/drivers/scsi/megaraid.h	2006-06-23 17:20:07.000000000 +0400
> @@ -1001,7 +1001,6 @@ static int megaraid_reset(Scsi_Cmnd *);
>  static int megaraid_abort_and_reset(adapter_t *, Scsi_Cmnd *, int);
>  static int megaraid_biosparam(struct scsi_device *, struct block_device *,
>  		sector_t, int []);
> -static int mega_print_inquiry(char *, char *);
>  
>  static int mega_build_sglist (adapter_t *adapter, scb_t *scb,
>  			      u32 *buffer, u32 *length);
> @@ -1023,6 +1022,8 @@ static int mega_init_scb (adapter_t *);
>  static int mega_is_bios_enabled (adapter_t *);
>  
>  #ifdef CONFIG_PROC_FS
> +static int mega_print_inquiry(char *, char *);
> +
>  static void mega_create_proc_entry(int, struct proc_dir_entry *);
>  static int proc_read_config(char *, char **, off_t, int, int *, void *);
>  static int proc_read_stat(char *, char **, off_t, int, int *, void *);
> @@ -1039,10 +1040,10 @@ static int proc_rdrv_20(char *, char **,
>  static int proc_rdrv_30(char *, char **, off_t, int, int *, void *);
>  static int proc_rdrv_40(char *, char **, off_t, int, int *, void *);
>  static int proc_rdrv(adapter_t *, char *, int, int);
> -#endif
>  
>  static int mega_adapinq(adapter_t *, dma_addr_t);
>  static int mega_internal_dev_inquiry(adapter_t *, u8, u8, dma_addr_t);
> +#endif
>  
>  static int mega_support_ext_cdb(adapter_t *);
>  static mega_passthru* mega_prepare_passthru(adapter_t *, scb_t *,
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
