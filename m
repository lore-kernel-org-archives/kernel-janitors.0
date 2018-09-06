From: David Miller <davem@davemloft.net>
Date: Thu, 06 Sep 2018 05:16:28 +0000
Subject: Re: [PATCH v2 net-next] failover: Add missing check to validate 'slave_dev' in net_failover_slave_un
Message-Id: <20180905.221628.2291238274171893981.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535771205-156540-1-git-send-email-yuehaibing@huawei.com>
        <1536029786-21710-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536029786-21710-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: sridhar.samudrala@intel.com, stephen@networkplumber.org, dan.carpenter@oracle.com, alexander.h.duyck@intel.com, jeffrey.t.kirsher@intel.com, liran.alon@oracle.com, joao.m.martins@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 4 Sep 2018 02:56:26 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/net_failover.c: In function 'net_failover_slave_unregister':
> drivers/net/net_failover.c:598:35: warning:
>  variable 'primary_dev' set but not used [-Wunused-but-set-variable]
> 
> There should check the validity of 'slave_dev'.
> 
> Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: use WARN_ON_ONCE as Liran Alon suggested

Applied.
