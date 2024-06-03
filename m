Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AEC3FBB7
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399444; cv=none; b=pUaGkofeVhukJtC/b1//topNq40OoTzzNLNjFDbkJCC0JcJd/3d6vQHGuKa5CsYSPUgWbz4SMoUbmkmWL8TOzpVnvlgyy2rzRKvLBBJqq8dqqSqV+jR9/NUA5pTSUaG47JC3yQyUIKtRDqXTmNWtgyaAcB38w6+okVeh/zvk65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399444; c=relaxed/simple;
	bh=jXX8dE7Opa6SPb1eAr4cYkqk9m+6M2AcMLxLfip3H8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dboNfzI54ohuuSvgdxKUWN3nQ+sg3j5m4yll+4feYcTKCOvsWm1wP7xO99P2zfYYCZNbvuxRiN5xmlbxdEM9XO+8CTSJfyBAkDslVlaUPMHi88zi7aPjXahY9hwOqYq3BnrcIPTTGuhgx02DyqaQn/xFj76/FN9J6Q1wpVQjecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ij7qee+2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ij7qee+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717399440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p9lkfOb50mYknLTXxEH/1KkxK13NvvMCFt7POCqNueE=;
	b=Ij7qee+2qiPRiQsIAF7a8f9E7sNEzOXjXDioOZWOQSy9qagYu9J1tC5STCnUqnE2j8F9hb
	FLWEtt/3bANhKNLYPz8UuoUsqPL2fFR5Dz6acZaOCl30j7jA+/tNOg1MTadgWEKPSsDQFZ
	NxRVpvs/u9CYERop+N19QNZq7lQnahE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-53qS6HS2NBCOeeIRGlgGCQ-1; Mon, 03 Jun 2024 03:23:58 -0400
X-MC-Unique: 53qS6HS2NBCOeeIRGlgGCQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a68ad67f110so63317166b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2024 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717399437; x=1718004237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9lkfOb50mYknLTXxEH/1KkxK13NvvMCFt7POCqNueE=;
        b=c4nOz3ipDhh59D8DUgGUlBZ5p8s7+nw4OlaxW2Bpn9xSBGIkyE+rH+cv+QQRg/+xI9
         fOthnRCxfmdpqcogI0+ZDiKyv4gEFRhHvk0Vu/dnKRg5rmfZcNurT/9k53zd/GnAog/h
         NRbnOkj/Hpp1Kg0j+dn5MTGu9m9iyabEebPlTpOzpHKPsH4WBlrIPe6Ozc6M1i9edSfc
         JXGL8uQYwdbZMzC+RcQcwyG8kJZJSitvgWLUgr3pJjFl/ONXiweN8D61oL3xXyVO/+3V
         oVBWqSgAscnGKw7f8+JfprW0FLWmS88CXrQzgQI+vIsKlG9lNAIjEYPZY+wkZ1iDYyFH
         2oUg==
X-Gm-Message-State: AOJu0YwDrzwDVO2nuZpGipsXDTnD8cPKWNsaTkPMrFIAeKpZ/TPAqD4r
	XD8sPTfmKoSe42gcWaaXgCqOIHir5+rvFHQdIL9Aa5heYWt/KzmLrmf7rWN7+G2KV+G9uZ+GgDW
	27x67VKETR48Q1ojjqzpzV2vlEuXckrBqxcu9mgb5s5RFMSLxU12HyXu2r69wOgh2pQ==
X-Received: by 2002:a50:934e:0:b0:578:5cbb:7296 with SMTP id 4fb4d7f45d1cf-57a36439beemr7303922a12.36.1717399437042;
        Mon, 03 Jun 2024 00:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFriRgQqLA1tuZVgrU6sA/7pisxmgPgYLdViimwhIn5HrCNMkK8cZu2MTkPGVh7h56cgKoC/w==
X-Received: by 2002:a50:934e:0:b0:578:5cbb:7296 with SMTP id 4fb4d7f45d1cf-57a36439beemr7303908a12.36.1717399436521;
        Mon, 03 Jun 2024 00:23:56 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a5ef86458sm1641846a12.78.2024.06.03.00.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:23:56 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in CHROMEOS EC HARDWARE MONITORING
Date: Mon,  3 Jun 2024 09:23:43 +0200
Message-ID: <20240603072352.9396-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e8665a172378 ("hwmon: add ChromeOS EC driver") adds a driver, some
documentation and the new section CHROMEOS EC HARDWARE MONITORING in
MAINTAINERS. The commit adds Documentation/hwmon/cros_ec_hwmon.rst. The
file entry in the MAINTAINERS section however accidentally refers to
chros_ec_hwmon.rst.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Refer to the intended documentation file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eab6c381a3b..09813e21da27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5143,7 +5143,7 @@ M:	Thomas Weißschuh <thomas@weissschuh.net>
 L:	chrome-platform@lists.linux.dev
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
-F:	Documentation/hwmon/chros_ec_hwmon.rst
+F:	Documentation/hwmon/cros_ec_hwmon.rst
 F:	drivers/hwmon/cros_ec_hwmon.c
 
 CHROMEOS EC SUBDRIVERS
-- 
2.45.1

