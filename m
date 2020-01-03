From: Simon Horman <simon.horman@netronome.com>
Date: Fri, 03 Jan 2020 08:27:55 +0000
Subject: Re: [PATCH net-next] ethtool: remove set but not used variable 'lsettings'
Message-Id: <20200103082755.GG12930@netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200103034856.177906-1-yuehaibing@huawei.com>
In-Reply-To: <20200103034856.177906-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Michal Kubecek <mkubecek@suse.cz>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Fri, Jan 03, 2020 at 03:48:56AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/ethtool/linkmodes.c: In function 'ethnl_set_linkmodes':
> net/ethtool/linkmodes.c:326:32: warning:
>  variable 'lsettings' set but not used [-Wunused-but-set-variable]
>   struct ethtool_link_settings *lsettings;
>                                 ^
> It is never used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Simon Horman <simon.horman@netronome.com>
