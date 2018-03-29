From: David Miller <davem@davemloft.net>
Date: Thu, 29 Mar 2018 18:35:20 +0000
Subject: Re: [PATCH net-next] net: hns3: remove unnecessary pci_set_drvdata() and devm_kfree()
Message-Id: <20180329.143520.180872666601831050.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241461-77556-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241461-77556-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:01 +0000

> The devm_kfree function allocates memory that is released when a

devm_kfree doesn't allocate memory, it frees it.

Your commit log message is confusing at best.  I know what you're
trying to say, but a lot of the logic is reversed or hard to
understand.

Thank you.
