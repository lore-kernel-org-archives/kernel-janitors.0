Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FA3221F0F
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604344; cv=none; b=raad/xLr/8NGQp96X5A6mCsHVrnyIWPbUbqc4Wu3A7q31TWyoV9zVBqtrxSpZYcODhWXhU7sTeNiBQEByqyQr/Ykq6YHH0i+pmByq9ew2Fl4wC2NHdgKAUXn9Lcu3ge0xdWi6lXQK+umAJ8/RN240aQehh0757klf3KIRG+MIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604344; c=relaxed/simple;
	bh=Si1QvVZW2cyZhFItNCPhnZgDqOaPxdjxwEHoeO/uyhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RH7xGymCkJoNdlR1QXoP6Od7LvE3Fie/YpZN/px+45TSp1nOkUrr3UZdiZtqBGRm+ayV50GjfUybNWS7iHegD/EKhVSN+CiZHM1jwTQFAfGzbOtd30JuJTZDJK/2ilfYmF6ukpXCxgZQ1Zo0ZWSSXacprmxAqDiGZIsK8fuvNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqLtbziP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqLtbziP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746604341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
	b=SqLtbziPMsHpbi+WccSRywb7PaxvQ2fwHGBYBAJAxRG7QIx6rGksgiarDREw8CSMQYfzx1
	048LB2gASVXOTJTu6OtfBgy5YaPdYPFwQsdJGyBA0rNTz63TgFBxliU7clG9DYhS3P4chM
	WtMJvGMcr1HD8JZkr7ObARLNZ3ea14A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-E0QsE-CTNvyzR8OhYZZAWg-1; Wed, 07 May 2025 03:52:20 -0400
X-MC-Unique: E0QsE-CTNvyzR8OhYZZAWg-1
X-Mimecast-MFC-AGG-ID: E0QsE-CTNvyzR8OhYZZAWg_1746604339
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so47998425e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604339; x=1747209139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
        b=Sf3AYQT48YBO4UPb9CmwLxMCI45tlQrDpxIZ16oliPcrX3kJ76dxMog67Crbv8yl6B
         vm/1WjdR1QaoPxYJUZZAU87FQ4rsbYr4K8pd3/dyQ8DF2AH9RQTLpYWEvM6A2vCdKAJC
         tfBOzAU6+zXFfeuG0dEalvwQV+eadV9jOCgyRJ6SFwWeTjcX38tLfLYPol6TfY3G+Jy2
         po/XVQweZbAyRS91zAKEoxQg1NaKL2wEkSWIYF3IxGVyLXvvOliKe+J4XaAcBZErShqc
         iEDvu0S9p0Gf23EzdH1VtZ3beFl2aLPHASz/qMBaRDL6yxDf4W9hDluHdjxa8poF6wzK
         5feg==
X-Gm-Message-State: AOJu0Yxix2uJbnjMmryp3wC6YbelV0Y0v2RYCAQQhqME8iC35NkeqM+Z
	QoGLGhw5oCXecul8OEXFPG/1Y0kllsPlBxSIJZwdn7tdkv4bzAIU1v3SIQUL470vFZY1oRcx3av
	7GKnvzuDsfm5uwSKC+M4YWm69WNZ0AhBGCQzBrOin2My5wDo/kIl19ljCYMX+JNwJoQ==
X-Gm-Gg: ASbGncuwTr22QEO7XEIGdApuNl7WRdqLFj37QhwFCRMa8zMdPAOHhCtiicQD5ZhUOuG
	ik2VhtXAR7kzoHRNigwR+AWE0bGr7gfj5zKJltTLCmSQsnh1qm44kFHZuA5kKauS1lghrRIQ/m+
	irL4lGRH6f33BVGYIe9aCELNPtWEPEIAAXBqnDcPtyeSnO8o3crDiGFmDfNGCJtW5Uht7QJrzMt
	VbQEtfc4jMnDkm6yqgnc4S84gmdLJpXYuhNj3nvXXfF0lKp1ITgRCQyCEbqPcpD1hE8e5b8UPR/
	H1F0E5Gv/lTCPdWYmXM1b6UtAHw+vABMNragi4gfmRHkH+g4XamyhlRYUg==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543255e9.30.1746604339055;
        Wed, 07 May 2025 00:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6bbFfoJUlE32ZpjhY8SNYfXA9NoideZRSClq3CU4H3TaCkDCmJ5dagaVohFcNt3ifY5S59g==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543005e9.30.1746604338689;
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43a802csm21562885e9.39.2025.05.07.00.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in DASHARO ACPI PLATFORM DRIVER
Date: Wed,  7 May 2025 09:52:05 +0200
Message-ID: <20250507075214.36729-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform
driver") adds the platform driver drivers/platform/x86/dasharo-acpi.c and
a new file entry referring to the non-existent file
drivers/platform/x86/dasharo_acpi.c in section DASHARO ACPI PLATFORM DRIVER
rather than referring to the file added with this commit.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34a55e3ff863..82e7b053ea76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6576,7 +6576,7 @@ DASHARO ACPI PLATFORM DRIVER
 M:	Michał Kopeć <michal.kopec@3mdeb.com>
 S:	Maintained
 W:	https://docs.dasharo.com/
-F:	drivers/platform/x86/dasharo_acpi.c
+F:	drivers/platform/x86/dasharo-acpi.c
 
 DATA ACCESS MONITOR
 M:	SeongJae Park <sj@kernel.org>
-- 
2.49.0

