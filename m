From: David Miller <davem@redhat.com>
Date: Sun, 01 Sep 2019 19:13:16 +0000
Subject: Re: [PATCH net-next] net: hns3: remove set but not used variable 'qos'
Message-Id: <20190901.121316.444864364160353651.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831122911.181336-1-yuehaibing@huawei.com>
In-Reply-To: <20190831122911.181336-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, linyunsheng@huawei.com, liuzhongzhu@huawei.com, huangguangbin2@huawei.com, lipeng321@huawei.com, tanhuazhong@huawei.com, shenjian15@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 31 Aug 2019 12:29:11 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_restore_vlan_table':
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:8016:18: warning:
>  variable 'qos' set but not used [-Wunused-but-set-variable]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 70a214903da9 ("net: hns3: reduce the parameters of some functions")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
