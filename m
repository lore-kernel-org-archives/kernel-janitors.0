Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B343909B1
	for <kernel-janitors@vger.kernel.org>; Fri, 29 May 2026 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095512; cv=none; b=RXI8kY88WM0HL2FmJt0OFfSXalgeabyjj4KjOWZz4GcKZFTiSpOyjl0B16aJ4KVOGj5GlJ0T5w3vfgI1+cu8evzaoyNuIW4Sy/7+/+3P7kjG967XBhJp426eYcSGYzk/cZSSwPmbIqX2j5tELTKJj2IvrXPtPDaq/Jd9s8EZ6rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095512; c=relaxed/simple;
	bh=ptw36ihhOIzTsxqr1eMO0bzZoqrv11FTm8UZmCwLNM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNWykyQ60eaBUWzZxPLAGDLmkuBRHjlkNzJ44Xc2aQkNh9UdnDrCWSX6p/gu78VUMwHkyCU/Z/vf55yfSESDBEzLjX1dkJCMoz5vk4qPPibbxGQhqtX2gQTjMfuLR4Mw4wkUKtramewCuzprdjy55L3xzgF+qW3bx6M8GkgsGU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0kTL+Z6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0kTL+Z6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso125117745e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 29 May 2026 15:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780095510; x=1780700310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4iesyYDPlSTsntkLH8m0VqrZNjF44k6q6gTGsFUht8k=;
        b=o0kTL+Z6sqxqXFQG01iRrJV6mv14N7sBxVUKmybz/E//D4xrCEjaefhnVQxTCh4boz
         Lzd+vEQAcTbMeJuufCwKapHGGf9t16ZnbGGLkFHGdDeR7kssKb0FTQCVVSYzai+iLK5w
         YT4W3bp4bwf3dHrbKePwPHzY6k/Tl+69trIbqjwEzQeGhBpqynZz1dXdAtqElVEokO7/
         D9uqK954121Hzo+R04GJmzcIH8ogTd7vOeTOPG3sHCf8MDej2vXExmM6ym7EIQ6DfbXp
         GwHfUHeL8VQE01TQI9FtnLLa9VIAVijhUx6o1LfeFrJqw714ZqZwBifNT7AdI4wxpyp6
         0HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780095510; x=1780700310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iesyYDPlSTsntkLH8m0VqrZNjF44k6q6gTGsFUht8k=;
        b=Qm2TEa3ZuIAY8L0vV60RqVI17peQ9JwH6SGthGM9/mzIf3buJe3PCuUBa66LXgnp/U
         uc92GXigTgV7mTXeGZiCzlUhcyRZbBFo/9B5/nQDk/vKweTRM30oPgpSXQifRIANxb65
         ynw01Ig5rHRBxx3VamK4F7bcPrZ4GafODccecwRFcAtXU2rs+S9cISEGsurwp2iBy289
         9S0MaAWRAb+kDhphWZrehv+gVO0EKVg789WsHMosYg4GpsiQsKyl6zfsnwh2BkUezMkF
         SZ/G24gUxJpxmJIczNGGMBhBb88iRxcuwARhzei+f1X89oouuLQqD0p1LWszNfrBSmsO
         eOsg==
X-Forwarded-Encrypted: i=1; AFNElJ/+rt/36QOEiLpFT/3WnhZTCo03KTkdVW/MJMnkxrcYCqWc2hJa22aFbeaWu9T9MGE7eL+f2s6y9bvdTuEuYAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYGxCmN7I2PGr32UHp9P1ts0UEH3jdfswD4S04zazmvItWoqU
	5BbfMn91WOZ9Rbgl+hf0fZlHqYwTJ0Oa+oEuMxei757eWSlxovpv4zUm
X-Gm-Gg: Acq92OELAEA4fiIsPzI5WnrdrPBPvKKc38uBfpcicHST+GxNlzAVBWFuVDEtJtqFTPn
	AYdzsyRp5LsPSiAdN3eGtlmBfIh0nvDfDrD0D4PIJezLU9l42VsJQ8X6M5sRTquKlt30luW74nz
	zLP9Lc6pcZhgWJtxgcZkAuGfxQkJSsWmN1kvKIem33OQ3kL8cPLuIHl4CsvMshnxtUueV+fo+4f
	g2IW9MvhqYEGuahNSE12sW10q5aT8bx5TVS/a5o0kAuGc8PDiAtl4jVb9khWSJpwocHcP1acXiO
	qVfF8qgFyJPYIb8zSAmVqwLI4yo8IxD/V2hvk7gFsUzoTgOLtz+nSDyk+TH4qdxKV+fOKunzDQO
	XJZ2TOfgV3kbsFMbaZWd0zKDeWqn2osZSRsJMxVD5KoaJRDk3/eVjJ7MGne2tv3NTBYibrKMynd
	XoFiFko48XYYDS+j1uKkFsinopw5jNXqsw5fcLaihS
X-Received: by 2002:a05:600c:450d:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490a2951a54mr22943045e9.33.1780095509756;
        Fri, 29 May 2026 15:58:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909cab7b00sm73451845e9.14.2026.05.29.15.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 15:58:29 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] include/linux/splice.h: trivial fix: declerations -> declarations
Date: Fri, 29 May 2026 22:58:13 +0000
Message-ID: <20260529225813.546405-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fix: declerations -> declarations

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---

This patch is for VFS tree.

---
 include/linux/splice.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/splice.h b/include/linux/splice.h
index 9dec4861d..8f6b17079 100644
--- a/include/linux/splice.h
+++ b/include/linux/splice.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Function declerations and data structures related to the splice
+ * Function declarations and data structures related to the splice
  * implementation.
  *
  * Copyright (C) 2007 Jens Axboe <jens.axboe@oracle.com>

base-commit: 9215e74f228f2b239f41271da9e5076ee3439d1b
-- 
2.47.3

