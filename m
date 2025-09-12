Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230CA2D29C7
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663213; cv=none; b=Ze1XXLQ4+VjeADaZGKMla1i1GGqNiyagHZ80iHMsL3sgnOOwQv86Scw64WKrawvTIV2zk5ueWBtl4Omsr+0ndZOz4Fpz7YUqDs7gWPyogAqY0XbTQJPzHYJFsONGGbXMbs0UpZpZPfxUi5zQx0TbLgMrmbULMdozTYmKgVsXSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663213; c=relaxed/simple;
	bh=9yoMY6f/O5Kdo0NFe6sZTx5s/b+R/IevS2MD/nCV13s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FD4AHzZ7klSRBI1U2Wypqxk3RQVV5wlvwDwRI90d2l9wiSqKKPgEYEMm8S5S5XGGmRDO37Z7UW/wkYtVhBRs0JgjmLeVGo6GQEzwSke66eycYcrk5VHbTCi0QoLM7jhvFgWHtkG14M52Bi4UEYXISx6aRb7nmyQNPTbMIDoRcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rf50OEvk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rf50OEvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757663211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vvaALMZ4+zN7uBMG4oemyZs/dyL2tuTURio8S2qM/9A=;
	b=Rf50OEvk/8W5RSEYbPLpQyEjscY3cz5YXF5maP1BSkSZnCEN4wvPFnjzWTyULX+mdotbPS
	Vx9osAXtcvnGeN8mZZd90U8WKmEuvVYmnzHfYX7ETinpzMSiE/UxOpKvqvFA3RN669SK2A
	I+F5jMp46B8u19lpXLagrjs1wmF/mKE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-xUUIP6hnMp2gwkcOuogawA-1; Fri, 12 Sep 2025 03:46:49 -0400
X-MC-Unique: xUUIP6hnMp2gwkcOuogawA-1
X-Mimecast-MFC-AGG-ID: xUUIP6hnMp2gwkcOuogawA_1757663208
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e5190bcba1so1081256f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663208; x=1758268008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvaALMZ4+zN7uBMG4oemyZs/dyL2tuTURio8S2qM/9A=;
        b=wudST2lE8xURa/41ioAmo7gop+CZWpJRkhSUyhC07jhaHW9QlX6+aLp8giItYLxFuK
         To462iVV5L2nwr/Ex25uZxfTRKKam1poORHCh8+k/dovV+848JqsVVNnAHo48D8Tp/1u
         aUPXSmxWxBqj1zu1S3LXfu9yvgwLB19GAz/LAIcPMWJnmoRczzyzQb9LocuGukgMKJWH
         /kcP4r1vFVMbqONmtRcgezfohfWhihJWVK6kotCiTCv1ycVACLQA2afj81TqjvvJC2Hb
         CMRQiABJkmw0Dfbdvm9IoXzAbHSAPQxYxeoOhYHWPdK6gRH8ZCAPqEX4pn4RyEbpVMF+
         P3/A==
X-Gm-Message-State: AOJu0YxiUOsuz4cXPPZ2RDzuVbRPliiOX7PA89+qDTePB0XYK3umvEdo
	Aie8IjJGstDRxu63HrrB0dZaEWrzK/5ftfiKKfypp0agn5/+ZDsgB639xeFVjqk8oU6WErbiWo/
	5nBHjYulwNGqtApw1afXGp0N9ZGUili4xucg4vU6p5GOE8OIZoNtWMsvrn0h9dMcu6C9kew==
X-Gm-Gg: ASbGncuY7ctQyjipREvs7rPsOx3Q8AsHHfbMdn+AAWX9Ga7omYaDG9y/bJCspNbV4gY
	9e8Crog6HnsjZR75jQgQXgh8GZcBGDb0eAm/uqmu++7aTyRCnBYgtPw8el8FEn6NyhM0esZY3ss
	tDDsuG9ivGbZZ+A/ness5KCAyF/WPGkfTEIDofcsAjVpJqfYYyTfc6lB2QROl1bJBCHHiqt+TqK
	WuCupRm0aXyS/nW1INjqbYX9AKq1r8ELEvPkHerS4gLj8be1eej9wBToSMHPrOIFrL7zxyMtvvh
	Gd8XI12dR9981KalK4nodz4afKFoCOlmyWVvUJu3XG07OAJAs+8heeZXFKESd8/dl3Gu6JV8ijq
	GZ3QIQYs3jFQHJg==
X-Received: by 2002:a05:6000:2891:b0:3e7:620e:529e with SMTP id ffacd0b85a97d-3e7659ecaa7mr2028790f8f.43.1757663208166;
        Fri, 12 Sep 2025 00:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm21ubE8d+dHPSjquWE3BgW1E1TkX8hsLoEa0HPJgLnT8FY+Bw9Zzo9lF6e6QuFVRZXGNdUA==
X-Received: by 2002:a05:6000:2891:b0:3e7:620e:529e with SMTP id ffacd0b85a97d-3e7659ecaa7mr2028771f8f.43.1757663207787;
        Fri, 12 Sep 2025 00:46:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm5362628f8f.36.2025.09.12.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:46:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-crypto@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in LOONGSON SECURITY ENGINE DRIVERS
Date: Fri, 12 Sep 2025 09:46:38 +0200
Message-ID: <20250912074638.109070-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5c83b07df9c5 ("tpm: Add a driver for Loongson TPM device") adds a
driver at drivers/char/tpm/tpm_loongson.c, and commit 74fddd5fbab8
("MAINTAINERS: Add entry for Loongson Security Engine drivers") adds a new
section LOONGSON SECURITY ENGINE DRIVERS intending to refer to that driver.
It however adds the entry drivers/char/tpm_loongson.c; note that it misses
the tpm subdirectory.

Adjust the entry to refer to the intended file.

Fixes: 74fddd5fbab8 ("MAINTAINERS: Add entry for Loongson Security Engine drivers")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa7f80bd7b2f..a1339a8bb705 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14537,7 +14537,7 @@ LOONGSON SECURITY ENGINE DRIVERS
 M:	Qunqin Zhao <zhaoqunqin@loongson.cn>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
-F:	drivers/char/tpm_loongson.c
+F:	drivers/char/tpm/tpm_loongson.c
 F:	drivers/crypto/loongson/
 F:	drivers/mfd/loongson-se.c
 F:	include/linux/mfd/loongson-se.h
-- 
2.51.0

