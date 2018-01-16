From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Jan 2018 10:40:22 +0000
Subject: [PATCH] scsi: storvsc: missing error code in storvsc_probe()
Message-Id: <20180116104022.GA3517@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K. Y. Srinivasan" <kys@microsoft.com>, Cathy Avery <cavery@redhat.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, devel@linuxdriverproject.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We should set the error code if fc_remote_port_add() fails.

Fixes: daf0cd445a21 ("scsi: storvsc: Add support for FC rport.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 3b3d1d050cac..40fc7a590e81 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -1834,8 +1834,10 @@ static int storvsc_probe(struct hv_device *device,
 		fc_host_node_name(host) = stor_device->node_name;
 		fc_host_port_name(host) = stor_device->port_name;
 		stor_device->rport = fc_remote_port_add(host, 0, &ids);
-		if (!stor_device->rport)
+		if (!stor_device->rport) {
+			ret = -ENOMEM;
 			goto err_out4;
+		}
 	}
 #endif
 	return 0;
