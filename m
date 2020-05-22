From: David Miller <davem@davemloft.net>
Date: Fri, 22 May 2020 00:14:31 +0000
Subject: Re: [PATCH 0/2 v3] net: ethernet: ti: fix some return value check
Message-Id: <20200521.171431.915213255847424378.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520034116.170946-1-weiyongjun1@huawei.com>
In-Reply-To: <20200520034116.170946-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: netdev@vger.kernel.org, grygorii.strashko@ti.com, christophe.jaillet@wanadoo.fr, colin.king@canonical.com, kuba@kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 20 May 2020 11:41:14 +0800

> This patchset convert cpsw_ale_create() to return PTR_ERR() only, and
> changed all the caller to check IS_ERR() instead of NULL.
> 
> Since v2:
> 1) rebased on net.git, as Jakub's suggest
> 2) split am65-cpsw-nuss.c changes, as Grygorii's suggest

Series applied, thanks.
