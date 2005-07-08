From: Domen Puncer <domen@coderock.org>
Date: Fri, 08 Jul 2005 14:59:49 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 03/23][RESEND] Audit return code of
Message-Id: <20050708145948.GA2437@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55133370807276427=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050708102212.GM4683@rhum.iomeda.fr>
In-Reply-To: <20050708102212.GM4683@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============55133370807276427==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I thought only SCSI drivers are this scary. ;-)

On 08/07/05 12:22 +0200, Christophe Lucas wrote:
> Description:
> Audit return of create_proc_* functions and use of KERN_ in printk();
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> 
> Index: 2.6.13-rc1/drivers/net/tokenring/olympic.c

> -#if OLYMPIC_DEBUG  
> +#if OLYMPIC_DEBUG 

One space remains:  ^ :-)

>  #if OLYMPIC_DEBUG
> -	printk("BCTL: %x\n",readl(olympic_mmio+BCTL));
> -	printk("GPR: %x\n",readw(olympic_mmio+GPR));
> -	printk("SISRMASK: %x\n",readl(olympic_mmio+SISR_MASK));
> +	printk(KERN_DEBUG "BCTL: %x\n",readl(olympic_mmio+BCTL));
> +	printk(KERN_DEBUG "GPR: %x\n",readw(olympic_mmio+GPR));
> +	printk(KERN_DEBUG "SISRMASK: %x\n",readl(olympic_mmio+SISR_MASK));
>  #endif


How about:
	#if OLYMPIC_DEBUG
	#define DEBUG
	#endif
above includes, and then pr_debug(); or just drop OLYMPIC_DEBUG
and use DEBUG?

And return code audit should probably be in a separate patch?


	Domen

--===============55133370807276427==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55133370807276427==--
