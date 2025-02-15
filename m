Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99331186E54
	for <kernel-janitors@vger.kernel.org>; Sat, 15 Feb 2025 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739609909; cv=none; b=miHvsAl3H5DYKQ7uc8cJ/Aw5VTbxvL11EjwICjUqnCRT7G18KD3MSyJZPnAkU2mumiGrWrpgB5GsRkRhIUqZxDm185K6x1sre1U1Vgts+ljFU5Ln9dvB/1XZzOeQZhKZA/wl0tyJt6oIxr6BhSrhat/UZ5cYzGTCYZTuBatuntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739609909; c=relaxed/simple;
	bh=sKxoVJVEPFnhrBSERaefdFMh4EK7yxMymN6Ui5MBWHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k1Qd0jghBQhTcJMG0Mk4J0WVC4Zag5HtkMqNq0Zj6ITyVpVXgKNxdr2TWkFsPFx1kKREo1KyitCRtsCEctAizQXnYUbmPi4xn9SlVtnfRTN1BU0WabzjuLXkZdGDn6w6sMC6TscALjhKKrfOlCa0eaEJeRofEY72ukmMYnItYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5P9gC9p; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5P9gC9p"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f2339dcfdso43659545ad.1
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Feb 2025 00:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739609906; x=1740214706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x66jRj9CtCwm0afYGvc64EAKE7M3Pni76l+UMRYpHbI=;
        b=B5P9gC9p025KNObQMXzNVH0hLAApSI9lhEFYXsIROsSi2q4u+4cMB2zs/ua59SsXOO
         8Ygx/YJkg7QrbfwHCPFZxEmNok6iLGW5u476bWOLpFz8+52rtMZsYM5J0gjMiDf7oIUy
         KZS3CXPV33CKHJluwUzPgNeAABcVGwaBVwYyblnFdiy6fRp7Q8fFXVc/BRgOWZbsNOCN
         ZI15iO9a7oKj99wsfvmMwWPxhowKMZ0PyBqFXubven1m9I2/zk0jZWKfBPB9shxJPaHb
         LY7blXkL15ghw31miW2qggsklrh2i2vYu1Pg3skgN4pZ7fqDpWqOQRCTb4Vg5BNGrIcQ
         aAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739609906; x=1740214706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x66jRj9CtCwm0afYGvc64EAKE7M3Pni76l+UMRYpHbI=;
        b=ZURsPR+aK28Mbekw7d/Ti6idjTdScg+vqxHPwtzJCK9RrJKRs3//Q0g2KuHPf1OAkG
         6r2CMwlx+jdbmoc7y5RSxQ/BDRkM5rftz0XJ7wWlA98XDhXg9nICHT09VIRjjOuWJ2/W
         wlGBX0/5YyXvWqYqJSE0LNUJHnyJHsOxGyu1pqF4TlFwNQrGkQtK0vYHmy+cIr6QIiqX
         aHi1Z1s/fHZmi/pUIPdC6EGdLn4EWpSGm3XWhrvpskLbBhz+V2Ivtxhx4P0/Vsa6RSpr
         3h8+pLyJkz6zQ+WTLy4clGBOJcrKs3YV4fXeiNe7wofYVBp7gOmht+u8+00o/lGZWdza
         sV7Q==
X-Gm-Message-State: AOJu0YzEgy3OxYWAKOQ5yl63NaYK248OeEBp07eOU2scyS4+5ThuK43P
	5UpDQbjfaX+WbRNDKpAsW3UJ8Pf53mFQTT0/BzEFZKW2GgAJ8gNdcp5clQ==
X-Gm-Gg: ASbGncs5zB/gZ7O5o9xJnzGD9mnNR36fNh0RqtC4G2/iLSSjR37ZTOIqQ6ak+T6VKLY
	kv7A1w14WD/o3A8aZA2P1hLsaDoOECJgZ/b9Wt1QODPY3LE+JTi00XXNpAkgNVgUDRxBVPni0IY
	BshigBoV0WvJIWmKwdCf2ltOPbMneQbdoA0ReA3NQU9CJg3676jl/2T3PD6wLrnE7zkPGClYW/o
	8IUxqnYDkzRNqbs1KlHrJsm75UOAkC/vaAJiPJ3omR7771FFSqUvAzu0uzhol7AzgSecwD5F17M
	r0MKq40rALSQqdzbLKrHnuxcHwfrMpnvikH6PerfiRRrMpM=
X-Google-Smtp-Source: AGHT+IF5Y5mHHW/Grb4l2iz9ThtBIrtbY3vHuQwWRTsBD8AZ6eLb96Qrc3BTp+/rxR5Bl5gzc2+AoA==
X-Received: by 2002:a17:902:ce89:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-221043951fbmr37326835ad.1.1739609905831;
        Sat, 15 Feb 2025 00:58:25 -0800 (PST)
Received: from LAPTOP-HLGLEP2K.domain.name ([223.181.111.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf76sm40084755ad.131.2025.02.15.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 00:58:25 -0800 (PST)
From: Viswanath <viswanathiyyappan@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH 1/2] i2c: Update i2c_msg documentation to clarify write
Date: Sat, 15 Feb 2025 08:58:16 +0000
Message-ID: <20250215085817.2455-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update I2C_M_RD Documentation to clarify that not setting it
signals a i2c_write

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..fa8a35881ce1 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the action is taken to be write data (from slave to master)
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
-- 
2.34.1

