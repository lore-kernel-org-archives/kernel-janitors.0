From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 17 Oct 2016 15:40:30 +0000
Subject: Re: [patch] netfilter: nft_exthdr: fix error handling in nft_exthdr_init()
Message-Id: <20161017154030.GA15672@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012060912.GF12841@mwanda>
In-Reply-To: <20161012060912.GF12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laura Garcia Liebana <nevola@gmail.com>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 09:09:12AM +0300, Dan Carpenter wrote:
> "err" needs to be signed for the error handling to work.

Applied, thanks Dan.
