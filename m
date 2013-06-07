From: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Date: Fri, 07 Jun 2013 13:44:24 +0000
Subject: RE: puzzling code in nvme_configure_admin_queue()
Message-Id: <100D68C7BA14664A8938383216E40DE02ECD7A1E@FMSMSX114.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130607114503.GA7768@debian>
In-Reply-To: <20130607114503.GA7768@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

We have to program the device with the page size so it knows where the page boundaries are.
I could put all this on one logical line like this:

dev->ctrl_config = NVME_CC_ENABLE | NVME_CC_CSS_NVM |
                           ((PAGE_SHIFT - 12) << NVME_CC_MPS_SHIFT |
                           NVME_CC_ARB_RR | NVME_CC_SHN_NONE |
                           NVME_CC_IOSQES | NVME_CC_IOCQES;

in order to shut up the warning, but is that really more readable?
________________________________________
From: Dan Carpenter [dan.carpenter@oracle.com]
Sent: June 7, 2013 4:45 AM
To: Wilcox, Matthew R
Cc: kernel-janitors@vger.kernel.org; Busch, Keith; Verma, Vishal L; Dave Jones
Subject: puzzling code in nvme_configure_admin_queue()

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

