Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379E1D8E01
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764401096; cv=none; b=SH02unTJFK7I+JiVPMYFwn3dNjjQmkq0XJzjCawRm6fzHS9I+ffM9SHqAFzp3lkkmlTQCmIpYQxyRB/U/ixZBKltnjWjSy34ac9aRrUljpuDLDVYpmH4253SPFNbeEnHt85D587lcHdg73Ogr+ZXI+HwwowVKYkgRjsNqAm2908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764401096; c=relaxed/simple;
	bh=mV0AMUiy39d3uXoYyCehWrKulLqG4HQkmcC25SOcFic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+4U3I3JqtZO9wKkPv05mL3QKWDi0LdnnEstvnGZdCWUUE/CbGhCZxYzxh606KElK4pTFEiEdx9gp7hWzDfMB90jwQJSZFLKQ/xO1giSMF/ajfxX69aiRxtim81i2HbQ84JCAb24aXg/dP1Aju8QYUnr9j+jgW9bIv+IAy1av8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ksmv/AKC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ksmv/AKC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso4040164b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 23:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764401094; x=1765005894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKRrf9Oz0mTS5nSZoxqsNvbGxex+oheA/yBx4553p7c=;
        b=Ksmv/AKCKrFBenl520Q4SpfMKQiZ5OrLAQr0jNLircHoCvlqnm2LfW28j9JOq4DIvn
         7GXZRQH8kVwR887h5RM983C6V04Pcm3/fb56LQVYuN+jmirF3M8y+uDthngxOefUw+nC
         1n3Qtm0DiKjazf9osiwwO8wsVegBxxoGjs4saVjELkNn/O+/CQmsbDMxEvN1xTHVHn8V
         2anGk44p+0061LebhVQFHfhCDariWRrbBC99tgE8Kxs6ppXJ7kbQpdcQXcLUJe0KFJ04
         vqnnmrRiOG8u/hrBLK+5xIR1J4v99HLk2PB17O7PD/k/5vMRZRlY2tU/K+mpXon//+sy
         qqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764401094; x=1765005894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKRrf9Oz0mTS5nSZoxqsNvbGxex+oheA/yBx4553p7c=;
        b=FTcHg2IKt7WzarrOoDlj6fnChTN1HsLhoEFo0KfvElLT8uAcDsppx3tdb/7481kfpj
         mXNaiAaku5i94XGU48lioA4qkqmM7NE6VLSeosBwbUjkqDHsTC7QoppkrGADOy+hvDmB
         P9d0eMa0AkcZhd1mXt+8QZKA+ddOEptr6VZUks9HE5n9w7nifZ5XXmKbU4bN2Iqd9B/i
         bwi+VgEiGVckVuxJNrf24GctABU5levS/7gWEYBbhQNGYYF9PshgM1xbblU3dEzP5612
         wFdHXnPSM+JWexm0k97I0+LtGD7EwiP746OtbZyAkT5Z3S/eaTyHB6zkJOLFnopWrFgQ
         baww==
X-Gm-Message-State: AOJu0YzTdgVCFCvufCjjs6RRtxDNXioJvEmBNk5YOAgAp2p1M4K0KmlR
	vgFKb8SgMd39Oi4lRyL+rcmiYDhCOtrvnoat5CcVIEnCaDuNBhQFARziRxGbS20L
X-Gm-Gg: ASbGnctkpp+YMTTlUR/1egBE7XhvJMwW34MkS6SGzAMsxok1uI+PwUKkE2Ff44gJdHB
	ixXTHEC+UTdq1h7Etqwil88KDtlUQYpQovo4exqTckFzJ1wIu6S88YCUKTMX4hFpMM8sxGOd3Mj
	gUs5WQUkElxuGdDtzsoIcrqnO/C7/pbdzVyBqqydgv33dELyDAbAt1iSmLmtrBVlTeLU222J3TL
	/RuJqNlt+D0ga34UOM4pA1z63CCKpCz7ApGi4l9kcU55IaQN6VqR5rwoLa1LbsAROjQeRXXyM2P
	ar+rR+mr+IaYP/8nz2FBHecjd6MHtISDTbDG+LBVV3Kys1CifyEsGiIw1pvJ7VbOWYzYOQ+yw3A
	iOoLULC+aUA80lEBORcPoygaMSNtJQy+VG0QAqiYbRN9TYggHcCPIaGi1TD6A7w1H2+f3xEonBW
	NaI4q2UbMzdk7dUqOZYwDdWvhB
