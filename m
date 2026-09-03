Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E84E140D
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449133; cv=none; b=DAacDtpXqbtz+rS9ak+klcgdvf9DUNmg9GT8bnjhn/Vxjk9hqZBCU/IPASOMYrAwMu3fh5+j2aaEX5sHuLl5cRzZnAJVKlFKfo8yPH+1m35qPEFBBBkgrFf4a5CNphkqa/CoJzzlR8xYF/1DdxJCBCqPY7ujs/uVt2wbhqhAxPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449133; c=relaxed/simple;
	bh=7x6k3CoQtycsyrx00Mon8kDDGXAjBXWuI79x9y09/hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IDUacqbpfgSA/X9PMaD5ca2HZ3lC3e1pyLrF51pvwzwh6MMzz8CDhZ3FM2IF0j8Cwdjt6eyySWQ779wFxDZn9zWbN0VYMlSkSOTfo3fpGVrXoFsNkdztMduL00mMNfTRLqfItvfPUYlSha43Z2l9/eOInkMnCICVj2WaKtliiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLFzdNuF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLFzdNuF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20246385e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449129; x=1789053929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJ0eJNAdxkEACL4i1LkrRsC16NHPzemhDd0NbgM2FuQ=;
        b=rLFzdNuF+VH/qrjJa+Yz5hBrq3j3PxpCtBYtDeTm/6uZyBRcPLEJ4quXkdUPjn8I+m
         VU8iv0A1YbeIKwtRuSdBTp2wtPIqSYcqIOkrR1T+OOVmiCiwzqkusQ+U8JdjZFxpnI/t
         2tWinf64tPsXJqPk5sEjdfWTZiWaNqLLI2DhbaV2b9O/io+S90sYGhiy8/YcStU07ytW
         WjoVFb1SiyXFWKeHoHsTvPasjkZ03EH4kjTGyytZpjnRadcgbj6gXN5KiedaRy4bmkAx
         TKpqd5e4msOmr/qK/1hYCYBvkt/gkaVTmH7/1FRP+Cs+c+11Zx8+As6sN+NOX+5LyaN2
         GAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449129; x=1789053929;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJ0eJNAdxkEACL4i1LkrRsC16NHPzemhDd0NbgM2FuQ=;
        b=kJeTn/dt2xkl6+/DKcxBUObTY1VlC2pO7NMLrdlafFc5I/PW0pPXDQng39q1xlqMuL
         g8+GyG5P9r/GIbp+4SLmS0IBWZHDqzTn7on566MDgi++1oZW6s6jv/D7zSEEcwELL5S6
         7iDzPXJ1d4L6Mg9s95LSgyaLXtn641wdiSMWacX1njXbaUe1iwY9KSp5C+3ivMDlQ+rm
         wr3EbtDRSn06DoNBlkjISloyCM+fj9HNdj+7OkpJOsmFFctBp0KmQe15N1bLEvGZeJWp
         ecGnWuBEPjMb6DZO8KBvWM+cICgpQ1Q2d1Ab2Dz+phKUyf/LsBKLC9fKT7etBEaC/Qs7
         m06g==
X-Gm-Message-State: AFuF++nxN9qHLtM+VuWOrdDpbnA/Pk9NzarfLwT3AkT6TBneoRB8+g6H
	xYQ+8G+t9uxpBNbUTPdA0poxIYQMUTnEiRLvkhVQzE9oLQYH8RvS9o8k+zdxQxkm
X-Gm-Gg: AYBFou1N3uY1PjZmIAc1l4zKtZENZXowVOvXG5jw8FCwrtNAWkLWFP7lUlJTbRyVB31
	75dLJgQdE0tHaRfyh7G+T32uM+sdhcINJqPmFjvE/RBOyddVU82ud9l2ry/DKhXz7nSMr2p7k2Y
	7zh/+v/jPWZU02KKIwLDcODrKXPnN8HV1EVO41RVi6v1AOpBZTcCifKdnNukCXVe6tOiY9/7WCG
	l6iwUvnLgJKBlEbczSqcJxaQzoHFEgbkzLuvGz21WMc/Z1CqFwUQMhPkwU+GGFPdLjuah5THEum
	ejzPGR5ypO3YR1e0cqZNMl/uhtRcwuhKmLWUfRdP0NBW+axj04h/y+U4jMqZ25lX49Sdvdlc+Zy
	THW5ujPlnxU9k+s7BeLhzIzYeAwMh/qcbyi7JAMU29VbscH4dwxTaKRbmYduK7tLx57a+uH0Hsb
	LBXCQzUTPHqKGnJfzQaqmgmZGY6SEgupBVWE9eAFg7h4cGLBYt+wRoFnIBGFU=
X-Received: by 2002:a05:600c:1d11:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49ce582a54amr228971615e9.14.1788449128877;
        Thu, 03 Sep 2026 08:25:28 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm93729425e9.12.2026.09.03.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:25:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matthew Sakai <msakai@redhat.com>,
	dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dm vdo: Fix spelling mistake "postive" -> "positive"
Date: Thu,  3 Sep 2026 16:23:25 +0100
Message-ID: <20260903152325.16304-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is another spelling mistake in a vdo_log_error message that
I somehow overlooked last time. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
index 1d8375cc3c3e..043549b1fc2e 100644
--- a/drivers/md/dm-vdo/dm-vdo-target.c
+++ b/drivers/md/dm-vdo/dm-vdo-target.c
@@ -443,7 +443,7 @@ static int __must_check parse_slab_size(const char *slab_str, block_count_t *sla
 
 	result = kstrtoull(slab_str, 10, &value);
 	if (result) {
-		vdo_log_error("optional parameter error: invalid slab size, must be a postive integer");
+		vdo_log_error("optional parameter error: invalid slab size, must be a positive integer");
 		return -EINVAL;
 	}
 
-- 
2.55.0

