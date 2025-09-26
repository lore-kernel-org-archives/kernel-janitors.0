Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC40286D53
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871152; cv=none; b=rlZvV6PPqj0of4CV5pm9OIL97I6atg6OfQxi9nftVQxych7GXnQukQ4Ktha7/vyvgEIvYzhH8+xjZmnvNQJCX5rhU0CgQIUfJ66CNY0v0t2jHLCdvXnkeXueLUn5iixqORLZqNhRzAy+NNTfWUrL5BrCWrUllWCfy/JRNuhEU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871152; c=relaxed/simple;
	bh=FDV3uBNAbwFXT+M7fyNWH+HJ349lnbWYLaE+n4S8cdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrFFVGO8OS0P13SlWptttRUkluMFeAfcAVfovz+quOrPWNyPVpegeh2Hcjh8oCFjnWTJ1ManGZuOsjYcI4ex9RinJvDHdBe0UU3YiS0zUm7h28RvI6h7Cf5LF/1GaQ13qIC+4FXceBrCwOv2j0jzfq6JN+p8dDR0V6GFIwecvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEI4CVB5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEI4CVB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758871149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tOPngMxA7p4GyjZLW1Z2fZxDxzYAemuo6fVS/hsRC0Y=;
	b=fEI4CVB5EQ441Y37ZWqAt0zqb8g499CBeBC2fomD/Y3/gCO0yF+so5Uw/+DLtprMI9HhIK
	W3mUO8h5e5sPbu0lgAk7jS8SlTym/vboLtXHCfqo3neTtPTJeYBm66O6RxB4yv0fgRD6Ko
	4ffBO4uok4MD/IV4Fmb4EHrgq/gS5bA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-G47w_AYlPhetOk-YZy5CMA-1; Fri, 26 Sep 2025 03:19:05 -0400
X-MC-Unique: G47w_AYlPhetOk-YZy5CMA-1
X-Mimecast-MFC-AGG-ID: G47w_AYlPhetOk-YZy5CMA_1758871144
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ece14b9231so1141987f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 00:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871144; x=1759475944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOPngMxA7p4GyjZLW1Z2fZxDxzYAemuo6fVS/hsRC0Y=;
        b=XOA5MObIvsG2FcH9VEMYXcURKkOr4IZN3kAflqCshhhuhGCzlqhDfXpvUNA+Hpa2xi
         XNt0zFtH0CgQFUtJNQTxIHms3SNqWUnopTixkwrpAmBdkwoBH2J1+9/D7wmFtmP6yC6Y
         tFwOSyPcyoSF55eMavvU/ryuPCrD/ejXO0d4PD9ZRUTcVK1x0yrL3o9mp3kPBA2PSaNW
         JNExxJF659so9axbJKCnlVfYpS89Bon7qw74voLkw6pDCEXJU5XPonGJMGw7nOF8jjnJ
         1afz6AgWYk+F7mz5wCWfsrBvmX9EJNME+dl1IevrbDDSB8ktNRpW9Al+mK/wxfQahS8W
         ouiA==
X-Gm-Message-State: AOJu0YzglbtzwrTu+mw5/04XIDp8HC8WkXJpX7t40aQCW3JxuLI0BASh
	ON4htkOpzUvFV85p0C8j0eBor/fTwzGN8VChJ89tjmwT57nxCFaPeXPvsuDuCFfkI4bZeTyFOc2
	ppms5zsixND70vcShufaCc29uEEjSGcreUTcbl1rdiSt360WxwC/fvs38yh7st1YwHCYN6Q==
X-Gm-Gg: ASbGncvd7xypPKJCMI5g0e6aSw+jZRAUa60dP8jnd4jTIW/XMf46f0o09Fx98T0IvDV
	yDCChXv3jQIFGFJ9YQ/9QOYpx9sGu4uqpfnsluOEEmkfpxKZ9K/eC+wjs2o/frVDh95WbPIFAuY
	aNNUnm/yHbzdiV9EefqVauVNfuZBVcBp5rjZV1hXkEaYoBlP8G9c0/W+y4N1hmjtZFvzpGZ1MEs
	WEslL9OegJSKznIW3ethUkbBxJLVO9MJJTdbNMemZdbTYzacYNtZS42IuHWVAjr8MjheRIEAZK2
	3gZTarzRxotXPs4PfxUNSeD/IOQ2DIjm/bc4AWU3g0jcOf2U8JAu1BlXmHWXViHxUO0MN2bjLFi
	14UzYVneANYjAUw==
X-Received: by 2002:a05:6000:310b:b0:3e7:1f63:6e81 with SMTP id ffacd0b85a97d-40e4a711565mr5936586f8f.16.1758871143686;
        Fri, 26 Sep 2025 00:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlb1Wb38trve2rzHq8pOF44+10uFK3uhKPrtJDVZXfjYr23BydS246rnVqWWs+QAxza2wP6g==
X-Received: by 2002:a05:6000:310b:b0:3e7:1f63:6e81 with SMTP id ffacd0b85a97d-40e4a711565mr5936558f8f.16.1758871143271;
        Fri, 26 Sep 2025 00:19:03 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm5994003f8f.62.2025.09.26.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:19:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sebastian Reichel <sre@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in THINKPAD T14S EMBEDDED CONTROLLER DRIVER
Date: Fri, 26 Sep 2025 09:18:59 +0200
Message-ID: <20250926071859.138396-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

In the activity of revising the patch series "platform: arm64:
thinkpad-t14s-ec: new driver" from v1 to v2, the location of the dt-binding
for lenovo,thinkpad-t14s-ec.yaml was changed, but the change of that
location was not reflected in the corresponding MAINTAINERS section.

So, commit bee278e18e64 ("dt-bindings: embedded-controller: Add Lenovo
Thinkpad T14s EC") adds the file lenovo,thinkpad-t14s-ec.yaml in the
embedded-controller subdirectory, whereas commit 27221f91b83f ("platform:
arm64: thinkpad-t14s-ec: new driver") refers for this file to the
non-existing platform subdirectory.

Adjust the file entry to refer to the right location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fcf4e34eaa5..b641b5e60bf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25466,7 +25466,7 @@ F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
 THINKPAD T14S EMBEDDED CONTROLLER DRIVER
 M:	Sebastian Reichel <sre@kernel.org>
 S:	Maintained
-F:	Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
 F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
 
 THINKPAD LMI DRIVER
-- 
2.51.0

