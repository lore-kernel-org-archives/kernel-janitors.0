Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40520550F
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506211; cv=none; b=ChfnrVcoyaExYCwfBnUN30PaP3Y9bjSgAouGrDNDeOvYzh5NXdON+CVJtNeu+RXShG5UxOQK1w+zksyq0B4iPKH+cwPzGSEUl83g42SKcyqRoHDJW5gnddKnDMtNir2gIrtjv0tD696x6KMK/agg59RrfIkku9HSUrDI8oMgu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506211; c=relaxed/simple;
	bh=3LccaYy2JDVCobt8glKY88eXynfYfO2uzCHaxh0Uis4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V19aAqy/EdB2kDEn+8EJgx+PiLkIwNrHbelM7vhkxGqB9Jt3z7qtTMLoim/RIKciGLDljUwcRaWwXvhm+kl5cjuERkGbHS4ZPDGJObfJdDh6kOGCwkCzq3EChNgbd1w0MeiQ5NjaV7ciO7GAX5uGJHuqVsayadxstA9aDVX/i0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LMMEqUzf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LMMEqUzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736506208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRSH8O26UTwSuC9PJKp4DRJMCikduzZmVegrJW9tYT4=;
	b=LMMEqUzfycf1dwLkmw8/AHehU2Nqi6sJgyDC2+uGR4bEmpKxA64GZ4m+tZRYY17uYZd/bq
	z05SY/HVyiMS9ZYCMyYSDJNth75vrX4PiK7ako3G9OtmABIllVNHjgDxmyM5C6o3ChmHzW
	BTBjpGjjbGFIGsfIGCuym9frbCfMtes=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-dLheMNMjNFmxqg5ZefERew-1; Fri, 10 Jan 2025 05:50:07 -0500
X-MC-Unique: dLheMNMjNFmxqg5ZefERew-1
X-Mimecast-MFC-AGG-ID: dLheMNMjNFmxqg5ZefERew
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d7611ad3so1067977f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2025 02:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506206; x=1737111006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRSH8O26UTwSuC9PJKp4DRJMCikduzZmVegrJW9tYT4=;
        b=vEsL1fwCMXBMRMfaICqybrMrdrevR8cLMReN8vZszMKv2fEaHX8BmwRoFIqQWVXl7D
         72zyTfHEondE4fMltWYYFoggEvuLju8CsAgi4A6QuwNTMmHrCE3K4BCOfP5xeDQ+dIn1
         6jJUJKfg/5uMGjQQPWZCGxsUcdkz6Atx9TXi6uljmKr1nxxpaVJUIP01ikO0mpwSG8pS
         4MlrMqfaVvlk+xcS65HYiNMBh+nhQhsNQKVrQvSN7Z7nZ6Zhw49+5BpJIJpaUAkmtjCz
         fQNZg18GmsZQTvSvomSMtzX58sKk9V8b5RS15mLl7mDd4Wo8dMGSPYBEOVkte3xcLtqz
         vzVQ==
X-Gm-Message-State: AOJu0YytbdBxpyUsSXz57pcBLLukgd+4s0YaGzyVxrFE2x7mB95H/8YJ
	0L//WeOHN8SbfluAQMBVZWXCZZc6UjmKH1QWCfLMDxQyCpO20Ovl7yCGBfeCkujIm7wwDFSP3ta
	RMyFK+uCdnlE/zQxVV2gSaxwuYq4VjauR2PUhS2jwdJfUUq/HTAsfO8lnVAtXRbPoXw==
X-Gm-Gg: ASbGncsoGXAwUu5eGMLyxhEWYmM16gADxq2CdvVIpXownLMcY1cQG47b3PiGYGMFnnz
	g/1MCcNTTWI29P7bx8kcPE1nxWzJdwaXBCVrqUfHH0dbt5FkTF2h2PBXXJXbznJ6D50wqOtRLau
	N8psj5CJtC/d1BKPcAar4L4Norpdh/bvaZh0mtpB94uZvL9yiabzOCyLMyVy4aKne7BDB2oWwX5
	MM7Uk86HLA88L73J/9hzYLKAhsp7wxya0YIUjEYpYovRgMdXpF29A4n2o0NLgIKJymJjGJVSDOK
	GKl29JtM4ZHi/DbDuo5GYtaAghVB
X-Received: by 2002:a05:6000:1846:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38a8730fc56mr8193042f8f.42.1736506206314;
        Fri, 10 Jan 2025 02:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5aiZctex9vNdUi3s0Ak45rkFbsf2rUIqQJFC+gJgiSgGN3CGOBEDkk82AqWSDj4qX0Sa/RA==
X-Received: by 2002:a05:6000:1846:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38a8730fc56mr8193014f8f.42.1736506205912;
        Fri, 10 Jan 2025 02:50:05 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcb5bsm84378945e9.23.2025.01.10.02.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:50:05 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pps: adjust references to actual name of uapi header file
Date: Fri, 10 Jan 2025 11:50:00 +0100
Message-ID: <20250110105000.56228-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 86b525bed275 ("drivers pps: add PPS generators support") adds a file
entry in MAINTAINERS and a reference in the ioctl-number documentation
referring to the file pps-gen.h, whereas the file added in this commit is
named pps_gen.h.

Adjust the two references to the actual name of the uapi header file.
While at it, put the entry in MAINTAINERS at the right place for
alphabetical ordering.

Fixes: 86b525bed275 ("drivers pps: add PPS generators support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 MAINTAINERS                                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 387ac4dbf4f8..6d1465315df3 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -283,7 +283,7 @@ Code  Seq#    Include File                                           Comments
 'p'   80-9F  linux/ppdev.h                                           user-space parport
                                                                      <mailto:tim@cyberelk.net>
 'p'   A1-A5  linux/pps.h                                             LinuxPPS
-'p'   B1-B3  linux/pps-gen.h                                         LinuxPPS
+'p'   B1-B3  linux/pps_gen.h                                         LinuxPPS
                                                                      <mailto:giometti@linux.it>
 'q'   00-1F  linux/serio.h
 'q'   80-FF  linux/telephony.h                                       Internet PhoneJACK, Internet LineJACK
diff --git a/MAINTAINERS b/MAINTAINERS
index 481b2dac1716..9fc47f2f1286 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18860,8 +18860,8 @@ F:	Documentation/devicetree/bindings/pps/pps-gpio.yaml
 F:	Documentation/driver-api/pps.rst
 F:	drivers/pps/
 F:	include/linux/pps*.h
-F:	include/uapi/linux/pps-gen.h
 F:	include/uapi/linux/pps.h
+F:	include/uapi/linux/pps_gen.h
 
 PRESSURE STALL INFORMATION (PSI)
 M:	Johannes Weiner <hannes@cmpxchg.org>
-- 
2.47.1

