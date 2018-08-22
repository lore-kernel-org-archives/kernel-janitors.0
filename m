From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Aug 2018 13:22:58 +0000
Subject: [bug report] bus: ti-sysc: Fix module register ioremap for larger offsets
Message-Id: <20180822132258.rh5u5kenlx2anuvs@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tony Lindgren,

The patch 7180c523efca: "bus: ti-sysc: Fix module register ioremap
for larger offsets" from Aug 8, 2018, leads to the following static
checker warning:

	drivers/bus/ti-sysc.c:518 sysc_ioremap()
	warn: unsigned 'size' is never less than zero.

drivers/bus/ti-sysc.c
   499  /**
   500   * syc_ioremap - ioremap register space for the interconnect target module
   501   * @ddata: device driver data
   502   *
   503   * Note that the interconnect target module registers can be anywhere
   504   * within the interconnect target module range. For example, SGX has
   505   * them at offset 0x1fc00 in the 32MB module address space. And cpsw
   506   * has them at offset 0x1200 in the CPSW_WR child. Usually the
   507   * the interconnect target module registers are at the beginning of
   508   * the module range though.
   509   */
   510  static int sysc_ioremap(struct sysc *ddata)
   511  {
   512          u32 size;
   513  
   514          size = max3(ddata->offsets[SYSC_REVISION],
   515                      ddata->offsets[SYSC_SYSCONFIG],
   516                      ddata->offsets[SYSC_SYSSTATUS]);
   517  
   518          if (size < 0)
                    ^^^^^^^^
It's weird that we don't trust the offsets.  Can the += 4 overflow?

   519                  return -EINVAL;
   520  
   521          size += 4;
   522  
   523          ddata->module_va = devm_ioremap(ddata->dev,
   524                                          ddata->module_pa,
   525                                          size);
   526          if (!ddata->module_va)
   527                  return -EIO;
   528  
   529          return 0;
   530  }

regards,
dan carpenter
