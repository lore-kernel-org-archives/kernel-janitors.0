Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21F12B96
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 05:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gXpkr7t5"
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id FSTZrpnVkgRU5FSTar0C39; Tue, 19 Dec 2023 06:17:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702963026;
	bh=QDDqKuTgraiQIw4koE+NaTIronTlA6Us494Q0sE/Agw=;
	h=From:To:Cc:Subject:Date;
	b=gXpkr7t5CfyXPM/SNEMlNBMsMOjtgoNDPKQKPa9f7Brvamv7+CQVTfMTkK1XR1lXw
	 G5dXkpm55H7nuRmJQpZBF+dYWmrxVbVuO7f1ot/V8llN34yYei9qzzmV8pmlrEE0q8
	 1QXoHKtvT2U6V8tnDqUZoBMqEdd/xslrkb3sdRxau9jtQHpyODcS+t4qdiJprOXAsE
	 JHJ6ffV631b85Kd6A7mUlLuR/q4KqHZOBlj6knstnh7D5FPhKLUpl9OjA8StC3D9Bk
	 P6aDXr8pz6qJTtuDF0qDpagDCvUJb2DLmVRa8DFat4LWZ/DYaYINVyks1jc9XB2Wha
	 n7v+nVJHlIu2Q==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Dec 2023 06:17:06 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] vboxsf: Remove usage of the deprecated ida_simple_xx() API
Date: Tue, 19 Dec 2023 06:17:04 +0100
Message-Id: <2752888783edaed8576777e1763dc0489fd07000.1702963000.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/vboxsf/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
index 1fb8f4df60cb..cd8486bc91bd 100644
--- a/fs/vboxsf/super.c
+++ b/fs/vboxsf/super.c
@@ -155,7 +155,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 
-	sbi->bdi_id = ida_simple_get(&vboxsf_bdi_ida, 0, 0, GFP_KERNEL);
+	sbi->bdi_id = ida_alloc(&vboxsf_bdi_ida, GFP_KERNEL);
 	if (sbi->bdi_id < 0) {
 		err = sbi->bdi_id;
 		goto fail_free;
@@ -221,7 +221,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 	vboxsf_unmap_folder(sbi->root);
 fail_free:
 	if (sbi->bdi_id >= 0)
-		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
+		ida_free(&vboxsf_bdi_ida, sbi->bdi_id);
 	if (sbi->nls)
 		unload_nls(sbi->nls);
 	idr_destroy(&sbi->ino_idr);
@@ -268,7 +268,7 @@ static void vboxsf_put_super(struct super_block *sb)
 
 	vboxsf_unmap_folder(sbi->root);
 	if (sbi->bdi_id >= 0)
-		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
+		ida_free(&vboxsf_bdi_ida, sbi->bdi_id);
 	if (sbi->nls)
 		unload_nls(sbi->nls);
 
-- 
2.34.1

