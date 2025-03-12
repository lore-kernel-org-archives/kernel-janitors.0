Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275B23BD15
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774832; cv=none; b=sRREkLy8P56/HBXMTk5A8AkHVlH/S4/brDKBplyIkJqcfADlrsckAz0CMJ/5x6DXKDDqyCuo4t/8LPWQhuZ3XwbdX2NSXGo36mBearzTiE82+RWasZyVN9ZysOk07hMgS/vu2HbBEnekMB6L3nJ4/TSd1wywXFVhvmYa8jMW+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774832; c=relaxed/simple;
	bh=kVD1cBOvbcjfuLGnWQGwAsJLPrywxdLU+w4aBmi2vMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCWf2HddfxtBhpuN5anhJGptRK7XlDfgWozseiNVJgM+jL9IQ/3q5Vr+3uwK2e5R+/InaRq95KXF4Lhfx0cC/og6pfCkaK1syVSng5F+uIqUOzWW/QxtOxF1mtwKgONZekw6HDDg6WxEboKMzpXV1D+NeOpTJZ9xoHoEE6MP0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fdhyS6by; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fdhyS6by"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741774829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h0Yr5Vgm7RUBCb/M+U5Z8BVsZiNBVB+EPPiJ4rqIWDA=;
	b=fdhyS6by15tZnEiIss0zjnherR7EKzyJ8RO2EVOGvlAREz1j/6L9iNPkC96siIqld2+bme
	nodkwvdTPz6c1mSQcxRCOvf3G1ectoEQ2um01P2ktTAb3sO//Kvh1RGYkNVZxsgcWgozB4
	YkWrPZKjBICaKBiBZ23CqUwH9iVmb5A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-3SqVAc69PBSlYK82vgp0kA-1; Wed, 12 Mar 2025 06:20:28 -0400
X-MC-Unique: 3SqVAc69PBSlYK82vgp0kA-1
X-Mimecast-MFC-AGG-ID: 3SqVAc69PBSlYK82vgp0kA_1741774828
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso318184f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 03:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774827; x=1742379627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0Yr5Vgm7RUBCb/M+U5Z8BVsZiNBVB+EPPiJ4rqIWDA=;
        b=AKkJwIg9U6WXIu3rHH4OIikjrSd1tcU94e/k+VXZXuEip22yRB1uE1JvLKPB/liF91
         Wzx8iB7IIgIL7fTmgjKFqwA11OkIDgIC1Y7fgWTG39BwSXkaKwP8t6Cr0XeQgyIRgrcF
         S/OEXA5mISd/CUZyTOx5rCbdAN8DXGc8mNpF66j7bpiASmLC5RxlHXFbbhizK/LUrMyh
         XvBPgWuwRFEefj7RTrXbt3ybNuQJTI43mEEZJqu7Ld+M2uP/fkKmm7WlXs9B0AC/bbHY
         ewwk7KuSGHkSYunWQQoxh5F8IZfZb459CvBiO5/+sBT/AWEtl+qdHnpt4pKCTANTjUt/
         Dq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHBNYDMo9BCB5T2qYz8AJS5kE+ZvVOHZkl4kkidcMJhbRXSty+CA1zeKWtZPhd+kPgVbE8FmrlKQRdb/gjPmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNYBWzYIiziwjFjc7ft+xB+vXDrMrVzogBQxWBbxcnUOc3db2z
	cRy6s1MF5HcigVGwB/QHabcymgL1E32VG04BWnEkUhW6GR7YBt0Bh7LTLHqZmt2IhWOjiLngq1x
	IwXxk3LLedbfoCydEJ8Jw6Dbu/5Eo23SzKlsjMcVbuEBBnnmXvQvMSFalff0SJiGk+rl2PW2EWm
	um
X-Gm-Gg: ASbGncuM7KgdYx7jx0wHjrPDa/2k0b7kW/gbuG3k4Wr0W0/Q2bG4Y/zKYkvzxCPRfWn
	50S/ajKBCN2Z0sjKYFDtjBpDMqP+wlMHQkZ0w96f67jsMILwZ/kMYNdCR6O7MQxi1rbUyFQzrID
	dPgHOYEvwCngyYpFNOkvEdQt8kB54zfYfZl9/uPEmFo7HnK+aKic3IpFCnHaLnDHjTpBWKkNdy2
	a0iGDh/n0jpVDnEscXUb5q9UIJqykIG9tl8DhIqCdFFswyHSD+OhZ/GQnCIymLwXnxtQubPgSPT
	epZqjQ2HjU2GtTL7MTuDkLyvGoPDlF2+DG+jQKjUHNYjaM1hADFVr0zOFZYn1KU=
X-Received: by 2002:a5d:6c65:0:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-3926cb6442fmr6821006f8f.14.1741774827292;
        Wed, 12 Mar 2025 03:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy2Q1sDAMgAbiGTwr0193U6ouUjNnUZZOSZ5Aaw1xNFil+VycgOfWKIaXwNWW/V12c4oR4JQ==
X-Received: by 2002:a5d:6c65:0:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-3926cb6442fmr6820992f8f.14.1741774826959;
        Wed, 12 Mar 2025 03:20:26 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2eecsm20457196f8f.79.2025.03.12.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:20:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH RESEND] MAINTAINERS: adjust file entry in QORIQ DPAA2 FSL-MC BUS DRIVER
Date: Wed, 12 Mar 2025 11:20:18 +0100
Message-ID: <20250312102018.215018-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 78fa0d19a50a ("dt-bindings: misc: fsl,qoriq-mc: convert to yaml
format") converts fsl,qoriq-mc.txt to yaml format, but misses to adjust the
file entry in QORIQ DPAA2 FSL-MC BUS DRIVER.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in QORIQ DPAA2 FSL-MC BUS DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
Original patch was sent 8 months ago:
https://lore.kernel.org/lkml/20240708075124.73522-1-lukas.bulwahn@redhat.com/

Patch was not applied yet. No modifications in this RESEND patch other than
rebasing it to the current linux-next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67bfd9109535..e6609b78998d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,7 +19578,7 @@ M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
 F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
 F:	drivers/bus/fsl-mc/
 F:	include/uapi/linux/fsl_mc.h
-- 
2.48.1

