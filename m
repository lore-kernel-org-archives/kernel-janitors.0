From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 06 Mar 2017 17:06:36 +0000
Subject: Re: [PATCH] netfilter: remove redundant check on ret being non-zero
Message-Id: <20170306170636.GA5955@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228113115.19888-1-colin.king@canonical.com>
In-Reply-To: <20170228113115.19888-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 28, 2017 at 11:31:15AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> ret is initialized to zero and if it is set to non-zero in the
> xt_entry_foreach loop then we exit via the out_free label. Hence
> the check for ret being non-zero is redundant and can be removed.
> 
> Detected by CoverityScan, CID#1357132 ("Logically Dead Code")

Applied, thanks.
