From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:20:43 +0000
Subject: [PATCH 13/42] drivers/serial/68360serial.c: Adjust confusing if
Message-Id: <Pine.LNX.4.64.1008052220270.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/serial/68360serial.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/serial/68360serial.c b/drivers/serial/68360serial.c
index 0dff3bb..5e19b6c 100644
--- a/drivers/serial/68360serial.c
+++ b/drivers/serial/68360serial.c
@@ -960,7 +960,7 @@ static void change_speed(ser_info_t *info)
 	 * !!! ignore all characters if CREAD is not set
 	 */
 	if ((cflag & CREAD) = 0)
-	 info->read_status_mask &= ~BD_SC_EMPTY;
+		info->read_status_mask &= ~BD_SC_EMPTY;
 	 local_irq_save(flags);
 
 	 /* Start bit has not been added (so don't, because we would just
