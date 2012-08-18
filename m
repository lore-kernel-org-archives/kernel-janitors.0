From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 18 Aug 2012 13:46:13 +0000
Subject: drivers/scsi/ipr.c:8448:2-19: alloc with no test
Message-Id: <20120818134613.GA11000@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian King <brking@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Wayne Boyer <wayneb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org

Hi Brian,

FYI, coccinelle warns about

  drivers/scsi/ipr.c:8448:2-19: alloc with no test, possible model on line 8457

vi +8448 drivers/scsi/ipr.c

  8443         if (ioa_cfg->sis64) {
  8444                 ioa_cfg->target_ids = kzalloc(sizeof(unsigned long) *
  8445                                               BITS_TO_LONGS(ioa_cfg->max_devs_supported), GFP_KERNEL);
  8446                 ioa_cfg->array_ids = kzalloc(sizeof(unsigned long) *
  8447                                              BITS_TO_LONGS(ioa_cfg->max_devs_supported), GFP_KERNEL);
> 8448                 ioa_cfg->vset_ids = kzalloc(sizeof(unsigned long) *
  8449                                             BITS_TO_LONGS(ioa_cfg->max_devs_supported), GFP_KERNEL);
  8450         }
  8451   

Thanks,
Fengguang
