Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1FD2773F0
	for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779162368; cv=none; b=UnNieHNvkFN/toxFKlwJ2PFnVTk/feppaD3QlZnxKl+pE5G7BcxXwiOJCGPcb5fkxENckCVMVJ54uNuemBmT/mhy9aJwPSqjllvaQxI77kh/zjHz6etkhdIzsAcU2Q3s5sS3MAV0HJPP35Ij2qfCTW9yqZlCZKP/TY3n7IBF2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779162368; c=relaxed/simple;
	bh=VbG1Au7HX7Usi+UALoJTAbC02ZVa6ikt67lXi0ZitvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7e2zrpturCKiJr4eULrEP4dtIeIp9XeOBt8r41QS9vKJ1SeRcLMqZoPELUmlmtU4Xp2Z0yHHEHNyShH1iA20Csq59xVN5fZ9RfkRckUggMizpXcz8CPqvF4ZQ+Pw3Ud8QpI4SL4JVu1DV3HK8NE8JbV4fNMJluPWSzKfpnaTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CEQ7IbDD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VEewFPRU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CEQ7IbDD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VEewFPRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779162366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cPGa/ywHUpCNwcQzKeJInlWvpOAWzktObSrGRj8rzb0=;
	b=CEQ7IbDDkinEGKxespPyOL20jKweIrj9el/c5WwmNvV4BDvUGg5dIk1yc5dcm1hYwcavbO
	5myipMD2Y5YWtQOpIMnwWhhS/aYbW5kRG5SfD6cMTzzqnK8KsoHNmTAysICNI5uYzbCNiI
	8sbgSQEAhTSiPiIf1XpltCbv9nMvmj8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-9ajqe76rPCKaIjpVBYNW-g-1; Mon, 18 May 2026 23:46:03 -0400
X-MC-Unique: 9ajqe76rPCKaIjpVBYNW-g-1
X-Mimecast-MFC-AGG-ID: 9ajqe76rPCKaIjpVBYNW-g_1779162362
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48fd9c22b8fso24541285e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 May 2026 20:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779162362; x=1779767162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPGa/ywHUpCNwcQzKeJInlWvpOAWzktObSrGRj8rzb0=;
        b=VEewFPRUTkGlxV3w1DffoOT5rz0F1sdB0HGvLsJEOrscT3tF6dV8lM84CGU3B5UPWE
         FLlxm1fSZEdS8BLC8RRUs+sQwaRUxs0GKO8s88L4ObIGJrt2X3Y0iLrfEnqpcVararM2
         5T5lVmkqQucZbSTFDcT5Ug8VNXpif59H7xRnbZFriXDZRgfj1248a1E4FIeAvzGvXWHt
         pEdeueVaYYPTFZO+7DUOyJWpc9asK18SnQRmJTMQ6byoS4npaa0PlJBhy1h30Lo2mHcK
         Nt3yxdGbcWPiKEvD42Mji0g+9j6Y28i17NK1Vickbipbmbhp5/0S4271Bf1OHpZCbc2q
         G9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779162362; x=1779767162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPGa/ywHUpCNwcQzKeJInlWvpOAWzktObSrGRj8rzb0=;
        b=lEJ29KqGWtqtUlw3X0Tk8ibY48HmzQogHxzOE3nDhiBpuJ5IKM/0J3d7n31HQ+ppr/
         vAH9KQQdqgM6UnKpUFK7q7rooqn8DignTGmwV2Q1qTKMymjf10pPi7O668O3U7atVHM9
         W322W+A/ClSIGFUFx7eMRGEUJgfv3sV7WzJTlYc70TcVYgL0lKBKGCsI8Xrlq1bCwOf5
         vM/BQxWWJghy81ldh6TF4sOeNp2/Vi5JHZQkI9dU+60OVPQFB2L+ylnc7EZ+WUeSgIkx
         4cmVBE2UwIYQc+Sz+00BHXnOwm07hx81091Oecd1/G7BwlU9rSErb7tb5Z2Yw3wENm9m
         uiqg==
