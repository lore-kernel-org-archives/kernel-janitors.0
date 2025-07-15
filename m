Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F2264A9
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561108; cv=none; b=A9Z5BsztBmZ6vtp025urVLJdkOf+c+caf/4UlcKOENruRjViH0k9k9t7h9b+ThyE5YY6QNwVPxUANhrxmYlow4ZfpY4f9wknXGkiQ5fRavI7GgUhpO8RFOBu/XIYXRCwIcp54803EiiamxahbVr2IRvoPoYdMW6e7XoNDPRFiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561108; c=relaxed/simple;
	bh=XxaeZ3neYhiWIw0v7Yb/IZodIsNiCdwRVdFvM06g4Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scLedUhB1iUooCH3KmT96mUnB3uzlkSbV3P4x3glWHGxELxnniVVgdr5giwoPbG5H8tjzXrJVT01wDRW2GSXhM4inHpElPnYeYW1rBj/U6NxbbK2pAYctE7ef0ZFC1lun0AZfobeztBMlFfHmupB8NToKwugQ74YuK8mv2gCiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtAhMKAQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtAhMKAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752561105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=njsXx1MQHjG0pYvx/jMfwxyJj9N+8fHFUPSJkTCfXcA=;
	b=YtAhMKAQXbfoejIo/liqqKgJ/KjcbHUsSgV7ojI8Q07aI7XEtmd/FkeaSsnZdlbaD7eaYh
	pmHv/34ucJTpvOw86aY/qEYURChA5Et8vekqx/OoYu9YR7H99c/bqZQ8jFPnKWiS/zRtPg
	Wi6mLRHKVbgSIdabceb831IlRedpA98=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-0anQCaA9OsGNEvqXhVxU1A-1; Tue, 15 Jul 2025 02:31:43 -0400
X-MC-Unique: 0anQCaA9OsGNEvqXhVxU1A-1
X-Mimecast-MFC-AGG-ID: 0anQCaA9OsGNEvqXhVxU1A_1752561102
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0d798398bso403978966b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 23:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561102; x=1753165902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njsXx1MQHjG0pYvx/jMfwxyJj9N+8fHFUPSJkTCfXcA=;
        b=n+kl/WvTJyF+HBGkPuhUZkk0H9FeT5HrbI7hd0NkAmC2AtimGZs75Rg4YWFUtgdlZB
         GkuMgIot5Pow0GLMFc8vavxVsstCdukjBkZN6lGWXBbXSMvCFeihY1eXF1qvkObUAbbC
         WBva4YPit9Vs4PjVHWG1UzTwXjloFGwDH/+TajtK8mmwtsUboFtiI4XVtRkt5B+fL8uu
         L4RRZe6b92QWR0KBUbWlh5c1oXGhWaClpOdEt3+tbVMm5lEqwkIrnBib6MbNhI6GK6YQ
         WUWR2AAOKk4bNe2Tnu7M1/JI2SnbS6CcENA7uJfBxjoyXIJJsjeg8TmtDLAy7RJbZEFs
         DgxA==
X-Gm-Message-State: AOJu0YwzA9Ke0lwF/zRvLTmYBbJY+HHczWBTMgLqmjm5YehiKSV2GUhL
	W6K2rpzFuVOVCRvO9lbEtt0VCof6xDkpySbrCj5is2ULDSFPR0ABMFK065sZZD3FOg/yVHvlATk
	cogC3cU7a8xCF2YkXJYaji2X2S0NNDt9HSuUiP+6nE5O1ncBxuLsWD0uRACFLE/6MJRfmPw==
X-Gm-Gg: ASbGncsY6sF5e9wImAPNeYNChru6J3PmB0ecpqlsEmOpsWMRH0NnbO+l6WNf6VxuQt5
	1GA3gkwEiWMiJ9oYPNuuqBTn13a/204mWJgvmqJSmZAKhdwUf1nRJwSRS8DA51JjDMtPW0qkO87
	l9mKIWTRy9ZaIJA97rqwniis/zJOB8l13FnWLsrpWkRX4dEC2Cizu4G52L+QV+jHJzr0Ao0BkR5
	pJCo4PYiST/SVAuXLF1ydGu/pnLS6Kf31gpgHqRLLEnZm0XIrD79qxqKPOr/CKV8rgi92YotqwG
	DRPGRdzcQnOOTaSn8/PpAirC8UNJ/ppmBCipQJhpemeNNkxHkj07k2mM9fairjalIAgiSdIgGtG
	zTeyaa/f7HA==
X-Received: by 2002:a17:907:3e14:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9b96bb26cmr146895266b.59.1752561101848;
        Mon, 14 Jul 2025 23:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbahyJQ8uPvvKj2Eu2Bjb83oyH09cB9oPzy2+yyYmKgrlH0TrWtXbUYxonD5LHJNMzFi0wSw==
X-Received: by 2002:a17:907:3e14:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9b96bb26cmr146892566b.59.1752561101291;
        Mon, 14 Jul 2025 23:31:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df56esm945349166b.156.2025.07.14.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 23:31:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER
Date: Tue, 15 Jul 2025 08:31:34 +0200
Message-ID: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d968e50b5c26 ("media: rkvdec: Unstage the driver") moves the driver
from staging/media/ to media/platform/rockchip/ and adds a new section
ROCKCHIP RKVDEC VIDEO DECODER DRIVER in MAINTAINERS. It seems that it was
overlooked that the section ROCKCHIP VIDEO DECODER DRIVER in MAINTAINERS
already existed, referring to the same files before the driver was moved
as the new section refers to after the driver was moved.

So, merge the information from the two sections for ROCKCHIP (RKVDEC) VIDEO
DECODER DRIVER into one. This essentially results in adding the maintainer
of the previously existing section in the new section and then removing
that previously existing section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5efcdb5537f5..d044e4f71ae5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21673,6 +21673,7 @@ F:	drivers/media/platform/rockchip/rga/
 
 ROCKCHIP RKVDEC VIDEO DECODER DRIVER
 M:	Detlev Casanova <detlev.casanova@collabora.com>
+M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
@@ -21693,14 +21694,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
-ROCKCHIP VIDEO DECODER DRIVER
-M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-L:	linux-media@vger.kernel.org
-L:	linux-rockchip@lists.infradead.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
-F:	drivers/staging/media/rkvdec/
-
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.50.0

