From: David Miller <davem@davemloft.net>
Date: Thu, 06 Feb 2020 13:01:37 +0000
Subject: Re: [PATCH v2 net] net: sched: prevent a use after free
Message-Id: <20200206.140137.826534991746807346.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAM_iQpVrckjFViizKZH+S=8GC_3T5Gm1vTAUeFkpmqJ_A66x1Q@mail.gmail.com>
        <20200205115330.7x2qgaks7racy5wj@kili.mountain>
In-Reply-To: <20200205115330.7x2qgaks7racy5wj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, kuba@kernel.org, mohitbhasi1998@gmail.com, vsaicharan1998@gmail.com, lesliemonis@gmail.com, sdp.sachin@gmail.com, gautamramk@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 5 Feb 2020 14:53:30 +0300

> The bug is that we call kfree_skb(skb) and then pass "skb" to
> qdisc_pkt_len(skb) on the next line, which is a use after free.
> Also Cong Wang points out that it's better to delay the actual
> frees until we drop the rtnl lock so we should use rtnl_kfree_skbs()
> instead of kfree_skb().
> 
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Use rtnl_kfree_skbs() instead of kfree_skb().  From static analysis.
>     Not tested, but I have audited the code pretty close and I think
>     switing to rtnl_kfree_skbs() is harmless.

Applied, thanks Dan.
