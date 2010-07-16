From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 02:07:11 +0000
Subject: Re: [PATCH 21/25] isdn/hardware/eicon: Convert pci_table entries
Message-Id: <20100715.190711.28819238.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152104.45958.PeterHuewe@gmx.de>
In-Reply-To: <201007152104.45958.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: PeterHuewe@gmx.de
Cc: kernel-janitors@vger.kernel.org, mac@melware.de, isdn@linux-pingi.de, arnd@arndb.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 21:04:45 +0200

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
> PCI_VDEVICE macro, and thus improves readability.
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Applied.
