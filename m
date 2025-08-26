Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338684D599
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189985; cv=none; b=Q0iMrAVXnsreOgs4ez1PujgJpIc4EdiTacz8X4UPvVsj3aCH9clkLwRAAfWYt//I2kwHgaBlmkp+EuHdl7QQTpg09lcvf849gA4vOuFYVnhxwnHUEgfj2Yl8UYVLC4Kd3OHkIpCQdJx/nX8hoPul173zmadfDqwAWeta3xI7dD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189985; c=relaxed/simple;
	bh=k1R700Z2+gqjiMvUOhAJnMVBUMz2mNDlbwad6gs5mnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ohAL9VbzKwSDROIiZUFdo1pAh1Mag/OUll4FiZG771hsudv/WSOes0IvSUpIcPi6MQj2cUAk6C7HwfNgT2iRw3tlcvoNa9z5KLHXhqeqi0AkGZpE8VTTsg3/2vJv4pti19yYMAxdCIyZVLi/Tl7tGRWTPMA6QIqRmmYjCXWfHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5K8jR+a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5K8jR+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756189978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZbpsP0JVSHBALAr4RXTkvJiiQWMCbeHRvXA5B+Ppf8k=;
	b=F5K8jR+ay/cwrAAQBP+VJ1qwu2kYwEXQN0es6vze43XI4sA2Seoj9QCHJ0dQrF14KRg8qt
	0GH8HvfL6HL5cfHCoJyGyinvhj62hcwi89qq2W+v8i1xRC8dYJ/zVlNAsvo3P/HrUu7Peu
	8HkYLv47vZvyTdGs1S22cOdyae2diII=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-gQKw1sS2MxaC_qZiehrqUA-1; Tue, 26 Aug 2025 02:32:56 -0400
X-MC-Unique: gQKw1sS2MxaC_qZiehrqUA-1
X-Mimecast-MFC-AGG-ID: gQKw1sS2MxaC_qZiehrqUA_1756189975
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-afcb7a5d28eso483053966b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Aug 2025 23:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189975; x=1756794775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbpsP0JVSHBALAr4RXTkvJiiQWMCbeHRvXA5B+Ppf8k=;
        b=oRb7qZZnsQj9LihYN9jGTXRnD2JyrhoYpk/Qj3M5nocUxr+V01SP0SU1qAswRW+2ij
         F87sL3ajY+jC+Ut5PZmwc8IzjFB7y9FyCwyUZ+C1f2TYYmlT1XysdlsiGdCfwEUMVZV0
         euvlRI5uEzBo4ZntCIgyjGuBlOiTVkjRH8cva17devHh9DHsZoSCjfV3l9bC4TONO3g+
         oMhXH+9lG2J/gvDhLk/0RAu2o5yeuRATPw8GxND3LryMEn0rV3jtFbofR1q0aJ1DI32g
         cbZM8lY3bZAFWn2pAi2KdoUhPOt/Cm97qPWjzZ9IKuwT+VrI6LwAHlJvZRjHBWupqSR1
         pAXg==
X-Gm-Message-State: AOJu0YxqEvehYdMYLxys+1qUKVLQKP4QchJNu7yHYmbIwdzUSsU3xdD7
	KllvAP3IcXl5+TpYQPVhfzg8kazafZ0HVMQIlwGkZLEAR+clUp2HQi716Af6Tv50gDCfZp11j7/
	fvylzNDBcswkHie7pNlWnGAAEsuR5B42D50YV1XUo5cbawpEYcCidsqlC/QuLI4MPld1CTA==
X-Gm-Gg: ASbGnctbjXE9GBiG1TzJ3VgClPuHgnZupY8KRMJ6I6LkRDrl8T//i4dJCVju9dOgUI0
	9vtvNqKz7yuEcoh4Qz7V5k9yaJYu9hA6Pfc7Pv3FcGFwhGIWEywXlhg5fHbJ983yXW8Tr/JzGvT
	X4VLnxchB+tg2dmWci4NZmj4mYn4Nn5zAAaoGAgrvVZgeNUyo0iaTE3TPc9rMMctlC79x6RZp+/
	waasokzZmwdOI6Vd8CWQkWH+BtxGcf0ngG3InxtzaTTwbyhJXR3VmAgJ8IOBzRtvu8oKQL5QNTC
	H389r5D1z5Iwvspxgr4FCUOYRd8YCFxwP+Q5mH8wyF11QP76IsgtkEAbmehyrRlOrQhFDvtDvfA
	OXLPcggsWHQ==
X-Received: by 2002:a17:907:86ab:b0:af4:11e1:f877 with SMTP id a640c23a62f3a-afe28f162a8mr1291526166b.21.1756189975116;
        Mon, 25 Aug 2025 23:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmSRbT/Wld10PpqjSUmNkXsFiZtdZslyiz4ToZl4XaqIzH5GqNA9prjgy3b7ugqVJ4b3iyig==
X-Received: by 2002:a17:907:86ab:b0:af4:11e1:f877 with SMTP id a640c23a62f3a-afe28f162a8mr1291523966b.21.1756189974678;
        Mon, 25 Aug 2025 23:32:54 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3174f806sm6346137a12.52.2025.08.25.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 23:32:53 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in DRM ACCEL DRIVER FOR ROCKCHIP NPU
Date: Tue, 26 Aug 2025 08:32:48 +0200
Message-ID: <20250826063248.32153-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a7352c849492 ("dt-bindings: npu: rockchip,rknn: Add bindings") adds
the device-tree binding rockchip,rk3588-rknn-core.yaml, whereas the commit
ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU") adds the
section DRM ACCEL DRIVER FOR ROCKCHIP NPU in MAINTAINERS with a file entry
referring to rockchip,rknn-core.yaml. Note that the file entry is missing
the part rk3588, compared to the added file above, which it intends to
refer to.

Adjust the file entry to the intended file name.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4bddc462c07..a569828c9f3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7542,7 +7542,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/rocket/
-F:	Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
+F:	Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
 F:	drivers/accel/rocket/
 F:	include/uapi/drm/rocket_accel.h
 
-- 
2.50.1

