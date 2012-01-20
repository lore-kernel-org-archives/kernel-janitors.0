From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jan 2012 07:57:14 +0000
Subject: [patch] ACPI, APEI, EINJ, cleanup 0 vs NULL confusion
Message-Id: <20120120075714.GD2295@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: Huang Ying <ying.huang@intel.com>, Tony Luck <tony.luck@intel.com>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

This function is returning pointers.  Sparse complains here:
drivers/acpi/apei/einj.c:262:32: warning:
	Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/apei/einj.c b/drivers/acpi/apei/einj.c
index bb20b03..c89b0e5 100644
--- a/drivers/acpi/apei/einj.c
+++ b/drivers/acpi/apei/einj.c
@@ -259,15 +259,15 @@ static void *einj_get_parameter_address(void)
 
 		v4param = ioremap(paddrv4, sizeof(*v4param));
 		if (!v4param)
-			return 0;
+			return NULL;
 		if (readq(&v4param->reserved1) || readq(&v4param->reserved2)) {
 			iounmap(v4param);
-			return 0;
+			return NULL;
 		}
 		return v4param;
 	}
 
-	return 0;
+	return NULL;
 }
 
 /* do sanity check to trigger table */
