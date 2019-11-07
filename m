From: Jiri Pirko <jiri@resnulli.us>
Date: Thu, 07 Nov 2019 10:46:33 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: Fix error return code in mlxsw_sp_port_module_info_init()
Message-Id: <20191107104633.GD2200@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106145231.39128-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106145231.39128-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Nov 06, 2019 at 03:52:31PM CET, weiyongjun1@huawei.com wrote:
>Fix to return negative error code -ENOMEM from the error handling
>case instead of 0, as done elsewhere in this function.
>
>Fixes: 4a7f970f1240 ("mlxsw: spectrum: Replace port_to_module array with array of structs")
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Jiri Pirko <jiri@mellanox.com>
