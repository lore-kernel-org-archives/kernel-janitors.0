From: David Miller <davem@davemloft.net>
Date: Fri, 10 Aug 2018 17:25:14 +0000
Subject: Re: [PATCH] mlxsw: remove unused arrays mlxsw_i2c_driver_name and mlxsw_pci_driver_name
Message-Id: <20180810.102514.302127683896943946.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180810075328.26400-1-colin.king@canonical.com>
In-Reply-To: <20180810075328.26400-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Aug 2018 08:53:28 +0100

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

Applied.
