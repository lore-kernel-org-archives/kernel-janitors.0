From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 21 Jan 2013 12:03:23 +0000
Subject: [PATCH 11/15] tools/lib/traceevent/event-parse.c: adjust duplicate test
Message-Id: <1358773378-4700-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive tests to the same location.  Field was already tested.
Alloc_arg can fail, so test that value instead.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@s exists@
local idexpression y;
expression x,e;
@@

*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
    when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 tools/lib/traceevent/event-parse.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
index 5a824e3..7538a1f 100644
--- a/tools/lib/traceevent/event-parse.c
+++ b/tools/lib/traceevent/event-parse.c
@@ -2481,7 +2481,7 @@ process_dynamic_array(struct event_format *event, struct print_arg *arg, char **
 
 	free_token(token);
 	arg = alloc_arg();
-	if (!field) {
+	if (!arg) {
 		do_warning("%s: not enough memory!", __func__);
 		*tok = NULL;
 		return EVENT_ERROR;

