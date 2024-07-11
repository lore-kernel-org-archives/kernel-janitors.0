Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C612DD9B
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720680717; cv=none; b=ZppNApB4cp6EWG/aSILni3G+RcprbAq265HM9PsyON3heKl7Sby/OJJQYymU3YZA/U1QWAjnIbm0Sr42SRt581zbTiLeCmkzgtnT9kXuNN2eByjFE5RS6Aoxm8iQBrCQVsC4QxQpwIKDaMFTRcsh59sRmbDA3VdM8PEfoWFvrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720680717; c=relaxed/simple;
	bh=LCK9icEae3jKYmdEHdfJqroHgzlTNAWTkaaa0AbjU4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gw6Z7DlSrg+458wxk8SYxeAlrsrJATXZDFJHcf1Lg+gMxcvq/9nW/oXzTU1Hi3wI4AJ5a9/o34MhUTNUotWRysT0Nioq2nqUawpZc+307IQo9ThBpJoxARdw8EbQmAD5WElj7AqLiuhsQNSdGwqMbhJcMAcRLyMPPiaiqxmdCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuTv+yla; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuTv+yla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720680713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OGHWmQ5BDSpnthAm3GCMpgKvKr351yaxBIw3YmVdyjY=;
	b=TuTv+ylaoxo43lGkikHQvrm/9w+QqGMiLTddjovqmyPC4TGn1eAKGtXSVQY+COiNWetxOa
	Ta4rdDKS9NYstrROAcPNCSGa9/LYn8XM/4YpIjnfBcCTZL+eOCRZhgGD006nvNzRaQdPg3
	yb7GS9/YphaFYaFlmhtfPxudkbBNqKE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-QPiS3w5IPnSw5LG850EiQQ-1; Thu, 11 Jul 2024 02:51:52 -0400
X-MC-Unique: QPiS3w5IPnSw5LG850EiQQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a77af33ce50so52330366b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jul 2024 23:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720680711; x=1721285511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGHWmQ5BDSpnthAm3GCMpgKvKr351yaxBIw3YmVdyjY=;
        b=PGVTuaA/ScLrsURh09951oIjdo1jHBDUiwPpXgFXw8Ed8wFTJQ6X/2GzqdtoNBV2pB
         Gc6/IpoYfB6qdM2TFctQaTu6lcWwm/mvyHjb8ovgRHO1j9kNvu1Y7BhcX+rI8rGNP8qK
         UjSdKJF5BRrlASqixHEG4+23qvPDc7G0LUT3mi7XQw6R4GV4zsj+Y+IbSEE0GVlVxqL9
         Q+P9V5T41DHPR+L2rM00kNs1O5HPsKIrCPGkmPnfKri7WUIWc/1J23BtoEJNO4HnoXLd
         H0HzTcO9bol6YiAaW+remc0DAL8bEX/XgHBoaOHsMRmZFhOlzyZkwUNifNsqvCpE5f+A
         VyXw==
X-Gm-Message-State: AOJu0YyNe1zlBZDar9gyWW7Bc4HEAQ1nLt95hRmd+nVMgCZJwwBPutkK
	HLzua8FN41R4tGUXJcJB5XyMuhr6tcSji7jydHzg812/yK2Yv/uOoMOOpGxg0VALphE5szAIeMT
	0AoqgctrcrHdY89cmGdXn7N0h9wMCu7I38Q7T/ThOsqkrDcRRQWfDQ3ix0hS40V9QeghyQwcjfQ
	==
X-Received: by 2002:a17:907:7f0e:b0:a72:4444:79bb with SMTP id a640c23a62f3a-a780b881cc4mr674810366b.59.1720680710877;
        Wed, 10 Jul 2024 23:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNGa3iTLDkJs9r42QlkOKMbEzsJfArWsJUH4Y9CnC2eN/9R9XztdP8hv+banbSj19eiMhoRA==
X-Received: by 2002:a17:907:7f0e:b0:a72:4444:79bb with SMTP id a640c23a62f3a-a780b881cc4mr674809466b.59.1720680710535;
        Wed, 10 Jul 2024 23:51:50 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a86f620sm226365966b.209.2024.07.10.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 23:51:50 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lee Jones <lee@kernel.org>,
	Karel Balej <balejk@matfyz.cz>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in MARVELL 88PM886 PMIC DRIVER
Date: Thu, 11 Jul 2024 08:51:40 +0200
Message-ID: <20240711065140.140703-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit f53d3efa366b ("MAINTAINERS: Add myself for Marvell 88PM886 PMIC")
adds a file entry referring to drivers/regulators/88pm886-regulator.c,
but the directory is actually called drivers/regulator. Note that there is
no 's' at the end.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair the file entry in the MARVELL 88PM886 PMIC DRIVER section.

Fixes: f53d3efa366b ("MAINTAINERS: Add myself for Marvell 88PM886 PMIC")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eab44bd1010..bb7b5ecbc0b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13495,7 +13495,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
 F:	drivers/input/misc/88pm886-onkey.c
 F:	drivers/mfd/88pm886.c
-F:	drivers/regulators/88pm886-regulator.c
+F:	drivers/regulator/88pm886-regulator.c
 F:	include/linux/mfd/88pm886.h
 
 MARVELL ARMADA 3700 PHY DRIVERS
-- 
2.45.2

