From: David Miller <davem@davemloft.net>
Date: Sat, 04 Nov 2017 13:52:01 +0000
Subject: Re: [PATCH] net: sched: cls_u32: use bitwise & rather than logical && on n->flags
Message-Id: <20171104.225201.217339814179113621.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103080945.27155-1-colin.king@canonical.com>
In-Reply-To: <20171103080945.27155-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  3 Nov 2017 08:09:45 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently n->flags is being operated on by a logical && operator rather
> than a bitwise & operator. This looks incorrect as these should be bit
> flag operations. Fix this.
> 
> Detected by CoverityScan, CID#1460398 ("Logical vs. bitwise operator")
> 
> Fixes: 245dc5121a9b ("net: sched: cls_u32: call block callbacks for offload")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
