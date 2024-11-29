Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0C15CD52
	for <kernel-janitors@vger.kernel.org>; Fri, 29 Nov 2024 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873969; cv=none; b=KXRlGoJ4o4s9zTjRIxSAWdBW2nZN/8OgBvVhDAOjxvlJXgEY7n1ji42PJHIkr34yGmju7bhKNkK4ElP2O7D6o3xI+Yi2uMP5CK7ZBBCIuC9j0RhSUTq9ighTWIgb/oLLaafrPh3htp5CwvE+hhjfYuPKhpjNWnVBfd5fVnHCV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873969; c=relaxed/simple;
	bh=SqmOT6iWjnt0mG+nwdZYca2nN237AFxzOVzsJfDWvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDWWnYx3+G7we5SvJwvqiHKZYpGu3lx/JhCTHOQhDo4oPeoX9FHMVRLaSMkUCSz3SdjAVeDidVIxtjMbp9tNyY8n9jBf/+MeLcYPffSW0yGxof37zXRvVZIddekfWGb7Tkxj8f//mwJM9UkEkIEtD1pE4cNIU6429wkZAUTFrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PB/sQjAw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PB/sQjAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732873966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u9pRkC1e52aumPgah0dPBX2kXf19ILENP915r5Qwrhw=;
	b=PB/sQjAwGKzNRQb9trHpHFbGh3W3OXgKkJrdO2fvS5oOYbFOLVRyhNiWY9Z8At09wzXGVx
	xbnKP6arz4xnk8ntzEWTEUNaRaGvzbTjeBT+Dox2S4c1bWdJoHVT/yQVTHsUUBlSu2OaLy
	TA5DqIomaP+mm58reCUCx3Iqb7CbxXc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-bWLzZfGfNquTkfCIBWDpXw-1; Fri, 29 Nov 2024 04:52:44 -0500
X-MC-Unique: bWLzZfGfNquTkfCIBWDpXw-1
X-Mimecast-MFC-AGG-ID: bWLzZfGfNquTkfCIBWDpXw
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d028dcdb47so1032378a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Nov 2024 01:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873963; x=1733478763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9pRkC1e52aumPgah0dPBX2kXf19ILENP915r5Qwrhw=;
        b=du3roMrhDJIpKKSsHnyJiJeCzCBnbJt6HFKqIALrG6u4YXeOgq1hh3Zrgy6QI/2cBh
         UY9nWgZuh7jtTr9wZpIm3RPvFvoqqR9oShILINc7yK81bTbxaxbL3oo6fRYMvuoZpl6U
         Ph6KNMcrtnIEqZ3IT8n3/wa7m15EfJjNVsT40BG4VLg1ch518BZR4bhTGb13B1JY1fT+
         OS/YiU/uvq1CybM2UrLegwR94KC57JOAdHshTFLtGE7d+hS22SAXUnP85CZ4J6zRGJ6A
         W73g+PwfHyDQlgPR55oCfVlMLxU/A6jDjNkvx01flLCT/+2ITL/YDSv0cnsehpazeV6j
         A0yQ==
X-Gm-Message-State: AOJu0YxKLlsMptwJQfULItYZGYUI46YQ5G1ORSC+I/UMQYfSorhZ7VO/
	mbND/AGHHZ1B8kmYV4AD/f1h6MjuZx0R7+V7CU2+2R6S/IkDeCuK7lCXkSNipjXvPOJCHuYwbz7
	uyrx5Ty6ldhWGOtTLG0z4QTxudt9GzeYKvjsClIdNIYN0/3BIrZDXITxrJVvwQE0FqA==
X-Gm-Gg: ASbGncsunqPEyjBqkosSJmLePAPwp8j/3hvBISMU5EH1SHykf9EfTrMSytRtNwYLqin
	uZwIWuzLKYTyPa3vXpyImLV1LvXL5IQWZIFshmcj0UPA5yAdUH3OwHZ4Le79P8vhVIyoMwVno6J
	ld+bZWzrmgUxE3c3r5yf/RYY6MrIBpEqHx4x+m7M1ORQB468EiXA+qysC+RYW/3ng7f8GcIReMm
	Bkr6oA5sIOaqwl8OLhh74LU1eJc90Eqlr4020OyDjKs+JxWcmnw8rnivPn9BW2lmA2Nx5f7JKbu
	TQymz7Zt3DGja38Hdy1VnQ==
X-Received: by 2002:a05:6402:42c4:b0:5cf:f5fc:4160 with SMTP id 4fb4d7f45d1cf-5d080c69119mr7901103a12.34.1732873963452;
        Fri, 29 Nov 2024 01:52:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1x2CcmMS3DDHYn2ZMvn/87pV8k//bJ2vQzTxS8d5iTD5KADjFjqrm1NCoFWK+kP+P/4M1Eg==
X-Received: by 2002:a05:6402:42c4:b0:5cf:f5fc:4160 with SMTP id 4fb4d7f45d1cf-5d080c69119mr7901082a12.34.1732873963145;
        Fri, 29 Nov 2024 01:52:43 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097dd9b7dsm1728078a12.52.2024.11.29.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:52:42 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: fix typo in I2C OF COMPONENT PROBER
Date: Fri, 29 Nov 2024 10:52:38 +0100
Message-ID: <20241129095238.51748-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 157ce8f381ef ("i2c: Introduce OF component probe function") adds the
header file include/linux/i2c-of-prober.h and a corresponding file entry in
the newly added MAINTAINERS section I2C OF COMPONENT PROBER. This file
entry unfortunately has a typo.
Fortunately, ./scripts/get_maintainer.pl --self-test=patterns detects this
broken reference.

Fix the typo in this file entry in the I2C OF COMPONENT PROBER section.

Fixes: 157ce8f381ef ("i2c: Introduce OF component probe function")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1240e75ecf4b..d1b50664b5e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10765,7 +10765,7 @@ L:	linux-i2c@vger.kernel.org
 L:	devicetree@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-core-of-prober.c
-F:	include/linux-i2c-of-prober.h
+F:	include/linux/i2c-of-prober.h
 
 I2C OVER PARALLEL PORT
 M:	Jean Delvare <jdelvare@suse.com>
-- 
2.47.0

