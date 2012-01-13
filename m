From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2012 06:28:34 +0000
Subject: [patch] [media] mb86a20s: fix off by one checks
Message-Id: <20120113062834.GA23737@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Clearly ">=" was intended here instead of ">".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/frontends/mb86a20s.c b/drivers/media/dvb/frontends/mb86a20s.c
index 38778a8..4e6f836 100644
--- a/drivers/media/dvb/frontends/mb86a20s.c
+++ b/drivers/media/dvb/frontends/mb86a20s.c
@@ -535,7 +535,7 @@ static int mb86a20s_get_modulation(struct mb86a20s_state *state,
 		[2] = 0x8e,	/* Layer C */
 	};
 
-	if (layer > ARRAY_SIZE(reg))
+	if (layer >= ARRAY_SIZE(reg))
 		return -EINVAL;
 	rc = mb86a20s_writereg(state, 0x6d, reg[layer]);
 	if (rc < 0)
@@ -568,7 +568,7 @@ static int mb86a20s_get_fec(struct mb86a20s_state *state,
 		[2] = 0x8f,	/* Layer C */
 	};
 
-	if (layer > ARRAY_SIZE(reg))
+	if (layer >= ARRAY_SIZE(reg))
 		return -EINVAL;
 	rc = mb86a20s_writereg(state, 0x6d, reg[layer]);
 	if (rc < 0)
@@ -603,7 +603,7 @@ static int mb86a20s_get_interleaving(struct mb86a20s_state *state,
 		[2] = 0x90,	/* Layer C */
 	};
 
-	if (layer > ARRAY_SIZE(reg))
+	if (layer >= ARRAY_SIZE(reg))
 		return -EINVAL;
 	rc = mb86a20s_writereg(state, 0x6d, reg[layer]);
 	if (rc < 0)
@@ -627,7 +627,7 @@ static int mb86a20s_get_segment_count(struct mb86a20s_state *state,
 		[2] = 0x91,	/* Layer C */
 	};
 
-	if (layer > ARRAY_SIZE(reg))
+	if (layer >= ARRAY_SIZE(reg))
 		return -EINVAL;
 	rc = mb86a20s_writereg(state, 0x6d, reg[layer]);
 	if (rc < 0)
