From: Felipe W Damasio <felipewd@terra.com.br>
Date: Mon, 26 Jan 2004 16:06:07 +0000
Subject: Re: [Kernel-janitors] [PATCH] Fix warning in drivers/ide/pci/triflex.c
Message-Id: <40153AEF.6000907@terra.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074874158.5269.3.camel@telecentrolivre>
In-Reply-To: <1074874158.5269.3.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

	Greetings,

Luiz Fernando Capitulino wrote:
> hi all,
> 
> this patch fixes this warning:
> 
> drivers/ide/pci/triflex.c:49: warning: `triflex_get_info' defined but not used
> 
> here is:
> 
> diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/ide/pci/triflex.c linux-2.6.2-rc2~/drivers/ide/pci/triflex.c
> --- linux-2.6.2-rc2/drivers/ide/pci/triflex.c	2003-10-08 16:24:04.000000000 -0300
> +++ linux-2.6.2-rc2~/drivers/ide/pci/triflex.c	2004-01-26 11:02:33.000000000 -0200
> @@ -45,6 +45,7 @@
>  
>  static struct pci_dev *triflex_dev;
>  
> +#ifdef CONFIG_PROC_FS
>  static int triflex_get_info(char *buf, char **addr, off_t offset, int count)
>  {
>  	char *p = buf;
> @@ -91,6 +92,7 @@
>  	
>  	return len > count ? count : len;
>  }
> +#endif

	Do we really need this chunk?

>  static int triflex_tune_chipset(ide_drive_t *drive, u8 xferspeed)
>  {
> diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/ide/pci/triflex.h linux-2.6.2-rc2~/drivers/ide/pci/triflex.h
> --- linux-2.6.2-rc2/drivers/ide/pci/triflex.h	2003-10-08 16:24:26.000000000 -0300
> +++ linux-2.6.2-rc2~/drivers/ide/pci/triflex.h	2004-01-26 11:02:33.000000000 -0200
> @@ -14,8 +14,16 @@
>  
>  static unsigned int __devinit init_chipset_triflex(struct pci_dev *, const char *);
>  static void init_hwif_triflex(ide_hwif_t *);
> +#ifdef CONFIG_PROC_FS
>  static int triflex_get_info(char *, char **, off_t, int);
.
.
.

> +#endif

	Since triflex_get_info is already #ifdef'd out if CONFIG_PROC_FS is not 
set, we don't need to put that extra #ifdef on the .c file, since that 
function will not get used anyway.

	IIRC the policy for adding #ifdefs on .c files is when it's really 
necessary, and I don't really see the point for this (expect object size 
and an extra symbol defined, which I don't think it really hurts here).

	Cheers,

Felipe

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
