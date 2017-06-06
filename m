From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Jun 2017 16:30:55 +0000
Subject: [PATCH] atomisp: ensure that status values > 7 are reported as errors
Message-Id: <20170606163055.16445-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?= <jeremy.lefaure@lse.epita.fr>, Joe Perches <joe@perches.com>, inux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current code checks if a status value is greater than 7 and
sets the status string as "ERROR" and then over writes the
string based on the bottom 3 bits of the value. Instead, fix this by
only checking on the bottom 3 bits of the value if the value is less
than 8.

Detected by CoverityScan, CID#1416607 ("Unused value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../css2400/runtime/debug/src/ia_css_debug.c       | 141 +++++++++++----------
 1 file changed, 72 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c
index bcc0d464084f..80d6fe29f30d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c
@@ -765,28 +765,29 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 
 	val = state->fsm_sync_status;
 
-	if (val > 7)
+	if (val > 7) {
 		fsm_sync_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_sync_status_str = "idle";
-		break;
-	case 1:
-		fsm_sync_status_str = "request frame";
-		break;
-	case 2:
-		fsm_sync_status_str = "request lines";
-		break;
-	case 3:
-		fsm_sync_status_str = "request vectors";
-		break;
-	case 4:
-		fsm_sync_status_str = "send acknowledge";
-		break;
-	default:
-		fsm_sync_status_str = "unknown";
-		break;
+	} else {
+		switch (val & 0x7) {
+		case 0:
+			fsm_sync_status_str = "idle";
+			break;
+		case 1:
+			fsm_sync_status_str = "request frame";
+			break;
+		case 2:
+			fsm_sync_status_str = "request lines";
+			break;
+		case 3:
+			fsm_sync_status_str = "request vectors";
+			break;
+		case 4:
+			fsm_sync_status_str = "send acknowledge";
+			break;
+		default:
+			fsm_sync_status_str = "unknown";
+			break;
+		}
 	}
 
 	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n",
@@ -799,34 +800,35 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 
 	val = state->fsm_crop_status;
 
-	if (val > 7)
+	if (val > 7) {
 		fsm_crop_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_crop_status_str = "idle";
-		break;
-	case 1:
-		fsm_crop_status_str = "wait line";
-		break;
-	case 2:
-		fsm_crop_status_str = "crop line";
-		break;
-	case 3:
-		fsm_crop_status_str = "crop pixel";
-		break;
-	case 4:
-		fsm_crop_status_str = "pass pixel";
-		break;
-	case 5:
-		fsm_crop_status_str = "pass line";
-		break;
-	case 6:
-		fsm_crop_status_str = "lost line";
-		break;
-	default:
-		fsm_crop_status_str = "unknown";
-		break;
+	} else {
+		switch (val & 0x7) {
+		case 0:
+			fsm_crop_status_str = "idle";
+			break;
+		case 1:
+			fsm_crop_status_str = "wait line";
+			break;
+		case 2:
+			fsm_crop_status_str = "crop line";
+			break;
+		case 3:
+			fsm_crop_status_str = "crop pixel";
+			break;
+		case 4:
+			fsm_crop_status_str = "pass pixel";
+			break;
+		case 5:
+			fsm_crop_status_str = "pass line";
+			break;
+		case 6:
+			fsm_crop_status_str = "lost line";
+			break;
+		default:
+			fsm_crop_status_str = "unknown";
+			break;
+		}
 	}
 	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n",
 			    "FSM Crop Status", val, fsm_crop_status_str);
@@ -852,28 +854,29 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 
 	val = state->fsm_padding_status;
 
-	if (val > 7)
+	if (val > 7) {
 		fsm_padding_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_padding_status_str = "idle";
-		break;
-	case 1:
-		fsm_padding_status_str = "left pad";
-		break;
-	case 2:
-		fsm_padding_status_str = "write";
-		break;
-	case 3:
-		fsm_padding_status_str = "right pad";
-		break;
-	case 4:
-		fsm_padding_status_str = "send end of line";
-		break;
-	default:
-		fsm_padding_status_str = "unknown";
-		break;
+	} else {
+		switch (val & 0x7) {
+		case 0:
+			fsm_padding_status_str = "idle";
+			break;
+		case 1:
+			fsm_padding_status_str = "left pad";
+			break;
+		case 2:
+			fsm_padding_status_str = "write";
+			break;
+		case 3:
+			fsm_padding_status_str = "right pad";
+			break;
+		case 4:
+			fsm_padding_status_str = "send end of line";
+			break;
+		default:
+			fsm_padding_status_str = "unknown";
+			break;
+		}
 	}
 
 	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n", "FSM Padding Status",
-- 
2.11.0

