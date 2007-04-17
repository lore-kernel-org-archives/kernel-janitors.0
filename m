From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Tue, 17 Apr 2007 08:30:21 +0000
Subject: [KJ] ATA_DMA_MASK => DMA_64BIT_MASK
Message-Id: <20070417083021.GB22931@traven>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

i'm having a look at the 'pci_set_dma_mask() and friends' task at
http://kernelnewbies.org/KernelJanitors/Todo. greping i found that ATA
drivers use the constant ATA_DMA_MASK in calls to
pci_set_dma_mask(),which is defined as 0xffffffffULL. i wonder if this
should be replaced by DMA_64BIT_MASK

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

     The assumption that what currently exists must necessarily
      exist is the acid that corrodes all visionary thinking
%
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