X-Google-Smtp-Source: AGHT+IHBXDYwIXs3ooyGp/+LMckjMUIqe18dzH6Im4yTTUMSPM65RY1hgaSrh8J3GPJNX6j7Q0Pv1w==
X-Received: by 2002:a05:6a20:430b:b0:341:c4e5:f626 with SMTP id adf61e73a8af0-3637db254efmr18281678637.7.1764401093818;
        Fri, 28 Nov 2025 23:24:53 -0800 (PST)
Received: from localhost ([114.84.66.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5095a1d85sm6342362a12.26.2025.11.28.23.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 23:24:53 -0800 (PST)
From: dl <laughinglucky6@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: dl <laughinglucky6@gmail.com>
Subject: [PATCH] net: dummy: align block comment style in dummy.ci
Date: Sat, 29 Nov 2025 15:24:42 +0800
Message-ID: <20251129072450.6273-1-laughinglucky6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment indentation to follow kernel coding style,
aligning each '*' in the header comment.

Signed-off-by: dl <laughinglucky6@gmail.com>
---
 drivers/net/dummy.c | 56 ++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
index d6bdad4baadd..874e06d5c51f 100644
--- a/drivers/net/dummy.c
+++ b/drivers/net/dummy.c
@@ -1,33 +1,33 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* dummy.c: a dummy net driver
-
-	The purpose of this driver is to provide a device to point a
-	route through, but not to actually transmit packets.
-
-	Why?  If you have a machine whose only connection is an occasional
-	PPP/SLIP/PLIP link, you can only connect to your own hostname
-	when the link is up.  Otherwise you have to use localhost.
-	This isn't very consistent.
-
-	One solution is to set up a dummy link using PPP/SLIP/PLIP,
-	but this seems (to me) too much overhead for too little gain.
-	This driver provides a small alternative. Thus you can do
-
-	[when not running slip]
-		ifconfig dummy slip.addr.ess.here up
-	[to go to slip]
-		ifconfig dummy down
-		dip whatever
-
-	This was written by looking at Donald Becker's skeleton driver
-	and the loopback driver.  I then threw away anything that didn't
-	apply!	Thanks to Alan Cox for the key clue on what to do with
-	misguided packets.
-
-			Nick Holloway, 27th May 1994
-	[I tweaked this explanation a little but that's all]
-			Alan Cox, 30th May 1994
-*/
+ *
+ *	The purpose of this driver is to provide a device to point a
+ *	route through, but not to actually transmit packets.
+ *
+ *	Why?  If you have a machine whose only connection is an occasional
+ *	PPP/SLIP/PLIP link, you can only connect to your own hostname
+ *	when the link is up.  Otherwise you have to use localhost.
+ *	This isn't very consistent.
+ *
+ *	One solution is to set up a dummy link using PPP/SLIP/PLIP,
+ *	but this seems (to me) too much overhead for too little gain.
+ *	This driver provides a small alternative. Thus you can do
+ *
+ *	[when not running slip]
+ *		ifconfig dummy slip.addr.ess.here up
+ *	[to go to slip]
+ *		ifconfig dummy down
+ *		dip whatever
+ *
+ *	This was written by looking at Donald Becker's skeleton driver
+ *	and the loopback driver.  I then threw away anything that didn't
+ *	apply!	Thanks to Alan Cox for the key clue on what to do with
+ *	misguided packets.
+ *
+ *			Nick Holloway, 27th May 1994
+ *	[I tweaked this explanation a little but that's all]
+ *			Alan Cox, 30th May 1994
+ */
 
 #include <linux/module.h>
 #include <linux/kernel.h>
-- 
2.52.0

