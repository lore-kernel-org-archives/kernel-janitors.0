Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4A3128A9
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725731; cv=none; b=lqEFIsAqF+obDJ/yi6mSfxERhxzgmk629GRFmKuAOb2IC6YrHHoLJE5eqPQHjNJp+Hpckpotxh+YCmeBfrdKXmtn7ZqqdHOqMepUcNkfZCGz0pRnvXwGahE2reJWs8k8+PXThIipSqyLVldmvH4vl+YnMoUa/usM1+8n+Ozji3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725731; c=relaxed/simple;
	bh=wtJAyPPNUJSoG+tZe3t5bj8Phdu4BHHUQMRRI2v+zXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTFdIaDYOPZy//GjHg2hAab5r9SAmUPRqOCfcBRVNty6Ng8y8eaezk62s73BVa75sNIcpNmXc3jM79LAlLmuObrsDxydlExsiai8ufnuRw1O+X9/dH4ydRN4MeU9j7b/spFx6Ky4/9zgfXkCuKP1ZhCDkYioWnLWlCEbC/AY50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPFO9FiH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPFO9FiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761725728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ff6OXw2ny4wHZ63fJoa48H6ku6dx6lxuxmUL0GeNKqE=;
	b=XPFO9FiHmcykERgBQXLMkW0Rft5IIVnFbO2fUgJE0833lysNUKsxsK/HYxHbpCwi7kTcnj
	ipcv5nK/UGJeOrUJPPbrc3shJm23wr0EK8zQLvTSJ7RgKM0POdx/C0NOi+mIyEYQ3nivjJ
	lRRSlq0cSpweUk7GRv0Vw08GfFdYNbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-3b-Pl3HmM8O3hIZYZcKQdw-1; Wed, 29 Oct 2025 04:15:26 -0400
X-MC-Unique: 3b-Pl3HmM8O3hIZYZcKQdw-1
X-Mimecast-MFC-AGG-ID: 3b-Pl3HmM8O3hIZYZcKQdw_1761725725
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-426feed0016so2289453f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 01:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725725; x=1762330525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ff6OXw2ny4wHZ63fJoa48H6ku6dx6lxuxmUL0GeNKqE=;
        b=ZULu8RmUwXUbZHo5308pvFvxPOYlplS5KWrypsCj99RsG2Ucr1is5e7hnNfWhtLF/m
         NJXH3c+sbkHZcH3i9zyNSbg6o7gB1VSctnLQ3kv+MgkXMcA1/lRm0YPrDm1AmlyeBgpI
         nUP0eyUslPmgupes3pAK0gpqcDSl5lJicbCxvXlWXcxj0UtE3A0AabE1HfbEU985PwZI
         ndcSMc2lrVojUEnZ26LurZjzf6QUuChz2DV/tgYPX2WAT22O8LThd/Ht9F/GWrFT/qfr
         wU349Mr9JADmA1JcO8Fvr4t6srV8PQlWZI8+X52yXCxhUEWGj2/ITpGY80N/Aet5sbLG
         hVrw==
X-Forwarded-Encrypted: i=1; AJvYcCX5AJqBVcd23MEQRMZXN3JtElBQF7neFuO9j7G/eI2NGKfMK8wSTKEu2zhdX/jC63ahuVFm7C39Cr8KjMXMn3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wM53OeZZCfnOkdurL9UmU8jOAM2XW1x1WrH/x1J1Uh0xUm1F
	WdxR82vvAftqlZUGbCzpdOIz5zCV7EOjHXFUYia+sZeemKlyuzWYcnVmNwx8EBV+zdSLkywiUCB
	CcsYI+tE7HPF4mq7zudh5bTLTUnHQk8KXtHOAXa858stkxKlq5lNftJ25ArRFq3XQs9vVTA==
X-Gm-Gg: ASbGncuX4JLkDBSOAwIoBFGZecoKAHpgz7tAEmtCr1/wxt1CkARtQM38aF03jF19FV7
	oV94lKJq2RfRK46w3kmhZQNe2P9Y+/cEvVIKb5ntoTcG1m2Y2b2huwPRRnTXYPdqI0yr0Xs3jus
	NRJIN2oMid17TF6f/kMZxrOv/6LT8k1ibL4jVPSEdS8AfDQRz4HDQH3OT14pxrsPKD0DHYcmtBV
	u4V5VwciJsFxxDbh3Xs6qWKpL6/M+MuGE4BPtjooCTtceFAUQb5HOyB3NMNt8P1gZalyXd2riwS
	CnsUhNK6vW9GiwyEGcFHHQz+CuSr2w7TTX2/TW/ztpEMpkC5M8wRmHWaSEBQmfX/nsvf6+F6sxQ
	19pW/lK7oy43lbimLabGZJ53UQlZsl2bM7Qnf05blTIUtmeS/
X-Received: by 2002:a05:6000:2004:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-429aef864e9mr1647193f8f.25.1761725725476;
        Wed, 29 Oct 2025 01:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyeojvasr6BooAy28GwhnCgQwf9+jW8RWuw46Y6Ps5/WvbTuvsqLh+jJH2JbliCLbpmi3Owg==
X-Received: by 2002:a05:6000:2004:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-429aef864e9mr1647165f8f.25.1761725725081;
        Wed, 29 Oct 2025 01:15:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm40050385e9.15.2025.10.29.01.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:15:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	support.opensource@diasemi.com,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove obsolete file entry in DIALOG SEMICONDUCTOR DRIVERS
Date: Wed, 29 Oct 2025 09:15:16 +0100
Message-ID: <20251029081516.83298-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 6277a486a7fa ("regulator: dt-bindings: Convert Dialog DA9211
Regulators to DT schema") converts the last txt dt-binding in DIALOG
SEMICONDUCTOR DRIVERS to the yaml format. With that, there is no file,
which matches the pattern for the dt-binding txt file entry in that
section. The existing yaml files are already covered by the file entry with
the pattern dlg,da9*.yaml.

Remove the obsolete file pattern in DIALOG SEMICONDUCTOR DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8085fdca7bcd..70de2f9c4a50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7213,7 +7213,6 @@ F:	Documentation/devicetree/bindings/input/dlg,da72??.yaml
 F:	Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/mfd/dlg,da90*.yaml
-F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
-- 
2.51.0

