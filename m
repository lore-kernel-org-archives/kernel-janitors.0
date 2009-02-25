From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 23:08:40 +0000
Subject: [PATCH 1/5] drivers/isdn/capi: fix sparse warning: context imbalance
Message-Id: <20090225230828.5377.29853.stgit@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225230737.5377.31370.stgit@localhost.localdomain>
In-Reply-To: <20090225230737.5377.31370.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Attribute functions with __acquires(...) resp. __releases(...).

Fix this sparse warnings:
  drivers/isdn/capi/kcapi_proc.c:241:13: warning: context imbalance in 'capi_driver_start' - wrong count at exit
  drivers/isdn/capi/kcapi_proc.c:252:13: warning: context imbalance in 'capi_driver_stop' - unexpected unlock

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/isdn/capi/kcapi_proc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/capi/kcapi_proc.c b/drivers/isdn/capi/kcapi_proc.c
index c29208b..50ed778 100644
--- a/drivers/isdn/capi/kcapi_proc.c
+++ b/drivers/isdn/capi/kcapi_proc.c
@@ -239,6 +239,7 @@ static const struct file_operations proc_applstats_ops = {
 // ---------------------------------------------------------------------------
 
 static void *capi_driver_start(struct seq_file *seq, loff_t *pos)
+	__acquires(&capi_drivers_list_lock)
 {
 	read_lock(&capi_drivers_list_lock);
 	return seq_list_start(&capi_drivers, *pos);
@@ -250,6 +251,7 @@ static void *capi_driver_next(struct seq_file *seq, void *v, loff_t *pos)
 }
 
 static void capi_driver_stop(struct seq_file *seq, void *v)
+	__releases(&capi_drivers_list_lock)
 {
 	read_unlock(&capi_drivers_list_lock);
 }

