From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2012 06:12:22 +0000
Subject: [patch] [SCSI] pmcraid: find_first_zero_bit() takes bits not bytes
Message-Id: <20120502061222.GA1111@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The find_first_zero_bit() function takes the size in bits not bytes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index ea8a0b4..b0f6f0b 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -5379,7 +5379,7 @@ static unsigned short pmcraid_get_minor(void)
 {
 	int minor;
 
-	minor = find_first_zero_bit(pmcraid_minor, sizeof(pmcraid_minor));
+	minor = find_first_zero_bit(pmcraid_minor, PMCRAID_MAX_ADAPTERS);
 	__set_bit(minor, pmcraid_minor);
 	return minor;
 }