X-Forwarded-Encrypted: i=1; AFNElJ/YWpSKaETTXOKFQIIWfGudk3Kw/7Ukb0s7wtT72kKezN1YDkR4ZxIlarwAC2Ee3paA941KDtLfahzUIY1v2i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ48jPtVOxYSAhjkJFyFd3jogTSiBFhW265E8YiFBiNAvG6eZY
	JdDaXroToJaMa5Lp97gqgqSjsMZaTyUokT7XuWnjQ3F4tATJdG/6+9jjBPY9Upo/y2UQ2+XjUji
	Vc0Soa9/hmsLZoTVUbZKnQFflXbpKYcsmtenVPEgfna14AQzO3a4gDG1zC+Z7sdAgst1WLQ==
X-Gm-Gg: Acq92OH9wYR1bj5hL/lSk+sEdgfw378jvdvK5671BAi25eBgyQ9h5LASbgXUcVihMGv
	8kEOv372EL39nwaahAz8egmoE7cd7BrKqMFxxgFnWVEabGwHuPedKajK16E5KbzSTh6+OZYk+L8
	aK/e0/fgHISe2Og9qUK9w8cUQuIPHFo2/2ktLuR8cHXDSQqNU2yIlVG0QYJUT/FfZi1FbUTUhMF
	reC9KkomErzsDtlm9l6fck8cJE7n07icu1bpbtZHlGeX3TmcwWYspjG82PfkTjezmlpeILHKmNt
	G2L5rHfxFkS0Ea7fpCCgzRHDpmozvZd3HdKhwJeyAQUsrjwH8nbHe0cm1w8wFGPJrVvOr06uu3H
	REobrrauWrtIwYOkpZAyBrROQQDpkz/4FIkjGgGPfJ6XUymVmPh/82LJrMZ+JM+vlSnBL+xs=
X-Received: by 2002:a05:600c:a11c:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48fe61f27famr203570495e9.14.1779162362568;
        Mon, 18 May 2026 20:46:02 -0700 (PDT)
X-Received: by 2002:a05:600c:a11c:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48fe61f27famr203570355e9.14.1779162362276;
        Mon, 18 May 2026 20:46:02 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2c96csm98434245e9.2.2026.05.18.20.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 20:46:01 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ingo Molnar <mingo@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop obsolete FPU EMULATOR section
Date: Tue, 19 May 2026 05:45:50 +0200
Message-ID: <20260519034550.276316-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 823caa173884 ("x86/fpu: Remove the math-emu/ FPU emulation library")
removes the directory arch/x86/math-emu/, but misses to also remove the
MAINTAINERS section FPU EMULATOR.

As Bill Metzenthen is already mentioned in the CREDITS for his contribution
to the FPU emulator, just add the email address in the MAINTAINERS section
to the CREDITS and then drop the obsolete FPU EMULATOR section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 CREDITS     | 1 +
 MAINTAINERS | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/CREDITS b/CREDITS
index 59d5de3eeb5b..0c810e190e7b 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2807,6 +2807,7 @@ D: Some of PAS 16 mixer & PCM support, inet6-apps
 
 N: William (Bill) Metzenthen
 E: billm@suburbia.net
+E: billm@melbpc.org.au
 D: Author of the FPU emulator.
 D: Minor kernel hacker for other lost causes (Hercules mono, etc).
 S: 22 Parker Street
diff --git a/MAINTAINERS b/MAINTAINERS
index c2539ffc179b..3198b032d46b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10163,12 +10163,6 @@ F:	Documentation/fpga/
 F:	drivers/fpga/
 F:	include/linux/fpga/
 
-FPU EMULATOR
-M:	Bill Metzenthen <billm@melbpc.org.au>
-S:	Maintained
-W:	https://floatingpoint.billm.au/
-F:	arch/x86/math-emu/
-
 FRAMEBUFFER CONSOLE
 M:	Helge Deller <deller@gmx.de>
 M:	Thomas Zimmermann <tzimmermann@suse.de>
-- 
2.54.0

