From: "weiyongjun (A)" <weiyongjun1@huawei.com>
Date: Wed, 10 Jan 2018 14:24:49 +0000
Subject: RE: [PATCH net-next] netfilter: nf_flow_table: remove duplicated include from nf_flow_table_ipv6.c
Message-Id: <6AADFAC011213A4C87B956458587ADB4013277E9@dggemi507-mbx.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515589626-72041-1-git-send-email-weiyongjun1@huawei.com>
 <20180110141806.ne5yk4cvjayczm5t@salvia>
In-Reply-To: <20180110141806.ne5yk4cvjayczm5t@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, "coreteam@netfilter.org" <coreteam@netfilter.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> 
> On Wed, Jan 10, 2018 at 01:07:06PM +0000, Wei Yongjun wrote:
> > Remove duplicated include.
> 
> I'm going to collapse this patch to:
> 
> http://patchwork.ozlabs.org/patch/858284/
> 
> and call it "netfilter: remove duplicated include"
> 
> So we don't need two patches for the same thing.
> 
> OK?

OK, I will do that in further. Thanks.

Wei Yongjun
