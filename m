From: Florian Westphal <fw@strlen.de>
Date: Sat, 29 Jul 2017 20:03:43 +0000
Subject: Re: [PATCH 1/1] netfilter: constify nf_conntrack_l3/4proto parameters
Message-Id: <20170729200343.GH28392@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501356197-26490-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501356197-26490-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501356197-26490-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "David S. Miller" <davem@davemloft.net>, bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> When a nf_conntrack_l3/4proto parameter is not on the left hand side
> of an assignment, its address is not taken, and it is not passed to a
> function that may modify its fields, then it can be declared as const.
> 
> This change is useful from a documentation point of view, and can
> possibly facilitate making some nf_conntrack_l3/4proto structures const
> subsequently.
> 
> Done with the help of Coccinelle.
> 
> Some spacing adjusted to fit within 80 characters.

Acked-by: Florian Westphal <fw@strlen.de>

Thanks Julia.

I think we can indeed constify these completely after making
'nla_size' set at compile time.

I'll send a simple attempt to make it so for l3proto soon.
