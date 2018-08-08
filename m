From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 08 Aug 2018 17:05:53 +0000
Subject: Re: [PATCH net-next] netfilter: nfnetlink_osf: fix using plain integer as NULL warning
Message-Id: <20180808170553.e6icrd5uq6bdjwwx@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533698624-107304-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533698624-107304-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 08, 2018 at 03:23:44AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> net/netfilter/nfnetlink_osf.c:274:24: warning:
>  Using plain integer as NULL pointer

Applied, thanks.
