From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 19 Jun 2019 10:51:22 +0000
Subject: Re: [PATCH][V2][next] netfilter: synproxy: ensure zero is returned on non-error return path
Message-Id: <20190619105122.envwm53ew7isp4m2@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618142244.16463-1-colin.king@canonical.com>
In-Reply-To: <20190618142244.16463-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 18, 2019 at 03:22:44PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently functions nf_synproxy_{ipc4|ipv6}_init return an uninitialized
> garbage value in variable ret on a successful return.  Fix this by
> returning zero on success.

Applied, thanks Colin.
