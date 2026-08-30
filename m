Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10801DFDA6
	for <kernel-janitors@vger.kernel.org>; Sun, 30 Aug 2026 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130828; cv=none; b=qkhZL8SedhSOqKp1eBB14xwDdN9BClQeFxr1VFGmUc7DDxIn1EuC4AlCiBlBbKREFm0hzaYKqpJSpfFYY9zjSgQb9j89LVBUfU/4la5Kk12A5VGTRpQ4PPHizkj6wtMiT0Q3LBsNH+9JqBAK+ynSKwVmgjfftc6vou8z/RvOX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130828; c=relaxed/simple;
	bh=ybC9y483wieKz+ewn4dd2GfE2AaLWKv0l2RaDWNQPEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJiqJb+WMOs3zAXPpG3p8mk6NiS4yltyt6cEF1anp3ck55aJDX25qopULuXIBkub3g0Ke5qVzje39CQ2djTxhWgcnfrOG7A+pM8hqRSNzK8T3r9oiR1Efjang4U/PgYurzpbQoVE9tX0vmdDPBfTermaF8FO9v/gzOU4Y7DHRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOaAAc7C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOaAAc7C"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso38211545e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 30 Aug 2026 16:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788130825; x=1788735625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhVOVfNqbME67sfeHpsvdRhcgU8hm6ZNstYat/TMXWw=;
        b=NOaAAc7C9Wt/mvm2SE7lUrZCXmqoB+HAR7mmWvPs8kQZQADayzvB4YbKN4vVX8P3K+
         IhAClCZZ5uTiuhpLEIKyqGv5IkG27+osqgpeBxq94/U6m4erC917Ewof/08cE6Zp/rzi
         U+1iXO90CecC5NO9Rbt6oBchicMS0gnBm66YGwtkwZHE3p0fhohRo5Crxr3SdIpen3pc
         O76fX+kH7g0QQ/baDb9FWMsI5VBj2/X5iBUNchcwVQ0emZcOMWlniyo3pd03q1cv1hn8
         Ib/VRkOUmm/OWYqYJv5GQDhje7nMdf0UEqkTU4NEbZDktvbsPcwxaBA3gH8RC905pcmC
         izeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788130825; x=1788735625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhVOVfNqbME67sfeHpsvdRhcgU8hm6ZNstYat/TMXWw=;
        b=i5A6CCmDFVi2Dv2CXFmGDHzGpCYjXbIptYguUKylh5C9jScDBT92MFtpRKIOZmcxk6
         Ob8bI2onPpsCObYMdq6rjIPu4sE86iv3Oakas1ok+P2H0kwcd6WaX/Y+Q7JmAMTTrLf9
         rWt8zC0wchcZmLamTRqEeaMnKxbVk5egzlHLTevxl/MwGdgRtqAqIBYHEbimU94oeGXL
         SPRi4AoHmk0ps7GGrtl6UOd2DcldA2X3XoBGieUKjtLeucMcYsGWlgNY/BwbRbzbhnOI
         21Y1m1jU+W7ldmDulvBkkhk9l21b22epHUauTYm5/zYFQn3Np/sHncntjtV191tHiUAY
         ZMfA==
X-Forwarded-Encrypted: i=1; AHgh+RppT6UoH2Z6VtJwPoS/qG/iKol1sWBvylLhmUMXl9t9FI5uJNodBBo6L+8tizhqvtnd+qFSj876gdM7HhHpVl4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJY9gjo8vIxRszmzh0UL6ZaF7K7Vfn/nv7q4hQfF4srUkE1x+g
	I0KqOljw3GFGPduEWhiASA6r6lFTGCEP21IQ4NeOQeIZLyzxRhpkgynm
