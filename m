From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:01:04 +0000
Subject: [patch] scsi: qedi: silence sprintf() overflow warning
Message-Id: <20170207130103.GA31552@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com, Thomas Gleixner <tglx@linutronix.de>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem here is this:

	sprintf(host_buf, "qedi_ofld%d", qedi->shost->host_no);

host_buf is 16 character so we only have 6 characters left for
->host_no.  But ->host_no is set in scsi_host_alloc():

	index = ida_simple_get(&host_index_ida, 0, 0, GFP_KERNEL);

It could theoretically go up to 0x8000000 so we need space for 10
digits.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index 5eda21d903e9..0dcf3b08230c 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -1735,7 +1735,7 @@ static int __qedi_probe(struct pci_dev *pdev, int mode)
 	u32 dp_module = 0;
 	u8 dp_level = 0;
 	bool is_vf = false;
-	char host_buf[16];
+	char host_buf[20];
 	struct qed_link_params link_params;
 	struct qed_slowpath_params sp_params;
 	struct qed_probe_params qed_params;
