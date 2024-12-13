Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E308A4A21
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734069628; cv=none; b=lSl3J7/0F936utCI2ejIJq09/6LQhE6r3vg9Z5Ootr2AQX3tvnMym1W99mho2PuOQF/lhVMw121btbmBdLNyQ9Um0kzNQn4CBkgWX10BbtJCWz18Hb2ubpMtx/7No+xL+4T045qZYKkgOBq5AtsGwJFdSEuqj84rJKKgs1BI0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734069628; c=relaxed/simple;
	bh=0feM0v9/HSqQnZrLaLJb8piuDlCnb2V34BAOP+y2+DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BAFw8OTNAoFv6j8PU4pNP5c0pNQONWOvGJvE0YbTX91XXdEJd3hevjXWPtAf4HjldRiOOqJyEhuDH2ejJy2OO2/5wDe/oImqlzm4Ht1bp18kxDzkh9vXOEPulUpfyAyeTBT3HyHHwef8ePmBqE9+ze7gurkgvs6/VTuzZ9QugmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlykQvXJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlykQvXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734069625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
	b=RlykQvXJ2MbzKl81q/vTaA04ErSv3jsKpj5pO77bILWOwB87jCg4u9YJm72q8sftFynFK5
	5yaCXOCEkleIdxrsV0vqrUQLqL5ZGhdnpqAyRsGWputfFtdqaM9xw9qsLqtjAS8kxKbvlt
	4qSMJdKdMpkaNOLkNMtKO38w2H4ywYM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-m51cy_8pPNm0wwNyz_EBug-1; Fri, 13 Dec 2024 01:00:24 -0500
X-MC-Unique: m51cy_8pPNm0wwNyz_EBug-1
X-Mimecast-MFC-AGG-ID: m51cy_8pPNm0wwNyz_EBug
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6a1595fdaso11428966b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 22:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734069623; x=1734674423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
        b=sofQa4F6S1ZveecyDxB7O02cs69qk0G/m9NZylpD3dmMKJXpQJmo7VEs52YJ9opRLg
         Xn8jmhQzhJZAnyUBcnllgF8TGHGlia8w04fv9QYETFV9xpUKY3hl5rj6G0H9opkol7ix
         ZraHGhk1wDnA7ypyndWXDtlG7MxEJ86AG67Kn15L0Li1q0Qf017OehcsRpWjAzAv0P0t
         Lv06FL1B4yzNVHkmrG9a3i5+vIpC7xDzD8aUb0nRb+z7SmaExh3mWR/AgvQRj4jclWbO
         gy92gBX3Yzce6gbyppfLIZyAHSbV2WzZdagdoT+Xf2GcIV/jpgmGvx1KkLb7eeZc/sEg
         0c8A==
X-Gm-Message-State: AOJu0Yz54mThcmlOtVS2TO/sxcUgD5K9ts47fnMLawpTPzMFIndq1Fw/
	Jb/gsfoDiDRWDuUHm3GUk3idkeIPcklAZJ5KAuBuRSQwI3Apns9W4iMwoSID4VNnPEstv1M0rFt
	tKi/QT7Ix12NCMqhX8pJ3rDRlLVM6TNn9h9ArOiwJVuLMCHGs99Ekc92nu8FrpsiXJg==
X-Gm-Gg: ASbGncuJmsB8KKqFYNWyOFzKj/ZlUmfi/DUGguCBHDpNbjyaFVMQJIcyiJzNqdxPwQg
	rDjzCfMu8zFiFdy2Oa+5vw6NNy8e3fiZfAMpuHXwy64Iiu3S6m8DEHNio9RinexeTnJXKe5p+W5
	T7NjIj1S63WQ/K2+opVseUqBSdByXpcPrwaxK03/3A2BMjwL96qveBXFcWuBdQinn41vEAv6ZTO
	lc/VoLSwgRt+hw50ACtABSyLEOzaaovcUEHnur7UuZk35hPO1BcBfE+4O8vlJQYHWlNq7eonAUm
	mQxJEaIcIXijWU6yeQV5g6OctHel
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id a640c23a62f3a-aab779c8bcamr130015966b.25.1734069622967;
        Thu, 12 Dec 2024 22:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwxJQVizGE5WgbyQd8OUq9Hy5FwjaQj5sQqA5agUSpWu1Zpe7/5Tw755l4EDxVsme0PEmFQ==
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id a640c23a62f3a-aab779c8bcamr130012766b.25.1734069622555;
        Thu, 12 Dec 2024 22:00:22 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa689a0a6fcsm648156266b.30.2024.12.12.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 22:00:21 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in MEDIA DRIVERS FOR STM32 - CSI
Date: Fri, 13 Dec 2024 07:00:11 +0100
Message-ID: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
adds a new driver at drivers/media/platform/st/stm32/stm32-csi.c, but
creates a new MAINTAINERS section MEDIA DRIVERS FOR STM32 - CSI with a file
entry pointing to drivers/media/platform/stm32/stm32-csi.c. Note that the
file entry is missing the ‘st’ directory in its path.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. Repair this file entry in MEDIA DRIVERS FOR STM32 - CSI.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bff3d35f80b5..230b7a4ee95f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14551,7 +14551,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
-F:	drivers/media/platform/stm32/stm32-csi.c
+F:	drivers/media/platform/st/stm32/stm32-csi.c
 
 MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP
 M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
-- 
2.47.1

