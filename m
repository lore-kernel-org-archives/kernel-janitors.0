From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 22:04:55 +0000
Subject: [PATCH] platform/x86: asus_wmi: remove redundant initialization of variable status
Message-Id: <20200507220455.66681-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index bb7c529d7d16..1909d728a536 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -309,7 +309,7 @@ static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 	struct acpi_buffer input;
 	u64 phys_addr;
 	u32 retval;
-	u32 status = -1;
+	u32 status;
 
 	/*
 	 * Copy to dma capable address otherwise memory corruption occurs as
-- 
2.25.1
