From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Tue, 15 Dec 2020 16:19:50 +0000
Subject: Re: [PATCH][next] netfilter: nftables: fix incorrect increment of loop counter
Message-Id: <20201215161950.GA10902@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214234015.85072-1-colin.king@canonical.com>
 <20201215143830.GA10086@salvia>
In-Reply-To: <20201215143830.GA10086@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 15, 2020 at 03:38:30PM +0100, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Mon, Dec 14, 2020 at 11:40:15PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The intention of the err_expr cleanup path is to iterate over the
> > allocated expr_array objects and free them, starting from i - 1 and
> > working down to the start of the array. Currently the loop counter
> > is being incremented instead of decremented and also the index i is
> > being used instead of k, repeatedly destroying the same expr_array
> > element.  Fix this by decrementing k and using k as the index into
> > expr_array.
> > 
> > Addresses-Coverity: ("Infinite loop")
> > Fixes: 8cfd9b0f8515 ("netfilter: nftables: generalize set expressions support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Pablo Neira Ayuso <pablo@netfilter.org>
> 
> @Jakub: Would you please take this one into net-next? Thanks!

You marked as "Awaiting Upstream", I'll take care of it.

Thanks.
