Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4741F5C1
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000599; cv=none; b=tGYotZB9aJ4DzJYHhktJ6MTp35IjT/jIX/QYg/DJ0Ca/py5inMEXtkNwUJUq/UJb3v6O7BEuHT8XJqFCtEcm3cRrZ6w9sK9bBSGf9jxHybiQ8JfGsPBbFoXwbKxm78PjrF0y9PldME3r/kFc6yC1bdre2fh2I7KzqUgMrN+A7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000599; c=relaxed/simple;
	bh=JiMeXSzcGFYAt/cFVug4AmqPWXY9cEdd8533d70mBKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sHseDgqh/uf36fqluCnTxOBxWeGg2eGWL3WnmVci1o0W701L2Z5hi3ccIfY+PmmpZsbtctoAtLYTt24bvSRVkClSRJ8N+ie7LfYFU1Keh4dO8O7hfcB7YBl5KBwA3cZt1U69e9L/KOGSyU++KHZA9QVjqFZNWcfWNeNpipKqU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oap7VlC8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oap7VlC8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49987fb18c0so20397595e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 14:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000595; x=1787605395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR+yz7Du0tDN+MMmxdZaL+gy5nSpkCG9lU9riLqVIiI=;
        b=oap7VlC8GGViI+gb2qEE6LnvvCS/SE0YY5R5hdvCXu0HMUDmNgjrLWdhXwqGsgmIFW
         gBU8PXKyfwAj6fGMhK3g7ZezmTAc/oIOyvAASBQeRzrVbrrLc30N5HHFSLGEDkOXlIwP
         mOOK3hbLUSFgrD4CMubKz938vFE4lwHcALvrIIK/IJvU7XR2I+l0hU4DqsrQTk9HicYU
         iquezsXdZ9CLzUqN1PieKVp5YMjRBVlLK5HXOqKEfOWPtCh+naAkOyb6BnchridC5S+z
         nSrJBosj4HN51lxfyBc8HhuVqGPondD+1CZY96+kYuO7pB0+1/6y8MSJACcd5r+ZCgvF
         +s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000595; x=1787605395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR+yz7Du0tDN+MMmxdZaL+gy5nSpkCG9lU9riLqVIiI=;
        b=lVVHhBSwQvAIt5UVOcUl3hdlUzZrHbtlW9jjTIkB5Hydmu75CU1kzlp4tn7UdoWmDl
         WA6wXwMvETbFi8uav796kQmx2r8CxSsh0jkVg4oy79M6L5H6ZOR6beL7vV+uJDWhhIfu
         B8X/mXr4DGe7GeVi6UzoxNHCI6KAOZRV1ZJYkekwKOlgpS5qysBzwDEqoojxR2K5T8YC
         /AoDHzqPjEnZ/RHe2zaSjYC4C/C6BxzzhFU3N5ZR4v1n/dJP/Lgxm3oHtb9qRkK41uTl
         zfmdMqAbmZMXRbn1ip6O+3nhHG4KvP9MRGdF7EY9QcrCXagMGXQIIf8hly3LY7uOWwS4
         zsEw==
X-Forwarded-Encrypted: i=1; AHgh+RqAfrltfvf2xyLQ4tsOlk2GeJwnTDG2OHfX6eEBfm2XNVL+w0b1zlZ/+d3C6Sk6/FUVf42dz3I0xDWaL5LstaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMpDgwunYQcrlyhnmm6a8yatH7DV09u9MZ7k7H7oJa/ciceYq
	ySnCsyvf57upq47VXCbS/YffEnMRHahVLt8MuOj/jbyUSj9R48uRrWjp5u5D9V47
X-Gm-Gg: AR+sD115x5td9rfgIYL+FLcQAgXX8dAy8wuKPStokwg54uN56P/euOJ1+tB99saPvPv
	pa/e5LU/Gg04Ed8hVe/7hs7Jkq28LdtkioH06getYQN/1ChFODCmWAP2YUFSXuU13bL6hyCKyR8
	QQVIGNGQ4f2kWYKDhA2HaKupRUD69EMkggmC7g2REIIIU+7av9G67epZ9g5s8g2XCm8fSFGWZ2p
	Spi5P3nZHrxlaz6CGLvpNzPRkNTysnzciF+phEnfMC9P3QgDyliyD9Q4DMTG5eLGg6qJ/D4Qee6
	Ru41xjAjKFLhNvnEFec5jeE9j+rL4oHhXg9j2L/F/9As9ZRdk2bMZLyjLb/3oDX3vsNgI4iq0dj
	5srhM/hkh8q+Qv6EZUbuf3mLdMoZIVKvivE/uRBRUzwxzcrSH6Di1z34fSKzRiKmR+HyTvtp+mh
	5m/YlOvvDSfnR7QUB3KmJ3JhxR2Xpek/ZlAcizZDwKNixVbIInCtQAkg3mI2Uq+xkTsWT8SpvJY
	YZpoatzaMSRXAn89oNJJdW1Sr257JF+5E4nZk1KgbiZDl8bkR+T
X-Received: by 2002:a05:600c:64c6:b0:499:84ff:b16 with SMTP id 5b1f17b1804b1-4999fb4d60bmr56255855e9.14.1787000594954;
        Mon, 17 Aug 2026 14:03:14 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610966dsm230491785e9.5.2026.08.17.14.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:03:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org
Cc: arnd@arndb.de,
	jani.nikula@linux.intel.com,
	joao@joaoff.com,
	julia.lawall@inria.fr,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] lib: cleanup "fake" tristates in Kconfig
Date: Mon, 17 Aug 2026 22:03:11 +0100
Message-ID: <20260817210311.2142999-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 7 DECOMPRESS_ options (e.g. DECOMPRESS_GZIP) currently have the
tristate type, but can never be set to M. Their only valid values are Y and
N, making them effectively booleans.

Let's make their types more accurate by changing them to 'bool'. Note that
this is only a code cleanup, there is no functional change.

These bistates were found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 lib/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 4e6b34c3346d..1e42f5167c68 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -219,29 +219,29 @@ source "lib/xz/Kconfig"
 #
 config DECOMPRESS_GZIP
 	select ZLIB_INFLATE
-	tristate
+	bool
 
 config DECOMPRESS_BZIP2
-	tristate
+	bool
 
 config DECOMPRESS_LZMA
-	tristate
+	bool
 
 config DECOMPRESS_XZ
 	select XZ_DEC
-	tristate
+	bool
 
 config DECOMPRESS_LZO
 	select LZO_DECOMPRESS
-	tristate
+	bool
 
 config DECOMPRESS_LZ4
 	select LZ4_DECOMPRESS
-	tristate
+	bool
 
 config DECOMPRESS_ZSTD
 	select ZSTD_DECOMPRESS
-	tristate
+	bool
 
 #
 # Generic allocator support is selected if needed
-- 
2.55.0

