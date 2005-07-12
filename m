From: Domen Puncer <domen@coderock.org>
Date: Tue, 12 Jul 2005 12:23:42 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 17/23] Audit return code of create_proc_*
Message-Id: <20050712122342.GC2470@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4803137218550726=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707154638.321093000@rhum.iomeda.fr>
In-Reply-To: <20050707154638.321093000@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============4803137218550726==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/07/05 14:03 +0200, Christophe Lucas wrote:
> Description:
> Audit return of create_proc_* functions.
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> Index: 2.6.13-rc1/arch/ppc/platforms/residual.c
> ===================================================================
> --- 2.6.13-rc1.orig/arch/ppc/platforms/residual.c
> +++ 2.6.13-rc1/arch/ppc/platforms/residual.c
> @@ -1024,9 +1024,13 @@ static int proc_prep_residual_read(char 
>  int __init
>  proc_prep_residual_init(void)
>  {
> +	struct proc_dir_entry *ent;
>  	if (have_residual_data)

				^ missing '{'?

> -		create_proc_read_entry("residual", S_IRUGO, NULL,
> +		ent = create_proc_read_entry("residual", S_IRUGO, NULL,
>  					proc_prep_residual_read, NULL);
> +		if (!ent)
> +			printk(KERN_WARNING 

					   ^ whitespace :-)

--===============4803137218550726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4803137218550726==--
