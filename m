From: Matthew Wilcox <willy@debian.org>
Date: Mon, 15 Mar 2004 19:18:53 +0000
Subject: Re: [Kernel-janitors] [PATCH] - style fixes for kernel/cpu.c.
Message-Id: <20040315191853.GH25059@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079377456.28138.39.camel@telecentrolivre>
In-Reply-To: <1079377456.28138.39.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2004 at 04:04:41PM -0300, Luiz Fernando Capitulino wrote:
> I changed tets in the form:
> 
> if (ret != 0) {
> To
> if (ret) {
> 
> I think there are no special reason to use the first one. Is there ?

There can be.  It very much depends.

> @@ -32,13 +32,16 @@ int __devinit cpu_up(unsigned int cpu)
>  	int ret;
>  	void *hcpu = (void *)(long)cpu;
>  
> -	if ((ret = down_interruptible(&cpucontrol)) != 0)
> +	ret = down_interruptible(&cpucontrol);
> +	if (ret)
>  		return ret;

This one is good.

> -	if (cpu_online(cpu)) {
> +	ret = cpu_online(cpu);
> +	if (ret) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> +

This one is bad.

> @@ -49,8 +52,9 @@ int __devinit cpu_up(unsigned int cpu)
>  
>  	/* Arch-specific enabling code. */
>  	ret = __cpu_up(cpu);
> -	if (ret != 0)
> +	if (ret)
>  		goto out_notify;
> +

I wouldn't change this one, personally.

> @@ -58,7 +62,7 @@ int __devinit cpu_up(unsigned int cpu)
>  	notifier_call_chain(&cpu_chain, CPU_ONLINE, hcpu);
>  
>  out_notify:
> -	if (ret != 0)
> +	if (ret)
>  		notifier_call_chain(&cpu_chain, CPU_UP_CANCELED, hcpu);
>  out:
>  	up(&cpucontrol);

This one's a bit dodgy too.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