X-Gm-Gg: AR+sD11SMfOKCfaGSNdneKFhPkCuxpQZeFX//qPK7JO/J6CXT++sA8nj8bu7RxNLbev
	/2mlizIcZs2BoYgAHEK6uvpqN+dNeKclZNzvk09gFdjlwqj9UD1yDeZY0Hke6ePiCVklAt83zh1
	CfW6uJhc7S4VcFfBMwht7eKaNrcTdu5f7zPW0o8Lv3MzUfEikuxx+hIAu1Ri9fzrZZAgHx4vSl0
	gOIf4HmXVl/6dvup/0SN35g9Df3oqpTIwMGzxDo+WRLl1XCb7sXazUrXGqoIkEwCA1h0HFHkuCz
	M3P4fwsWFU0cWzcGmWVqdPXe7Rt8NThXdy98DuraEvgDY6wr+4jOspKlh5uhizoxuUSSg8bGM8+
	4pslANfm6W1u5QsD/GmauN/nZMCNjkHnt3DCY6NJKxW/J4C18j9ZQdsfrGxMp6ZoO+VDqaAwpOO
	uXAtgh9udVNOTt9RCeTgkxRBzN13oj66GEYlZiYi404ybJds7Mu9ZCGy/og7IhvaXHw0kwsjri6
	nouL4mtPLx7sypnI8bz0glYUK0n5m6IYN1cm0YjYfUfnmAorRXf
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr293066235e9.7.1788130824697;
        Sun, 30 Aug 2026 16:00:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm506042145e9.2.2026.08.30.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:00:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org
Cc: arnd@arndb.de,
	tglx@kernel.org,
	xur@google.com,
	kees@kernel.org,
	peterz@infradead.org,
	thomas.weissschuh@linutronix.de,
	ruanjinjie@huawei.com,
	gourry@gourry.net,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com,
	jani.nikula@linux.intel.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] arch/Kconfig: fix dead conditions by removing dead options
Date: Mon, 31 Aug 2026 00:00:16 +0100
Message-ID: <20260830230016.2730093-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two 'int' options:

ARCH_MMAP_RND_BITS_DEFAULT
ARCH_MMAP_RND_COMPAT_BITS_DEFAULT

are used directly as conditions for defaults. 'int' options should not be
used as conditions, because they will always evaluate to false.

Let's remove these options, because they are not used anywhere else.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- add reviewed-by tags from Arnd and Jinjie
- send to Andrew (seems nobody in particular maintains this file)

Link to v1:
https://lore.kernel.org/all/20260729210546.394392-1-julianbraha@gmail.com/
---
 arch/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..72890200d049 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1238,13 +1238,9 @@ config ARCH_MMAP_RND_BITS_MIN
 config ARCH_MMAP_RND_BITS_MAX
 	int
 
-config ARCH_MMAP_RND_BITS_DEFAULT
-	int
-
 config ARCH_MMAP_RND_BITS
 	int "Number of bits to use for ASLR of mmap base address" if EXPERT
 	range ARCH_MMAP_RND_BITS_MIN ARCH_MMAP_RND_BITS_MAX
-	default ARCH_MMAP_RND_BITS_DEFAULT if ARCH_MMAP_RND_BITS_DEFAULT
 	default ARCH_MMAP_RND_BITS_MIN
 	depends on HAVE_ARCH_MMAP_RND_BITS
 	help
@@ -1272,13 +1268,9 @@ config ARCH_MMAP_RND_COMPAT_BITS_MIN
 config ARCH_MMAP_RND_COMPAT_BITS_MAX
 	int
 
-config ARCH_MMAP_RND_COMPAT_BITS_DEFAULT
-	int
-
 config ARCH_MMAP_RND_COMPAT_BITS
 	int "Number of bits to use for ASLR of mmap base address for compatible applications" if EXPERT
 	range ARCH_MMAP_RND_COMPAT_BITS_MIN ARCH_MMAP_RND_COMPAT_BITS_MAX
-	default ARCH_MMAP_RND_COMPAT_BITS_DEFAULT if ARCH_MMAP_RND_COMPAT_BITS_DEFAULT
 	default ARCH_MMAP_RND_COMPAT_BITS_MIN
 	depends on HAVE_ARCH_MMAP_RND_COMPAT_BITS
 	help
-- 
2.55.0

