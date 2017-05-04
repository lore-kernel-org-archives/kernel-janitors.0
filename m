From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 May 2017 20:10:48 +0000
Subject: [PATCH 3/9] drbd: Drop unnecessary static
Message-Id: <1493928654-18768-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any use, on every possible execution path through the function.  The static
has no benefit, and dropping it reduces the code size.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@

static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@

-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

The change in code size is indicates by the following output from the size
command.

before:
   text    data     bss     dec     hex filename
  67299    2291    1056   70646   113f6 drivers/block/drbd/drbd_nl.o

after:
   text    data     bss     dec     hex filename
  67283    2291    1056   70630   113e6 drivers/block/drbd/drbd_nl.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/drbd/drbd_nl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 02255a0..ad0fcb4 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -2294,7 +2294,7 @@ static bool conn_ov_running(struct drbd_connection *connection)
 static enum drbd_ret_code
 check_net_options(struct drbd_connection *connection, struct net_conf *new_net_conf)
 {
-	static enum drbd_ret_code rv;
+	enum drbd_ret_code rv;
 	struct drbd_peer_device *peer_device;
 	int i;
 

