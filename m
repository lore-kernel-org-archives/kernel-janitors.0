From: David Miller <davem@davemloft.net>
Date: Tue, 16 Oct 2018 05:50:10 +0000
Subject: Re: [PATCH -next] fore200e: fix missing unlock on error in bsq_audit()
Message-Id: <20181015.225010.1963314934467310847.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539572836-187019-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539572836-187019-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: 3chas3@gmail.com, hch@lst.de, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 15 Oct 2018 03:07:16 +0000

> Add the missing unlock before return from function bsq_audit()
> in the error handling case.
> 
> Fixes: 1d9d8be91788 ("fore200e: check for dma mapping failures")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
