Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C59209F55
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254486; cv=none; b=Hfr9aQJRFbg9/foMP6vAq5pm693i+DLIT8BtuFWz+djCIfIVQXTSvIb5FvX03GvBKsjDF92eSQhTO4AWw941S6RWU6i0DX02Fa7pYZb9gpn0kVsBEPCWxPU43AhNFU/4P9MwGLDz7miVkNvRaSJNw7wHEG1haXUDutrxryTT4Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254486; c=relaxed/simple;
	bh=3ho3qGo1lVmXuX2dMlnltG2fGWa3E3AUvtUOA6OLNpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TogEIEaKacvjzo3TeMwdOaMBZkdXWFhrdxnJx5ix7ZMn34iFPF/HM0YizS+/KK6t88oIJSDglFDuksddYJHaBMP+PxefEGfDjCBZpi+tujPay/1jucQpVo3mjp8Ht78gsMxwyCYmlXohVOPArq7UK9JNYuG2serYYnvBN+chDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bOhR2nlo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bOhR2nlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741254483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qhoIeIC0J8+KZetLEFZda/wAPxtts5eJjpdjM7DSGkg=;
	b=bOhR2nlo4ahUXchJLlAeLIwfSc/EDcYHFrCuS2JzQLr9bv5IDNlYf7DAksyQGbRy4XxByq
	zsZWw8ZMmXcrICmFdcPjDmNiUIot9Pu7s/avIGVtvW7aXXYdBveuBpOKxIAt0BsGrXiyAK
	yShl7ZFeG0/9dz0tLO9T7iVbXVpBs4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-jVFUjHFFNOWqrxRaKGOFGg-1; Thu, 06 Mar 2025 04:48:02 -0500
X-MC-Unique: jVFUjHFFNOWqrxRaKGOFGg-1
X-Mimecast-MFC-AGG-ID: jVFUjHFFNOWqrxRaKGOFGg_1741254481
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-390fd681712so215771f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 01:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254481; x=1741859281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhoIeIC0J8+KZetLEFZda/wAPxtts5eJjpdjM7DSGkg=;
        b=kOVRjTSXQalQSC3fyxqPQm7vxIDdpsflpy0jaBSaGh/UAhXWLkc9zCnMzhnnBLts3K
         lDMyeuxBrFeWo+UkNOD4gV3I9vn1/c4bwNdhr2xUTJXptvyP29LUyHV/pJPoPwPx78AF
         PMjk0e0ra0LK/4tT6SmpsRtuJV1cHLaJAhqkTkcFYBVd+tYo2uuNfMQscsnJFRX0SzAz
         O9/xPP2iZDm8V1Q7/ZXKZbEDarXwjdJDXxp0nggrV1qO/t7gH24CpeWW8v20dVM7QX54
         M4rMDhBeLH5PhsFuIVKIx152UbYHNTKSANW29iRix5p9MbTgbLmAa4MXAmRr/gT0yiDf
         5+1w==
X-Gm-Message-State: AOJu0Yz36OIIwkQGXSHjK4J0z/QUVBFxzFsKLssLxM+Qq6TgBlMVPk2u
	eKeqIlQ66qgopAaBHCtdKMIdtmgsONPOW0m8osvRB7huP3SzP3wowsCFScRYrOpXBA8Fhp5j57o
	7kq4fGMmFE/tr0wVf0zFe5pgNUgd7lyr4cPDlMnSjv6RqxzdZHBR8EbSPanq/gvSsGg==
X-Gm-Gg: ASbGncvCyFqb3ryBTkCqBof0xLXhl9n8u3dwzHZxgf52euC8EcyniaQMMF/G3f1sY1C
	W1ZOEJ6Av36l9Fw4o30S4t86NuHNPSTI4sbzAMduC7sECx4PCW4Dome2ofl94P71/QUXBZfTva5
	f9kbpODuHDa7Vv/cNbRYtZjy+YCYmciAMyEi0z/tCJch69qA7GTQYe8bweJw12X8M8PM0MfqGiR
	ek/lRHCuqhcwVVhYtDFnOvREj+fYwzGgOvLC7EXauYDQdbS1+wzircjthgcB1b7FKQh/DL9vvG7
	DNQTZzsurLIycdPimhKbVhfub/HNwiICDlhMlFcou9rPayaVetTBeJyGo+CO3EU=
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr6723546f8f.16.1741254480850;
        Thu, 06 Mar 2025 01:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaiIHXbccL0gmNV8J9au35MPia1hghbbM07U8lOSRBfu151n9eSAZV97mDiHYuec/YepoOoQ==
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr6723518f8f.16.1741254480467;
        Thu, 06 Mar 2025 01:48:00 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c10437dsm1507462f8f.99.2025.03.06.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:47:59 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] net: ethernet: Remove accidental duplication in Kconfig file
Date: Thu,  6 Mar 2025 10:47:53 +0100
Message-ID: <20250306094753.63806-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit fb3dda82fd38 ("net: airoha: Move airoha_eth driver in a dedicated
folder") accidentally added the line:

  source "drivers/net/ethernet/mellanox/Kconfig"

in drivers/net/ethernet/Kconfig, so that this line is duplicated in that
file.

Remove this accidental duplication.

Fixes: fb3dda82fd38 ("net: airoha: Move airoha_eth driver in a dedicated folder")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/net/ethernet/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index 7941983d21e9..f86d4557d8d7 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -21,7 +21,6 @@ source "drivers/net/ethernet/adaptec/Kconfig"
 source "drivers/net/ethernet/aeroflex/Kconfig"
 source "drivers/net/ethernet/agere/Kconfig"
 source "drivers/net/ethernet/airoha/Kconfig"
-source "drivers/net/ethernet/mellanox/Kconfig"
 source "drivers/net/ethernet/alacritech/Kconfig"
 source "drivers/net/ethernet/allwinner/Kconfig"
 source "drivers/net/ethernet/alteon/Kconfig"
-- 
2.48.1

