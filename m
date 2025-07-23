Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C70271461
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254741; cv=none; b=IpvGhEMxT0/mOjwPRpeynRMVvM7mZi76AOId9ZaQWSFWs7uaY9zbHFViTozCvqKUup3imWPSoJvSByA1v6lVHdpbM/+VBzXobfbgidZLwFJaKXS2XgK7ohcHgSh9ekTweca9JB9UPyA4FAfgOe7YLhCAOsM+sSmDjluRi8JIARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254741; c=relaxed/simple;
	bh=FwnLzYB260LPBBLyO6QPG8c/64H6Crnq1RaI4UHgsKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZY9oMXy/dyRpkoeHdzVAFXzCLKKnLYpMxeBbFyeFQbvQ3gQh0AFX1MiCrJGUJfHEQU/nHWTsBuxyVT6HIJlxXP0J+9SwyB79Y2L4gqcfMY2D/WEk9EKe23UOkW5gzYFsqxoEbTc/z0KTVM2RmFyOGcKj1qK+xSBfI0thfUiBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0gl4xfQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0gl4xfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753254737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=svJ9vKg5v2xhgonVVA8jklvWB8f0wsV6uQlirW6mTLA=;
	b=T0gl4xfQNe+weoXhUlAnf/l1GdVp5YbWSCKOR0Pt4rQVem0R8LRjXHXqzMH5nyuOEyCQsx
	cJS4F/U7G5ws2Cd8We9YwMkMLnOHkN1TO9JQKEqMT63Q5UMJen5vf/hAFwwX9x/7b/y1vj
	PaZdg9A8HTxfxaUHuvAnoTyhWlADBis=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-l63rEQU8O1Gf9YiILgFZ6Q-1; Wed, 23 Jul 2025 03:12:16 -0400
X-MC-Unique: l63rEQU8O1Gf9YiILgFZ6Q-1
X-Mimecast-MFC-AGG-ID: l63rEQU8O1Gf9YiILgFZ6Q_1753254735
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-607434dbc78so6044918a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 00:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254735; x=1753859535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svJ9vKg5v2xhgonVVA8jklvWB8f0wsV6uQlirW6mTLA=;
        b=cYdvCD8NbL2IqX+cQyaeJYBN7uk5nVTrt9CTukMD2JF+9swC4UKFlGqFfJkP3ufbo0
         0SUB2yuSCXF7fuoBcvdwDWTVCGy25sjUcnlzaSE2v+h5weFqweJJ8x/x4k4tND+tUqb/
         p//FOXlOKC/4SB7n3fjDGoRe4NsvK1rExpk1hzYlH62+zEA2DbyGixbAX8TUoEdEAb2l
         7KAzxwW1X6QV4q5ZEa6fpzGVIP33UfiFvEX6IKeoj653SGv7fNXRTxkMauMJXwAwUbD8
         a1Ok4fncnWyOEBcTw9JFSSJSm5Jffc3Q9ffbXKFlXfQg6w151/2m3gmooMJ2XjQeVvsq
         h91Q==
X-Gm-Message-State: AOJu0YwUKMalP3IGRNSdJTwDBR1gcbyj2AzO5Kf6LhZezOtS9Ljh/sQQ
	5Xc/VrJJPYknVAF50+dD6bvQvNhKuoigPHAEBS/IIbqdfbNdcTyX/Hd2RkGezdtde6NFDe89oWo
	7bElCrL44yaa88h7+ZLXZZiVAGmaptrwhP1PjywlAKHWTnpUFS0zEjugGs6GQpXPvlZSqcA==
X-Gm-Gg: ASbGncv27OzYea+GI1a0HIBf4uTUTnxJGhMbC4tWcWLZ8gYZ6xE1CShnhl9xyNreAQr
	/yGjq8am0rFADMH3SaZ+h7jtEIOReydrOFsQ9CNy+hdDiHPFbwQJPYsix5mmdthlQ4uTAk3xcLP
	/IyBaUmd8cW22RyMM0X5M09iMuRd+P/D3c8TESuBjmmEnTbcnTmjm7SfYQUR4uAKIP2A1pDk3MG
	xCE1CspYah8ZC47JZRIBYa9qCct7EpYzcU7ssDBWOggCNO6BVnY3NQKdEwfFAVVfaSjrFXaXyBW
	1QueKD0OG/2GzDnzCXpgeSxrMEbKZuWkNoQyWk2JDtHg3k9bWoI13Kd1D/b4PxYsUzoNxPEI6OP
	Nw/wr62BSZA==
X-Received: by 2002:a17:907:9816:b0:ade:316e:bfc with SMTP id a640c23a62f3a-af2f6c0ab4amr179168666b.21.1753254734911;
        Wed, 23 Jul 2025 00:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGri0DF7TftUzJZLGAOyHGORDLnO7b2pDFWy2dCBLl64IhL44y4nfzSRlFJb2/VuGJ7H/2qMA==
X-Received: by 2002:a17:907:9816:b0:ade:316e:bfc with SMTP id a640c23a62f3a-af2f6c0ab4amr179165166b.21.1753254734451;
        Wed, 23 Jul 2025 00:12:14 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d33csm997361466b.112.2025.07.23.00.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:12:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86: Drop unused and needless config X86_64_SMP
Date: Wed, 23 Jul 2025 09:12:11 +0200
Message-ID: <20250723071211.622802-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

As part of the commit 38a4968b3190 ("x86/percpu/64: Remove INIT_PER_CPU
macros"), the only use of the config option X86_64_SMP in the kernel tree
is removed. As this config option X86_64_SMP is just equivalent to
X86_64 && SMP, the source code in the tree just uses that expression in the
few places where needed. Note further that this option cannot be explicitly
enabled or disabled when configuring the kernel build configuration.

Drop this needless and unused config option. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 66115134b596..afa4077e423f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -411,10 +411,6 @@ config HAVE_INTEL_TXT
 	def_bool y
 	depends on INTEL_IOMMU && ACPI
 
-config X86_64_SMP
-	def_bool y
-	depends on X86_64 && SMP
-
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
-- 
2.50.1

