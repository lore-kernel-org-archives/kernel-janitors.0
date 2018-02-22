From: David Miller <davem@davemloft.net>
Date: Thu, 22 Feb 2018 20:34:00 +0000
Subject: Re: [PATCH net] net: aquantia: Fix error handling in aq_pci_probe()
Message-Id: <20180222.153400.848754057860912740.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180222091155.GA9883@mwanda>
In-Reply-To: <20180222091155.GA9883@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: igor.russkikh@aquantia.com, weiyongjun1@huawei.com, pavel.belous@aquantia.com, darcari@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Feb 2018 12:11:55 +0300

> We should check "self->aq_hw" for allocation failure, and also we should
> free it on the error paths.
> 
> Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
