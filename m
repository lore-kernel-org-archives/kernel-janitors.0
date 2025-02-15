Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F84186E54
	for <kernel-janitors@vger.kernel.org>; Sat, 15 Feb 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739609914; cv=none; b=gOfFcly3U2/Urzl7T0ZgWZehnBW40wgw+FKRpius9U4OuOXEfXxDLH6HGp7WQNgwokLYU/sPrB5ljzDcUv33gE/dzBPHzv+57XqQAsx2ZSLK8KS5fw+bbdvNO2GjKl6XmtPevavZROjP5K8GBY7NulbdPs/MZhYGUTmjzjYixqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739609914; c=relaxed/simple;
	bh=zUcr1lsE9NXqWKcxOYzvbEjOMUWBYjxxMbRR++FyHqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8mlSfPCxWW8vrNfgmtkJC0TsTvl18LLwGj4tDDcb0kHOYBCparIuD7wfkIrzKqGxw37B009Bg2Dlwbv/VN763/1S576DcpRYsEKjNzi5qQmZcjPupxcyLviwTRKTLwMUJLABbicmXAnOA/AcbmiJ6weDvHvhMqe9aE84q2Ntu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3Z9Xksz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3Z9Xksz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22113560c57so444665ad.2
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Feb 2025 00:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739609911; x=1740214711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgcMkFe+nMofBxiOR9bhZok0ftWdrYrG3MfErIxo/qs=;
        b=T3Z9Xksz+6N1SngQuP2X2LLUttf68N7m3sQu80cHNAbgTYUgLFs6GMHTn0+0/u5UKx
         jacM2rrmVPMkY4E9y/t/xAug8fToxfhZqfoTV2bm1IVKO9txsuSCo8QtLassz3TP2G5y
         Yjdwwjllj+g4wizYxK/pDlYBpdDpWBW9aQOhI9954R7E09uYwqKqntGn1LY3jPpyoxvs
         uzDSfvLDvnAFXxUwVJRNfUpaLbKx30TqvvcBINH7ya4s2foW4/rUfsGd/avdD7sw4nCm
         nUeZeN25e+Wi0vyicxM3FeYKJ9ckJDsPJ8a7mRqX4o0R6V/+tCVbB9OO1BqLGV+7ehSP
         9a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739609911; x=1740214711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgcMkFe+nMofBxiOR9bhZok0ftWdrYrG3MfErIxo/qs=;
        b=Xleq/bt6z3mL/0vOy2rVbQtSi46REks6YtgQhwAXRcBzxI4Fb5EXaV7ca/hheB2ymi
         hfGtYxeWTebEvDLAEKV6yBAdG65i+9Q7v4YCiXEnk4b+iRjD+S1qffJE8Ar3+2jE51oI
         Mdoyd4vh1U1y3pwClgguqBf03B+pxNNKsleeYJ0QZBKBfhBwJl9hAtLO2E03MWiAlhK5
         6uo3+FLVtWMrrigV1vugRsR5bkAMDybKvv2NIwI+mFSFZsF6/xeclCPBMFMlpCG9Q357
         RCqKzqmKkF+PlWPuccFd41k1xfZzn2uJhepy7WK3KTTZd1+pRAK1MOLGP0KCJit3RBdq
         94+w==
X-Gm-Message-State: AOJu0YxWxfSYG7xssRCBvDwvKKT/tpK+wngX57bMHet5/CqcNYX3RR+J
	s4q2kQbr76LvfDfkL4gDmI0FSOZwhEQ8iWiGDo/FqVKsbJPq2mc69M71Kg==
X-Gm-Gg: ASbGnctQsbfynnWMfq4QRvKkRULfXW6MwTVo+HECVWd0sXDVrrCFXMZMNM335EZlGC4
	AP7CRgdUHlt4/WFL+H0zD6GxjZrQc1S0ujMzQhHwv27eYWdia5zygXMpDMdzobjip2ioQMEZprX
	n9UCyc5RLy6kHHu7ueZwkA1c2b8FzETfRdGoOHuuJ6SKvzIblN1jTRnrP38Qq1cywBS9T5Z7i9L
	qwdPkxTu46GxtakxaiXKJk32xGE7sDUjaBa2gBuPlSuN+AtFHaVnM2u/hM8X/WKErX5Y+ZJgfUa
	/rwKAs0IKc5HruvvuODwGdFIcdWf1YMDND6Zqr8BBHJ+ODQ=
X-Google-Smtp-Source: AGHT+IEDwksIHuY/iTnMSoQBD9qMyj19+JkpGQknJa6yzP53ceis5QXHPLT2AA8agnhQk5MGnT/luQ==
X-Received: by 2002:a17:903:2f8c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22104038460mr36360485ad.20.1739609910865;
        Sat, 15 Feb 2025 00:58:30 -0800 (PST)
Received: from LAPTOP-HLGLEP2K.domain.name ([223.181.111.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf76sm40084755ad.131.2025.02.15.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 00:58:30 -0800 (PST)
From: Viswanath <viswanathiyyappan@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH 2/2] i2c: Fix grammatical errors in i2c_msg documentation
Date: Sat, 15 Feb 2025 08:58:17 +0000
Message-ID: <20250215085817.2455-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215085817.2455-1-viswanathiyyappan@gmail.com>
References: <20250215085817.2455-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following grammar mistakes:
Makes only sense in -> Makes sense only in
may have changed those standard protocol behaviors ->
may alter the expected behavior
No functional changes.

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index fa8a35881ce1..28f327366d16 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -25,8 +25,8 @@
  *   not set, the action is taken to be write data (from slave to master)
  *
  *   Optional:
- *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
- *     in kernelspace, because userspace buffers are copied anyway
+ *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
+ *	in kernelspace, because userspace buffers are copied anyway
  *
  *   Only if I2C_FUNC_10BIT_ADDR is set:
  *   %I2C_M_TEN: this is a 10 bit chip address
@@ -67,7 +67,7 @@
  * @i2c_msg transaction segment, beginning with a (repeated) START.
  *
  * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
- * passing certain @flags may have changed those standard protocol behaviors.
+ * passing certain @flags may alter the expected behavior.
  * Those flags are only for use with broken/nonconforming slaves, and with
  * adapters which are known to support the specific mangling options they need.
  */
-- 
2.34.1

