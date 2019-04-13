From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Sat, 13 Apr 2019 12:58:15 +0000
Subject: Re: [PATCH v2] netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
Message-Id: <20190413125815.oiefilsilitqf2cm@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402133038.GA18575@kadam>
 <20190406052652.GA20963@kadam>
In-Reply-To: <20190406052652.GA20963@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Sat, Apr 06, 2019 at 08:26:52AM +0300, Dan Carpenter wrote:
> I believe that "hook->num" can be up to UINT_MAX.  Shifting more than
> 31 bits would is undefined in C but in practice it would lead to shift
> wrapping.  That would lead to an array overflow in nf_tables_addchain():
> 
> 	ops->hook       = hook.type->hooks[ops->hooknum];

Applied, thanks.
