From: David Miller <davem@davemloft.net>
Date: Wed, 06 Mar 2019 18:38:10 +0000
Subject: Re: [PATCH net] net: hns3: Fix a logical vs bitwise typo
Message-Id: <20190306.103810.1452574067340135170.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190306081234.GC2625@kadam>
In-Reply-To: <20190306081234.GC2625@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yisen.zhuang@huawei.com, linyunsheng@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Mar 2019 11:12:34 +0300

> There were a couple logical ORs accidentally mixed in with the bitwise
> ORs.
> 
> Fixes: e8149933b1fa ("net: hns3: remove hnae3_get_bit in data path")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Very recent bug.

Applied.
