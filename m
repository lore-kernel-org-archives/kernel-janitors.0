Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100037D111
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Feb 2026 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772234416; cv=none; b=kkFq2tqVhnqQMr2QoFj2lYvZav017wGFRewWOgN5V5ToYswWWz9zl6BFbLfLDgNMFuwGUHPbC0gmEhT0VqBt9HliaM5PoARS0408UDsr0YBOVU/urYG3yFsmNFnFZGFJaBaBm66zH2x/SHJ0NZ7FqAoUGm67Rspc8gHpx9GI1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772234416; c=relaxed/simple;
	bh=/aRfcc0FWmyP471vD2pIeYTV+OU8HPn9prrbelgUnd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dn684cfKq6vh0yffC01HwYFsDZy0pfSYN6h29G9Qgg7y3nwVazOjgq5+6MR/USJexLMo2E3ivcrDEJ1UOvfGsou5jKSex1dYQ8ORdFlVZ/T+mPlKi6fOjXDoZ3a5AKugD73W+U0Qg+TBtAU2apz4cYKmHqLvttVc3aGxl96+n0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le0ckI7E; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le0ckI7E"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43991064db8so2615069f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Feb 2026 15:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772234414; x=1772839214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwCrpGcqRgHVPpOjWtlEizCs0pzjg1uHQ80GjIVgbPc=;
        b=Le0ckI7EKIEU9Pwu2sUwVJ6eXmxLZQibCWAfcEK4C6x8iLocx/q70A9023IEwXvjjF
         /XIqKOxGaSfYd/WDx8l+1ivq1EC5xXhD/P1m5vJNPB7Eeb8W9Hv3qQK+JdeJBci/ItTb
         qt539o82C8gfTelMwcdoGpw9FaY8KwU3uUUFEd8SNC1VDjQ1ngVDvFWk+oTzXZp/j2nE
         c4lYpUzo9tWS7uGJvwzKV94kSlEbjJEUahXlBLB9PzDzLHnrxaSboyaUgxw7HVAKl3CF
         IQLDxWyeJ+rM0K1FyaCgdTpGpOlDBOPSA6nIB+BCCWhNE9MoxkZo62/PlnN9pETbp2F8
         D9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234414; x=1772839214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwCrpGcqRgHVPpOjWtlEizCs0pzjg1uHQ80GjIVgbPc=;
        b=ALzR1Rt9461L5k48Fo4feEVJtwaGi/wmxdj1bfbCJqdvIKthrNudkxZGoHGQseHOkn
         PxDCMQOepSAHVs6LqP/oP/20HxkfHMFEzxIHaNOGpEYNZiRELpsQbhhwwuvTnfxOV5jx
         kij6OARYTJiT5/IFEfWyYRsInFDjuL8vzPO+1MuEiZrxS+2fhLbVNKYhb9Ncvnbkkac7
         PEjJiSl0Xy18IzLnLDcxcmworPsspv0iigQEYa1S6aSKn1qL5Hi1nRREeF0mLWeoVJTz
         3ajmvcNJ7qedsgnYjfJ6kYFDkZRTMLDaKHDFJdLvIipp6Vd3saC+Zcy3tzBe3QzNDXkT
         fnfA==
X-Gm-Message-State: AOJu0YxUnV5mmZLpfUPYEYaPA71gPYbTarLlD6SBBFJD93mHUvCQzJ6I
	lKFAQMLV7mlfjxcOOt73IsW87zFRu9fvyamnoz+SNDs+VDcoJE9mkK5B
X-Gm-Gg: ATEYQzz0EcNKwLrj462S3Jqhq93FjXVRyQ4Q99Ck/x2WBcEa98jJQP800Va774xL2Vm
	KH0NhdAnuOkTXEKI3s6XJ1RXqaI+zy7ejeRug/CR2tjcZ39kyfAofRK3mLSfNVVbGqusr45P3Wc
	ArgYWL6xN+a7JAOOnBTejJko0GwSz7VWHNIos7a9mTtR5hHWhgJlJbIFuEMWfb7m6t3I6SX6Wdg
	z9U186s6jkBmcE57+ywBulsR+er8HtVmyF7np7p3TgrNQKisztueCR0ezfvZQQts9aif443CpLW
	U0xBUpuoGjzLkAor7D1q0iPHo7FoLd8/EGZZuXrW0kAFEKN9SIlWrnQEPJsjLEBKjmy6OT3ch7J
	kWJrqUuhFpwQcVgzNWUqM/DxrPT6V3kXyKJZkLXqwzWVdFjSqB2uYU64a18JY7JHbxWLO7qzJpr
	CfbBSjkWyP8NvomF4e6wJCBA==
X-Received: by 2002:a5d:5d05:0:b0:436:3563:49a3 with SMTP id ffacd0b85a97d-4399de368a3mr7525057f8f.52.1772234413639;
        Fri, 27 Feb 2026 15:20:13 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a523sm9690140f8f.19.2026.02.27.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:20:13 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ntfs: Fix spelling mistake "initiailized" -> "initialized"
Date: Fri, 27 Feb 2026 23:18:54 +0000
Message-ID: <20260227231854.421561-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an ntfs_debug message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs/mft.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 56012477d3f0..6d88922ddba9 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1442,7 +1442,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	struct attr_record *a;
 	int ret;
 
-	ntfs_debug("Extending mft bitmap initiailized (and data) size.");
+	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
 	mftbmp_vi = vol->mftbmp_ino;
 	mftbmp_ni = NTFS_I(mftbmp_vi);
-- 
2.51.0

