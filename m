From: Francois Romieu <romieu@fr.zoreil.com>
Date: Fri, 20 Feb 2004 20:45:51 +0000
Subject: Re: [Kernel-janitors] [PATCH][RFC] - proc cleanup for
Message-Id: <20040220214551.A26032@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077194142.3626.6.camel@telecentrolivre>
In-Reply-To: <1077194142.3626.6.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
[...]
>  A question, should I do:
> 
> retval = gen_rtc_proc_init();
> 
> return retval
> 
> Or
> 
> return gen_rtc_proc_init();

Your choice. I would probably do:

ret = misc_register(frob);
if (ret >= 0)
	ret = rtc_gen_proc_init();

return ret;

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
