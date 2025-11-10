Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C295217723
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Nov 2025 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753666; cv=none; b=MJO3Oi+3tURAiK/pttsrFFdOc66TPh0C9zZ9JfekSpiz2naQxwkK2KYhi0zdIaGdcVdnAhiVJxiu7F9ToNF7Ugr6AblrIdNZJDE+H5BzZqLDsi5k8pU4Y3I/R2YzQbl279W87ZrXaF7aGnn6vnkmbmDHr14KoAcmamJw8Llay6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753666; c=relaxed/simple;
	bh=YJ3BZTtfcw/RfpDQRx5abrEDF8mvR1AzdIWq9uO4+4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0oAmCI6iRBbxgSa0MQnoJoKA6M2N/fn1VXC/3NtNgwyfCyy3S+ApdVOWDSqPS0U9jj/CUWYKJHsLkttXdtxWuWvqSJV6pPPC0tO6h42ub1yaM5W+rz/LNUdq14BpbWi8XdfU1Y4pDBkExtNs4Hs+acBemtZwEedZcx2loQePfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LacHBl70; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFXxq60y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LacHBl70";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFXxq60y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762753663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
	b=LacHBl70OVG3WFIAJUKmTg8r2AP9qgUX9zBjs/MCjNTOAcgZml2RR8b6uxaxgQA4AimuKY
	Za9R73a/G6VVcSJw4340GKlZIaoj7VA24exgX9kLp1TC0PAZJHe/axtm495Xz00DDLd0iK
	U/bmGMcMsYvvRZ2TVrGlEsXd/AYvPAY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-WscOjonRNMWB3T4bfuuONg-1; Mon, 10 Nov 2025 00:47:41 -0500
X-MC-Unique: WscOjonRNMWB3T4bfuuONg-1
X-Mimecast-MFC-AGG-ID: WscOjonRNMWB3T4bfuuONg_1762753660
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-640ed3ad89bso4467811a12.3
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Nov 2025 21:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762753660; x=1763358460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
        b=IFXxq60yn7NQQgsW6QAwSmGflQY5cR2p2r6Jevbmqipvf8iBKChXoDcokETmnxIJUC
         b/KVytCo2vUHPIHqxy7b/+diIhXxZFpGWUgK4r3Uwu8bRHIuvMPk5vSfiRxxEtgaA2rI
         hRVBB6wxg/I6vqRQtHvgsVlfLxjZfeBA0PM2vPaEnkKNLq+fFWa0jD7hbqw+1jdhpKmr
         DC5zIf+aVp0lnP7h0WG2xZmBIf8Sz377xRBFoCXtlgodQknnbCchLZS1fF2S2O5qrf/t
         mfXrVTUoQoXT4ro2ksyJQQkOFbRkwR5IUWHtYTBOf4iCxFuru7QLSP/L+iaaXpvn+DXX
         kfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762753660; x=1763358460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
        b=nb7Xzt1SX0qpqtuTu60PyDd35OqCF1W6XySkamU6iadGljdVN2cMLzZ8Jpb0Bbfc5J
         d2Ez0VXfxmxdtXX670B+ooKIhfiGBCxDMK9SeUFvUxP9I0nr6L1tGrHfsBmYNXwMLxqr
         hTD3UtNQ7zOl0ilX8p7cep+vmsHiXDgmZBw90S/K6mFHe9W8L5Z1YFyWFX5mSZllqg/x
         Jbl0sKAPsVHfXU41S+/lwS98LTVVKZXSc5lwS0c/Ta7BMkw7A3arCch6tRMWqz+jMgqG
         TkMqyX9MPh4qrx6GKLkZ63h6RyrKiMSQ/8TXJzwD+HXPU61iqcvU6hVbMw8G94sEt4pK
         tzYA==
X-Forwarded-Encrypted: i=1; AJvYcCU8fJtgQqpbKOcHCu2/vlCdhY0jB/W/w0D6Jak/qoy81kIOjlAiQL746jJO/BL5UMMnnk2mWwdgl8kaXjTeDxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiqFzH01LbnilRNljmBthektLNTiRE7IZyBWaPb09J7jJyl3nU
	TjpJ2w+wZxDjIl3aCI/UfUiEpT+zXlDfNLoZ4HxHmGWzKU3Q2/JYz6HKN8ftnQaAKDLMsKsw/DS
	ZIEibXHNkO5cmmxxhJex3zorXYcaYFdOymoS0LXsxEYEQLLoJvqoKYgq8YK2uYQwUJZRNXA==
X-Gm-Gg: ASbGnctOJS1fhdK3pE1KjhSbVN7eGUjswnHqVvZNFk9WsDnqkVyEypKXS+LVkc+5d8m
	ZEUlTRVQv6e+RgLjjhINBGFjPY8oZvunWXpQ6gJcvTqjthwqB3tTwZLxV5ixQXJ+4uTRN0ZfJRd
	TFe5wGDmbgSY8jPrV2+lGGIC1NvJxYvCAkfMqYw+DZr+VNn3EhF7quK3/Of0tOHuY3V4ea0z36W
	8k/NxZi+FZxSP5RaxvNez17JFa+i7TnvqG/gpgzKewEiRFwhBRJC5qP3DJo6MgWRjm0CNfQPHTM
	SobQapmgebcumymYX4zlAMrTRV3DaJF7Zl8UkA55qRl+ZCN2M6YzJGTHnK6TG+8SrI62Q+8mOmg
	Sl7WUVNa9CVrxgzX9xC2KGNuyHD1PH9fMVQ2jNLbrvzrrhUb9
X-Received: by 2002:a05:6402:1450:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-6415dbfba36mr5698081a12.3.1762753660470;
        Sun, 09 Nov 2025 21:47:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFztFBKZhlPJh2YWtsA5qKNwBUxmLe/vKjcOZksHYngaDToN73r0z6KmaOZay6WJDpaRa9mmQ==
X-Received: by 2002:a05:6402:1450:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-6415dbfba36mr5698062a12.3.1762753660148;
        Sun, 09 Nov 2025 21:47:40 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm10365924a12.11.2025.11.09.21.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 21:47:38 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Job Noorman <job@noorman.info>,
	Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in HIMAX HX83112B TOUCHSCREEN SUPPORT
Date: Mon, 10 Nov 2025 06:47:33 +0100
Message-ID: <20251110054733.441893-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a311c777f298 ("dt-bindings: touchscreen: consolidate simple touch
controller to trivial-touch.yaml") aggregates a few touchscreen yaml files
into a common trivial-touch.yaml, but misses to adjust the reference in
HIMAX HX83112B TOUCHSCREEN SUPPORT, which refers to the removed file
himax,hx83112b.yaml.

Make HIMAX HX83112B TOUCHSCREEN SUPPORT refer to trivial-touch.yaml, in
order to inform the maintainer on changes to the device-tree binding
relevant to that hardware driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 982998ec1134..2a881629003c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11213,7 +11213,7 @@ HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
 F:	drivers/input/touchscreen/himax_hx83112b.c
 
 HIMAX HX852X TOUCHSCREEN DRIVER
-- 
2.51.1

