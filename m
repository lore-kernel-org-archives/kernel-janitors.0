Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60471F1313
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994705; cv=none; b=Qoxz1ykMgfdtB02KOp0oyYr/xc9KO9J/GRByOo5+FxIRVTxhznHnBLpH1IvZRNCWKerALLHU7ZKVIUchZv+IdQ8o6acitL163HPTNLCdPe0Ft9g50HnTLjHOVwuHto8eX/A+4vM/wEzLmXlerd+Vc9Ab1rHYP32fMjdTvdc/xcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994705; c=relaxed/simple;
	bh=zlCMUidIBWNN9WpoUdZwIdQCmJ/Iyiw+Jbwq8oV+ti4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjxUH5h43M9BnWyFeRJeakv7sxLCC2ZGVllTCjNnZWX60ZQK2NmbvcLP8/oFk3hco3p4RbNjCsVvrB2TUbAyK9RKX8phKHED6kEDqAA4PUXRReBuyrI6vJnT7LEuX8PVYEvg7JucjngLLw54cfuEw2DZ1Sj5y3fvouBJFbtI4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+4l/rg7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+4l/rg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
	b=f+4l/rg7nb3tY93HAZ2wFZgtc2zAfcxz+11HqoN3um6IwG6rNvMfmGKdd1nM7FchJyQlO8
	z7Nh/7Uy6ZfRAAyjitQAOZsak413mUT5AYTrKVoWwMxhkrur14k4bSrsY9vNH4AvLp9owG
	DPsyN2gLSVclEEQwWcoY/Gt6UvRlpI8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447--RqUrDAKM6q7sc2V5vmKWA-1; Mon, 03 Mar 2025 04:38:06 -0500
X-MC-Unique: -RqUrDAKM6q7sc2V5vmKWA-1
X-Mimecast-MFC-AGG-ID: -RqUrDAKM6q7sc2V5vmKWA_1740994686
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e4becb4582so5636393a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 01:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994685; x=1741599485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
        b=E0IgoiVID/umU9v56eoe0aZ2kxWjaTZOf20G8kqrlMSd6dHMe92JJ9pb2rSn+M2qmE
         5GhlT9qS7ltW/yisO+BaiX1xzRQkFa6oxeSOtrLfYKN5VMr6ofZB3MZyEfGZ1OPfCza1
         s9t6QVJUBH+q9jtOI4f4RkIjoYde12U+M1mhClZ+20/PRfoQc6O1LYd1es23oajRBPvM
         QaKomgE8WiRfli/m6fSpX/1TjNQOp9hqcIn93WGM9r534HtVi/sfcyGxcZvtwTAhGm5g
         RvS+otawIiHvRui52DG4161J0vyY2Z2kIR2TEvvFdIFjPvgEIJwySbpZRyQt1TQSxIuq
         uY1Q==
X-Gm-Message-State: AOJu0Yxn3HtoIknxRStr11WT54qhYaLjemlWXFb6v4GSRlZs/0nI2OlF
	Mfhd9Uz5+C+/QzioV7fX8CiteYL2te+sPqxYOTo4YlbhIfLDPEZ/9X5unuQXbHEF0q6NBXu+Z3F
	kWAdTRaoBSTHhBarO7VU2nmfhVlAOpfQM3FAxaklS3umLnupTYcQKuXRlN6oPdcV6pelQyqRvNc
	ut
X-Gm-Gg: ASbGncu/zi31iaVq2fKo0LBJiXLoCsyL9HKpt8FDS5ceEUr4oYTcMIR6KsQq810zFQH
	PaUY9Fzl5uYBCWU6hOuKhRZmsaAccnIdv9GRyezDJG8Eld8pN3t/H+vi015njLjemS1GUPnEWGj
	UTlCNOMCj2sll/ccNFhCFoIAGwcWeSinIEkJtWYxsv888lb7s/iGTepNoG1eCswcINND2aXMdKL
	pNguVE4sGXpktZ8G/a3cHyRYzZlkk/vu1By1q0vH5db5QrCO1yCVc7in++2gwZ3ryZHusNWqPgy
	M60207hyXvM2WXC6/tdms1Rwh9L/ZcIkG9+X8ZLcRmaRdFi2KYXijg48U7MvhRk=
X-Received: by 2002:a05:6402:51c6:b0:5de:5717:f235 with SMTP id 4fb4d7f45d1cf-5e4d6b6271cmr13603175a12.24.1740994684950;
        Mon, 03 Mar 2025 01:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0D4fk02QR9pNIZDoVtBIGIryV/5nnFm81RWTyHdja4tZ1wouSANXuFLVpCyDmAiODjbHbRQ==
X-Received: by 2002:a05:6402:51c6:b0:5de:5717:f235 with SMTP id 4fb4d7f45d1cf-5e4d6b6271cmr13603153a12.24.1740994684510;
        Mon, 03 Mar 2025 01:38:04 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6cfd0sm6614899a12.28.2025.03.03.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:38:02 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] xen: Kconfig: Drop reference to obsolete configs MCORE2 and MK8
Date: Mon,  3 Mar 2025 10:37:59 +0100
Message-ID: <20250303093759.371445-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit f388f60ca904 ("x86/cpu: Drop configuration options for early 64-bit
CPUs") removes the config symbols MCORE2 and MK8.

With that, the references to those two config symbols in xen's x86 Kconfig
are obsolete. Drop them.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 77e788e928cd..98d8a50d2aed 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -9,7 +9,7 @@ config XEN
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
 	depends on X86_64 || (X86_32 && X86_PAE)
-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MCORE2 || MATOM || MK8)
+	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC && X86_TSC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
-- 
2.48.1

