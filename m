Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF551DC04C
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Nov 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820511; cv=none; b=W0xnQexNjTU/xxOjPNmA7ddBlXIH3Sxf28yN1rBwXvK84yKgmgBTr36rs/p5u7CdktcIif0paxwfsF9gBQWqUNB9M+g2b7DM38ZVPzcaJJD47iqfLbyugvReyBdYSrsm1bTA/lXGP6woKZzDLi9VSmCORpYa1UwTOulOfLJ7r+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820511; c=relaxed/simple;
	bh=koya1W1nzWIe32bX6FCUiIbJTuzU7rznDrUGuDE82EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyAoll5xoBjQSkG7eOr2J3rpvTC7Ww+QBut+k6Q1IIAI7x+x/DF1rkcu6h9L2itlAFI+V9DQVLW+UkoN6IU72ba+CFF60TZ0aKWLpX3F9BVhd8kGgocN4CW56z/y5sVh5bH4K+fA05PK5X/2utvboYT4oeNjPO23909uN0zcMzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CEfrs8XF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CEfrs8XF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730820508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/BHZqjA869XTgUt4zd08lmfD1No0TmEngRpCXfkSKAM=;
	b=CEfrs8XFCwoHTSaJOzojx5hC00HvZ87IGLoK49E8Rp2WvcPZYb9bPB0xVvbX2AawfgwIBG
	fwzJta8iLqNUKlwVzxSe+kWpQ6fysg6C+lOdtyjKtg2A0lkLa4yWwp0rrpIFGqjdI6LQCw
	bE+cIyKUOd9mQ6s+kXjf5ZXzZyppiyA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-E2BxHNQ5NaaF33T3rQ6UWA-1; Tue, 05 Nov 2024 10:28:25 -0500
X-MC-Unique: E2BxHNQ5NaaF33T3rQ6UWA-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3e60dde7edcso3818545b6e.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Nov 2024 07:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730820504; x=1731425304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BHZqjA869XTgUt4zd08lmfD1No0TmEngRpCXfkSKAM=;
        b=fXb8Z0fFKSQrsQ+EzhmhdqiibyJBJ7KzJuouTL2d9ID3e4q55jOjr8NSZF/6K3XAdF
         JH0i4GPdzeUHMJ2Lql7aOKof/uLu/dyv4iBmF1RBUdGpvq8b03KyRNDtMvw5I4ugWPjt
         BUx97tcNaBqp83kPdoDASDChSXBNx9PYp5DZhl698OegLNtwP0RSJ/o6hTRFnmjRT1oe
         G0kyiQ+Vl+n4mEFyajndY7KcQSAtnCofPfZdnvPoDkfZ6mXw6MZ/0DGtqqC1JVodS4Bb
         z1UXzq0aSIF+nxnWDginVVQrWrFL33W8QeG1BeD+nyJLebSo2o9Lhwt5I1ZSemnm2XyJ
         Q8IQ==
X-Gm-Message-State: AOJu0YxQvbf4zPxUSVW/NWs1DyeKKQG6VOYdlz457+1HSYgYQlUTMa3M
	j6BqDkd8C1OcWzuQVjpcs+QQDX8BHpBhzOWSux4QSiivNO7EXr21J8fKFPAsI86VVnY1A684+Sl
	Js2akwDXPIj3RlU4Wp+r5aXEqQhu7C1IJpSrm5tTKeWq8ifa26Hy8Rk3ujSshuVKoVg==
X-Received: by 2002:a05:6808:1a13:b0:3e5:fd5a:d3cc with SMTP id 5614622812f47-3e758c1e383mr15987672b6e.16.1730820504493;
        Tue, 05 Nov 2024 07:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM4h5d/5NTRGyzrdFGDivSjfzdTU4SI3JAKtmPsDLW3+Bpn/Y3lRnzvPnwJvRB/5b3fWrucw==
X-Received: by 2002:a05:6808:1a13:b0:3e5:fd5a:d3cc with SMTP id 5614622812f47-3e758c1e383mr15987633b6e.16.1730820504068;
        Tue, 05 Nov 2024 07:28:24 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661259698sm2528540b6e.50.2024.11.05.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:28:23 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL TPMI DRIVER
Date: Tue,  5 Nov 2024 16:28:13 +0100
Message-ID: <20241105152813.60823-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit df7f9acd8646 ("platform/x86: intel: Add 'intel' prefix to the
modules automatically") renames tpmi.c to vsec_tpmi.c in
drivers/platform/x86/intel/, but misses to adjust the INTEL TPMI DRIVER
section, which is referring to this file.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry to this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fba9faf48c9..31b2252122ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11851,7 +11851,7 @@ M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/debugfs-tpmi
-F:	drivers/platform/x86/intel/tpmi.c
+F:	drivers/platform/x86/intel/vsec_tpmi.c
 F:	include/linux/intel_tpmi.h
 
 INTEL UNCORE FREQUENCY CONTROL
-- 
2.47.0

