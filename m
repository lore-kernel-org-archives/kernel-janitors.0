From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:44 +0000
Subject: [PATCH v2 09/17] Staging: quickstart: Use switch-case in quickstart_acpi_notify
Message-Id: <1326320574-11220-10-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index b183d21..17e57c0 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -180,15 +180,19 @@ static void quickstart_acpi_notify(acpi_handle handle, u32 event, void *data)
 	if (!quickstart)
 		return;
 
-	if (event = QUICKSTART_EVENT_WAKE)
+	switch (event) {
+	case QUICKSTART_EVENT_WAKE:
 		quickstart_data.pressed = quickstart->btn;
-	else if (event = QUICKSTART_EVENT_RUNTIME) {
+		break;
+	case QUICKSTART_EVENT_RUNTIME:
 		input_report_key(quickstart_input, quickstart->btn->id, 1);
 		input_sync(quickstart_input);
 		input_report_key(quickstart_input, quickstart->btn->id, 0);
 		input_sync(quickstart_input);
+		break;
+	default:
+		break;
 	}
-	return;
 }
 
 static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
-- 
1.7.8.3


