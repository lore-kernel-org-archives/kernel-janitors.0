From: Julia Lawall <julia@diku.dk>
Date: Sun, 12 Jul 2009 07:42:47 +0000
Subject: [PATCH 1/3] drivers/hid: Drop NULL test on list_entry result
Message-Id: <Pine.LNX.4.64.0907120942070.17416@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz, linux-input@vger.kernel.org, gregkh@suse.de, jirislaby@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

list_entry, which is an alias for container_of, cannot return NULL, as
there is no way to add a NULL value to a doubly linked list.

A simplified version of the semantic match that findds this problem is as
follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E;
statement S1,S2;
position p,p1;
@@

*x = list_entry@p(...)
... when != x = E
*if@p1 (x = NULL) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/hid/hid-lgff.c              |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-lgff.c b/drivers/hid/hid-lgff.c
index 95835ea..987abeb 100644
--- a/drivers/hid/hid-lgff.c
+++ b/drivers/hid/hid-lgff.c
@@ -151,11 +151,6 @@ int lgff_init(struct hid_device* hid)
 
 	/* Check that the report looks ok */
 	report = list_entry(report_list->next, struct hid_report, list);
-	if (!report) {
-		err_hid("NULL output report");
-		return -1;
-	}
-
 	field = report->field[0];
 	if (!field) {
 		err_hid("NULL field");
