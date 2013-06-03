From: David Miller <davem@davemloft.net>
Date: Mon, 03 Jun 2013 04:40:05 +0000
Subject: Re: [PATCH net-next] bnx2x: fix a power state test
Message-Id: <20130602.214005.1774370170369806654.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370163746-30745-1-git-send-email-yuvalmin@broadcom.com>
In-Reply-To: <1370163746-30745-1-git-send-email-yuvalmin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuvalmin@broadcom.com
Cc: netdev@vger.kernel.org, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org, ariele@broadcom.com, eilong@broadcom.com

From: "Yuval Mintz" <yuvalmin@broadcom.com>
Date: Sun, 2 Jun 2013 12:02:26 +0300

> If PCIe supports PM capabilities, bnx2x will always claim eeprom is accessible
> as PCI_D0 is zero.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yuval Mintz <yuvalmin@broadcom.com>
> Signed-off-by: Ariel Elior <ariele@broadcom.com>
> Signed-off-by: Eilon Greenstein <eilong@broadcom.com>

Applied, thanks.
