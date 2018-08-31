From: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
Date: Fri, 31 Aug 2018 16:39:38 +0000
Subject: Re: [PATCH net-next] failover: remove set but not used variable 'primary_dev'
Message-Id: <23e9e24a-dfec-e112-0745-d29e4742c057@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535687218-23169-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535687218-23169-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <stephen@networkplumber.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Liran Alon <liran.alon@oracle.com>, Joao Martins <joao.m.martins@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/30/2018 8:46 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/net_failover.c: In function 'net_failover_slave_unregister':
> drivers/net/net_failover.c:598:35: warning:
>   variable 'primary_dev' set but not used [-Wunused-but-set-variable]

Actually this gcc option found a bug.
We need to add this check after accessing primary_dev and standby_dev.

         if (slave_dev != primary_dev && slave_dev != standby_dev)
                 return -ENODEV;

Can you resubmit with the right fix?


>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/net/net_failover.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
> index 7ae1856..e103c94e 100644
> --- a/drivers/net/net_failover.c
> +++ b/drivers/net/net_failover.c
> @@ -595,12 +595,11 @@ static int net_failover_slave_pre_unregister(struct net_device *slave_dev,
>   static int net_failover_slave_unregister(struct net_device *slave_dev,
>   					 struct net_device *failover_dev)
>   {
> -	struct net_device *standby_dev, *primary_dev;
> +	struct net_device *standby_dev;
>   	struct net_failover_info *nfo_info;
>   	bool slave_is_standby;
>   
>   	nfo_info = netdev_priv(failover_dev);
> -	primary_dev = rtnl_dereference(nfo_info->primary_dev);
>   	standby_dev = rtnl_dereference(nfo_info->standby_dev);
>   
>   	vlan_vids_del_by_dev(slave_dev, failover_dev);
>
