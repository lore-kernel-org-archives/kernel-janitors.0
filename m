From: James Smart <james.smart@emulex.com>
Date: Mon, 09 Aug 2010 14:03:26 +0000
Subject: Re: [patch] lpfc: change spin_lock_irq() to spin_lock()
Message-Id: <4C600AAE.8030507@emulex.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807221517.GC9031@bicker>
In-Reply-To: <20100807221517.GC9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, James Smart <james.smart@emulex.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Alex Iannicelli <alex.iannicelli@emulex.com>, linux-scsi@v



Dan Carpenter wrote:
> In lpfc_cleanup_pending_mbox() we already have IRQs disabled so we don't
> need to disable them again.
> 
> Also in lpfc_sli_intr_handler() there is a typo where it has
> spin_unlock_irq() instead of just spin_unlock().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c

Acked-by: James Smart <james.smart@emulex.com>

Thank You.

-- james s
