From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Oct 2017 14:40:33 +0000
Subject: [PATCH] ACPI / sysfs: make function param_set_trace_method_name static
Message-Id: <20171002144033.26965-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function param_set_trace_method_name is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'param_set_trace_method_name' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/acpi/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index 78a5a23010ab..ca80e13aeeb1 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -168,7 +168,8 @@ module_param_cb(debug_level, &param_ops_debug_level, &acpi_dbg_level, 0644);
 
 static char trace_method_name[1024];
 
-int param_set_trace_method_name(const char *val, const struct kernel_param *kp)
+static int param_set_trace_method_name(const char *val,
+				       const struct kernel_param *kp)
 {
 	u32 saved_flags = 0;
 	bool is_abs_path = true;
-- 
2.14.1

