From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 May 2016 08:30:07 +0000
Subject: re: firmware: qcom: scm: Add support for ARM64 SoCs
Message-Id: <20160524083007.GA23462@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Kumar Gala,

The patch 93a30f70d97e: "firmware: qcom: scm: Add support for ARM64
SoCs" from May 12, 2016, leads to the following static checker
warning:

	drivers/firmware/qcom_scm-64.c:154 qcom_scm_call()
	warn: unsigned 'desc->res.a0' is never less than zero.

drivers/firmware/qcom_scm-64.c
   127          do {
   128                  mutex_lock(&qcom_scm_lock);
   129  
   130                  cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL,
   131                                           qcom_smccc_convention,
   132                                           ARM_SMCCC_OWNER_SIP, fn_id);
   133  
   134                  do {
   135                          arm_smccc_smc(cmd, desc->arginfo, desc->args[0],
   136                                        desc->args[1], desc->args[2], x5, 0, 0,
   137                                        &desc->res);
   138                  } while (desc->res.a0 = QCOM_SCM_INTERRUPTED);
   139  
   140                  mutex_unlock(&qcom_scm_lock);
   141  
   142                  if (desc->res.a0 = QCOM_SCM_V2_EBUSY) {
   143                          if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
   144                                  break;
   145                          msleep(QCOM_SCM_EBUSY_WAIT_MS);
   146                  }
   147          }  while (desc->res.a0 = QCOM_SCM_V2_EBUSY);
   148  
   149          if (args_virt) {
   150                  dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
   151                  kfree(args_virt);
   152          }
   153  
   154          if (desc->res.a0 < 0)
                    ^^^^^^^^^^^^^^^^
This is never true.  It's an unsigned long now but probably it should be
changed to an int?

   155                  return qcom_scm_remap_error(desc->res.a0);
   156  
   157          return 0;
   158  }

regards,
dan carpenter
