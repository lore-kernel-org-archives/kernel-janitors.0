From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 09 Sep 2005 07:51:31 +0000
Subject: Re: [KJ] [PATCH] printk : arch/alpha/kernel/core_lca.c
Message-Id: <20050909075131.GA31634@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62840167374388223=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============62840167374388223==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 08, 2005 at 10:47:08AM +0200, Christophe Lucas wrote:
> printk() calls should include appropriate KERN_* constant.

> --- linux-2.6.13.orig/arch/alpha/kernel/core_lca.c
> +++ linux-2.6.13/arch/alpha/kernel/core_lca.c
> @@ -334,23 +334,23 @@ lca_init_arch(void)
>  static void
>  mem_error(unsigned long esr, unsigned long ear)
>  {
> -	printk("    %s %s error to %s occurred at address %x\n",
> +	printk(KERN_WARNING "    %s %s error to %s occurred at address %x\n",

Looks like these should be printed with KERN_ERR.

> -		printk("    A b-cache tag parity error was detected.\n");
> +		printk(KERN_WARNING "    A b-cache tag parity error was detected.\n");

> -		printk("    Several other correctable errors occurred.\n");
> +		printk(KERN_WARNING "    Several other correctable errors occurred.\n");

> -		printk("    Several other uncorrectable errors occurred.\n");
> +		printk(KERN_WARNING "    Several other uncorrectable errors occurred.\n");

> @@ -372,16 +372,16 @@ ioc_error(__u32 stat0, __u32 stat1)

> -	printk("    %s initiated PCI %s cycle to address %x"
> +	printk(KERN_WARNING "    %s initiated PCI %s cycle to address %x"


--===============62840167374388223==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62840167374388223==--
