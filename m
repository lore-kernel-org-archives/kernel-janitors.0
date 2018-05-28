From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 28 May 2018 22:37:33 +0000
Subject: Re: [PATCH net-next] netfilter: nat: make symbol nat_hook static
Message-Id: <20180528223733.36krgmqzuyjk5h5g@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527328133-86305-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527328133-86305-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 26, 2018 at 09:48:53AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> net/netfilter/nf_nat_core.c:1039:20: warning:
>  symbol 'nat_hook' was not declared. Should it be static?

Applied, thanks.
