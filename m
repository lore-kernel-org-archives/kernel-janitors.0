From: Szymon Janc <szymon@janc.net.pl>
Date: Fri, 10 Feb 2012 20:00:13 +0000
Subject: [PATCH 2/3] Staging: quickstart: Fix compilation warning on 64 bit arch
Message-Id: <1328904014-22710-2-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

acpi_size is u32 or u64 depending on architecture. Cast it to
unsigned long and use %lu for printing.

This fix following build warning:
drivers/staging/quickstart/quickstart.c: In function ‘quickstart_acpi_ghid’:
drivers/staging/quickstart/quickstart.c:212:5: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 3 has type ‘acpi_size’ [-Wformat]

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index f6ec8f2..2c8c12b 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -209,8 +209,9 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 		quickstart->button->id = *(uint64_t *)buffer.pointer;
 		break;
 	default:
-		pr_err("%s GHID method returned buffer of unexpected length %u\n",
-				quickstart->button->name, buffer.length);
+		pr_err("%s GHID method returned buffer of unexpected length %lu\n",
+				quickstart->button->name,
+				(unsigned long)buffer.length);
 		ret = -EINVAL;
 		break;
 	}
-- 
1.7.9


