From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 13 Jul 2016 04:33:40 +0000
Subject: Error handling in drivers/pci/host/pcie-xilinx.c
Message-Id: <nm4gb7$hvv$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

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


