From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 08 Apr 2019 21:05:47 +0000
Subject: Re: [PATCH] netfilter: nf_tables: remove unused parameter ctx
Message-Id: <20190408210547.2pu4odsv5gglh3t7@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190317172706.26050-1-colin.king@canonical.com>
In-Reply-To: <20190317172706.26050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 17, 2019 at 05:27:06PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function nf_tables_set_desc_parse parameter ctx is not being used
> so remove it as it is redundant.

Applied, thanks.
