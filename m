From: Domen Puncer <domen@coderock.org>
Date: Wed, 13 Jul 2005 17:31:42 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 19/23][RESEND] Audit return code of
Message-Id: <20050713173142.GA21831@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88815241640264819=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050712120511.GF4712@rhum.iomeda.fr>
In-Reply-To: <20050712120511.GF4712@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============88815241640264819==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/07/05 14:05 +0200, Christophe Lucas wrote:
> Description:
> Audit return of create_proc_* functions.
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> 
> Index: 2.6.13-rc1/arch/m68k/mac/iop.c
> ===================================================================
> --- 2.6.13-rc1.orig/arch/m68k/mac/iop.c
> +++ 2.6.13-rc1/arch/m68k/mac/iop.c
> @@ -275,6 +275,7 @@ void __init iop_preinit(void)
>  
>  void __init iop_init(void)
>  {
> +	struct proc_dir_entry *proc_entry;
>  	int i;
>  
>  	if (iop_scc_present) {
> @@ -303,7 +304,10 @@ void __init iop_init(void)
>  
>  #if 0	/* Crashing in 2.4 now, not yet sure why.   --jmt */
>  #ifdef CONFIG_PROC_FS
> -	create_proc_info_entry("mac_iop", 0, &proc_root, iop_get_proc_info);
> +	proc_entry = create_proc_info_entry("mac_iop", 0, 
> +		&proc_root, iop_get_proc_info);
> +	if (!proc_entry)
> +		printk(KERN_WARNING "iop: Unable to create /proc entry.\n");
>  #endif
>  #endif

This adds a warning about unused variable; not good.

--===============88815241640264819==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88815241640264819==--
