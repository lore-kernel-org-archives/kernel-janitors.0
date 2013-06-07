From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2013 11:45:03 +0000
Subject: puzzling code in nvme_configure_admin_queue()
Message-Id: <20130607114503.GA7768@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Matthew,

The patch b60503ba432b: "NVMe: New driver" from Jan 20, 2011, leads 
to the following warning:
"drivers/block/nvme-core.c:1174 nvme_configure_admin_queue()
	 warn: foo |= 0"

drivers/block/nvme-core.c
  1173          dev->ctrl_config = NVME_CC_ENABLE | NVME_CC_CSS_NVM;
  1174          dev->ctrl_config |= (PAGE_SHIFT - 12) << NVME_CC_MPS_SHIFT;
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
How is this used?  Most of the time PAGE_SHIFT is 12 so this
statement is a no-op.  I searched for NVME_CC_MPS_SHIFT but I didn't
find anything.

  1175          dev->ctrl_config |= NVME_CC_ARB_RR | NVME_CC_SHN_NONE;
  1176          dev->ctrl_config |= NVME_CC_IOSQES | NVME_CC_IOCQES;

regards,
dan carpenter

