From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 19 Jan 2004 15:06:12 +0000
Subject: [Kernel-janitors] Re: Problem with CONFIG_SYSCTL disabled
Message-Id: <1074524771.21244.7.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Em Seg, 2004-01-19 às 12:21, YOSHIFUJI Hideaki / 吉藤英明 escreveu:
> In article <1074521369.6070.99.camel@pegasus> (at Mon, 19 Jan 2004 15:09:29 +0100), Marcel Holtmann <marcel@holtmann.org> says:
> 
> > so it is not needed to wrap the inclusion of linux/sysctl.h around
> > #ifdef's, but why is it done so many times?
> > 
> > 	net/core/neighbour.c
> > 	net/ipv4/devinet.c
> > 	net/ipv4/arp.c
> > 	net/ipv4/route.c
> > 	net/ipv4/netfilter/ip_conntrack_standalone.c
> > 	net/ipv6/route.c
> > 	net/ipv6/addrconf.c
> > 	net/ipv6/ndisc.c
> > 	net/ipv6/icmp.c
> > 	net/appletalk/sysctl_net_atalk.c
> > 	net/bridge/br_netfilter.c
> 
> Compilation time?


 I fixed the net/bridge/br_netfilter.c, and sent the patch to Andrew
(and him fowarded to D. Miller, I though that was -mm problem).

> If one does not require linux/sysctl.h without CONFIG_SYSCTL,
> you don't need to include it.

 I take a quick look, there are other places to fix. Should it be a
janitor task ?

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
