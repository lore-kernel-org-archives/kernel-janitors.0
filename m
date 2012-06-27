From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:04:52 +0000
Subject: [patch 3/3 -resend] [SCSI] pmcraid: find_first_zero_bit() takes bits not bytes
Message-Id: <20120627090452.GL31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The find_first_zero_bit() function takes the size in bits not bytes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch was originally sent on Wed, 2 May 2012.

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index a38dade..719619a 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -5376,7 +5376,7 @@ static unsigned short pmcraid_get_minor(void)
 {
 	int minor;
 
-	minor = find_first_zero_bit(pmcraid_minor, sizeof(pmcraid_minor));
+	minor = find_first_zero_bit(pmcraid_minor, PMCRAID_MAX_ADAPTERS);
 	__set_bit(minor, pmcraid_minor);
 	return minor;
 }
