From: Florian Westphal <fw@strlen.de>
Date: Fri, 05 Apr 2019 10:01:54 +0000
Subject: Re: [PATCH] netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
Message-Id: <20190405100154.ohc6kjfyysug7fpp@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402133038.GA18575@kadam>
 <20190405083436.GT32613@kadam>
In-Reply-To: <20190405083436.GT32613@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 	if (hook->num > 31 || !(type->hook_mask & (1 << hook->num)))
> 
> which seems like a slightly ugly magic number but it fixes the buffer
> overflow.

You can use NF_MAX_HOOKS instead of 31.
