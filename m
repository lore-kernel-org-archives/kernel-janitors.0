From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 16 Nov 2004 12:15:11 +0000
Subject: Re: [KJ] [patch scsi/zalon 1] scsi/zalon: Added KERN macro to printk()
Message-Id: <20041116121511.GC1945@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78248930300376074=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1100563336.41994388ca77d@webmail.misk.net>
In-Reply-To: <1100563336.41994388ca77d@webmail.misk.net>
To: kernel-janitors@vger.kernel.org

--===============78248930300376074==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 16 Nov 2004, Andrew McGregor wrote:

> Hi,
> 
> I have added a KERN macro to a printk() function as requested in the Kernel
> Janitor's TODO list.
> 
> Signed-off-by: Andrew McGregor <am@misk.net>
> 
> --
> 
> --- drivers/scsi/zalon.c        Mon Nov 15 23:38:14 2004
> +++ /root/linux/janitor-linux-2.6.9/drivers/scsi/zalon.c        Mon Nov 15
please follow SubmittingPatches,
patches should apply with -p1.
> 23:38:01 2004
> @@ -109,7 +109,7 @@ zalon_probe(struct parisc_device *dev)
>         */
>         irq = gsc_alloc_irq(&gsc_irq);
> 
> -       printk("%s: Zalon vers field is 0x%x, IRQ %d\n", __FUNCTION__,
> +       printk(KERN_INFO "%s: Zalon vers field is 0x%x, IRQ %d\n", __FUNCTION__,
>                 zalon_vers, irq);
> 
>         __raw_writel(gsc_irq.txn_addr | gsc_irq.txn_data, dev->hpa +
> IO_MODULE_EIM);
> 
--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============78248930300376074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78248930300376074==--
