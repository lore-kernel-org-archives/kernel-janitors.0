From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 03 Feb 2020 20:33:30 +0000
Subject: Re: [PATCH net] net: sched: prevent a use after free
Message-Id: <CAM_iQpVrckjFViizKZH+S=8GC_3T5Gm1vTAUeFkpmqJ_A66x1Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131065647.joonbg3wzcw26x3b@kili.mountain>
 <CAM_iQpUYv9vEVpYc-WfMNfCc9QaBzmTYs66-GEfwOKiqOXHxew@mail.gmail.com>
 <20200203083853.GH11068@kadam> <CAM_iQpWu=EuAj709=wL0ZgbLvFgBbaaVZcMjYm0ZmTeLJ7nkCg@mail.gmail.com>
In-Reply-To: <CAM_iQpWu=EuAj709=wL0ZgbLvFgBbaaVZcMjYm0ZmTeLJ7nkCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Mohit Bhasi <mohitbhasi1998@gmail.com>, "Mohit P. Tahiliani" <tahiliani@nitk.edu.in>, "V. Saicharan" <vsaicharan1998@gmail.com>, Gautam Ramakrishnan <gautamramk@gmail.com>, Linux Kernel Network Developers <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Feb 3, 2020 at 11:58 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Mon, Feb 3, 2020 at 12:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Why is that better?
>
> Because it is designed to be used in this scenario,
> as it defers the free after RTNL unlock which is after
> sch_tree_unlock() too.

Just in case of misunderstanding: I am _not_ suggesting to
use rtnl_kfree_skbs() to workaround this use-after-free,
rtnl_kfree_skbs() still has to be called after qdisc_pkt_len(),
at least for readability, despite that it could indeed
workaround the bug.

Thanks.
