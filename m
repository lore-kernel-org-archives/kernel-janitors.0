From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 21:48:05 +0000
Subject: Re: [KJ] [Patch] BUG_ON() Conversion in drivers/scsi
Message-Id: <20060220214805.GF29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6331946501879242=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============6331946501879242==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2006 at 06:25:40PM +0100, Eric Sesterhenn wrote:
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner, contains unlikely() and can better optimized away.

Applied.

> --- linux-2.6.16-rc2-git2/drivers/scsi/ibmmca.c.orig
> +++ linux-2.6.16-rc2-git2/drivers/scsi/ibmmca.c
> @@ -2243,8 +2243,7 @@ static int __ibmmca_host_reset(Scsi_Cmnd
>  	int host_index;
>  	unsigned long imm_command;
>
> -	if (cmd == NULL)
> -		BUG();
> +	BUG_ON(cmd == NULL);
>
>  	ticks = IM_RESET_DELAY * HZ;
>  	shpnt = cmd->device->host;

This one can be removed.

> --- linux-2.6.16-rc2-git2/drivers/scsi/aacraid/aachba.c.orig
> +++ linux-2.6.16-rc2-git2/drivers/scsi/aacraid/aachba.c
> @@ -388,8 +388,7 @@ static void get_container_name_callback(
>  	scsicmd = (struct scsi_cmnd *) context;
>
>  	dprintk((KERN_DEBUG "get_container_name_callback[cpu %d]: t = %ld.\n", smp_processor_id(), jiffies));
> -	if (fibptr == NULL)
> -		BUG();
> +	BUG_ON(fibptr == NULL);
>
>  	get_name_reply = (struct aac_get_name_resp *) fib_data(fibptr);

> @@ -945,8 +944,7 @@ static void io_callback(void *context, s
>  		  smp_processor_id(), (unsigned long long)lba, jiffies);
>  	}
>
> -	if (fibptr == NULL)
> -		BUG();
> +	BUG_ON(fibptr == NULL);
>
>  	if(scsicmd->use_sg)
>  		pci_unmap_sg(dev->pdev,
> @@ -1891,8 +1887,7 @@ static void aac_srb_callback(void *conte
>  	scsicmd = (struct scsi_cmnd *) context;
>  	dev = (struct aac_dev *)scsicmd->device->host->hostdata;
>
> -	if (fibptr == NULL)
> -		BUG();
> +	BUG_ON(fibptr == NULL);
>
>  	srbreply = (struct aac_srb_reply *) fib_data(fibptr);

Almost certainly these too. Haven't checked deeply.



--===============6331946501879242==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6331946501879242==--
