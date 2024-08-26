Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD5149C4A
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668299; cv=none; b=H3Rd3rq5UkPl97chirevxDKMzTT5Y2FPDX6EMD27ACm4ysz9g83X6O513LhUt06gWCwa7+9ywMonTojf/hG6+I9T784ezrjpT2nAyjWkxxu0ntyV4gJO+sWu2Kepm3LIBq5eoPDVGji2tS8e/66eXta9PlZnFTh5iWT/6W8Lq9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668299; c=relaxed/simple;
	bh=D56uU97DHLTAV46MruOMwh3ENgVDe/CheFULj4BVelg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAWZwbljBaHCSrI7ZZYitduYSgmFO7rGfTzfeFdOjCT+or+ZUmiEUvgZqmNl46SNNJEaekR9rrWiIVzDV+u2sqxTXYWvk2MsbIt/PE3FuWn8ya842TTTNy8AnXbc0b7r0MTpyFBvpqE45BEn1o3TNKjHyqORd9kkqIq1HnaBmbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EiprRgLO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EiprRgLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724668296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
	b=EiprRgLOvwbWUHBEAZ/hosZdJUWMRiAGfTJS3JttxAW9hzbwc2qpn8XUs1EVgSOtJmVh2F
	5/dMkYO2khSm04T2z33Gr6Tkr/3L328mHZMIzLjNIfnr2JD8FuWWEKh58EAkYY5QGlKrv7
	2m+J4CM1ibLiLCc24wosRrLwQ1FW0KI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-tu5vmGyhNtu0rvCem3J4Rg-1; Mon, 26 Aug 2024 06:31:35 -0400
X-MC-Unique: tu5vmGyhNtu0rvCem3J4Rg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3718a4d3a82so2226472f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668294; x=1725273094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
        b=CT2zyRwaSmAsXAW0X82V8U1dUpqiXrtN8WWS2ySUVPtFgp9zu7TSgLNt3QjteYjJdX
         uIwBOs6ntb/Ud8d5JPU7Mz+4pYd9WIklrHh0MAUD3jPgJENaB9eY5bVAtkEnL5NgBnt2
         9+XJG+XMlXfwHqqsUH+yOO47ahB0w9H0WurPlJfKb4iUbADN/Lpu7Qi9PCNyypr5fp0v
         /lQLrZlicl2q1WiBG4rC1OlcAmYySw5NrHLt2jDEOLM6l62NYEll/jawUx75SQRtV5vE
         Fu41+UAQfG6etx6qEQErs3i9V+xTZnhGo4Ul3W7W3yuzmC+K7RxVpGMljIUU6gcjGVwv
         ICnA==
X-Gm-Message-State: AOJu0YyARKmPWQVpB1dn24PRV8qsbtD9XgPpqRCZifo0pUWLD54kCw/s
	TqEx7UErQ9GtV0ugkd1L0ZoO23z1i5u/eH0f3qNK/WelGQKYqV50XR0xB9OabIPABA7BpXUphm+
	qKxwqT0kWz53pVn2CjruaDf6O/3rz9d3ILB/GNrvsM4t+bvw/AbOjLhMUaPpO/OeK3g==
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id ffacd0b85a97d-373118e356cmr5559985f8f.51.1724668293903;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUeeP55UuNdWAbZbdqz9KsjtE0dvBbjRTHSYopNttrDKLMjjvyaUEJgoMgra3xM9ZAZ8FKfQ==
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id ffacd0b85a97d-373118e356cmr5559965f8f.51.1724668293420;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac518043csm148327225e9.46.2024.08.26.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:31:32 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entries in TEXAS INSTRUMENTS AUDIO DRIVERS
Date: Mon, 26 Aug 2024 12:31:29 +0200
Message-ID: <20240826103129.18882-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e486feb7b8ec ("ASoC: dt-bindings: convert tlv320aic31xx.txt to
yaml") converts tlv320aic31xx.txt to ti,tlv320dac3100.yaml, but misses to
adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

The pattern ti,tlv320*.yaml in the section already covers
ti,tlv320dac3100.yaml and ti,tlv320adcx140.yaml. So, further file entries
in this section are redundant. Adjust the file entries in TEXAS INSTRUMENTS
AUDIO (ASoC/HDA) DRIVERS accordingly.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dd88c28c0f7..6aa85a43d8c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22753,8 +22753,6 @@ F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
-F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.45.2

