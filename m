Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095913C8E8
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Oct 2025 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299379; cv=none; b=CNXq8qDtY46SolM5ZIjbzspD2Z0hxFO+Y/KuETbz5K7Su7AobYHzafPo4JsO7YKigqVwtXR/igNi3ydauDAANn3lLo56Bp82R15F/TviShEcbavtAipYIkHEgWSeBnmb/ulvaJRdgLi3u8ydfoAzA9DyR2y4hUPa88pQPTuTkTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299379; c=relaxed/simple;
	bh=zTZvQvz7JG+APZWziums5mPjsnmOIULh8ulG7LVPhkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DEhzesW4NNdQX/gsl3gwPyjdKgMtpdMoWIt3E9m6Iq3E1lY99vLK81ELs6HM6IKcTOXPGfj+WxvtUXnGnvkS2rdAlurmgXkAKetFBxacWEQYy2zXKhfMggiepNPUJbiQvprhL5RqUrpI99kgOHMLIxKzNF/ilQ22qPn/9u1DI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEKhphph; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEKhphph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759299376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8gaStWL+ntZFUm4T3e327BEdVCx4LxQqNCCOu6JDj8s=;
	b=hEKhphph4cGAUKhqWk9/qKaXKGfkDbVtJdTFMSUx1LKd1dmiiTf0xccDHU7DHAEbzB93ro
	YiZF6GhdkrCart+2INWx8CQeheTDI+wHpF0X2kzMRIovggDRw1VbPaZ+fgBkFa6cvtbGmc
	XRCRrsD5PTDffIwx6BV8YgreHMZUo+8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-dqGR3gmDNHmpqqHHzOhS0A-1; Wed, 01 Oct 2025 02:16:14 -0400
X-MC-Unique: dqGR3gmDNHmpqqHHzOhS0A-1
X-Mimecast-MFC-AGG-ID: dqGR3gmDNHmpqqHHzOhS0A_1759299374
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3efa77de998so4063291f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 23:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299373; x=1759904173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gaStWL+ntZFUm4T3e327BEdVCx4LxQqNCCOu6JDj8s=;
        b=QrcMWn/of/QNyjcroIz064rz/KsDLcpbLkd2FhIAre9ZCJm6Q1emFr1bTfQ4BL1Lk2
         KlZLvjKY2e5/SKhLu2d5nG0p8a/cuoiJ1xAYuLcguQ12grk107A4q0cNiep0NBnMFD+D
         VZilxM3yBuHNc0Q35+FwhqNWqrFTtX3zd6+5tZ7RaAV0xEsW056LMDK2GtyioeLUoxSv
         9le/uQvKvDjbAjqP3i5QSJgVi0ZAVODKmja4iwCyfHJCJ14LxXMsz/F6qVD7i3YZVQBR
         qEVvJrFEKy/z9PcVeRzLI7nDRLgz1zy2Nnle1rReevieWabhDzFkOfLiklm9VMmpMNbC
         5tJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjnyjtfc5qeHUoVD/zNYWWK77vDwj9FrDgU407Z/+kJmxUTBcAKKSx8NAhFq2GUQWS5S+l/4icgi8l73uMPrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTY3gLbGN34qaNFr8l1NA6Tui3CFLwVcL22nPi4HkgHu5y+HV
	nssvGV79C3iYiUYONNT7q9OOjTcPAKGE5gmK2FJbZleVn7E6n4nHyMmBdemfzRn8UjmS3iWRvXn
	cir4/YhBxE1TXF4UEjXJlhl6FPIGvc/UuMjxVQcRzzmdyTj8VcJHhPbmnvdCzeBvkB+R6Ng==
X-Gm-Gg: ASbGncsFSaAsF3bgPBE1283jXNjK9zDCvOasat1F2qJ7zd7pByE9WjkOI6GIf2ECnFk
	99MDTV+bMbN7oKmuTmy9jQDsga+tkzz5hcgFHOjg48PZniUj18E5nyBcBhCzD4+eHFJifpaXZUi
	o1nbbBiPikqNjhEveeiA6mv3zSPtJV5C/Bwk4jWdAnBFwhlr7npKGZQHWV//4+Szn4sZkKg9Zw5
	IrpRodNZTzJbRB8FpjP0gLhdySdjwPW64NWK1R3sv3xp/xOI3v7UdcYOPUSS6N1NvC8S0LrvIZU
	xUNz0owHOwAfb7tSgCkv0i3sZmfBnoXEm1y6Iartvat2ABsll3qjmaSPmvHvcs4ncgz7Yx06G+u
	5tP323Tjj4FPI/c1mCyE=
X-Received: by 2002:a05:6000:2381:b0:3f8:e016:41c0 with SMTP id ffacd0b85a97d-425577ee9a5mr1625961f8f.10.1759299373642;
        Tue, 30 Sep 2025 23:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqt0cbQ3yhlC9NUmKLr9TrwlDXftJyJ8jaxrushSt7Z7NutbNA/tFFVZiy52RJ3xcD/4g9ZA==
X-Received: by 2002:a05:6000:2381:b0:3f8:e016:41c0 with SMTP id ffacd0b85a97d-425577ee9a5mr1625948f8f.10.1759299373270;
        Tue, 30 Sep 2025 23:16:13 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-41f0c467ecasm12794524f8f.38.2025.09.30.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:16:12 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Cc: Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEGACHIPS BRIDGES
Date: Wed,  1 Oct 2025 08:16:09 +0200
Message-ID: <20251001061609.513432-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 74459b0dacce ("dt-bindings: display: bridge: convert
megachips-stdpxxxx-ge-b850v3-fw.txt to yaml") renames
megachips-stdpxxxx-ge-b850v3-fw.txt to megachips,stdp2690-ge-b850v3-fw.yaml
as part of this dt-binding conversion, but misses to adjust the file entry
in MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 343948543711..250e90f6f0ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15957,7 +15957,7 @@ M:	Peter Senna Tschudin <peter.senna@gmail.com>
 M:	Ian Ray <ian.ray@ge.com>
 M:	Martyn Welch <martyn.welch@collabora.co.uk>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+F:	Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
 F:	drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
 
 MEGARAID SCSI/SAS DRIVERS
-- 
2.51.0

