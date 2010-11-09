From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Tue, 09 Nov 2010 20:48:49 +0000
Subject: [PATCH 3/3 v2] hibernation: constify platform_hibernation_ops
Message-Id: <285897.77932.qm@smtp128.mail.ukl.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Kees Cook <kees.cook@canonical.com>, Emese Revfy <re.emese@gmail.com>, linux-kernel@vger.kernel.org

Patch against mainline.

Changes since v1: added one hunk; no longer adding "const" qualifier to
pointers in platform_hibernation_ops after seeing
b4144e4f6e3b448d322095ca08af393682a69e33.
---

Subject: [PATCH 3/3] hibernation: constify platform_hibernation_ops

Derived from the grsecurity patch.

Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
---
 drivers/acpi/sleep.c     |    4 ++--
 include/linux/suspend.h  |    4 ++--
 kernel/power/hibernate.c |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index acfa8c3..ba1caf7 100644
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
index bb98383..f45f3cc 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
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
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 657272e..491b81a 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -51,14 +51,14 @@ enum {
 
 static int hibernation_mode = HIBERNATION_SHUTDOWN;
 
-static struct platform_hibernation_ops *hibernation_ops;
+static const struct platform_hibernation_ops *hibernation_ops;
 
 /**
  * hibernation_set_ops - set the global hibernate operations
  * @ops: the hibernation operations to use in subsequent hibernation transitions
  */
 
-void hibernation_set_ops(struct platform_hibernation_ops *ops)
+void hibernation_set_ops(const struct platform_hibernation_ops *ops)
 {
 	if (ops && !(ops->begin && ops->end &&  ops->pre_snapshot
 	    && ops->prepare && ops->finish && ops->enter && ops->pre_restore
-- 
1.7.3.2.161.g3089c

