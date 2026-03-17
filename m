Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B53803E9
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2026 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780664; cv=none; b=l/myio53XUCMFm0DcJwPz7VZMe3UXoWpT5orPK3JvV9liKSEMxX6CQ5zmVQfDq6vx4gO+ZqlX2slwvyMPFfTbHa1u6aMxZA99pnRxthSwht1UoEP91h++iISnrsTZuh8G8OBMH0+yqRtQNkDMUKutmUYhYD5FtECFXb1hTj7h7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780664; c=relaxed/simple;
	bh=yntkghlcCP7ZIzwF2Sh3ioPGHdXavGN3D4wJZF+nEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bdKb8UB9zpOcpLy+BKNexFeJdX1r8cquxKlBba3C9Maak8Ynh7hgcqn9zGnzqQV4q1HAUje5wiYeQqoLGHP8YeiD8zQHDpHVTV5mXU1Ash/tWQg4OKOlgC3P+5BFybRqgaYKCgnVn8LqrykNViWRgdai2XMZrQlLELp9a9hdodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO62Zr5w; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO62Zr5w"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so44065f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773780661; x=1774385461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yFBJVJpKs5V7I19enN0uxv92VPjioQfGoucnyTKKqE=;
        b=hO62Zr5wXn+5fG2NSIxA3RysgKWXYEBt6HPcheu54DQ5dabEVi24bbTtV4dMy8lsYU
         z3zMDIlZ/haDHvtboukDXmFeqa21qI+QBw7DkM70u+mC2dtqZJpRC+8X1FczxYye2NMe
         GHuXiqrzgcrjWXt8FP+YK1fAoB3WSA+olJ/icOQ3B7+0GoVyKIsTQl8zIqyCNhi09sa4
         0DXOcoY9jb0Nsqpyiqi536yR2eWVooJwzeRXaB1nhS3CEnubeIo7ilDfkD3jkEOBbQUd
         qRzPFiZSy8RlLSmXF49SSXErLRM7cR/QlfpqBcFLHQmKjioyzFJfJ1KKrD8aKQKAHbwX
         Ij3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780661; x=1774385461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yFBJVJpKs5V7I19enN0uxv92VPjioQfGoucnyTKKqE=;
        b=CKYSzVEqwxEZYNfX4Hd+ykUKGiyROXoeO7U+6czcr32p2OeFjf/n3qBMo7pY25FSEC
         WxaoJORrC/FdSkvBO20qPqplFL9Qd0nC8tRmaYx0MRhwUFhG/oWyBPypGkyt0xzc/nVf
         ppYcmWHg+v75UB/DSFU+Pb57k5zkjzy6UeBH8dz3YSKXlOk5LayixstYoTl+7smuGKxv
         FxJo7ZjBc+7h86ztbAylVNv7DBOv+3mxD8wkGSFWB3K63lpmU0aukdPIeIIU/mkQ+eFz
         r5IoIbTw0cBu6PV5ZGCWROQqpwnISyrdeU5/bB7brazgxCsrDA1BGzRyb/jJ44oZ4U6X
         Z0xg==
X-Gm-Message-State: AOJu0YzW5oQLbbigBNwW5MN5D0B0gjwHlmlcDOAi6OsQe17N9cWbP7eS
	gHlkQ8MaX++KxSVaOyY++QjWDDJqGUvlsK2pZ4MeqJM+0ArN05myTWZN
X-Gm-Gg: ATEYQzwUCZUwPCCYS0qPAyhsUTRKIiY73GBG3bTDZOGWBPZc2FjMyD/8mmKm+QvNH8b
	F2LqTfeHO5qjuxrUm93bITt8FAd2VSVoa2OGQ+8q6swazanFE79Xyd2U24sBSLRwei7FOVxzMJj
	RMOWeqtLTqORJfFdvqYja9gCOZ//WqS6TXos6FEPrVwaEi22CKo0feNnk9yrz+DdYqmVhx5NTzv
	d9/Djw1tH3NsoTMs2QZ3mm9BlxjW9nIpuk3rzOA6AIuJAUlniyznDmUvK2oOAP8TxGtX3mxmZBB
	dk0HaB/tIAebcIKIfNDJe0tV/HnWXrfau0nQGS8oCEPC68FLUPFKsP61X2vNlHedFKbqd061Qyo
	EsdpgNdZerKVxiQBrgC/fbhrOTClsMMzMQId7JPUH78k5MTkU4B4pPlvZjupZjhFyzeXVZgUqAJ
	P9tmimxohZfa+P+Wwn+PsNNg==
X-Received: by 2002:a5d:584b:0:b0:439:fe98:20f9 with SMTP id ffacd0b85a97d-43b527c4d66mr1136366f8f.27.1773780661024;
        Tue, 17 Mar 2026 13:51:01 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518522d7sm1706550f8f.13.2026.03.17.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:51:00 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dt-bindings: dmaengine: Fix spelling mistake "Looongson" -> "Looogson"
Date: Tue, 17 Mar 2026 20:49:38 +0000
Message-ID: <20260317204938.120729-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in the title field. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../devicetree/bindings/dma/loongson,ls2k0300-dma.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
index c3151d806b55..8095214ccaf7 100644
--- a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Looongson-2 Multi-Channel DMA controller
+title: Loongson-2 Multi-Channel DMA controller
 
 description:
   The Loongson-2 Multi-Channel DMA controller is used for transferring data
-- 
2.53.0

