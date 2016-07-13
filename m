From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 13 Jul 2016 04:58:22 +0000
Subject: Error handling in drivers/pci/host/pcie-xilinx.c
Message-Id: <e451321a-42de-9d5f-bf33-bbcb495ebc6f@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <nm4gb7$hvv$1@ger.gmane.org>
In-Reply-To: <nm4gb7$hvv$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

(resent because of broken cc)


Hi,

in file 'drivers/pci/host/pcie-xilinx.c', error handling in 
'xilinx_pcie_init_irq_domain()' seams to be broken.

The pattern used is:

    if (!var) {
       ...
       dev_err(...);
       return PTR_ERR(var);
    }

so we always return '0', which means success.

Returning PTR_ERR(-EINVAL) or PTR_ERR(-ENODEV) could be, IMHO, better.

Best regards,

CJ



