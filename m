From: Kent Yoder <key@linux.vnet.ibm.com>
Date: Tue, 04 Sep 2012 16:18:21 +0000
Subject: [PATCH] tpm: fix tpm_acpi sparse warning on different address spaces
Message-Id: <20120904161819.GB20588@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120830143839.GA9589@linux.vnet.ibm.com>
 <20120830174556.GD20741@mwanda>
 <20120830192155.GA25524@linux.vnet.ibm.com>
 <20120902163030.GB1840@mwanda>
In-Reply-To: <20120902163030.GB1840@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

acpi_os_map_memory expects its return value to be in the __iomem address
space. Tag the variable we're using as such and use memcpy_fromio to
avoid further sparse warnings.

Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>
---
 drivers/char/tpm/tpm_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_acpi.c b/drivers/char/tpm/tpm_acpi.c
index fe3fa94..56051d0 100644
--- a/drivers/char/tpm/tpm_acpi.c
+++ b/drivers/char/tpm/tpm_acpi.c
@@ -49,7 +49,7 @@ int read_log(struct tpm_bios_log *log)
 {
 	struct acpi_tcpa *buff;
 	acpi_status status;
-	struct acpi_table_header *virt;
+	void __iomem *virt;
 	u64 len, start;
 
 	if (log->bios_event_log != NULL) {
@@ -102,7 +102,7 @@ int read_log(struct tpm_bios_log *log)
 		return -EIO;
 	}
 
-	memcpy(log->bios_event_log, virt, len);
+	memcpy_fromio(log->bios_event_log, virt, len);
 
 	acpi_os_unmap_memory(virt, len);
 	return 0;
-- 
1.7.11.4

