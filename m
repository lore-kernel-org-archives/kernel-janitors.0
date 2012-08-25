From: Cong Wang <amwang@redhat.com>
Date: Sat, 25 Aug 2012 07:49:22 +0000
Subject: Re: [congwang:ipv6 30/31] include/net/ipv6.h:273:12: error: 'struct net' has no member named 'ipv6'
Message-Id: <1345880962.14276.22.camel@cr0>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120824151249.GB7171@localhost>
In-Reply-To: <20120824151249.GB7171@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2012-08-24 at 23:12 +0800, Fengguang Wu wrote:
> Hi Cong,

Hi,

> include/net/ipv6.h: In function 'ip6_frag_nqueues':
> include/net/ipv6.h:273:12: error: 'struct net' has no member named 'ipv6'
> include/net/ipv6.h: In function 'ip6_frag_mem':
> include/net/ipv6.h:278:25: error: 'struct net' has no member named 'ipv6'
> ..
> 
> vim +273 include/net/ipv6.h
>    270	
>    271	static inline int ip6_frag_nqueues(struct net *net)
>    272	{
>  > 273		return net->ipv6.frags.nqueues;
>    274	}
>    275	
>    276	static inline int ip6_frag_mem(struct net *net)

Right.. I missed #ifdef CONFIG_NF_DEFRAG_IPV6.

Thanks for the report!

