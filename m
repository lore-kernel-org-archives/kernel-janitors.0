From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 11 Aug 2014 16:41:14 +0000
Subject: Re: [PATCH 4/5] netfilter: nf_tables: fix error return code
Message-Id: <20140811164114.GA7770@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
 <1407415749-19978-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 07, 2014 at 02:49:08PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert a zero return value on error to a negative one, as returned
> elsewhere in the function.

Applied, thanks Julia.

