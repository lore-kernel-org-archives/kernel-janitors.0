From: Domen Puncer <domen@coderock.org>
Date: Tue, 12 Jul 2005 12:28:35 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 21/23][RESEND] Audit return code of
Message-Id: <20050712122835.GD2470@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97609123520217023=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050712120758.GG4712@rhum.iomeda.fr>
In-Reply-To: <20050712120758.GG4712@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============97609123520217023==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/07/05 14:07 +0200, Christophe Lucas wrote:
> Description:
> Audit return of create_proc_* functions.
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> Index: 2.6.13-rc1/arch/arm/kernel/ecard.c
> ===================================================================
> --- 2.6.13-rc1.orig/arch/arm/kernel/ecard.c
> +++ 2.6.13-rc1/arch/arm/kernel/ecard.c
> @@ -776,9 +776,16 @@ static struct proc_dir_entry *proc_bus_e
>  
>  static void ecard_proc_init(void)
>  {
> +	struct proc_dir_entry *proc_entry;
> +
>  	proc_bus_ecard_dir = proc_mkdir("ecard", proc_bus);
> -	create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
> +	if (proc_bus_ecard_dir == NULL)
> +		printk(KERN_WARNING 
> +			"ecard: Unable to create proc dir entry.\n");
> +	proc_entry = create_proc_info_entry("devices", 0, proc_bus_ecard_dir,

I don' think this is intended if proc_bus_ecard_dir is NULL.


--===============97609123520217023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97609123520217023==--
