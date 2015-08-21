From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Aug 2015 08:46:56 +0000
Subject: [patch] Input: sentelic - silence some underflow warnings
Message-Id: <20150821084656.GA25369@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

I have a static checker that complains when we check for an upper bound
but don't have a coresponding check for a lower bound.  With this code,
the upper bound check seems not really required, so it is not a bug to
leave the lower bound check out as well.  But let's silence the warning
by making these variables unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/mouse/sentelic.c b/drivers/input/mouse/sentelic.c
index cc7e0d4..11c32ac 100644
--- a/drivers/input/mouse/sentelic.c
+++ b/drivers/input/mouse/sentelic.c
@@ -432,7 +432,7 @@ static int fsp_onpad_hscr(struct psmouse *psmouse, bool enable)
 static ssize_t fsp_attr_set_setreg(struct psmouse *psmouse, void *data,
 				   const char *buf, size_t count)
 {
-	int reg, val;
+	unsigned int reg, val;
 	char *rest;
 	ssize_t retval;
 
@@ -440,7 +440,7 @@ static ssize_t fsp_attr_set_setreg(struct psmouse *psmouse, void *data,
 	if (rest = buf || *rest != ' ' || reg > 0xff)
 		return -EINVAL;
 
-	retval = kstrtoint(rest + 1, 16, &val);
+	retval = kstrtouint(rest + 1, 16, &val);
 	if (retval)
 		return retval;
 
@@ -476,9 +476,10 @@ static ssize_t fsp_attr_set_getreg(struct psmouse *psmouse, void *data,
 					const char *buf, size_t count)
 {
 	struct fsp_data *pad = psmouse->private;
-	int reg, val, err;
+	unsigned int reg, val;
+	int err;
 
-	err = kstrtoint(buf, 16, &reg);
+	err = kstrtouint(buf, 16, &reg);
 	if (err)
 		return err;
 
@@ -511,9 +512,10 @@ static ssize_t fsp_attr_show_pagereg(struct psmouse *psmouse,
 static ssize_t fsp_attr_set_pagereg(struct psmouse *psmouse, void *data,
 					const char *buf, size_t count)
 {
-	int val, err;
+	unsigned int val;
+	int err;
 
-	err = kstrtoint(buf, 16, &val);
+	err = kstrtouint(buf, 16, &val);
 	if (err)
 		return err;
 
