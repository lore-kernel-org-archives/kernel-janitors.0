From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Thu, 08 Jan 2004 20:19:41 +0000
Subject: Re: switch identation was: Re: [Kernel-janitors] [PATCH] Fix warning
Message-Id: <20040108201941.GY3062@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040107164516.50bcd936.rddunlap@osdl.org>
In-Reply-To: <20040107164516.50bcd936.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, Dec 23, 2003 at 03:18:50PM -0200, Arnaldo C. Melo escreveu:
> Em Tue, Dec 23, 2003 at 10:43:16AM -0200, Luiz Fernando Capitulino escreveu:
> > +		switch(clocking) {
> > +			case 0x03: printk("DISABLED !\n"); break;
> > +			case 0x02: printk("= 2X PCI \n"); break;
> > +			case 0x01: printk("= 133 \n"); break;
> > +			case 0x00: printk("= 100 \n"); break;
> > +		}
> 
> May I suggest that we use:
> 
> 		switch(clocking) {

I was nuts ;(

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
