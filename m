Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A0343D83
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285703; cv=none; b=R/sqaJnO8O9sWYaCZ1+CZLVqZRQDaFYjtmeNw6kdgpDwIgz3AnPpQj7DNrU1vmQdEWeJfexjmVgR95CyotaI9wc5gvzu8051dJ0SXz3/XLvy8i6jk6BuuA+V2OK/p5WhZ5CAoH3jyEpJHnfrYkWAjYjD948wUI5T/MayivcCl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285703; c=relaxed/simple;
	bh=HSoyRRGbqwKrrPWn0b3Gxv3O7atFcfaJ2Ou+bHXSKWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYfQMBXWJ/0jSQbPW5kwMwiEX/KUMHCuULMQp7XyHqwR2Y3SsbBqcbpgCK09/FjEaXUvy4JLtlH6IQ0ubeovoXHQCYRlzkX0ST6Q38hp15SQ2+jxEqHFmpObqPy1w5XwZmPdF1y6MalRK89SbSD5kyqN8/lclXYOTmSD6ENF940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hi6o7ZZA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hi6o7ZZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756285700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=btmAfnbOXrpj/8xKgw2LcnKjNrejkITdGU2HjYixq9M=;
	b=Hi6o7ZZAuMxbQuyKowH91qdDM/b/adER79TeDLNS6mMxmRtvovs8ZAAqSxB8x4EVt2g3+L
	1UFaw4rQ+bUyHedyVUb5KBu0ZTybmoZXm5PQkkf1x0vYtgxlcPSh+Ypvz5yPkCQuW0zbXS
	6xbtP4TXLQymcWaJeJaMgq7zSnLvitE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-4e3cGyYfOwGGyP7rtf8OoQ-1; Wed, 27 Aug 2025 05:08:18 -0400
X-MC-Unique: 4e3cGyYfOwGGyP7rtf8OoQ-1
X-Mimecast-MFC-AGG-ID: 4e3cGyYfOwGGyP7rtf8OoQ_1756285698
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e972eso143198136d6.3
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 02:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756285698; x=1756890498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btmAfnbOXrpj/8xKgw2LcnKjNrejkITdGU2HjYixq9M=;
        b=fh9EheJXtimM/b2yzuqi0303oBYO68FnxjQUYt8kAPmMq2/Vw8/ul7vPJuxcC3kXN3
         3v6kQHfVzDovXDMT8svm54Iu41IuRGMrC71RsVRp4922Nf318PiwvIKW/SlMQ7J4y1D7
         GId0SaMog8P4ACnz+KinBunxgsdcquHdWT/YbkbiquKfmNXZc7NiFi+FnP8ItovunuIT
         T/ul0vw+dP4OsJ0DTmZIa1THil4VzQDdcjHjsvufH8wQ/XNrv/ZXYdfVD2G6J4o7OC1D
         C1/Ew+cS3PNuDOS/Gn0ZUE5CQlgjRpK/JNpbH/EWxXeIJc3yl0e/k5p5iHTfuNJuZRTp
         K0KA==
X-Gm-Message-State: AOJu0Yy/Y2HQprAabwwXW3aVLIZdN1z5BbUbL8l+VyvssMliDR27jF8Y
	f0Ob+xuaaV2JpK48vPkUbgimC834vxEMGclz8dE4ByeChe80pWkjvoJraPlxTbOechpFn9DepcT
	mtMyG+f0G9AV3gfUm1hOaRmSKp7Pm0dqbWyedgQ/PDyvi/m0Zkv/F4fb8+kBtO20hCixz2Q==
X-Gm-Gg: ASbGncu57FyH/nV0C3KKRp/gYzSBkYeobN3kdXsDmL498vzSYt3g4iW8xfjKfmu5u6+
	dtkd0Ms7EZmbHFQesaGs3l5GmYrHhwHm7RZ0Smpm/KR746vMdI41a03cqoYhHzIinRErWXJkAAG
	TLYwQ8gsQhDjgHUR+UbyXkS6uzpQYOvBryZqumvAJheadZjNTZbVxqgA4NNW3w2Asbh9mZZUurh
	e747Rgojcrm2funyyWz91G7qdyzykPLOINTDIRDAMT2pYQvQwordBduFP4P/MA1PluDFYyGI32F
	hstVSnCNisINbQRnRwAWFSIbZaKBfz1PHcMg9MUruG6/DcJji2JrfpnSg6JhemFXWIPfgUFfMr8
	++U//KHH53g==
X-Received: by 2002:a05:6214:f2f:b0:70d:ad2e:ced8 with SMTP id 6a1803df08f44-70dad2ed051mr7559326d6.54.1756285697878;
        Wed, 27 Aug 2025 02:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKnx0Sy0uoUmTwX2Z3OLZ81WV24S78smOZB6VPkrYeFf13KoSmBl+HyiIGutNgl+jaQogtkw==
X-Received: by 2002:a05:6214:f2f:b0:70d:ad2e:ced8 with SMTP id 6a1803df08f44-70dad2ed051mr7559106d6.54.1756285697478;
        Wed, 27 Aug 2025 02:08:17 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72b3c1csm81764646d6.58.2025.08.27.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 02:08:16 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ext4: remove obsolete EXT3 config options
Date: Wed, 27 Aug 2025 11:08:08 +0200
Message-ID: <20250827090808.80287-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

In June 2015, commit c290ea01abb7 ("fs: Remove ext3 filesystem driver")
removed the historic ext3 filesystem support as ext3 partitions are fully
supported with the ext4 filesystem support. To simplify updating the kernel
build configuration, which had only EXT3 support but not EXT4 support
enabled, the three config options EXT3_{FS,FS_POSIX_ACL,FS_SECURITY} were
kept, instead of immediately removing them. The three options just enable
the corresponding EXT4 counterparts when configs from older kernel versions
are used to build on later kernel versions. This ensures that the kernels
from those kernel build configurations would then continue to have EXT4
enabled for supporting booting from ext3 and ext4 file systems, to avoid
potential unexpected surprises.

Given that the kernel build configuration has no backwards-compatibility
guarantee and this transition phase for such build configurations has been
in place for a decade, we can reasonably expect all such users to have
transitioned to use the EXT4 config options in their config files at this
point in time. With that in mind, the three EXT3 config options are
obsolete by now.

Remove the obsolete EXT3 config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 fs/ext4/Kconfig | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index c9ca41d91a6c..01873c2a34ad 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -1,31 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-# Ext3 configs are here for backward compatibility with old configs which may
-# have EXT3_FS set but not EXT4_FS set and thus would result in non-bootable
-# kernels after the removal of ext3 driver.
-config EXT3_FS
-	tristate "The Extended 3 (ext3) filesystem"
-	select EXT4_FS
-	help
-	  This config option is here only for backward compatibility. ext3
-	  filesystem is now handled by the ext4 driver.
-
-config EXT3_FS_POSIX_ACL
-	bool "Ext3 POSIX Access Control Lists"
-	depends on EXT3_FS
-	select EXT4_FS_POSIX_ACL
-	select FS_POSIX_ACL
-	help
-	  This config option is here only for backward compatibility. ext3
-	  filesystem is now handled by the ext4 driver.
-
-config EXT3_FS_SECURITY
-	bool "Ext3 Security Labels"
-	depends on EXT3_FS
-	select EXT4_FS_SECURITY
-	help
-	  This config option is here only for backward compatibility. ext3
-	  filesystem is now handled by the ext4 driver.
-
 config EXT4_FS
 	tristate "The Extended 4 (ext4) filesystem"
 	select BUFFER_HEAD
-- 
2.50.1

