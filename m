From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 12 Aug 2013 17:55:35 +0000
Subject: Configure DMA atributes?
Message-Id: <CA+MoWDo8nhoomstYJx6Q5Krj-m=_swmpMu2iE5aHRH-gDf-QEQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

There are some PCI Ethernet drivers with code similar to:

From: drivers/net/ethernet/realtek/8139cp.c

        /* Configure DMA attributes. */
        if ((sizeof(dma_addr_t) > 4) &&
            !pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) &&
            !pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
                pci_using_dac = 1;
        } else {
                pci_using_dac = 0;

                rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
                if (rc) {
                        dev_err(&pdev->dev,
                                "No usable DMA configuration, aborting\n");
                        goto err_out_res;
                }
                rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
                if (rc) {
                        dev_err(&pdev->dev,
                                "No usable consistent DMA
configuration, aborting\n");
                        goto err_out_res;
                }
        }

What is this code supposed to do?

I did tests inside two KVM virtual machines using rtl8139 virtual
network interface. One VM configured for x86_64 and the other
configured for i686. On both VMs this code makes no visible difference
at all. I can remove the code completely, or leave only parts of it,
the result is always the same. The 8139cp module is loaded
successfully and the network works after loading the module. Nothing
is shown on dmesg.

If I comment the assignment to pci_using_dac, the compiler issues
warnings, but it makes no visible difference to assign 1 or 0.

If I had real hardware what could I brake by playing with this code?

Thanks!




-- 
Peter
