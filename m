From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 03 Oct 2005 11:04:53 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <20051003110453.GA10630@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0079680339579235593=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0079680339579235593==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

slackfan@users.sourceforge.net (slackfan@users.sourceforge.net) wrote:
> signed-off-by: Anton Brondz
> 
> --- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
> +++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 12:36:30.000000000 +0000
> @@ -23,23 +23,23 @@ static void doublefault_fn(void)
>  	store_gdt(&gdt_desc);
>  	gdt = gdt_desc.address;
>  
> -	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> +	printk(KERN_WARNING "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> [...]
>}
>  	}
> 
> 
> This is the third time I'm sending this. Hope you're not tired of me yet :). This time I've added a signed off line, used a different mail client to get the word
> wrap off and changed the constants.

Please use correctly Signed-off-by such as :

	Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Send your patch with correct syntax as said in :

	http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

Have a nice day,

				- Christophe (clucas@rotomalug.org)


--===============0079680339579235593==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0079680339579235593==--
