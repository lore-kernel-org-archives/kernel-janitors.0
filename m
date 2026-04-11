Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776071F5821
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912108; cv=none; b=qilPORO3tCnEv1QVek3yX9zbgRIzW6d+GyGsKO41D6/KLmFumahHEQnIHYr+neHAloweecyHN9nt/DGUIcQ7s0b9J6Gol1sFN3Jl+umLOTNeV9TUfIRLobhQ+Hti8NPZ87GfhXROBtJVurKsxF51htMoFLX2kmA1OKb5k4IXlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912108; c=relaxed/simple;
	bh=vBPOS+Mzqd0qYklI1rlLeYg1G4n0LqVG0JMrgPezwfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fDIFeWmuoE5VCCbKsI7SoxcvfZ+wr8c9YNTR7w2oBZKNCcpXGiEtCMTjnU+ThCu0LwgFhgn1EqaG+UJ9DwtllXG7+IKtSJsjrXQt7t2hPStRBl2yb+pGrtw/JhdDLnPKuS9/OaGxIGlW497SU5WpEU0XAZ46+LPnQTb81MYXIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeWNeaGc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeWNeaGc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ad135063so27926855e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775912106; x=1776516906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sk4BS+NYYx5pChD5+U+ftGqCpaMePJhg1hk3GmMPw8=;
        b=JeWNeaGcVEuMVVFQYis1gFrR6mqYj/vk3CTyHh6QeeTVifUoZlEAhrH/Suea+3aL1s
         5fUhWs89pOHBqehrz0GVfmJImtGM/+Jr4cJrBxEC4ctDEXI+VAxxXF3PkOBaJfBoKfuR
         g/8zsEQLzhRhgkqoKBj75gWStKNlVorHWAJ6+fgyhealNUSILcWJAFqJ+RA595mYDQxJ
         cuZcApIg7HxnhcBzmwd9j4anVkOyNqNYTp1J7WZd3al+iEVGwba5+9OOw78+LuU7zc6Y
         2m0ycQxHYgDYtxcBeQtFLwxMJ+O9r+lDYRaoC9mKv7CFzGTZZDDNGclTwNfs+VnE7lNb
         WWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775912106; x=1776516906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sk4BS+NYYx5pChD5+U+ftGqCpaMePJhg1hk3GmMPw8=;
        b=tHx1IvtiQrIWpMlt85GN1pZyGcRh1Hp8JfMLxWWBHRLNlJAsoY2s5ovEzmEr/lu16k
         sFkp0wqElq13uBQEiofJT4iia4jvVGzR/jkHmrtQa5smimLZq/ATPwagzWY8F7bq8757
         9pTEEO9+UxrFTYMyurT5pll73TrqycY3DrN3uwH2zdmmXVpLoJT1oL7YTVNrOIwPQKAp
         tpG+/TRtry7xMlvagAt3qCGPFNu5JC4EZU1L1y7Jc7hAZLtjG16G+e7dbsRS0p0XXnPk
         ZdwUNPTt2Y1paO/67O3QhedZ6mA1nSbSkFC2HVEOXMA9cFD2vQ06wJ3cVZ6Az52duN8/
         TyOw==
X-Gm-Message-State: AOJu0YztUoqnpqU8+fiFKSiqYhFI0yDfJlJxdhk1g5RQZkoXNbrrv4Cf
	5zMXKscD+ZvQcTIyRxVySawMiAyqBtwD3bV+HdvgK7vaLikcbIHrU4L3
X-Gm-Gg: AeBDieuSIK/Xv0H3wkfhjdhcNjiOmOkB4GyGHRQU8+Hnty2IO2GWwPmq6wlPfL1m12K
	fPYVbGx9BFll1enYo/vYGQ/CH8aX2c/UXtM1vGGLQXEe39hYaabvgQPEVaBRmSWHiZLYNOmznWj
	B9+f8gTsqmY9qFCxDIxsGAN5JmGFo5amdxRYr4ZQDsNLI8qD9QLKS2JPdEuSJjB8Bvjbrb5PK6R
	bDhumdH8tJzL8NUWhzKxRJNMWcdH5IpmzT1XURWv1Wj2UDHuu/MVsyARzcq8jNIqEJe17j4SWfN
	ebYapa2klPsY4g2lzvV1h2l3ubRqSl09nIgqRLt4mDvHyt0Qrml6CcDSnYpUT2nsVmIFoCXZkCi
	kSS/5GJtHeNCb1hJFlq479vQGYKP5oiTp5ZRMFmPyg0H7xySga1aD1FdPGJzQuGK17XJJ1Faip6
	kAWdo1NgEGF1R1BUH38hGBE2lkgGR7GbHC
X-Received: by 2002:a05:600c:35c7:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488d68b27d6mr98565045e9.26.1775912105614;
        Sat, 11 Apr 2026 05:55:05 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a69sm15877244f8f.4.2026.04.11.05.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:55:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hfsplus: remove xattr error message
Date: Sat, 11 Apr 2026 13:53:38 +0100
Message-ID: <20260411125338.165758-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When exercising hfsplus with the stress-ng xattr stressor a large
quantity of somewhat unhelpful error messages "hfsplus: xattr exists
yet" spam the kernel log. Remove these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/hfsplus/xattr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index c70bb6f494b2..e10e1d8a5862 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -301,7 +301,6 @@ int __hfsplus_setxattr(struct inode *inode, const char *name,
 
 	if (!strcmp_xattr_finder_info(name)) {
 		if (flags & XATTR_CREATE) {
-			pr_err("xattr exists yet\n");
 			err = -EOPNOTSUPP;
 			goto end_setxattr;
 		}
@@ -348,7 +347,6 @@ int __hfsplus_setxattr(struct inode *inode, const char *name,
 
 	if (hfsplus_attr_exists(inode, name)) {
 		if (flags & XATTR_CREATE) {
-			pr_err("xattr exists yet\n");
 			err = -EOPNOTSUPP;
 			goto end_setxattr;
 		}
-- 
2.53.0

