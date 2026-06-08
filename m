Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C534104B
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939488; cv=none; b=MWqBWZVE2aeTJBwiAdJZCJEzeasRzjJcUAIws+9wdKSFDlTRMhRR5vqlfFMD7JUzp7QfzLp4dNC6ad23ZXKmkB2R5/NI+fJNTsnBTcU4pjo0A4rcmk4Cn4NIY2dRJRYn/gXewtDL9bFzTSD9KUGp+EptMSkF6oa3xp/yIh3P8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939488; c=relaxed/simple;
	bh=dtOF4xxESkWE22xIaERJosO7shaUt4KMtJYvpqo/8Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iXjKd9qwJTguL+jQhMiA3fcRoqbVKeNNHKmuZwzI46YCSVbV2XbGrlCegumVSW1TKcPCVBiLA+RYOfj60bci+wSDejA7yiowcOho7pPDC4QPKXIdudYUOZFjylYfhFf2v2R9F8rXNioLzadPgB/QD3Ku8p52g2skZHLSnuODN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUnHPg5y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUnHPg5y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b12270b3so27846275e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780939486; x=1781544286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W67x2+0CmcWfiVmczD4VTNNBq42SHz8YTBavihCtORQ=;
        b=jUnHPg5yLk0OxcIKpK3k8NFgYXrAmEA91AfVas6YFEB0DNRRj5t6XUl0eVOZ4feChM
         2SsjQIKVHRsZ212p5e/Tkiw0L/xPz6KLIbORw8StMtcpC3oSwyTU659UfSvu5HDQOzL9
         IVCLb78JkX/X4U36GCJfgif4WpwHcLk2wRdsLBOtiYFZZzJ90fq3sofwE8ZkNz4Tzxjl
         so/3bUCLgix9jfnH3yJkJ1LMnU0aDnM6TpGDiA+lRBmqPn2GZkzm1ZiZy1wyS3PQYhsV
         3WEJNSLXxy2XX/AyoQxE24kxe/HX8s6ucGo6z1YS1OMBk6lKfb/iD48VN1KEX147c5U6
         fUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939486; x=1781544286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W67x2+0CmcWfiVmczD4VTNNBq42SHz8YTBavihCtORQ=;
        b=az+C6hPO4U4eUNvsmtiw2B7pHwCDpOSzBuNSNGJJiTs8zzW5B/ZXRsfSz5vzpwZDKf
         z6Vrn7MHe+pezZ33ZGwLAoEMSpMq0GmhWgKPB87Z/S72K2lfgdfaWq3KGc0w4psxhBuf
         tY8+NeQeNztCGdUKyDgpDA0v5MiPXusb/VYku82cuAFyIyptrYilhR8szDwreZQj5IPd
         u31GVyHZ0fhDdVf5miv+5t30K5Rd+HrLyHSXtGflCkYZzy9CS48H/rEkdkGno0Xuk+1z
         PVE97cI2736z+IbP40A1TOY9RiHGAZCZ6X+196R66mfhLgWxM1QP9z2JJ8nxoX9hvPAr
         gXvg==
X-Gm-Message-State: AOJu0YyZ3hOuDqdGXcFki86cFZ0hdNotFUJwTO9cphxWy9CPtNub7t7c
	dLs4K5i4QgMvm7n+dHnU9Uzpgneyzx/KoM+jKFu85wBsaPXCL4Abx7qV
X-Gm-Gg: Acq92OFXF+brhAhhPfm1ixg6axwjm2P1rX5Impw01ITGt7EX8K7m9Feku5MeRcOs4+p
	cJjIZCiM84SAiYx5PDm1UXnluqo4aAKgAph9sMoFPIlHECfaE4t19bBPBsfBzWG7luaIaFdTUR7
	jetUWZwB+KtPbF9DapVREM5oKAmdcdJl/7Heq6cHpyiuqNL7DQCzrmjLKMdeHTA1zbkfEFBzeCM
	CUcBDl16H29s+EemzsRUQ4m/HI+3edKVNoBYnZW5B3tE6P83vYvkniqWW+fi7PwNBQSCc/2UUK5
	ycocpKQ6Mb3ixrEL+ZkAl4WlU+JLAbJscugQhWZHikNgewy4/Blg0JIWFqyLsoKc6R+MlwfS7RX
	/AQekVAI+RSQ0Jn1bJcRr3z1jLb6qHEM9y4Vd9xSkwDT38ErzOEysnhlaSD5e9MR0dOpz2xBir1
	BAC0t4Dr46I1RLCP4M++5U9hveaWGTKh4CFjh891c/P2U=
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr263479625e9.29.1780939485695;
        Mon, 08 Jun 2026 10:24:45 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda363bsm41890020f8f.31.2026.06.08.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:24:45 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/sched: Fix spelling mistake "sumission" -> "submission"
Date: Mon,  8 Jun 2026 18:23:15 +0100
Message-ID: <20260608172315.34626-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
index 90d31888cf92..285546a2218f 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
@@ -599,7 +599,7 @@ static void drm_sched_scheduler_two_clients_test(struct kunit *test)
 	 *  -  qd: Number of outstanding jobs in the client/entity
 	 */
 
-	pr_info(" [pct] - Job sumission progress\n"
+	pr_info(" [pct] - Job submission progress\n"
 " [cps] - Cycles per second\n"
 "  [qd] - Number of outstanding jobs in the client/entity\n");
 	pr_info("%s:\n\t            pct1 cps1 qd1;  pct2 cps2 qd2\n",
-- 
2.53.0

