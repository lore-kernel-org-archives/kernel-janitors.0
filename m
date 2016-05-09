From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 May 2016 20:03:59 +0000
Subject: re: qlcnic: Add support to enable capability to extend minidump for iSCSI
Message-Id: <20160509200359.GA24843@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Shahed Shaikh,

The patch d01a6d3c8ae1: "qlcnic: Add support to enable capability to
extend minidump for iSCSI" from Aug 7, 2015, leads to the following
static checker warning:

	drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c:1441 qlcnic_83xx_get_minidump_template()
	error: we previously assumed 'hdr' could be null (see line 1440)

drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c
  1424          if (fw_dump->tmpl_hdr = NULL || current_version > prev_version) {
                     ^^^^^^^^^^^^^^^^
This could be NULL.

  1425                  vfree(fw_dump->tmpl_hdr);
                              ^^^^^^^^^^^^^^^^^
Or freed.

  1426  
  1427                  if (qlcnic_83xx_md_check_extended_dump_capability(adapter))
  1428                          extended = !qlcnic_83xx_extend_md_capab(adapter);
  1429  
  1430                  if (!qlcnic_fw_cmd_get_minidump_temp(adapter))
  1431                          dev_info(&pdev->dev, "Supports FW dump capability\n");
  1432  
  1433                  /* Once we have minidump template with extended iSCSI dump
  1434                   * capability, update the minidump capture mask to 0x1f as
  1435                   * per FW requirement
  1436                   */
  1437                  if (extended) {
  1438                          struct qlcnic_83xx_dump_template_hdr *hdr;
  1439  
  1440                          hdr = fw_dump->tmpl_hdr;
                                ^^^^^^^^^^^^^^^^^^^^^^^^
But we are still dereferencing it here.

  1441                          hdr->drv_cap_mask = 0x1f;
  1442                          fw_dump->cap_mask = 0x1f;
  1443                          dev_info(&pdev->dev,
  1444                                   "Extended iSCSI dump capability and updated capture mask to 0x1f\n");
  1445                  }
  1446          }

regards,
dan carpenter
