From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 30 Jul 2012 00:56:38 +0000
Subject: Re: [nf-next:nf_tables4 2/2] net/ipv4/netfilter/nf_table_nat_ipv4.c:184:30: sparse: incompatible typ
Message-Id: <20120730005638.GA32554@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120729004811.GB7049@localhost>
In-Reply-To: <20120729004811.GB7049@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 29, 2012 at 08:48:11AM +0800, Fengguang Wu wrote:
> Hi Pablo,
> 
> There are new sparse warnings show up in
> 
> tree:   git://150.214.188.80/nf-next nf_tables4
> head:   b33538d5361ec09e5c947765a7615fc67640a9fe
> commit: b33538d5361ec09e5c947765a7615fc67640a9fe [2/2] netfilter: nf_tables
> 
> All sparse warnings:
> 
> + net/ipv4/netfilter/nf_table_nat_ipv4.c:184:30: sparse: incompatible types in comparison expression (different address spaces)
> 
> vim +184 net/ipv4/netfilter/nf_table_nat_ipv4.c
>    181		enum nf_nat_manip_type maniptype = HOOK2MANIP(ops->hooknum);
>    182		unsigned int ret;
>    183	
>  > 184		if (ct = NULL || ct = &nf_conntrack_untracked)

should be fixed now in nf_tables5 branch. Now we use
nf_ct_is_untracked(ct) instead of the reference to the global
untracked conntrack object.
