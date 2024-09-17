Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F500165F16
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Sep 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569608; cv=none; b=IzUcJctaISK0bITbiHmBkjT32Ik+NjAyoxWHCtowS0BMJM7Xl+3G6Bl+a+UZVHc3c7apk3WRAEahbsFOWJODeK6QBljlxB2xmbRxOZg+ZY3OLAy3/DpKMlZk24elbYyqgix9z/YPGbkv0N+UP3KUOyz0f+h9BUdAyjXi0Hgre4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569608; c=relaxed/simple;
	bh=0LMBN520YvnGOafFgvhLjT6qIlZcWSGFYJKW35052PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AV0OszifFi6UrYfn0GmEBPPxSE8JakDe0qKzF27ZgwITZJym+YpHI4el3UO88bd3Tppgffs0xdDYKq3c3pH2MKAyNpMUzBtDMkeF7O/1qDGYVwrmuYmO5W7nuWZbL7T8VQeQgJAK4U76ef0LZ95czY7kZAcRTp5YX2TRfnY44DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mk1yY+Ur; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mk1yY+Ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726569606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8NsOdWTBNIM1qx9lP6F4iSdy29rXjvavRpAqXtZKsU=;
	b=Mk1yY+UrlVMhFFAVFGel8B1+I4njXxSkc3i3O1vQX+cfbxerh6nPNIVGGiCZrhJKQ3jJ1s
	zjskjNMFf2ZB431jpt5C/IVywPcmLQWZNU+naozx/2wjtUvrQD/wgPy/aXxvZl4gXjFN3n
	qw94YLx6ce9/Lv8BxNkVcj00oZD24+Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-c8TSoiniN3uo-_cLTz6sWA-1; Tue, 17 Sep 2024 06:40:04 -0400
X-MC-Unique: c8TSoiniN3uo-_cLTz6sWA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3780c8d689bso2385533f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Sep 2024 03:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569603; x=1727174403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8NsOdWTBNIM1qx9lP6F4iSdy29rXjvavRpAqXtZKsU=;
        b=V7mvLUHoeIzaiVPT5vg069HLcYJgxVeRGs/hT0tTKqz6rB6t30hAgwngfEb5nVeS+l
         mIYWTPiBk6Z9EUbD6gtbFPPZe5M0GFZfGBoqixZSqrzY9B6zmtUx7gvsn3RdUTs9jhKY
         YnxTBN/OdZOTW81mejYltIGDmHKaGrwqUhN7c+w93/aM7jV362KhdgPWReDD6YLNM9J0
         Zq5yZgRu0XXiqsRQxRTK3imNhRB4Xjv+Sl36dPOnuKZ+hyW7+Yp12VlBKKgNVi2H42fP
         1POQkBuqS1mlHKgI5S83jjoD85aUT/qQiDT5vv1r9fx5+Rx6WHDfkiZTB2UTrfmoyIc4
         xajw==
X-Gm-Message-State: AOJu0Yy5HgYBlGpmpjGDllQ/D5vEYgT7HPfTL2ru2IFwaIa+RsDJvWGK
	dXcHjSOIRW7VUPr+pkb3E6h4SZUOFKxuKMXoavJEsQYhtjNKbj3UcC8mqmi4cQ6M1jfW1EPagwg
	/+Gepva6HZJ/pf195HPRSZ9l/dpKZ0KjCEzhrwQ05oxpfhfkemPeQwZZtDaLmAJRLXA==
X-Received: by 2002:a5d:6892:0:b0:368:785f:b78e with SMTP id ffacd0b85a97d-378c2cfc259mr10196601f8f.13.1726569603381;
        Tue, 17 Sep 2024 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4UI97Csxn3j4pYvJYFP/Fr/uiCCt79JPc4rAJ1fBKy2utflgkB7c4Go4SgMPtMwX0FZF9A==
X-Received: by 2002:a5d:6892:0:b0:368:785f:b78e with SMTP id ffacd0b85a97d-378c2cfc259mr10196573f8f.13.1726569602833;
        Tue, 17 Sep 2024 03:40:02 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780007dsm9183869f8f.82.2024.09.17.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:40:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL MID PLATFORM
Date: Tue, 17 Sep 2024 12:39:55 +0200
Message-ID: <20240917103955.102921-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5f1cda51107f ("platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to
x86 subfolder") moves intel-mid_wdt.h in ./include/linux/platform_data into
the x86 subdirectory, but misses to adjust the INTEL MID PLATFORM section,
which is referring to this file.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry to this header file movement.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c4116045664..9a4fa88edcd3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11646,7 +11646,7 @@ F:	drivers/platform/x86/intel_scu_*
 F:	drivers/staging/media/atomisp/
 F:	drivers/watchdog/intel-mid_wdt.c
 F:	include/linux/mfd/intel_soc_pmic_mrfld.h
-F:	include/linux/platform_data/intel-mid_wdt.h
+F:	include/linux/platform_data/x86/intel-mid_wdt.h
 F:	include/linux/platform_data/x86/intel_scu_ipc.h
 
 INTEL P-Unit IPC DRIVER
-- 
2.46.0

