From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:34:16 +0000
Subject: [PATCH 6/9] fs/dlm: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032334010.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

hlist_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E,E1,E2;
statement S,S1,S2;
@@

I(x,...) { <...
- (x != NULL) &&
  E
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/dlm/lowcomms.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c0d35c6..37a34c2 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -248,7 +248,7 @@ static struct connection *assoc2con(int assoc_id)
 
 	for (i = 0 ; i < CONN_HASH_SIZE; i++) {
 		hlist_for_each_entry(con, h, &connection_hash[i], list) {
-			if (con && con->sctp_assoc = assoc_id) {
+			if (con->sctp_assoc = assoc_id) {
 				mutex_unlock(&connections_lock);
 				return con;
 			}
