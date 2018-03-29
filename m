From: David Miller <davem@davemloft.net>
Date: Thu, 29 Mar 2018 18:36:48 +0000
Subject: Re: [PATCH net-next] net: cavium: use module_pci_driver to simplify the code
Message-Id: <20180329.143648.41406520497524761.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241515-77766-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241515-77766-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: rad@semihalf.com, aleksey.makarov@cavium.com, pombredanne@nexb.com, jglauber@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:55 +0000

> Use the module_pci_driver() macro to make the code simpler
> by eliminating module_init and module_exit calls.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
