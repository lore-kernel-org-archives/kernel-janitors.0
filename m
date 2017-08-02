From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 02 Aug 2017 12:23:55 +0000
Subject: Re: [PATCH 1/1 v3 nf-next] netfilter: constify nf_conntrack_l3/4proto parameters
Message-Id: <20170802122355.GA13459@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501583101-14188-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501583101-14188-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501583101-14188-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 01, 2017 at 12:25:01PM +0200, Julia Lawall wrote:
> When a nf_conntrack_l3/4proto parameter is not on the left hand side
> of an assignment, its address is not taken, and it is not passed to a
> function that may modify its fields, then it can be declared as const.
> 
> This change is useful from a documentation point of view, and can
> possibly facilitate making some nf_conntrack_l3/4proto structures const
> subsequently.
> 
> Done with the help of Coccinelle.

Applied, thanks Julia.
