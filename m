From: Francois Romieu <romieu@fr.zoreil.com>
Date: Wed, 04 Feb 2004 21:58:36 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <20040204225836.A20190@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
[...]
> diff -X dontdiff -Nru linux-2.6.2-rc2-bk4/drivers/net/pppoe.c linux-2.6.2-rc2-bk4~/drivers/net/pppoe.c
> --- linux-2.6.2-rc2-bk4/drivers/net/pppoe.c	2004-02-02 10:41:32.000000000 -0200
> +++ linux-2.6.2-rc2-bk4~/drivers/net/pppoe.c	2004-02-02 10:41:34.000000000 -0200
[...]
> @@ -1112,26 +1126,19 @@
>  
>  	if (err)
>  		goto out;
> -#ifdef CONFIG_PROC_FS
> -{
> -	struct proc_dir_entry *p = create_proc_entry("pppoe", S_IRUGO,
> -						     proc_net);
> -	err = -ENOMEM;
> -	if (!p)
> -		goto out_unregister;
> +
> +	err = pppoe_proc_init();
> +	if (err) {
> +		unregister_pppox_proto(PX_PROTO_OE);
> +		err = -ENOMEM;

-> What about making pppoe_proc_init() return -ENOMEM directly and testing
   against (err < 0)

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
