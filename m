From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 21 Jun 2005 19:32:04 +0000
Subject: Re: [KJ] [PATCH] Audit return code :
Message-Id: <200506212332.04474.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101842.GI4880@rhum.iomeda.fr>
In-Reply-To: <20050621101842.GI4880@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 21 June 2005 14:18, Christophe Lucas wrote:
> Audit return codes (and handle failure correctly) for misc_register.

> --- 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c
> +++ 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c
> @@ -192,12 +192,19 @@ static int hdpu_cpustate_probe(struct de
>  {
>  	struct platform_device *pdev = to_platform_device(ddev);
>  	struct resource *res;
> +	int ret;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	cpustate.set_addr = (unsigned long *)res->start;
>  	cpustate.clr_addr = (unsigned long *)res->end - 1;
>  
> -	misc_register(&cpustate_dev);
> +	if (ret = misc_register(&cpustate_dev)) {
> +		printk(KERN_WARNING "Unable to register misc device.\n");
> +		cpustate.set_addr = 0;
> +		cpustate.clr_addr = 0;

Why clear them? Anyway, both are pointers, so use NULL.

> +		return ret ;
> +	}
> +
>  	create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);

Also unchecked.

Please, post patches inline.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
