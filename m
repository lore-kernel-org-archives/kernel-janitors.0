From: Ido Schimmel <idosch@mellanox.com>
Date: Fri, 10 Aug 2018 15:23:21 +0000
Subject: Re: [PATCH] mlxsw: remove unused arrays mlxsw_i2c_driver_name and mlxsw_pci_driver_name
Message-Id: <20180810152321.GA11917@splinter.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180810075328.26400-1-colin.king@canonical.com>
In-Reply-To: <20180810075328.26400-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 10, 2018 at 08:53:28AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Arrays mlxsw_i2c_driver_name and mlxsw_pci_driver_name are defined
> but never used hence they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: 'mlxsw_i2c_driver_name' defined but not used
> warning: 'mlxsw_pci_driver_name' defined but not used
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Thanks!
