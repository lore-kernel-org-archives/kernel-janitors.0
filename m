From: David Miller <davem@davemloft.net>
Date: Mon, 27 Apr 2020 20:28:27 +0000
Subject: Re: [PATCH net-next] net: ethernet: ti: fix return value check in k3_cppi_desc_pool_create_name()
Message-Id: <20200427.132827.1256740159726999330.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427093343.157119-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427093343.157119-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: grygorii.strashko@ti.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 09:33:43 +0000

> In case of error, the function gen_pool_create() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
