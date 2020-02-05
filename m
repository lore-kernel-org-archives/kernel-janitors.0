From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 05 Feb 2020 18:03:45 +0000
Subject: Re: [PATCH v2 net] net: sched: prevent a use after free
Message-Id: <CAM_iQpWKQ+59GfAP8RTntEM55FC7AYvZgo_hhPXNMbxCpo-c=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAM_iQpVrckjFViizKZH+S=8GC_3T5Gm1vTAUeFkpmqJ_A66x1Q@mail.gmail.com>
 <20200205115330.7x2qgaks7racy5wj@kili.mountain>
In-Reply-To: <20200205115330.7x2qgaks7racy5wj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Mohit Bhasi <mohitbhasi1998@gmail.com>, "V. Saicharan" <vsaicharan1998@gmail.com>, Leslie Monis <lesliemonis@gmail.com>, "Sachin D. Patil" <sdp.sachin@gmail.com>, Gautam Ramakrishnan <gautamramk@gmail.com>, Linux Kernel Network Developers <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 5, 2020 at 3:56 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The bug is that we call kfree_skb(skb) and then pass "skb" to
> qdisc_pkt_len(skb) on the next line, which is a use after free.
> Also Cong Wang points out that it's better to delay the actual
> frees until we drop the rtnl lock so we should use rtnl_kfree_skbs()
> instead of kfree_skb().
>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Cong Wang <xiyou.wangcong@gmail.com>

Thanks!
