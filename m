Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A015213245
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784544; cv=none; b=UyUejGPGPTwHHIEiNNFrOFv1ThDOfmVjKqfEhr7mexzPStz35cmyyuyfXhnyoD0rFBvEIeR8I7EmLN0BwSYisSDXnz8D+bu7odi1JUanmtaSCQMseXrkr4pRVzdg2mTU5T0KZhcz4jTCw+AcMcfp+SDBe3QSolKg2jxOnfxccso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784544; c=relaxed/simple;
	bh=DvnzqR3N+Yt1hJiN/UFuDlnF+d8ai01tb91e7tKjUK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZUdjQvd8Fhv5OJDx2b0Mz9uEyIfx2ggMYgrZcVRPb/sgcULwagcmisWTq4wGVXT4U5OVl1mzY2Jro1ICKr8kd9+6jTc2ko4klGsIphkZU4dVltpwBC7vWlLyVziy5Kv5UvKyYpw1nQYBgt3bVJMqeVOf/+JndG9IHweBs41ePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvxmxhLy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvxmxhLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739784541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qeVUNDEioZ1zA8ELxm1OFFvu01528gdmuR0pSmN5LWs=;
	b=RvxmxhLyiCQdro9HLllY6GwEoZAC6rvMnyK+hiw+zIO7GPE+cFxJInPnZolAzxtDNscYR8
	LJcUyOQ37StumQc+P58PVl3wXq076R9/49HxpUdcCOqOKhcPKWQydWV+f+C2qSnoGoqKBX
	QTb2qQOi8mQrngVSxZ3lrg2laV7sNTk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-suJ-Bjm7NxeDnGu4PPvK_A-1; Mon, 17 Feb 2025 04:28:59 -0500
X-MC-Unique: suJ-Bjm7NxeDnGu4PPvK_A-1
X-Mimecast-MFC-AGG-ID: suJ-Bjm7NxeDnGu4PPvK_A_1739784538
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f28a4647eso2116920f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 01:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784538; x=1740389338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeVUNDEioZ1zA8ELxm1OFFvu01528gdmuR0pSmN5LWs=;
        b=J2i5guBzM2/ssTI3cRDF0oXUwj3nuqDoGZI0MJ0GFmKShlsGi2givBFitBba8sMU5Q
         6Gk374qL3Jv9DMoFQaDBONrGIzUh6QKm5ar3GMNU+Yfl0wCnvE/XCEnHlqdZOTpT3F/D
         tw0m2sX5F4Lpnx956BY3Nc6S86sv6thTNxZnN2R8RsyC/ztxlgSk3g6RvFwxOPiuMHBk
         EVr0okrGdrOVq3AGhzj2t8Sap/IZPcZh07balsWXfH/OGeNRYwjo/yvNCf2f2YPkCWFw
         QHd11GbjkZwTK/r0Y4oa8h+3BMqwP9HqPqM6LMVU08qSMX4IzruqBahSbD3oAhGn6WQc
         5jAw==
X-Gm-Message-State: AOJu0YxoxBspWGQbIY7HUDBKoBUdJw4h2L0Gt0t2QUDuEJDaNQodAAoR
	PFm0zmlfgRrVdPAQt7j4Q5EWfjCzxh0XZPMJquHcFpmmOk8uKOwj+0a6zZM6/K4uvQoWI3oWUjN
	9Q6gifLNsB2zu5KY/IfmhuFFTjZzU7kqy7ZCZYq/CPhheCRReyfhwgyqQDqhQB7dgKL7pL2A6qW
	U4
X-Gm-Gg: ASbGncu4uJIYlsht96jusBU6jCfBAdM2ISWYmfoIN0ZcYMjN13EOasLYmM3DkHj3Y1S
	eUcTodyUdzZe+7AbPT7Zh8Bv9q1VV2HJDFkzUdnR6u3GGxzgKf/N1lrEPCFddpwiLsPsENBhXpk
	9RDBSBLSkfdEX10gI5oCNxA0wqEAq+9eapwvIgfAHGoOLuVZl33ZpTOZdc8qf33/fbPMUj/xBvm
	b9h1yoy5R3HzXAp5DqMS4V4hlJtAft14o7REqBwvGa/CLu9hjo9nqjyZz79bwqidHfs7A6QCfck
	AwnHWoyosOIMcbxUlYatXbjtVsgbXl/7i8bV+AiPbhe2q+UTsLzf
X-Received: by 2002:adf:fa08:0:b0:38d:df70:23e7 with SMTP id ffacd0b85a97d-38f33f34cecmr6714672f8f.31.1739784537698;
        Mon, 17 Feb 2025 01:28:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrmijOoGMXonbnwZyd9fLGlM4O8FZOdIeSBCVRiU0u4DCtv0gGZP/fVwdyLL1x9WLMBEhxAg==
X-Received: by 2002:adf:fa08:0:b0:38d:df70:23e7 with SMTP id ffacd0b85a97d-38f33f34cecmr6714640f8f.31.1739784537284;
        Mon, 17 Feb 2025 01:28:57 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7998sm11554234f8f.82.2025.02.17.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:28:56 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: David Lechner <dlechner@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust the file entry in SPI OFFLOAD
Date: Mon, 17 Feb 2025 10:28:51 +0100
Message-ID: <20250217092851.17619-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 8e02d1886988 ("spi: add basic support for SPI offloading") adds a
new MAINTAINERS section referring to the non-existent file
include/linux/spi/spi-offload.h rather than referring to the files added
with this commit in the directory include/linux/spi/offload/.

Adjust the file reference to the intended directory.

Fixes: 8e02d1886988 ("spi: add basic support for SPI offloading")

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a54d8510ea6e..53cf3cbf33c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22402,7 +22402,7 @@ SPI OFFLOAD
 R:	David Lechner <dlechner@baylibre.com>
 F:	drivers/spi/spi-offload-trigger-pwm.c
 F:	drivers/spi/spi-offload.c
-F:	include/linux/spi/spi-offload.h
+F:	include/linux/spi/offload/
 K:	spi_offload
 
 SPI SUBSYSTEM
-- 
2.48.1

