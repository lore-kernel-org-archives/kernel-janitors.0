From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 12:56:00 +0000
Subject: [PATCH v2 5/8] drivers/media/dvb-frontends/stb6100.c: Removes useless kfree()
Message-Id: <1347454564-5178-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Remove useless kfree() and clean up code related to the removal.

The semantic patch that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
position p1,p2;
expression x;
@@

if (x@p1 = NULL) { ... kfree@p2(x); ... return ...; }

@unchanged exists@
position r.p1,r.p2;
expression e <= r.x,x,e1;
iterator I;
statement S;
@@

if (x@p1 = NULL) { ... when != I(x,...) S
                        when != e = e1
                        when != e += e1
                        when != e -= e1
                        when != ++e
                        when != --e
                        when != e++
                        when != e--
                        when != &e
   kfree@p2(x); ... return ...; }

@ok depends on unchanged exists@
position any r.p1;
position r.p2;
expression x;
@@

... when != true x@p1 = NULL
kfree@p2(x);

@depends on !ok && unchanged@
position r.p2;
expression x;
@@

*kfree@p2(x);
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/dvb-frontends/stb6100.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/stb6100.c b/drivers/media/dvb-frontends/stb6100.c
index 2e93e65..45f9523 100644
--- a/drivers/media/dvb-frontends/stb6100.c
+++ b/drivers/media/dvb-frontends/stb6100.c
@@ -575,8 +575,8 @@ struct dvb_frontend *stb6100_attach(struct dvb_frontend *fe,
 	struct stb6100_state *state = NULL;
 
 	state = kzalloc(sizeof (struct stb6100_state), GFP_KERNEL);
-	if (state = NULL)
-		goto error;
+	if (!state)
+		return NULL;
 
 	state->config		= config;
 	state->i2c		= i2c;
@@ -587,10 +587,6 @@ struct dvb_frontend *stb6100_attach(struct dvb_frontend *fe,
 
 	printk("%s: Attaching STB6100 \n", __func__);
 	return fe;
-
-error:
-	kfree(state);
-	return NULL;
 }
 
 static int stb6100_release(struct dvb_frontend *fe)

