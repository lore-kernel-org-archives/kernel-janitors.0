From: David Miller <davem@davemloft.net>
Date: Fri, 03 Nov 2017 06:55:01 +0000
Subject: Re: [PATCH][net-next] net: sched: cls_bpf: use bitwise & rather than logical && on gen_flags
Message-Id: <20171103.155501.268373482338402451.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102200412.16757-1-colin.king@canonical.com>
In-Reply-To: <20171102200412.16757-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: ast@kernel.org, daniel@iogearbox.net, jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Nov 2017 20:04:12 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently gen_flags is being operated on by a logical && operator rather
> than a bitwise & operator. This looks incorrect as these should be bit
> flag operations. Fix this.
> 
> Detected by CoverityScan, CID#1460305 ("Logical vs. bitwise operator")
> 
> Fixes: 3f7889c4c79b ("net: sched: cls_bpf: call block callbacks for offload)
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
