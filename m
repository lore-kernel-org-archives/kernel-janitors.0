From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 24 Apr 2013 23:59:47 +0000
Subject: Re: [patch -next] netfilter: nf_nat: missing condition in nf_xfrm_me_harder()
Message-Id: <20130424235947.GA6528@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130424151151.GA16783@elgon.mountain>
In-Reply-To: <20130424151151.GA16783@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 24, 2013 at 06:11:51PM +0300, Dan Carpenter wrote:
> This if statement was accidentally dropped in a merge commit so now it
> returns unconditionally.

Applied, thanks Dan.
