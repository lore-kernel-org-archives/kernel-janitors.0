From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 10 Jan 2018 14:18:06 +0000
Subject: Re: [PATCH net-next] netfilter: nf_flow_table: remove duplicated include from nf_flow_table_ipv6.c
Message-Id: <20180110141806.ne5yk4cvjayczm5t@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515589626-72041-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515589626-72041-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 01:07:06PM +0000, Wei Yongjun wrote:
> Remove duplicated include.

I'm going to collapse this patch to:

http://patchwork.ozlabs.org/patch/858284/

and call it "netfilter: remove duplicated include"

So we don't need two patches for the same thing.

OK?
