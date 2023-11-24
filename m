Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oORGNIuz"
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42428199A
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Nov 2023 13:14:46 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 6dVarrd1vODaN6dVarO0tO; Fri, 24 Nov 2023 22:14:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700860483;
	bh=AjHvTwD5169EQnPtOFzMX5xSY+da/AUya8Bl2YOHLW8=;
	h=From:To:Cc:Subject:Date;
	b=oORGNIuzObs23L1jO9Rtgrfd0oMK5aRQcYUmdX5wUHHnFQoaE0uaY/3FBuYJPh3ot
	 u7RaPUl3Y/Q2+mxq4Ml6ZsTq3c4XKR+198COQl/HwM7mzurkhPRC4+8xMVn2wK2nqI
	 Bn+dx7V41/3NGpPi5vMpNvyacQE0F+8z6B7uaVrxfLz95cjDrJ9ddEDJE8rKDdv8hi
	 nCYvo1M7hBvlWtswH7Pm9Fs7EYWxqLM2UPgXsVh6s6ekbuxQz7r5tQ+wAcTBzBFWFP
	 3tHtHAz906el/xfMeuw7w2OzdMgySt+VUEOzYp1C/mIVXfY8EiAGeisNTykzPjWu09
	 55hEPTaw7Rjzg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 24 Nov 2023 22:14:43 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andriy.shevchenko@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] parport: Save a few bytes of memory
Date: Fri, 24 Nov 2023 22:14:36 +0100
Message-Id: <0eba5f2ddd142ab0f577f67e482d1152b40ee720.1700860416.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of parport_register_dev_model() callers pass a 'name' that is a
constant string.

So kstrdup_const() can be used to save the duplication of this string
when it is not needed. This saves a few bytes of memory.

Use kfree_const() accordingly when this string is freed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/parport/share.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/parport/share.c b/drivers/parport/share.c
index e21831d93305..49c74ded8a53 100644
--- a/drivers/parport/share.c
+++ b/drivers/parport/share.c
@@ -611,7 +611,7 @@ static void free_pardevice(struct device *dev)
 {
 	struct pardevice *par_dev = to_pardevice(dev);
 
-	kfree(par_dev->name);
+	kfree_const(par_dev->name);
 	kfree(par_dev);
 }
 
@@ -682,8 +682,8 @@ parport_register_dev_model(struct parport *port, const char *name,
 			   const struct pardev_cb *par_dev_cb, int id)
 {
 	struct pardevice *par_dev;
+	const char *devname;
 	int ret;
-	char *devname;
 
 	if (port->physport->flags & PARPORT_FLAG_EXCL) {
 		/* An exclusive device is registered. */
@@ -726,7 +726,7 @@ parport_register_dev_model(struct parport *port, const char *name,
 	if (!par_dev->state)
 		goto err_put_par_dev;
 
-	devname = kstrdup(name, GFP_KERNEL);
+	devname = kstrdup_const(name, GFP_KERNEL);
 	if (!devname)
 		goto err_free_par_dev;
 
@@ -804,7 +804,7 @@ parport_register_dev_model(struct parport *port, const char *name,
 	return par_dev;
 
 err_free_devname:
-	kfree(devname);
+	kfree_const(devname);
 err_free_par_dev:
 	kfree(par_dev->state);
 err_put_par_dev:
-- 
2.34.1

