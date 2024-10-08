Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86941E1A27
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Oct 2024 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728420908; cv=none; b=rbfk1Lls88nWXcr8ibjQxW0k7TwXHxdXcn5GvVvF7TCJ5CVQY+HGP3gr2eU4BZl/BXxWjlBIAnnOL8G7Jt9kOmwyIsbce9QRgEvcLY1L1xCFwWv3dKOglkKYm2S6rnRhSZjiTGkytduf6tCr/0EFk4lUMluRUw41LYgj9ZQXyc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728420908; c=relaxed/simple;
	bh=4wQNIu4/Ua8YXW4f38TGr99Bjm+K/ywUOAGfzRyvGLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHmBMZCujTsl8SnCdQI8zp+ylH8OfAVUlyjKKiiZqDqYMwtZNtov/1y7zZOdXeFHJB/qGTv/wb1Ebr3TlsVFYTSiINu89YGJ4/s4aqBQbT/+xFQbRsIY6FIn3Zbmix3brAkSgFNaQuSJdw/p1/8goDVk+XzS9JhRyTVPbDuVNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=u8W271SW reason="signature verification failed"; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="u8W271SW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b9b35c7c7so43673195ad.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728420906; x=1729025706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
        b=u8W271SWslxF5yJIdFPrKRECVQJYttiICI7y/A1ZM9Yrd30i1CHntKDCKeHV5w4IOq
         53E0B7snG9e/8WQ4iZt7lBMqIekPgXIASr+u4ON1LSV56jv8h8+9buwmVSpRrxTVuK1k
         Kkn4MD82rIpqWOF2NIkqM+sV6I8YpVN6Ulx72tpjXkOHPxdySxPCwPrfm60YeyS2ML6H
         on3vcQ2tmDPwro0u0JBL6MJpW7ktgrF7MqFxFjz7xMxgoIVI0g6tRKWCfUYEC0uEu9El
         wLNtaaMtCjZzHjjZp1+IbON6FFi2qHA6AInivWe6X/DBqlnai/juxvKRJ0qZbixKtS2t
         Om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728420906; x=1729025706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
        b=QtF/+2bpIja1k27rM/BUVDuQElFAzuU/blG6UVqPJbHGk1a8tOrdMTbi090ZIPcdB7
         L6/7TwD6v/YiIqk5BxDLa23b2i7s3WV/uQDZmr5apGo7Hvp/jqg5c5Jvsv4ddJIfU7V2
         SXnPM7HFDjltNaJ/rT1ewH4LIcHFQCRXg8Yd3JkHoCCCB6BN8i2a0rDiSPz77VF9zNcO
         Wd/ty67nc2C0yLY7N/fOXBxmdEweLvJdoxsThnB1VzkXh7UAOaphlXTYPq219XrBJH5n
         ln9cDaRpZCG9ZvmVxwCXIxPOerLZ9kOOwTS9dgc1xqUMdjpV6K50RL9jvU91vqp9a1Nk
         Invg==
X-Forwarded-Encrypted: i=1; AJvYcCWunxbTL9C4uvAJYimrYfi0nBJEPMZ/vzpdhmnlbjDTyHmhYBIBY1HFEffUK/RQ/24jAb0x6aSieVAY7bbpTd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJ+S2+Eme6QB0LJQxRPW7Tuplejql9debsH0IkgvfvAKdQuL/
	ysUjBRKO6Bz8TmSeRnABRIHfIHB8VPPdbOLTa+TsiAMkAaC2zOXR8d0rW+kLyW/JPpd8XgOAyT/
	pTYGztw8+
X-Google-Smtp-Source: AGHT+IG5QtndTuvxUc4EQsIUMZuzUEKCOMQYR+xtaqDBDhzPRGHOGMjKNeFwj/pDDHDOMAis6O/BGw==
X-Received: by 2002:a17:902:c411:b0:20b:9f8c:e9de with SMTP id d9443c01a7336-20c6376dfefmr4938325ad.13.1728420906131;
        Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
Received: from localhost.localdomain ([132.178.207.21])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20c13986787sm59611735ad.242.2024.10.08.13.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 13:55:05 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/guc: Fix deference after check
Date: Tue,  8 Oct 2024 14:53:48 -0600
Message-ID: <20241008205352.4480-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `if (!snapshot->copy)` evaluates to True only when `snapshot->copy`
is Null. Thus, derefrencing `snapshot->copy` inside this if block is
equivalent to Null pointer derefrencing.
The `if` condition is now changed to evaluate to true only when
`snapshot->copy` is not Null.
This issue was reported by Coverity Scan.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 7fbc56cceaba..4e1a5e8ba1e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	if (!snapshot->copy) {
+	if (snapshot->copy) {
 		for (i = 0; i < snapshot->num_chunks; i++)
 			kfree(snapshot->copy[i]);
 		kfree(snapshot->copy);
-- 
2.43.0

