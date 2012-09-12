From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 12:56:02 +0000
Subject: [PATCH v2 3/8] drivers/media/dvb-frontends/s5h1432.c: Removes useless kfree()
Message-Id: <1347454564-5178-6-git-send-email-peter.senna@gmail.com>
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
 drivers/media/dvb-frontends/s5h1432.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/s5h1432.c b/drivers/media/dvb-frontends/s5h1432.c
index 8352ce1..6ec16a2 100644
--- a/drivers/media/dvb-frontends/s5h1432.c
+++ b/drivers/media/dvb-frontends/s5h1432.c
@@ -351,8 +351,8 @@ struct dvb_frontend *s5h1432_attach(const struct s5h1432_config *config,
 	printk(KERN_INFO " Enter s5h1432_attach(). attach success!\n");
 	/* allocate memory for the internal state */
 	state = kmalloc(sizeof(struct s5h1432_state), GFP_KERNEL);
-	if (state = NULL)
-		goto error;
+	if (!state)
+		return NULL;
 
 	/* setup the state */
 	state->config = config;
@@ -367,10 +367,6 @@ struct dvb_frontend *s5h1432_attach(const struct s5h1432_config *config,
 	state->frontend.demodulator_priv = state;
 
 	return &state->frontend;
-
-error:
-	kfree(state);
-	return NULL;
 }
 EXPORT_SYMBOL(s5h1432_attach);
 

