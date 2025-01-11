Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCAE24B22A;
	Sat, 11 Jan 2025 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736624870; cv=none; b=p6243MobX+RKpxWaX7g8Rdr1obJswrSBk/RBLOoiSCtoszX1PXRS6tim2KE5qlMjWOigWmngfhs4i68/9OizHmvJdc4gkEK+YobFoR7A2Wgxj9HY0GCRMRc8AAMfelvNPFecikrIHWd8yZtyZ1ZpnOflULXP+/ptFBuZZIqOXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736624870; c=relaxed/simple;
	bh=pCHxNFYTC0M25bVDxnFv5v2wGuiQVcvAQ4dtqAP6CLs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bQt0rCrX1dIw22o00Okpp9dBSAtH2eE9B54wTEDkTI+8tVcmACNmMTlmf2eYd1UgxnoXPCs90oPGmqL7kVkUw2dqtUgRQkdxFb8V79FZyAihf1LXPWiKbw/8MTF5vhTtMesMLfI+DDVwCtiZOReJV9vFCncAGKYMI5XNGTKcMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhiCqToJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhiCqToJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2efb17478adso5113002a91.1;
        Sat, 11 Jan 2025 11:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736624868; x=1737229668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNPm5XgYPf3Wtfr1LKIDSnDOGdbJV1zMvz2mCxjuB+8=;
        b=JhiCqToJSuHF2vL8MByHr/rxC5gXXCkcPfbf/Gy8yoQF0WgN1bFKkaxOJtv3yx1SC0
         wqjNp3eqBvb7dUZmRrn0caTdNXIr+aOK4NFgiT82HmczmpgIfqnFN/08ZfM3Uy1xDPae
         +wyOEykb85aiiAAJT1R355DZ4pwcZKSons+Nml9H5caeTb9c+kECKYPV8mUxrhzbsmaf
         NQhQP1xC+XJXuOV7C9PRo3vsEK0jt2CxoSG3PN30Af8mg8Tn8Ip7aIiqv4ce8TgqdqDY
         8EG4V/lfpAXjFhnO6M5AQd7XadOoR8XqGk2dYUG0qPhjoe2kpme33Fr1DyGPJ0TXJ2N9
         kLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736624868; x=1737229668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNPm5XgYPf3Wtfr1LKIDSnDOGdbJV1zMvz2mCxjuB+8=;
        b=RZ84Lzp2VQfCveb00+kfHuMzxcYByKxhooI87UytSBkQ5T9fmSw1U4vf2GOYrAtPn8
         sEJhNASVgOG8nKEDYgjuup+RwAHv7U7RxZc9+ePsfq3ll5ucD7UxcR8MX2C1AttujdMl
         XaaWZFsMRzvWjhjiVGu/YUPr3rnqLEWuUauAHQGh2xlq3a+lb5bOHAHuFQ8tVlWh9ibw
         oq0mmiwUq3etf8OgLmkvKO/l7yln3zP9q3Yui0xTdDimyJKVEBD3iwVx4EfTHe2BsVEL
         ijG8VJ5KXO89JKlRqmfhB0DDVLliHrNHkRK/L9xFJFIc78jvXN3GrVM+gdy/7RqOD7vH
         NmTA==
X-Forwarded-Encrypted: i=1; AJvYcCURt+3XMKnJpUk5AReoeZbAha8NKz7+ch9LdQxnTUI+18RL+ZTXbhP3kOAA5/GGt1nbnpISkSBTuckk5SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE2LS2OCU2qVQKFERbi8oIiZeg94ipOzl2uNKcfVmE6E83kSbQ
	C1XxvxskZt/PPCifWr0Byx9ctTSG21KgQdy99p6wQ9DmzNpQRhbLvcFz5dXba0U=
X-Gm-Gg: ASbGncseKc6NMlvcpidhPXPWH2GpLaLOKkkQRbEJvL28YdXhycoKjVSKjfkaYAUduvD
	e4C5gj+EkfkZHQWyoNuQSvvswzUejeBPOmNeJ36vOTfvQKrV3xQstAatWCU4hcGkG9sZ6AlQSqb
	j35KNMFCi2A075oLwk07td1270Czb6d78SBow1/yuzn6Q8OE6o9tWXzsGAdlSB56k6hm00lq9Pw
	+0PXDl6h3NHC4tEaWL4VszA6RyO/a/6wEfeti3kWVhJ6fnQOEDYf6I=
X-Google-Smtp-Source: AGHT+IFsHGDM2NDNSc8JFy6rDLeM+s4LBGtq3j4iUYl1rCyHKBlHpFODg64YbnKSOk75RrTAi7SVEg==
X-Received: by 2002:a05:6a00:1385:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72d21f17738mr21870378b3a.4.1736624868043;
        Sat, 11 Jan 2025 11:47:48 -0800 (PST)
Received: from localhost.localdomain ([122.174.69.103])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4065c475sm3384993b3a.117.2025.01.11.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 11:47:47 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	tanyaagarwal25699@gmail.com
Subject: [PATCH] CREDITS: fix spelling mistakes
Date: Sun, 12 Jan 2025 01:17:10 +0530
Message-Id: <20250111194709.51133-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Fix spelling errors identified using codespell tool.

Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
 CREDITS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index cda68f04d5f1..1f9f0f078b4a 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4339,7 +4339,7 @@ D: Freescale Highspeed USB device driver
 D: Freescale QE SoC support and Ethernet driver
 S: B-1206 Jingmao Guojigongyu
 S: 16 Baliqiao Nanjie, Beijing 101100
-S: People's Repulic of China
+S: People's Republic of China
 
 N: Vlad Yasevich
 E: vyasevich@gmail.com
-- 
2.39.5

