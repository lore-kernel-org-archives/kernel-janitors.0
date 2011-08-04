From: David Miller <davem@davemloft.net>
Date: Thu, 04 Aug 2011 08:30:45 +0000
Subject: Re: [PATCH 2/2] drivers/ide/cy82c693.c: Add missing pci_dev_put
Message-Id: <20110804.013045.68180626611349178.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311870407-22461-2-git-send-email-julia@diku.dk>
In-Reply-To: <1311870407-22461-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 18:26:47 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> Pci_get_slot calls pci_dev_get, so pci_dev_put is needed before leaving the
> function in the case where pci_get_slot is locally used.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks!
