Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA9B187FEE
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430741; cv=none; b=QlWrHsy2/jecTTSYwuDbzCgreg77ghaoCVCxSfswy1oC5HI5/8YL5jG+S4hQLBTzoIg00sVonwT9LAFCeNc11DBEmeK0g+pO+lKkQIXefOrsjjnZByZohZx/XIaaUr1GeiL2yPorFLRZYSeZYpenb/bJ70uV0yFXhGfyswEf6Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430741; c=relaxed/simple;
	bh=J84a+GUC53/DXU7se4jcQYTHK8dHcObTxeHmGxs+G3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukI2Ip7EdZYaIDbH5x1TnqycVNzofUQxuFFiqOyjULXDeJcc/SeulrMj2CimxrWv6p9H+3IE1Gj9WmN/revVM3/dL8ubShPwKV+mOkghjDFu/CpPotA8BwUYwohf6yRkQKijIdaNCWJgZ/cY6BkTJTthbbOS7Z2qYfvzuP2NazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKE2GDNK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKE2GDNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727430739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
	b=UKE2GDNK7sCz9aZ2aJIwoIw6ZkH0/NPa5fgIYvICoYqhjinKKY/jT3/ORQYomSJEKKEjHc
	E38b0zebmYibRri0V2wFUz2GpJMuPksoSWwLlZ794B041YRFFEAHu7QMLOexSMN1h/McUi
	YJnWGEKiVrsfbgq7pe8WzFozdxYuJuc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-NUor4eS2NV2ogeiOyTWmxA-1; Fri, 27 Sep 2024 05:52:16 -0400
X-MC-Unique: NUor4eS2NV2ogeiOyTWmxA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a9a71b17a3so343980985a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 02:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430735; x=1728035535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
        b=J+EkXFLtjTZ5DGYrchric/mCOmNYEtETvOUxT6TP7o2bnm3COjQrFSagAlw8Yo61K2
         1NgXYBRJyfkob2SWGf1/jjabohBF6NV1EOG2/aqxFDwYzs3d+2v0gzAYDbHCyqqU9Ebm
         wAj+IqqgmLR0V5n09avkA+opovoN+jmYbuIJp5mzhgD27rnQzQppshi1vGwOJny9K/Dw
         D+pJQd1+oMgniQ65ZHlJCdFpaVMRojHus3w82PmgPPv+LIGvghhQU8kCFM5YCHHWH2tK
         5wa071rjrvHWR4CuVWmcTg/JDVVVK2CSJgR5P5gEqcEFajwlEOcX/JZYNOPHWtvvlB/L
         ubTQ==
X-Gm-Message-State: AOJu0YwdhxQdZOMfdEztOLflUYIP7EstrPJIw+nmK/lAbVBggxRuTNz1
	y2cSNapaozJp4cyYno33cuag8OG20MWzSVeBGMpggY2saK+j/OTYaiQKyF2Kam6Zms0dCzozXPP
	U5wuTiDzFhNHKaTmhEL4mghpIVinzylY3KebJ6mOgOKI57wt34zEiny872Wg5b6szes0y0WKJk8
	wg
X-Received: by 2002:a05:620a:3196:b0:7a9:9ec7:63d1 with SMTP id af79cd13be357-7ae3782e3b3mr378551985a.18.1727430734987;
        Fri, 27 Sep 2024 02:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcRCGQ3J5pp0phB8xmBJPL/cN9jReho1pvo3oym0cfHErzgl2Eu/dJWBypCa1n5PpNPoUe3w==
X-Received: by 2002:a05:620a:3196:b0:7a9:9ec7:63d1 with SMTP id af79cd13be357-7ae3782e3b3mr378549485a.18.1727430734574;
        Fri, 27 Sep 2024 02:52:14 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377d5db7sm69557385a.28.2024.09.27.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:52:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] powerpc: remove dead config options for MPC85xx platform support
Date: Fri, 27 Sep 2024 11:52:03 +0200
Message-ID: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform
support") and commit b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform
support") removes the platform support for MPC8540_ADS, MPC8560_ADS and
MPC85xx_CDS in the source tree, but misses to remove the config options in
the Kconfig file. Hence, these three config options are without any effect
since then.

Drop these three dead config options.

Fixes: 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform support")
Fixes: b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/powerpc/platforms/85xx/Kconfig | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 9315a3b69d6d..604c1b4b6d45 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -40,27 +40,6 @@ config BSC9132_QDS
 	  and dual StarCore SC3850 DSP cores.
 	  Manufacturer : Freescale Semiconductor, Inc
 
-config MPC8540_ADS
-	bool "Freescale MPC8540 ADS"
-	select DEFAULT_UIMAGE
-	help
-	  This option enables support for the MPC 8540 ADS board
-
-config MPC8560_ADS
-	bool "Freescale MPC8560 ADS"
-	select DEFAULT_UIMAGE
-	select CPM2
-	help
-	  This option enables support for the MPC 8560 ADS board
-
-config MPC85xx_CDS
-	bool "Freescale MPC85xx CDS"
-	select DEFAULT_UIMAGE
-	select PPC_I8259
-	select HAVE_RAPIDIO
-	help
-	  This option enables support for the MPC85xx CDS board
-
 config MPC85xx_MDS
 	bool "Freescale MPC8568 MDS / MPC8569 MDS / P1021 MDS"
 	select DEFAULT_UIMAGE
-- 
2.46.1

