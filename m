Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CC328619
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Nov 2025 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763376053; cv=none; b=rSmTB20pzIXavlegc3J3M3iF/C+4Dqj71xIANKGBMGroKET/W+PjcDH7qSD5yaaShQ4jjKHRsZRS911r2qTDHgCT21Kp0u5n1XEnIN2S6qsQgsoD4r+2bNT56gLOD/fk30RvBWY+fhm8z1984+Q8JAmxcVS9ISUyIPYxP64NXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763376053; c=relaxed/simple;
	bh=AMWmt45bE/sNq//FAFn52LtOJH5BEcAVLHelh7huOBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyU88DCRKeauJS4e+6npNpcWbb9CZmFB+EZlbAK4lUPQx5WnjF2IRTUjXS8drr36JT7QRaEPjF72juhsc8IVto+eGiMJhafaeRYlFEbRvPE7wa+MWnhWjw8t0Q3Ile9IwK3PMbSB4ll56ttN9Xan0J3tQMX9iY5AzmiHuR4ufmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPsezOdM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mM162k+w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPsezOdM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mM162k+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763376051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
	b=bPsezOdMmX6xhTwV1RaiNNkLf8j0OdAkWqP4H93jIYJwF1cUQKqsyBILkdRukwdv8wN6Fe
	sojLEut+GinBIgV+aWRqey3/CeXnMWn2FmZXCw+MobVLKyU3u/kzHbCdGQtby3OIzKwgH2
	AtylQ2RqYRvTdrhON6CcplIW83StM9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-ZDoU9yXROHWmnISCiYqcKA-1; Mon, 17 Nov 2025 05:40:48 -0500
X-MC-Unique: ZDoU9yXROHWmnISCiYqcKA-1
X-Mimecast-MFC-AGG-ID: ZDoU9yXROHWmnISCiYqcKA_1763376048
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so7697165e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Nov 2025 02:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763376048; x=1763980848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
        b=mM162k+wWiMg46GtbdSqeMyS0d1tuaIG8rEpEe1Jrt6w9sQW4gstyAANClD7qcHc82
         WHK8uPPinvP6HZYGaS9IT9xRTTlnO9l/s+3EpQNIsjp6xM0/zjTnCYqzpixklweoXkmI
         BPjjkRiG1s2rWrDf3LiCc2dc8EESu4nXbMOAyrBm2krXjGo7V4PrUIpXDgltaRPpmRJp
         bYO9eSpDtVuLmXVyzHsgqOmT215VK8r4UQzbI97uaT2wdCIJ/dwpFJvwneCg0asmB/gE
         kPW3FBNC4u09gVukxTPHWTgT6BrvFAPIc7olbosJXWn51yEhgwXisShu2AR9rODBPhw9
         aM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763376048; x=1763980848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
        b=EMH6jxas18z+FGatJ2UNmnmsMuP9IKmVvue7eRVjNbnP/eh5EUhfyf1btCNT/5RBw0
         JJzDtmCCn+lrabyNvC/7VXavdkV5GT5Dc3+H7RTw84XrHtK3xVv1BPW25QyGk+4T+Jt2
         h6rPabnyCNq1ln1J8E3fQf3ekxj3fug5x1qNtblHbuQkwRAxMuo7Nn+bIue9waKPPSMT
         H57KoZjn8qXYAJd5Xn+CrLJs23b1E3Yy/unrt5Mc6JbLPgP3+xzZ7dOU5oV9TbzShvnq
         pi1h4UhxphbQKEiZxivpTSLU8XugzcGj0fEcuBXXxREveF+Z1MO050DkTQVwpzkKq/Uw
         ClWA==
X-Gm-Message-State: AOJu0YxmdTlxroTcATOtTPPL0fODGhOToeo8XEMY3/YYKitnJFf2ZMz7
	zgglhf6998GmCOtzr2Dsd6RRu5eSvpm0vOHRldw9KtN59+GyzpW0DxXfaVAhcRbLsUDED6aGM/D
	32H0s89wogNpkc1MFtGRr49pARAPwSG5kw3GP5Wp530rO+8oMvpGYgaMljL0v3xXZXz1aGA==
X-Gm-Gg: ASbGncud3rwG4JBUZxLhgEi0aYCj7qMAqpFhEF5QvGORFfy28gJVrQ5cZdZTwFh9UP6
	WfOcX8mRRCEFrANuMgFtqJzG4VU8YnbQtC3T5s5yFo2ZBCnck1fDgrJ+X7eu2UHcXqhLjKsniuF
	nFzbb0Z69axWjH4mmZDLySw133GBGm42CKfstn/Xakbe4GAWjr8ViEfi+b0iM2ytff2VbIq6ZGM
	mPUxzfBxo0nlfPIgRqrVbBhvBdj8uGhQwRvtsJlNjvsl3BNfASDmPG1ynike4CQbxq/9rjpJgdC
	1zTaf6slhtqxYC5698XXoTj7biAsRKUocryUB36N8tVMRevR8mHO0/ptlYNDRx6RxC9KgB3frAZ
	SK1b9Jke64aCw24aXyBiHbP5kER+NOgbfPDGd0k7bK8Dch7J0
X-Received: by 2002:a05:600c:1f92:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4778fe96324mr111237995e9.22.1763376047736;
        Mon, 17 Nov 2025 02:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDlPS2oFFSJ+IKiQOcZ0dVKJrAeryW0seKkZC07kxLfKJ//4N95dOnEcejlq4qUG/ZdKbm3g==
X-Received: by 2002:a05:600c:1f92:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4778fe96324mr111237665e9.22.1763376047320;
        Mon, 17 Nov 2025 02:40:47 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477991646b2sm130447715e9.7.2025.11.17.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:40:46 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in RISC-V MICROCHIP SUPPORT
Date: Mon, 17 Nov 2025 11:40:44 +0100
Message-ID: <20251117104044.291517-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 71c814e98696 ("spi: microchip: rename driver file and internal
identifiers") renames spi-microchip-core.c to spi-mpfs.c, but misses to
adjust the file entry in RISC-V MICROCHIP SUPPORT.

Adjust the file entry after this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec635515c0c4..320045a6bad9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22372,7 +22372,7 @@ F:	drivers/soc/microchip/mpfs-control-scb.c
 F:	drivers/soc/microchip/mpfs-mss-top-sysreg.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
 F:	drivers/spi/spi-microchip-core-qspi.c
-F:	drivers/spi/spi-microchip-core.c
+F:	drivers/spi/spi-mpfs.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
-- 
2.51.1

