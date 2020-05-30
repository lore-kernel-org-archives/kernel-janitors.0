From: David Miller <davem@davemloft.net>
Date: Sat, 30 May 2020 00:00:05 +0000
Subject: Re: [PATCH net-next] tipc: remove set but not used variable 'prev'
Message-Id: <20200529.170005.1952701912928856345.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528074359.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20200528074359.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: jmaloy@redhat.com, ying.xue@windriver.com, kuba@kernel.org, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 May 2020 07:43:59 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/tipc/msg.c: In function 'tipc_msg_append':
> net/tipc/msg.c:215:24: warning:
>  variable 'prev' set but not used [-Wunused-but-set-variable]
> 
> commit 0a3e060f340d ("tipc: add test for Nagle algorithm effectiveness")
> left behind this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
