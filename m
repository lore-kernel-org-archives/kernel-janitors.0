Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14C14A8A
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HIfwAvNr"
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7E0FD
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 08:55:48 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yDZKqJ4wOLilFyDZKqui3f; Wed, 01 Nov 2023 16:55:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698854147;
	bh=ufZ6eZhZNmydg60KYGYUmr72dJOjnFUCCdCp0lk2s4g=;
	h=From:To:Cc:Subject:Date;
	b=HIfwAvNr4Wr/ZqZITN+UDDI6Sr+OP0ffSXr6wMVGL42Io4gtcI2JevZbjrzSmRSHb
	 sPI5r2tTON9FAGdFrWEhkWCVHArvlw/pkjUzyIm/E0CWmrpmALHSCdoslU/7LDArhu
	 0yLkai4iY4mIAZ9dver1cur852e+lofck18LtFau0yGJdoz3mrgW4p4V2gEI8WsGdk
	 UN5FhiWAH587QA/dCkXrmVLHHApBfoGkV5CjuyieGtowAiWgtocibWW/aBXtKsf3ZF
	 TtgcauYzH7yQz8UUKLZF8RFYqnZTTggBadf9g+V55FohN6L9Myy3hAER7walH0IX+X
	 vn32+War5/CGQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 16:55:47 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: intel-lpss: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 16:55:38 +0100
Message-Id: <a63f3da5745187f5a9b1e2ec0492f2fe2e0b0b8d.1698854117.git.christophe.jaillet@wanadoo.fr>
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
 drivers/mfd/intel-lpss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 9591b354072a..9115ba4c768f 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -405,7 +405,7 @@ int intel_lpss_probe(struct device *dev,
 
 	intel_lpss_init_dev(lpss);
 
-	lpss->devid = ida_simple_get(&intel_lpss_devid_ida, 0, 0, GFP_KERNEL);
+	lpss->devid = ida_alloc(&intel_lpss_devid_ida, GFP_KERNEL);
 	if (lpss->devid < 0)
 		return lpss->devid;
 
@@ -442,7 +442,7 @@ int intel_lpss_probe(struct device *dev,
 	intel_lpss_unregister_clock(lpss);
 
 err_clk_register:
-	ida_simple_remove(&intel_lpss_devid_ida, lpss->devid);
+	ida_free(&intel_lpss_devid_ida, lpss->devid);
 
 	return ret;
 }
@@ -456,7 +456,7 @@ void intel_lpss_remove(struct device *dev)
 	intel_lpss_debugfs_remove(lpss);
 	intel_lpss_ltr_hide(lpss);
 	intel_lpss_unregister_clock(lpss);
-	ida_simple_remove(&intel_lpss_devid_ida, lpss->devid);
+	ida_free(&intel_lpss_devid_ida, lpss->devid);
 }
 EXPORT_SYMBOL_GPL(intel_lpss_remove);
 
-- 
2.34.1

