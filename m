From: "David S. Miller" <davem@redhat.com>
Date: Mon, 19 Jan 2004 17:40:10 +0000
Subject: [Kernel-janitors] Re: Problem with CONFIG_SYSCTL disabled
Message-Id: <20040119094010.68fb43a7.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074519043.6070.93.camel@pegasus>
	<20040119.224603.71004956.yoshfuji@linux-ipv6.org>
	<1074521369.6070.99.camel@pegasus>
	<20040119.232131.03582632.yoshfuji@linux-ipv6.org>
	<1074524771.21244.7.camel@telecentrolivre>
In-Reply-To: <1074524771.21244.7.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Cc: yoshfuji@linux-ipv6.org, marcel@holtmann.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Mon, 19 Jan 2004 13:06:12 -0200
Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> wrote:

> > If one does not require linux/sysctl.h without CONFIG_SYSCTL,
> > you don't need to include it.
> 
>  I take a quick look, there are other places to fix. Should it be a
> janitor task ?

Yes, it's just ugly to have these ifdefs in *.c files _if_ they can be avoided.

Meanwhile I've applied the neighbour.h fix from Yoshfuji-san.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
