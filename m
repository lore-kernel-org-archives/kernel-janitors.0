From: David Miller <davem@davemloft.net>
Date: Mon, 02 Oct 2017 05:57:43 +0000
Subject: Re: [PATCH] net: hns3: Fix an error handling path in 'hclge_rss_init_hw()'
Message-Id: <20171001.225743.584554872378988701.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170930053434.4558-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170930053434.4558-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, linyunsheng@huawei.com, lipeng321@huawei.com, colin.king@canonical.com, arnd@arndb.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 Sep 2017 07:34:34 +0200

> If this sanity check fails, we must free 'rss_indir'. Otherwise there is a
> memory leak.
> 'goto err' as done in the other error handling paths to fix it.
> 
> Fixes: 46a3df9f9718 ("net: hns3: Fix for setting rss_size incorrectly")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
