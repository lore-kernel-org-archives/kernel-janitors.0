From: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
Date: Tue, 04 Sep 2018 16:36:49 +0000
Subject: Re: [PATCH v2 net-next] failover: Add missing check to validate 'slave_dev' in net_failover_slave_un
Message-Id: <463f089f-f613-a90b-1978-9c903efd6834@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535771205-156540-1-git-send-email-yuehaibing@huawei.com>
 <1536029786-21710-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536029786-21710-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <stephen@networkplumber.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Liran Alon <liran.alon@oracle.com>, Joao Martins <joao.m.martins@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/3/2018 7:56 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/net_failover.c: In function 'net_failover_slave_unregister':
> drivers/net/net_failover.c:598:35: warning:
>   variable 'primary_dev' set but not used [-Wunused-but-set-variable]
>
> There should check the validity of 'slave_dev'.
>
> Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Sridhar Samudrala <sridhar.samudrala@intel.com>


> ---
> v2: use WARN_ON_ONCE as Liran Alon suggested
> ---
>   drivers/net/net_failover.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
> index 7ae1856..5a749dc 100644
> --- a/drivers/net/net_failover.c
> +++ b/drivers/net/net_failover.c
> @@ -603,6 +603,9 @@ static int net_failover_slave_unregister(struct net_device *slave_dev,
>   	primary_dev = rtnl_dereference(nfo_info->primary_dev);
>   	standby_dev = rtnl_dereference(nfo_info->standby_dev);
>   
> +	if (WARN_ON_ONCE(slave_dev != primary_dev && slave_dev != standby_dev))
> +		return -ENODEV;
> +
>   	vlan_vids_del_by_dev(slave_dev, failover_dev);
>   	dev_uc_unsync(slave_dev, failover_dev);
>   	dev_mc_unsync(slave_dev, failover_dev);
>
