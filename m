Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C651FBC
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jan 2024 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705733945; cv=none; b=aVOd6/8QqovmhY0gbe+N+tbeAI5duLEd+hKAEL+PyVCqU3xbBJ23C0HOvqbyeJlTJgBDl8dPZ37qu8YEBLJyV+0RtsY5rv7ckd7iu54gVPnYI8OYWc5zheefkhVGNNF0lm9+JlOT9Q+MQrgd0t7FHA9pZoCKnJBw7+7LGnCoC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705733945; c=relaxed/simple;
	bh=iLUdhhWo7aaI6NNBGbzsfYLNbVys8tgyc3bVY56Gjik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUCJMhF+TrA1Xp6I6xjuq95mMIQcw9hIKCbs9bjmHyUiyZHKjPGmNbWYf44khr3PX+ctQpREBjxXmEx3JVcE/dr1k8q/xWtJvy9SgGAJYE8Vg6LsCh6+U3Zrqbd/hynKgDIhKC1xXcHEoi2fSy9GbTYnZZl7078PpVSa9FBL4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HSIL+65R; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HSIL+65R"
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id R5JcrkgoYBejiR5JdrgS2l; Sat, 20 Jan 2024 07:58:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705733933;
	bh=swo29GFzf9xHjPXqHApVp1CpCySEKUtAyuh+ivXKxUQ=;
	h=From:To:Cc:Subject:Date;
	b=HSIL+65Rtj5Jv/agCYAK7LGEEezmUGxhWlpnklfHBQzQSvkYCVoQY8tEzYKv/hvN4
	 5ZuhOgIzYgV/GlzzYRLJZUrAB/nUqZ0LydGQMlLNyBV3ei0Hyap9Zfb/27JAgrTc4c
	 bruPR+pQJw2oiWZ8ov+4owF5XS60KWO4l+c5nysTCk4PRCv41fPFOoMfLUO5jLHzM1
	 92j2radxR42JzL3myOoXxgtKf8I3uBaF0qv9WZHGw67b+i6lWu8yJPxgI+p1mudX76
	 +1t2pR3x1zIj7zo8E1OnmmZpE9zcw4GoommMUUPbSrMFJoT6TnpMgDxvxYiS0Exx1f
	 J5riGI+tz7y4Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jan 2024 07:58:53 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] platform-msi: Remove usage of the deprecated ida_simple_xx() API
Date: Sat, 20 Jan 2024 07:58:46 +0100
Message-ID: <fd87836efa894aee0ae43e767369c85a2ee7e1ff.1705733916.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_max() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/base/platform-msi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index f37ad34c80ec..ca48d1f60865 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -172,8 +172,8 @@ static int platform_msi_alloc_priv_data(struct device *dev, unsigned int nvec,
 	if (!datap)
 		return -ENOMEM;
 
-	datap->devid = ida_simple_get(&platform_msi_devid_ida,
-				      0, 1 << DEV_ID_SHIFT, GFP_KERNEL);
+	datap->devid = ida_alloc_max(&platform_msi_devid_ida,
+				     (1 << DEV_ID_SHIFT) - 1, GFP_KERNEL);
 	if (datap->devid < 0) {
 		err = datap->devid;
 		kfree(datap);
@@ -191,7 +191,7 @@ static void platform_msi_free_priv_data(struct device *dev)
 	struct platform_msi_priv_data *data = dev->msi.data->platform_data;
 
 	dev->msi.data->platform_data = NULL;
-	ida_simple_remove(&platform_msi_devid_ida, data->devid);
+	ida_free(&platform_msi_devid_ida, data->devid);
 	kfree(data);
 }
 
-- 
2.43.0

