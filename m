From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 13 Jul 2016 04:47:35 +0000
Subject: Error handling in drivers/pci/host/pci-dra7xx.c
Message-Id: <nm4h5b$ssj$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

in file 'drivers/pci/host/pci-dra7xx.c', error handling in 
'dra7xx_pcie_init_irq_domain()' seams to be broken.

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


