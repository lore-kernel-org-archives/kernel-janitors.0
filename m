From: Florian Westphal <fw@strlen.de>
Date: Mon, 11 Dec 2017 09:18:05 +0000
Subject: Re: [PATCH][netfilter-next] netfilter: conntrack: make struct nf_conntrack_l4proto_gre4 static
Message-Id: <20171211091805.GK24449@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171210233255.15009-1-colin.king@canonical.com>
In-Reply-To: <20171210233255.15009-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure nf_conntrack_l4proto_gre4  is local to the source and does
> not need to be in global scope, so make it static.

This bug was added in
commit b9679a9fd3a7d36ea3deb2864a00cc413c5aae28
netfilter: conntrack: l4 protocol trackers can be const

> -struct nf_conntrack_l4proto nf_conntrack_l4proto_gre4 = {
> +static struct nf_conntrack_l4proto nf_conntrack_l4proto_gre4 = {

This should be 'static const'.
