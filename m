From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Dec 2014 11:07:30 +0000
Subject: [patch v2] scsi: set fmt to NULL scsi_extd_sense_format() by default
Message-Id: <20141202110729.GA17562@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417277275.2202.35.camel@HansenPartnership.com>
In-Reply-To: <1417277275.2202.35.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

One of the two callers passes an unintialized pointer as "fmt" and
expects it to be set to NULL if there is no format string.  Let's make
this function work as expected.

Fixes: d811b848ebb7 ('scsi: use sdev as argument for sense code printing')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Change scsi_extd_sense_format() instead of the caller

diff --git a/drivers/scsi/constants.c b/drivers/scsi/constants.c
index aee62f6..e2068a2 100644
--- a/drivers/scsi/constants.c
+++ b/drivers/scsi/constants.c
@@ -1271,6 +1271,7 @@ scsi_extd_sense_format(unsigned char asc, unsigned char ascq, const char **fmt)
 	int i;
 	unsigned short code = ((asc << 8) | ascq);
 
+	*fmt = NULL;
 	for (i = 0; additional[i].text; i++)
 		if (additional[i].code12 = code)
 			return additional[i].text;
@@ -1282,6 +1283,8 @@ scsi_extd_sense_format(unsigned char asc, unsigned char ascq, const char **fmt)
 			return additional2[i].str;
 		}
 	}
+#else
+	*fmt = NULL;
 #endif
 	return NULL;
 }
