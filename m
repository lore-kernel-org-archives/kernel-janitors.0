From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:29:20 +0000
Subject: [PATCH] EDAC: remove redundant assignment to variable rc
Message-Id: <20200424112920.12676-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>, linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/edac/sb_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index d414698ca324..19c95943d218 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -3442,7 +3442,7 @@ MODULE_DEVICE_TABLE(x86cpu, sbridge_cpuids);
 
 static int sbridge_probe(const struct x86_cpu_id *id)
 {
-	int rc = -ENODEV;
+	int rc;
 	u8 mc, num_mc = 0;
 	struct sbridge_dev *sbridge_dev;
 	struct pci_id_table *ptable = (struct pci_id_table *)id->driver_data;
-- 
2.25.1
