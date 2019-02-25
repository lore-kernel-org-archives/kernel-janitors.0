From: Ido Schimmel <idosch@mellanox.com>
Date: Mon, 25 Feb 2019 11:18:30 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: remove set but not used variable 'autoneg_status'
Message-Id: <20190225111828.GA17457@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190225020328.42510-1-yuehaibing@huawei.com>
In-Reply-To: <20190225020328.42510-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jiri Pirko <jiri@mellanox.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 25, 2019 at 02:03:28AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum.c: In function 'mlxsw_sp_port_get_link_ksettings':
> drivers/net/ethernet/mellanox/mlxsw/spectrum.c:3062:5: warning:
>  variable 'autoneg_status' set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit 475b33cb66c9 ("mlxsw: spectrum: Remove unsupported
> eth_proto_lp_advertise field in PTYS")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Thanks!
