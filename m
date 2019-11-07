From: David Miller <davem@davemloft.net>
Date: Thu, 07 Nov 2019 23:13:28 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: Fix error return code in mlxsw_sp_port_module_info_init()
Message-Id: <20191107.151328.687483368106631813.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106145231.39128-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106145231.39128-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 6 Nov 2019 14:52:31 +0000

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 4a7f970f1240 ("mlxsw: spectrum: Replace port_to_module array with array of structs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
