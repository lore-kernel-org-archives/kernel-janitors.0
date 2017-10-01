From: David Miller <davem@davemloft.net>
Date: Sun, 01 Oct 2017 03:08:28 +0000
Subject: Re: [PATCH][net-next] net_sched: remove redundant assignment to ret
Message-Id: <20171001.040828.1047378292144214219.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929140116.8642-1-colin.king@canonical.com>
In-Reply-To: <20170929140116.8642-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Sep 2017 15:01:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of -EINVAL to variable ret is redundant as it
> is being overwritten on the following error exit paths or
> to the return value from the following call to basic_set_parms.
> Fix this up by removing it. Cleans up clang warning message:
> 
> net/sched/cls_basic.c:185:2: warning: Value stored to 'err' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
