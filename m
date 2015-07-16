From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2015 20:17:13 +0000
Subject: [PATCH] Bluetooth: cmtp: Do not use list_for_each_safe when not needed
Message-Id: <7a32b5e113be6344c436791e5ce7c17e8f2b4e68.1437077656.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, gustavo@padovan.org, johan.hedberg@gmail.com, davem@davemloft.net
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use the safe version of list_for_each here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/bluetooth/cmtp/capi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/cmtp/capi.c b/net/bluetooth/cmtp/capi.c
index b0c6c6a..4c5e3e0 100644
--- a/net/bluetooth/cmtp/capi.c
+++ b/net/bluetooth/cmtp/capi.c
@@ -100,9 +100,9 @@ static void cmtp_application_del(struct cmtp_session *session, struct cmtp_appli
 static struct cmtp_application *cmtp_application_get(struct cmtp_session *session, int pattern, __u16 value)
 {
 	struct cmtp_application *app;
-	struct list_head *p, *n;
+	struct list_head *p;
 
-	list_for_each_safe(p, n, &session->applications) {
+	list_for_each(p, &session->applications) {
 		app = list_entry(p, struct cmtp_application, list);
 		switch (pattern) {
 		case CMTP_MSGNUM:
@@ -511,13 +511,13 @@ static int cmtp_proc_show(struct seq_file *m, void *v)
 	struct capi_ctr *ctrl = m->private;
 	struct cmtp_session *session = ctrl->driverdata;
 	struct cmtp_application *app;
-	struct list_head *p, *n;
+	struct list_head *p;
 
 	seq_printf(m, "%s\n\n", cmtp_procinfo(ctrl));
 	seq_printf(m, "addr %s\n", session->name);
 	seq_printf(m, "ctrl %d\n", session->num);
 
-	list_for_each_safe(p, n, &session->applications) {
+	list_for_each(p,  &session->applications) {
 		app = list_entry(p, struct cmtp_application, list);
 		seq_printf(m, "appl %d -> %d\n", app->appl, app->mapping);
 	}
-- 
2.1.4

