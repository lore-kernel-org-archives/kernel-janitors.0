From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Feb 2019 05:39:13 +0000
Subject: [PATCH] scsi: qla2xxx: check for kstrtol() failure
Message-Id: <20190220053913.GA25196@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error handling was unintentionally left out so it introduces a
Smatch static checker warning:

    drivers/scsi/qla2xxx/qla_attr.c:1655 qla2x00_port_speed_store()
    error: uninitialized symbol 'type'.

Fixes: a7b9ca7fc87a ("scsi: qla2xxx: Add support for setting port speed")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/qla2xxx/qla_attr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index 2eb1ae721a7d..f928c4d3a1ef 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -1652,6 +1652,8 @@ qla2x00_port_speed_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	rval = kstrtol(buf, 10, &type);
+	if (rval)
+		return rval;
 	speed = type;
 	if (type = 40 || type = 80 || type = 160 ||
 	    type = 320) {
-- 
2.17.1
