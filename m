From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Tue, 31 Jul 2012 00:06:43 +0000
Subject: Re: [nf-next:nf-nat3 4/10] net/ipv6/netfilter/ip6t_MASQUERADE.c:40:14: error: 'struct nf_conn_nat'
Message-Id: <20120731000643.GA25115@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120730145327.GB7311@localhost>
In-Reply-To: <20120730145327.GB7311@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Mon, Jul 30, 2012 at 10:53:27PM +0800, Fengguang Wu wrote:
> Hi Patrick,
> 
> Kernel build failed on
> 
> tree:   git://150.214.188.80/nf-next nf-nat3
> head:   b2969d44298e26268717a2aa1b93fef9b09734f4
> commit: 98bc284654e7db0d3272506f697bd0b38b17007b [4/10] netfilter: ip6tables: add MASQUERADE target
> config: i386-randconfig-k006 (attached as .config)
> 
> All related error/warning messages:
> 
> net/ipv6/netfilter/ip6t_MASQUERADE.c: In function 'masquerade_tg6':
> net/ipv6/netfilter/ip6t_MASQUERADE.c:40:14: error: 'struct nf_conn_nat' has no member named 'masq_index'
> net/ipv6/netfilter/ip6t_MASQUERADE.c: In function 'device_cmp':
> net/ipv6/netfilter/ip6t_MASQUERADE.c:68:12: error: 'const struct nf_conn_nat' has no member named 'masq_index'
> net/ipv6/netfilter/ip6t_MASQUERADE.c:69:1: warning: control reaches end of non-void function [-Wreturn-type]

Fixed in nf-nat4 branch.

Thanks.
