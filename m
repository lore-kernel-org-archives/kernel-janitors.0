From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 03 May 2017 14:15:33 +0000
Subject: Re: [PATCH] net/sched: remove redundant null check on head
Message-Id: <20170503141533.GC2077@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503135040.32023-1-colin.king@canonical.com>
In-Reply-To: <20170503135040.32023-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

Wed, May 03, 2017 at 03:50:40PM CEST, colin.king@canonical.com wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>head is previously null checked and so the 2nd null check on head
>is redundant and therefore can be removed.
>
>Detected by CoverityScan, CID#1399505 ("Logically dead code")
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
