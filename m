Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2B425A323
	for <kernel-janitors@vger.kernel.org>; Sat, 10 May 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889942; cv=none; b=WobNdOfGKjS0aw3zD2BIyX8kC3H5z0NbY9dRb80XdPfFTsYI0VS2Vpjy86masn08/ppApqWbJ8j4nnDRCGhqDH+5FGSdwDUXQ4mEx2Tu+UJ924dmveswQqgN5bcvkSG2tueI0VIlyvyWfJqZ9I+KP9Dt51U1UdTNYhDlF1DG7hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889942; c=relaxed/simple;
	bh=r7Ia15x0XoqRtxXrdZIvlpHfrZNhjtxmu/N4uHhXw2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eWWJvEvWeKyIp2UQKKBNSYmAnNH4r0/pjDRBPRtaY3N6sKG0USMlXKNcRntukAlNFtGw/PECHx9Pcae8mR3sGkZ35N19LKWUF8DzR9Q9Y3+5g26vziSThvvROk/uYwQsAF2EKccOJaynekbaGhtx98SYV0NNpUDnZHpANuH4kQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3ZMj6Ke; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3ZMj6Ke"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so2503523a12.0
        for <kernel-janitors@vger.kernel.org>; Sat, 10 May 2025 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889940; x=1747494740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa1gB13jXdCRMBhUTevQhMRSRHWuYjbEOHaj1K/fMvU=;
        b=Q3ZMj6KeDLyHDxFUcThV9YqmgLmUTCKp0OHbTSAQT2vbpKaAVX7mr8UybeCR8oXBPB
         K+rTdvvh/HTpNFfJ7SyigNJSdYfiBwARjEPYXiVivs9UAX/efO8zBdLX+7M6LlKQr9L2
         XdANG8krVsDNY9DbnGJFsuk+XmSTWBt/38HTBPL8QRA8DDNq2HDSZsLcJl1B+cBfgsaG
         LkcDMORvXpo79N2jLqzdpBVjyDFbvMjCMHkP9+CB39ReDid5v+4lmwAFuvS73DwPGxZQ
         s8tMd7MFUA5Tn5EF3erOnKhbcXZSXCk2Lx52HQgJY71Py9YWVNk1ZeHiXHFEOyLXJc38
         Dmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889940; x=1747494740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa1gB13jXdCRMBhUTevQhMRSRHWuYjbEOHaj1K/fMvU=;
        b=cSxks9VuDUHoFtttnA8sQmOsONA32q2F0ZqYHk2iblsoV9hok+yaA36ibfVRJUIw8X
         xi6sg7070ZmUabgw2S/RnLzyeLwHdt1t5pGAQpyrQA47tyb1OSdAOc5bepQYNKpt44ht
         n8WRiqSHpq84Ckg1GbqUjvSKNH53tBnwMFnp+vu4UkJRXFfQ89GgIfgdGGTCh0TjCGVZ
         4ekiNQv7Y/BAOxwr/AffRUKYLHTCemP6bmN+zbvDtXXVdJgefHkA7yWEAfKvSFnqnYXH
         lb3HqDy3PzG8D1naN+wL1NdHJILkLqstjtOeid2KiB92WM6WwQt+D/g/ez2aHqCzGHZ8
         kcxQ==
X-Gm-Message-State: AOJu0YzDNV7A3Cu/FWot4TadbE+QZ3fqM/8DrhMdYeAPai/n9qkIc472
	XZPnRnqZqDEHy2bAl3ZfD8cjWAR3tQwlJ3qqTPXs43cbNNXJXLaiy5fPiSBn
X-Gm-Gg: ASbGnct7XZ4pkoU7KdTHRI5bmS6dhZ0TKMGo6CXB/W8rIWuId/gO75YqzwPTnwof2z5
	3AWhaLfE3Xg8g1icglXgGHF97KTd4RIwn7Sj+B5pDjBaSY8PkrA6gT9ayI1GBCyEsgf+9v3ko/i
	Vz9RE9ivc2a336kugVH2xvQ+ZXyux0h/+JpbkiBUrr5QBfC5J4U0FJ2i/txLPU/9rtXuNePN25Y
	EX8/g5+gKBgW5J96PNDBBoF5E6shOaSgeDRxn82mnMOe8mUvOieQc6JkIl0QMy7P6D+5Fjde6uM
	CykJHOrSZX5RveqR+k3tDtFz9NJ11d+dVB7qh/ZHyvbDpAte6r50jJ4sAuBwFhIP/44O+2lvbaI
	=
X-Google-Smtp-Source: AGHT+IETSH99FjiGWPlAyBYbrUcFE4wcBoHTh6Bjc/ZwvPF5Q4SDo1Mh7asV5nhpDAhdgUkqjWtODw==
X-Received: by 2002:a17:903:2f88:b0:22e:6801:b9c9 with SMTP id d9443c01a7336-22fc8affe81mr91458715ad.8.1746889929842;
        Sat, 10 May 2025 08:12:09 -0700 (PDT)
Received: from localhost.localdomain ([223.181.104.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7546aefsm34549325ad.37.2025.05.10.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:09 -0700 (PDT)
From: Viswanath <viswanathiyyappan@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: Fix grammatical errors in i2c_msg documentation
Date: Sun, 11 May 2025 02:10:58 +0530
Message-ID: <20250510204058.27258-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following grammatical errors in i2c_msg documentation:
1. Makes only sense in → Makes sense only in
2. may have changed those standard protocol behaviors →
   may alter the standard protocol behavior

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..aa751389de07 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -24,7 +24,7 @@
  *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
  *
  *   Optional:
- *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
+ *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
  *     in kernelspace, because userspace buffers are copied anyway
  *
  *   Only if I2C_FUNC_10BIT_ADDR is set:
@@ -66,7 +66,7 @@
  * @i2c_msg transaction segment, beginning with a (repeated) START.
  *
  * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
- * passing certain @flags may have changed those standard protocol behaviors.
+ * passing certain @flags may alter the standard protocol behavior.
  * Those flags are only for use with broken/nonconforming slaves, and with
  * adapters which are known to support the specific mangling options they need.
  */
-- 
2.49.0

