From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 30 Jul 2012 10:19:33 +0000
Subject: Re: [nf-next:nf-nat2 3/8] net/ipv6/netfilter/nf_nat_l3proto_ipv6.c:146: error: implicit declaration
Message-Id: <20120730101933.GA4346@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120730025425.GB7133@localhost>
In-Reply-To: <20120730025425.GB7133@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2012 at 10:54:25AM +0800, Fengguang Wu wrote:
> Hi Patrick,
> 
> Kernel build failed on
> 
> tree:   git://150.214.188.80/nf-next nf-nat2
> head:   2c59d9f21ca33d3f974f45ae1f730982a85bd908
> commit: 1fd41de690223f8d39aa679deb3e9f88155a3af0 [3/8] netfilter: ipv6: add IPv6 NAT support
> config: avr32-atngw100_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> net/ipv6/netfilter/nf_nat_l3proto_ipv6.c: In function 'nf_nat_ipv6_csum_recalc':
> net/ipv6/netfilter/nf_nat_l3proto_ipv6.c:146: error: implicit declaration of function 'csum_ipv6_magic'

This should be fixed in the new nf-nat3 branch.

Thanks Fengguang.
