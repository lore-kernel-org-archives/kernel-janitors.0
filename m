Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C8568F
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Nov 2023 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YmYTctjN"
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5BBEB
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Nov 2023 02:45:08 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id zacnqtRsUBKTszacoqttjX; Sun, 05 Nov 2023 11:45:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699181105;
	bh=9b85zzslUSMT7EI5O+bY45Xi0oEa+NJhiBDoT4Py3kM=;
	h=From:To:Cc:Subject:Date;
	b=YmYTctjNTeAjCTVWG7IO4d3lf9haWgfL5VQ4C4gOCKG0x8gMkkvZd+AAz4r/pS+kH
	 NG2sOv9e8AdfPl+V8G18Xddd6INznvqog217VqbEa7pGRdPLumwAS8vF9C1bOsP/oa
	 bCmFMBWJGvcExWYthxeBXcWTJzp+fcJTBAuHPms3lebu1cAO519lgdnOiwZoHGV8lo
	 ygJ0tCuXCPtweITlPklBINhK/FvcLEDawmOHgxaHPPhMpQiYMonDy0fWYeYsxm97GH
	 xBy69tve1IfzWadKK4GYhliv3crg+5MeMzQba7V2EPudz2gl9hNUOsYPg1oDRhbqQa
	 /laOR8v7O4+Tg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 Nov 2023 11:45:05 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	keescook@chromium.org,
	willy@infradead.org,
	senozhatsky@chromium.org
Cc: list@mail.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/i915/uc: Simplify an error handling path in uc_fw_rsa_data_create()
Date: Sun,  5 Nov 2023 11:45:01 +0100
Message-Id: <0468666539199f4a440c0a60553b24832a50256a.1699180889.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i915_vma_unpin_and_release() is already called in the error handling path,
there is no need to call it here as well.

It is harmless, because the 2nd call will be a no-op, but it is cleaner
and less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 362639162ed6..228c58f38489 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1216,7 +1216,6 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
 	vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
 						 intel_gt_coherent_map_type(gt, vma->obj, true));
 	if (IS_ERR(vaddr)) {
-		i915_vma_unpin_and_release(&vma, 0);
 		err = PTR_ERR(vaddr);
 		goto unpin_out;
 	}
-- 
2.34.1

