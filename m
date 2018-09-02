From: Liran Alon <liran.alon@oracle.com>
Date: Sun, 02 Sep 2018 08:34:26 +0000
Subject: Re: [PATCH net-next] failover: Add missing check to validate 'slave_dev' in net_failover_slave_unreg
Message-Id: <365233C7-0C33-45E0-9EAD-4E9F89E94BDC@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535687218-23169-1-git-send-email-yuehaibing@huawei.com>
 <1535771205-156540-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535771205-156540-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sridhar Samudrala <sridhar.samudrala@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Joao Martins <joao.m.martins@oracle.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



> On 1 Sep 2018, at 6:06, YueHaibing <yuehaibing@huawei.com> wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/net_failover.c: In function 'net_failover_slave_unregister':
> drivers/net/net_failover.c:598:35: warning:
> variable 'primary_dev' set but not used [-Wunused-but-set-variable]
> 
> There should check the validity of 'slave_dev'.
> 
> Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
> Suggested-by: Samudrala, Sridhar <sridhar.samudrala@intel.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> drivers/net/net_failover.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
> index 7ae1856..af1ece8 100644
> --- a/drivers/net/net_failover.c
> +++ b/drivers/net/net_failover.c
> @@ -602,6 +602,9 @@ static int net_failover_slave_unregister(struct net_device *slave_dev,
> 	nfo_info = netdev_priv(failover_dev);
> 	primary_dev = rtnl_dereference(nfo_info->primary_dev);
> 	standby_dev = rtnl_dereference(nfo_info->standby_dev);
> +
> +	if (slave_dev != primary_dev && slave_dev != standby_dev)
> +		return -ENODEV;

As this condition signals a bug, I think we should instead:
if (WARN_ON_ONCE((slave_dev != primary_dev) && (slave_dev != standby_dev))
    return -ENODEV;

> 
> 	vlan_vids_del_by_dev(slave_dev, failover_dev);
> 	dev_uc_unsync(slave_dev, failover_dev);
> 
