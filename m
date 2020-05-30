From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Sat, 30 May 2020 09:43:38 +0000
Subject: Re: [PATCH] scsi: cumana_2: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <20200530094338.GE1551@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073555.577414-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530073555.577414-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, May 30, 2020 at 09:35:55AM +0200, Christophe JAILLET wrote:
> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> So use 'host' in both cases.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is itself wrong.  cumanascsi_2_intr() requires "info" as the devid.
Either cumanascsi_2_intr() needs changing to use shost_priv(host) along
with this change, or free_irq() needs changing to use "info".

Likely the same for the other patches, I haven't looked.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
