From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 02:06:10 +0000
Subject: Re: [PATCH 05/25] atm: Convert pci_table entries to PCI_VDEVICE
Message-Id: <20100715.190610.112584064.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152041.08976.PeterHuewe@gmx.de>
In-Reply-To: <201007152041.08976.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: PeterHuewe@gmx.de
Cc: kernel-janitors@vger.kernel.org, chas@cmf.nrl.navy.mil, eric.dumazet@gmail.com, tj@kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 20:41:08 +0200

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
> PCI_VDEVICE macro, and thus improves readability.
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Applied.
