Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D820C478
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510868; cv=none; b=tPspZwz9rORE1EWOHb2n2Uy6iNmoWq9C+lKfi4nl3esjuR0ZVwVa3Cwey1MP3CuWfs2ip8pGT11T6Xtizz3WgahPvhYW5rwIhPg2PcNDRKAAyJYfLkWQzdESQNyUy1VXr7TDNBgOHSY8gbcLpZGqGV1lnEVnm3p2ieB+1Fs22kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510868; c=relaxed/simple;
	bh=4OIC0awF9qdqrSYze3bLtli1VnuK3Zbdv6/S+ikE0YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nq6o4nEaxs5ewiBylYHWaGonoHEJbENUrFOI2LduSjBQEiehczBepNMpceqWou1hfgEcBbo3mRWnRLOlCryC5BFPMqjVnhNoCm2dTVEjKpX7rXg/7wFO2CfIU/A7rwskoEXcW/vS/Oi6vB3CYFptVtpbXfDngR4AEXhKHog7jAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amrX3qMI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amrX3qMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736510865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/s6AcoV7eSa8oU9Cj5O6jNKTNB31fGwfafoEc6FUA1U=;
	b=amrX3qMI46GRa0T/LuQssmTg4CI5iEjphbXLAvBTEvr3q/5Ort1velPRTRcteElYt2Cbpu
	LHwclhpxlRD26bKl3DaQbWgQZYeKupJZuUV+z0leiXEzSk8own2rjB5TY1JPy6A+kspNWM
	oKEQIPGg3n8MqYFWyGFPgKp0Gr1sigY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-qan6yjonPgmQxulYGRpJ8Q-1; Fri, 10 Jan 2025 07:07:43 -0500
X-MC-Unique: qan6yjonPgmQxulYGRpJ8Q-1
X-Mimecast-MFC-AGG-ID: qan6yjonPgmQxulYGRpJ8Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436379713baso9643785e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 04:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510862; x=1737115662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/s6AcoV7eSa8oU9Cj5O6jNKTNB31fGwfafoEc6FUA1U=;
        b=lSjIcC0+/KMK6Zix20qBsjtQ5EpRL8tGGDw4QfrRhnLarXBSFyazFawYhd8ajrcx7l
         TfdgyfdUuAoONqAW5zA98LCW9V5WKkZL/JUYLUXpsyvl9/CWRPvj1yKBj5W0yq6i1vJY
         iS8WqDmAaEzLo6oQ/wsLtywnXmdl3LfeecO3nWbUS814Gkz7ynBJdhq9BYDFxEfWSa4V
         xfaaj8d7C5LQ7S/vOv6aOgb5pGnUQ/LfgApkofW+hptE7uwAKZ632O33IyZF9K+I8rvi
         lW1xZQbBvhROcsqsB9ep/upG+vuCgsONYUpBgVoNJ7RiMiT8MoBA7XYpRkO1le1hytAz
         dgsg==
X-Gm-Message-State: AOJu0YyRb/CDAnH+5LLn3rG5vJPvZwB3s1UKP2qs1eRGZTG7zAknLwJw
	Zu9xA6mhsrGgI1tTGRGrOh3j6Ue7D4dAOKS0rhDF0sAeaUsu+yZdidfjFgGGSIEydqwgOH+67aG
	jUsnVk0Mqaharv29Tbvve1rBeTsgu2p5nV5jo0sgow8DjSDwgATBplBUJrgv81pe4MA==
X-Gm-Gg: ASbGncszWaTENCtOwmRry+PlI5CEnr7mpmHdFubnibtBK+JyWa/9PHwiZJ6gXoFPpZr
	okIvdJbfysPcg65+HWwzCHIheMP1gskJ4ISjA8MYm3CkXKYPOq0R7FLVT80OG10n7XokDeiSwOd
	cPEIwlvDllVmrtQrOVPG+OkYGqLMTIKc2nkuX5hhhKTdugPLzyvKl4+zKwbEm+g8Y0ufsXrrVAp
	MNGc62Uzyx80LorIfl518QRphHQ5qKhFkLa/GLh+Ucrmzwf7e4ZLmItR79VFIFK7w743xLu2xv2
	hMVqgUwsrtE5M9MPtKWO+UDrDDDv
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436e26a9045mr102324415e9.17.1736510862544;
        Fri, 10 Jan 2025 04:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbgDQ3ewebQfLS4urKYZZILsPA8GS3xvXnwmYJ52EVcMnygfg0FQR9Yh+N96Ihn3P91v+A4g==
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436e26a9045mr102324195e9.17.1736510862220;
        Fri, 10 Jan 2025 04:07:42 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc81sm51204965e9.5.2025.01.10.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:07:41 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: Adjust the file entry for the qnap-mcu header
Date: Fri, 10 Jan 2025 13:07:36 +0100
Message-ID: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 998f70d1806b ("mfd: Add base driver for qnap-mcu devices") adds a
file entry in MAINTAINERS referring to the file include/linux/qnap-mcu.h,
whereas the file added in the commit is placed in include/linux/mfd/.

Adjust the file entry to the actual location of this header file.

Fixes: 998f70d1806b ("mfd: Add base driver for qnap-mcu devices")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fc47f2f1286..ccb919894a1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19260,7 +19260,7 @@ F:	drivers/hwmon/qnap-mcu-hwmon.c
 F:	drivers/input/misc/qnap-mcu-input.c
 F:	drivers/leds/leds-qnap-mcu.c
 F:	drivers/mfd/qnap-mcu.c
-F:	include/linux/qnap-mcu.h
+F:	include/linux/mfd/qnap-mcu.h
 
 QNX4 FILESYSTEM
 M:	Anders Larsen <al@alarsen.net>
-- 
2.47.1

