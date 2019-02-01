From: David Miller <davem@davemloft.net>
Date: Fri, 01 Feb 2019 18:02:25 +0000
Subject: Re: [PATCH net-next] net: hns3: Check for allocation failure
Message-Id: <20190201.100225.1478232033973170808.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201083226.GF8459@kadam>
In-Reply-To: <20190201083226.GF8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yisen.zhuang@huawei.com, liuzhongzhu@huawei.com, salil.mehta@huawei.com, lipeng321@huawei.com, shenjian15@huawei.com, tanhuazhong@huawei.com, linyunsheng@huawei.com, liangfuyun1@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 1 Feb 2019 11:32:26 +0300

> We should return -ENOMEM if the kcalloc() fails.
> 
> Fixes: d174ea75c96a ("net: hns3: add statistics for PFC frames and MAC control frame")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
