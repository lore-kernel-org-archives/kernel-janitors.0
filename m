From: Olof Johansson <olof@lixom.net>
Date: Mon, 01 Dec 2008 17:43:27 +0000
Subject: Re: [PATCH] drivers/mtd/nand/pasemi_nand.c: Add missing pci_dev_put
Message-Id: <20081201174327.GA21274@lixom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811271319070.15160@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811271319070.15160@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org

On Thu, Nov 27, 2008 at 01:19:49PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> pci_get_device increments a reference count that should be decremented
> using pci_dev_put.  I have thus added an extra label in the error handling
> code to do this.  I don't know, however, whether there should be a
> pci_dev_put before the return 0 as well.
> 
[...]

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Olof Johansson <olof@lixom.net>

