From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Nov 2014 18:14:14 +0000
Subject: [PATCH 3/4] staging: unisys: remove unneeded structure
Message-Id: <1417371255-2282-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417371255-2282-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417371255-2282-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Romer <benjamin.romer@unisys.com>
Cc: kernel-janitors@vger.kernel.org, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete a local structure that is only used to be initialized by memset.

A semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x,i;
@@

{
... when any
-struct i x;
<+... when != x
- memset(&x,...);
...+>
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/unisys/visorchipset/visorchipset_main.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/unisys/visorchipset/visorchipset_main.c b/drivers/staging/unisys/visorchipset/visorchipset_main.c
index c8f7bea..7e6be32 100644
--- a/drivers/staging/unisys/visorchipset/visorchipset_main.c
+++ b/drivers/staging/unisys/visorchipset/visorchipset_main.c
@@ -1940,7 +1940,6 @@ static HOSTADDRESS controlvm_get_channel_address(void)
 static void
 controlvm_periodic_work(struct work_struct *work)
 {
-	struct visorchipset_channel_info chanInfo;
 	struct controlvm_message inmsg;
 	BOOL gotACommand = FALSE;
 	BOOL handle_command_failed = FALSE;
@@ -1955,8 +1954,6 @@ controlvm_periodic_work(struct work_struct *work)
 	if (visorchipset_clientregwait && !clientregistered)
 		goto Away;
 
-	memset(&chanInfo, 0, sizeof(struct visorchipset_channel_info));
-
 	Poll_Count++;
 	if (Poll_Count >= 250)
 		;	/* keep going */

