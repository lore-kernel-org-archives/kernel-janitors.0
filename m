From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 14 Apr 2017 06:27:49 +0000
Subject: Spurious code in drivers/scsi/qla2xxx/qla_os.
Message-Id: <86ffb226-fa9a-ac86-cfdb-34518f46815d@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

the following code looks really spurious to me.
The function 'qla2x00_probe_one' is too hairy for me to understand it 
and propose a patch if needed.

So I just report it to you in case of interest.

(BTW, the code in 'qla2x00_unmap_iobases' looks also quite close to the 
code below. Maybe the 2 should be synchronized)

Best regards,

CJ



diff -u -p ./drivers/scsi/qla2xxx/qla_os.c 
/tmp/nothing/drivers/scsi/qla2xxx/qla_os.c
--- ./drivers/scsi/qla2xxx/qla_os.c
+++ /tmp/nothing/drivers/scsi/qla2xxx/qla_os.c
@@ -3244,8 +3244,6 @@ probe_hw_failed:

  iospace_config_failed:
      if (IS_P3P_TYPE(ha)) {
*        if (!ha->nx_pcibase)
*            iounmap((device_reg_t *)ha->nx_pcibase);
          if (!ql2xdbwr)
              iounmap((device_reg_t *)ha->nxdb_wr_ptr);
      } else {

