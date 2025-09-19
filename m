Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564132BE622
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301085; cv=none; b=HiX3pq58MDU9ppS4wCzf4zaZ0oqQ8ga/QyVw6vI3RnRBWUHjxkC4+Kc0YD7CCbGN2sGrGnu4KERsKgY0eCb/amtYmuh1xCR7xqaV4f7Qqyku+5UXixP0bxX8FDK45+Dg2JO+Yw6miR2Kw7Q7s64ZOZKbLMssKNa9zm5GkoRcoR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301085; c=relaxed/simple;
	bh=LkXiNYVmYy45PbtQp4w3oidCzbB9YyGL7WOlczqslRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GYi0uBnGLNSoCQQw0cfl/CnLf7w0wagYNanqVJ0cwqZK5GCKC4huC+8lOMHpvSh6fqq1ab2TuDsF4r8lj430klLs7NtFDngiOOI2HojUAUEPiY8kgbaW50p+jNDLV6RAzqDPWmc48rWgKGtXm2TTqLkoxg3tjqhFK+20Oz6/ka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVkxSd11; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVkxSd11"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so15178215e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758301081; x=1758905881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dHGlmanb8gaPkMmh9rY2xAoH7nIapmCNS2c1Geon5Qs=;
        b=FVkxSd11McjzefB8Ll8uU1936gI8oS7ah3PJUPFjaJ/xDSp41scvUqinCh9Ys/ZzZ3
         FLcAoZqOqMBblRNqSP/uHvsCWt43SjsnzR+3e2fYlCQenDjXDX9OENgd6F71PDe36SS5
         ztNEKcYZrthA/ILnKBhCCHFL7Jp2RI6MkoPJ3c1UyPgZ9q3vHJQ+R3R7G3WK090Cn+2g
         qSjY/wZUPd5QrZ8u6HIkrEY1Z8c02/sRRO3+N/cn8n40kjtqkUTn5ObHgZM2yBrLedv/
         qKBt+adnAriUM0sQxks2SH+YbZBvJqeCgfhtwHOJG34DaR5KRJIDKLhyTmsAX19tl7eO
         ta0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301081; x=1758905881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHGlmanb8gaPkMmh9rY2xAoH7nIapmCNS2c1Geon5Qs=;
        b=kc7WoPO+983L4xiscrMjGn1yqfjo0NBOJULFKmsCGfX9ahq9GfO8igCFTdF2MlFhBw
         moAke/+QIh2G7zvxL5eGTBjI1iCJ8tprOAbfBPhZU/Jb/oIElN4la4fadkyJr9k5Us33
         Sm2W5hZGJih01gyhnGkSjbTzDBaUbPn0YEXLPapcK96JeQkUfeZc6nRQJUwj7UD37eJm
         OGCpSkjtIT8wwq2sPjhZAluUGU+dWayDVtPQ60EvYSHfZm1BHBYWSGUKAdIqYJiXImIb
         0CJh1gXBJdOangBjFL9hRxhQT2yECJvJiV+Xd1734HvTP2+BUSltLZ6j8kAcwWCMqC27
         zd7g==
X-Gm-Message-State: AOJu0YxXT2Z8z4H89TlMJSPicuTk8f5WOuE2NCFVGeAQ48b6+14dbHe4
	FG9JlrhYcSF/ULt80BzaNRUEtx7VGguC5j2w0zEkqLZszBDBd9ZsfUMf
X-Gm-Gg: ASbGncvSBQlr7m51zHbW4HBSAvKHztlq19/eOnIdjWUIhQhJcG/Dn1hVy84ScUnYoa9
	0QkNB2qPNpVTOz8Hzy0dnBnGgPz2S7eH/rVtMDB0Awnu6B3MANnkRWIc4M8upJ/VR8KBtAGNPoI
	UWghvgQr2CmS5iIEIO0RH3bEALvuFVdchIW04jxKa9yZp+hXU94XNLs25FF8v2yrQy45wllG/gV
	6GsAljKJ+6K/FinWnzEQxwhf+1DKNeOfx6/NdMeRbmR0wxh1+Q/Ck9NqUPjetodeKf7/cam1mo2
	r+Pn92mnpYyX2o04t7hKem9LImLKMEx3Zo6YpdxZiG2oSLcJ06gPyvQ0mEp+/BoFGumLuLrPyJT
	6wUYfIkN2OFsNOIgVXz9zpg==
X-Google-Smtp-Source: AGHT+IHRuVYN4oeI6DMvgCDuUp6xTSHvjNQAT0yQq+8tmYwKdcvpMDomyJYfc7kVeI7DWpy6ZIZ2sw==
X-Received: by 2002:a05:600c:1d12:b0:45d:cff6:733f with SMTP id 5b1f17b1804b1-467ebacab73mr30669845e9.11.1758301080265;
        Fri, 19 Sep 2025 09:58:00 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee073f4f6asm8171331f8f.6.2025.09.19.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:57:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] selftest/futex: Fix spelling mistake "boundarie" -> "boundary"
Date: Fri, 19 Sep 2025 17:57:11 +0100
Message-ID: <20250919165711.557272-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a test message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 722427fe90bf..3a71ab93db72 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -206,7 +206,7 @@ int main(int argc, char *argv[])
 	ksft_print_msg("Memory back to RW\n");
 	test_futex(futex_ptr, 0);
 
-	ksft_test_result_pass("futex2 memory boundarie tests passed\n");
+	ksft_test_result_pass("futex2 memory boundary tests passed\n");
 
 	/* MPOL test. Does not work as expected */
 #ifdef LIBNUMA_VER_SUFFICIENT
-- 
2.51.0

