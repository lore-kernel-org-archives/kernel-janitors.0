Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878611CDA3C
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583973; cv=none; b=UPA5OQ5t8EnfIyERAV0D26a9PdLHrmwhNfcpI+5BsDDgEQmkx6+dBkofRxUfaf+zQbH3X5pSF8WQ3pZpW+knMC2XXrlb511/Kvaa4iSwj9VE+TK4Khtq7OgI9NN7vEgzsSrnxPn/bWum3C1pLjNDb/7QLENYevgZWS7/0LLAzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583973; c=relaxed/simple;
	bh=ldQLIidAq3XSrv1H+wr586pudMJ5rZs4x1TZh0YPAbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+7ul0SHEsgbhVcaJsi7aPzvkocyaP2J/aZCJ3g2ghDK55n9cgHJaiosj9fsDvNdRnuHOVQz3jpfnfseZfws//5pu/16wpvl3xQweywMutnWoFjppOiykie+mb9W7BmTP/l43tV7CwYt/y/BbXSKBKxYsUTvPPwTta5Yx+84yLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=w58brkkt; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="w58brkkt"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20b8be13cb1so13264175ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728583972; x=1729188772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Ikuhi33gkCIoLfXtInuXs32ry1GdG7/p1R2O08x7Q=;
        b=w58brkktEhQWz7RcTWZhy1WH5wJe4yF91xIA7/dJrpcQQmmojdotyIkx1WCicFuToe
         T+8O3Fsdd7ItNEV/ALx8afey2WUL4pGPLTFkZ+WdrtxeBZovCF5CyY21qykNTywKZEuH
         3vHYT1nulYDJ3Xfx/3+IfKgx2nhNo+PNS42fpyW4L366a0KCv0izhlK9i2zRco9ZixYC
         Ijix4lxrRbC8oLgoxwu2tuJq6BbNt3/fgTceEkCenpSprLLTxZY5JAHSspwmzbNDITak
         5B+x5R/C9ix065RfRoWDnimbNCNaKuiO0PS6LzLNlzK4e/jaySNcE7ALy+qAy0/46r56
         OvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583972; x=1729188772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2Ikuhi33gkCIoLfXtInuXs32ry1GdG7/p1R2O08x7Q=;
        b=uszlMx+6Z6KzoJ8gcsNSXhMJGUGbS1xAwDex6V4EO6iXt/a7d/1VI6q5+tnoFOLg7u
         sF+3Vs5pw/QSZHfhQmQn/a152kNKK0qG9fDsOi2yYZvCBbu2/ZW1MUQlvht39+ph5Ud5
         UpR4Xra8aWsY5/9OuWZmJzhIINqsaqJsND1wqusZgOmLYyhS9bmJfP1s3zadQXKXOeBI
         i5KmIsJ8GOFWmWbPnLiGJIDOoNW5QmoWAeYH92vxp5YG75PLfSLTIOXkVfcfXrX0LF6y
         4pmzAsrPrG5kMG7WsB7oQTMX/wyul5ruIJeclua8O0BdGCRCAKSkFT/HumWeCnrri/Le
         DIVA==
X-Forwarded-Encrypted: i=1; AJvYcCWTIZPxdUM6muf4gEaGvpLlo+CGHwNPAHqD1AbLxA4iEybKyNe//f1dAvOmmXCssSHMVxKHRyDw4CXzmLbTF4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMxlmzUh74crwe3EMR3f60rl9IsUPho5zQrKit7Qkr91oee6VC
	ODquc7tapdG1BzuVryn4vgnQnvI0PVYbokC+Mlwhr3qf2h1bP/pvOKFdghPCpLY=
X-Google-Smtp-Source: AGHT+IGrb5VGtSEu9KmvvevlzQDjJSErZq0lhnojNnBzr72kJlQ7bv63piP0wdViZzr+N15omjEafw==
X-Received: by 2002:a17:903:244e:b0:20c:5b98:8cd7 with SMTP id d9443c01a7336-20c637f84aemr120365205ad.38.1728583971732;
        Thu, 10 Oct 2024 11:12:51 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.16])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ea448e468asm1306575a12.4.2024.10.10.11.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:12:50 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: akpm@linux-foundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mm/execmem: Remove logically deadcode in execmem.c
Date: Thu, 10 Oct 2024 12:10:58 -0600
Message-ID: <20241010181102.5522-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NULL check of variable `area` within the `mas_for_each` loop is
unnecessary, as the varialbe `area` can never be NULL. So, the
`continue` statement inside the if block is never reached.

Remove the if block that performs the NULL check.

This was reported by Coverity Scan:
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600362

Fixes: d44c3485820e ("execmem: add support for cache of large ROX pages")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 mm/execmem.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 9c6ff9687860..97706d8ed720 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -75,9 +75,6 @@ static void execmem_cache_clean(struct work_struct *work)
 	mas_for_each(&mas, area, ULONG_MAX) {
 		size_t size;
 
-		if (!area)
-			continue;
-
 		size = mas_range_len(&mas);
 
 		if (IS_ALIGNED(size, PMD_SIZE) &&
-- 
2.43.0

