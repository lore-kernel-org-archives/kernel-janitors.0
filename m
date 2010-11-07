From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sun, 07 Nov 2010 13:10:47 +0000
Subject: [PATCH] hibernation: constify platform_hibernation_ops
Message-Id: <927142.41127.qm@smtp141.mail.ukl.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Patch against mainline.

---

Subject: [PATCH] hibernation: constify platform_hibernation_ops

Derived from the grsecurity patch.

Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
---
 drivers/acpi/sleep.c    |    4 ++--
 include/linux/suspend.h |   24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index 721d93b..5149c9b 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -498,7 +498,7 @@ static void acpi_pm_thaw(void)
 	acpi_enable_all_runtime_gpes();
 }
 
-static struct platform_hibernation_ops acpi_hibernation_ops = {
+static const struct platform_hibernation_ops acpi_hibernation_ops = {
 	.begin = acpi_hibernation_begin,
 	.end = acpi_pm_end,
 	.pre_snapshot = acpi_pm_prepare,
@@ -541,7 +541,7 @@ static int acpi_hibernation_begin_old(void)
  * The following callbacks are used if the pre-ACPI 2.0 suspend ordering has
  * been requested.
  */
-static struct platform_hibernation_ops acpi_hibernation_ops_old = {
+static const struct platform_hibernation_ops acpi_hibernation_ops_old = {
 	.begin = acpi_hibernation_begin_old,
 	.end = acpi_pm_end,
 	.pre_snapshot = acpi_pm_pre_suspend,
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index 2669751..37857e3 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -217,16 +217,16 @@ extern void mark_free_pages(struct zone *zone);
  *	platforms which require special recovery actions in that situation.
  */
 struct platform_hibernation_ops {
-	int (*begin)(void);
-	void (*end)(void);
-	int (*pre_snapshot)(void);
-	void (*finish)(void);
-	int (*prepare)(void);
-	int (*enter)(void);
-	void (*leave)(void);
-	int (*pre_restore)(void);
-	void (*restore_cleanup)(void);
-	void (*recover)(void);
+	int (* const begin)(void);
+	void (* const end)(void);
+	int (* const pre_snapshot)(void);
+	void (* const finish)(void);
+	int (* const prepare)(void);
+	int (* const enter)(void);
+	void (* const leave)(void);
+	int (* const pre_restore)(void);
+	void (* const restore_cleanup)(void);
+	void (* const recover)(void);
 };
 
 #ifdef CONFIG_HIBERNATION
@@ -245,7 +245,7 @@ extern void swsusp_set_page_free(struct page *);
 extern void swsusp_unset_page_free(struct page *);
 extern unsigned long get_safe_page(gfp_t gfp_mask);
 
-extern void hibernation_set_ops(struct platform_hibernation_ops *ops);
+extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
 extern int hibernate(void);
 extern bool system_entering_hibernation(void);
 #else /* CONFIG_HIBERNATION */
@@ -253,7 +253,7 @@ static inline int swsusp_page_is_forbidden(struct page *p) { return 0; }
 static inline void swsusp_set_page_free(struct page *p) {}
 static inline void swsusp_unset_page_free(struct page *p) {}
 
-static inline void hibernation_set_ops(struct platform_hibernation_ops *ops) {}
+static inline void hibernation_set_ops(const struct platform_hibernation_ops *ops) {}
 static inline int hibernate(void) { return -ENOSYS; }
 static inline bool system_entering_hibernation(void) { return false; }
 #endif /* CONFIG_HIBERNATION */
-- 
1.7.3.2.161.g3089c


