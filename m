Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65A3161B8
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735994; cv=none; b=QwGcbD+44EndfB6lapVezRDM1xN4mBrll7SsdRFB2Oh69NhlL3pwMwzWiVmiKkGu4F4AsSBKw5kONPzwioJf6Fgsi07J1FEveoU/rLu6VgvHNTSe4PO6NIeAo4oqEhgm61d2TIrFbr3QZPtwg0YAHXG4fbpDKg8MfAsNZgjlo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735994; c=relaxed/simple;
	bh=jKGLCRj7hWPj6nCNCOR0lDjd3tjy9+HvWQH6dH7MB6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvN/SE2pCwgh223rJQQOZ6+AWh0aI93OUZjucb7qe0ZX+ZCGKUG+G/okw7qjj91ks2nvL3YDuSgKHrJa+iuWXZDe2soNSVBduPAIoc2qhb5xYAhD0Nhwblt9iziD9nGVEBl3IKlUvxFWxSUAiHJl71V6QXFsBl656rQN7htpZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HchAJfem; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HchAJfem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=HchAJfemNS1k7AsTdAsiboBt5s1dRhu9QiaPSCDfhR03DEmsJajNuHXI4fLO1kkAASBwjk
	/47BL2BNr8YJGVDY5OTmyK2wmc/Uck0lpVzYNuP6A3OrDJagJPxB8Ltuwj+AoU3XSHs0nH
	ZW41dRppyhbxqG4/skUODEd4eGe0UJI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-iZCR6LQXO0W5F8dU6pn_Jw-1; Wed, 29 Oct 2025 07:06:29 -0400
X-MC-Unique: iZCR6LQXO0W5F8dU6pn_Jw-1
X-Mimecast-MFC-AGG-ID: iZCR6LQXO0W5F8dU6pn_Jw_1761735988
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42814749a6fso3765596f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 04:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735988; x=1762340788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
        b=sTP3qO3MUpsxps4fBd2ov/qQa3NQLrfzB5QdfAo0aoCdxIvLiOh2Y5sUbhXTxOtS2S
         L44D9gxWg+jp1Z9NMxNhOFam86CR5y3j7z0Y//nmSjfUk4v+udmvmZpPW8+H5IkpDOMT
         zS9PR8q9C1cobqucEZAWVM5sSYQCTFM1AnyumDOlXx8eOqsEAdyB4aquE5npb9fVqhz9
         jTeJt+MLjFf/g3ADfllx93OyEfg+G/X4UXyO7KneK+F9+ha7vJ9W/Ujmd1gNW0DLb7am
         GAjwhlLPfiE3NricP6hke5wvZFyTWq+5FFo/zH51mw5QefBZr4Rxp0cahMqNGRhf954K
         u71w==
X-Forwarded-Encrypted: i=1; AJvYcCUJD2v0MFPTD7oMSXJp8JuEYsG3Jp/Stup/Ktl6OaI2q5VOcKYC0JX9FVj0zX3uC4fK+iZzBUyY7YPI05zok4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPZsbei7L7EjaKvYVtlXy9mpFSJMxyC6hzUAC5wuQli7FNPOk
	SvbxmLcGD8pwGUs5gY9RGNhoQp3hft51+YUcxV5pnrPqClvDZPMpd61bOeh3CnGbNpDarmvCMjJ
	6y/l91LVkvaWudz27XMJs+WsYr4h/jyTzQCjgmwxLI/byJ8VUGIDeoXw7m1jC7IyYaFiEPg==
X-Gm-Gg: ASbGncs2r+ZmVZp+a9weAE6YssEvfG0Th7aHPzFt2nlDtNyRp3CKRVgQ9VukUovADfm
	mqBvtwTzfOtcjw/MW+s4HblO1lu5TyUOa3r9Fh8avp8s9fq90AsVJVMwuJfYNIKBJtxznGOzJW0
	WVc8idnIqs1ib9MaP54SCYNvUReg7mtL69LpShEh2cI0muL2euOx26+kP/GSKHEj2K5l9nnqWK3
	H9T5vpl3dvL9sn85sJz64gn9GhTl7vsNCu/15Aenu8Wf7gAA4y6uqUtRsK8Qb0fDu8fsnGv3Ndt
	jJnQF2THH2TlndrL+Ui5LOrf3GvIajYWi3f2rv/i1RyoCNcSYZ/Qw8bbmw6K+yR0mC64+w7wUFS
	Id48tGKCeBVYgnK7xbw6VM42jc8+apkN4LsZEa9zAgVinzx+k
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1957003f8f.54.1761735987797;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB8RsWZ0SjBkvUi9VbRgSefrwznyNGIlSzLxxkHxgmXUspqFq3z5NvztJjJO8HtqyDc5C8pg==
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1956977f8f.54.1761735987352;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm26665735f8f.14.2025.10.29.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:06:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
Date: Wed, 29 Oct 2025 12:06:23 +0100
Message-ID: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
bindings to DT schema") renames mediatek-mdp.txt to
mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
to adjust the file entry in MEDIATEK MDP DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e428ec79dd24..c094b2fef0fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
+F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 F:	drivers/media/platform/mediatek/mdp/
 F:	drivers/media/platform/mediatek/vpu/
 
-- 
2.51.0

