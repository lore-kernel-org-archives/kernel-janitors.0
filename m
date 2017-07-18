From: Florian Westphal <fw@strlen.de>
Date: Tue, 18 Jul 2017 21:12:29 +0000
Subject: Re: [PATCH] netfilter: fix netfilter_net_init() return
Message-Id: <20170718211229.GB5832@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718193856.yh2qd2j5bloiuq5r@mwanda>
In-Reply-To: <20170718193856.yh2qd2j5bloiuq5r@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We accidentally return an uninitialized variable.

Ugh, indeed, thanks for the quick fix!
