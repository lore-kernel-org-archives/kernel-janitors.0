From: Julia Lawall <julia@diku.dk>
Date: Wed, 02 Jul 2008 19:38:24 +0000
Subject: [PATCH resend] drivers/md: remove null pointer dereference
Message-Id: <Pine.LNX.4.64.0807022136520.4854@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agk@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If pgpath->pg->ps.type is NULL, it is not possible to access its name
field.  Alasdair G Kergon suggested that the field type is actually known
never to be NULL; instead it is its field reinstate_path that is supposed
to be tested.


This problem was found using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

* if (E = NULL)
{
  ... when != if (E = NULL) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -883,7 +883,7 @@ static int reinstate_path(struct pgpath 
 	if (pgpath->path.is_active)
 		goto out;
 
-	if (!pgpath->pg->ps.type) {
+	if (!pgpath->pg->ps.type->reinstate_path) {
 		DMWARN("Reinstate path not supported by path selector %s",
 		       pgpath->pg->ps.type->name);
 		r = -EINVAL;
