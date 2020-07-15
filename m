From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 15 Jul 2020 18:14:51 +0000
Subject: Re: [PATCH] netfilter: nf_tables: Fix a use after free in nft_immediate_destroy()
Message-Id: <20200715181451.GA17884@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714105622.GB294318@mwanda>
In-Reply-To: <20200714105622.GB294318@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 01:56:22PM +0300, Dan Carpenter wrote:
> The nf_tables_rule_release() function frees "rule" so we have to use
> the _safe() version of list_for_each_entry().

Applied, thanks.
