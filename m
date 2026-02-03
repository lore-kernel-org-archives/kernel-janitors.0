Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BD394482
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Feb 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107931; cv=none; b=Lhxhpe7pEyQbKEl4/vFYyK7ZMef4MDJclfFLn9mqjfUCCLsEomN97Or0SwWg2/JhL4jfmO+oAOq08/XYcXdu2tuG6JlrpRpdP+mS3mipYbodXrj6U6D49T/7euAejqDWHiiVAt3ublM/qDTR6o5suwEGrLCotyisT0cn/MliG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107931; c=relaxed/simple;
	bh=UP3o5RZCgmNzEHWoXYEDA5D9xCWek14i60bIqhpFpuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DN9zJdI3lLLvM9adYWNmDK0zJql9asCs9Y2yXsSq/K/wtfed30Q/1VMJ/Gu8Ygrwk3t1yLVUofPtuJ+Q05lUdrwW3nf1VYNoBQgp202oPXUCHvlCWJANoyLrCsIojtEqv/zcP87t40fqcgx5xl2P8GHAPLhmfkIiYmX38oTsmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bvlWfUW5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3ZK5/0k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bvlWfUW5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3ZK5/0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770107928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=;
	b=bvlWfUW5Nqvlwwewdb758u/DxRgNm+UxV0KnbOb8zU5oZoETEbzqQfDaSQ1ffl9n8HsHVb
	8XdNin1Xgc7OZBYrceicHYyHc3JXeBd7Ou595o52V63AowOOoMwhxvZbSRM0IMr9+49j8G
	aE1jDAzcqeqgejf4lIJV7MByv9otulU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-3amhXLcqOomPueZvR5pVFg-1; Tue, 03 Feb 2026 03:38:47 -0500
X-MC-Unique: 3amhXLcqOomPueZvR5pVFg-1
X-Mimecast-MFC-AGG-ID: 3amhXLcqOomPueZvR5pVFg_1770107926
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-480717a8e05so53075515e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Feb 2026 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770107926; x=1770712726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=;
        b=D3ZK5/0knC55UWO643CwP+QFsKjI/R8ZGeUixLa7Yfy/gxQULpx/4AJzezYIRzEK4W
         A2ElQuD1q45EVJ3uv/hKawNJW20njGHcLCNusRIosc6nS2Xu+9EunbtgDjk8fVXw37f+
         4VqIB1CGK6PFW11k/lRybeTz4Hu3sb0NGTeHSVYkrs7D1qZZZGCqSlHFUF+QSMDvcTOD
         bF7cnSO+OL0ptEnE6zOl4AaWPsag1Z8ysTo3oGGr3nvRMBHWW5QsHJoMWEki6M90fZ26
         LD1h0/vIzx6ru4re1bjzuSWQObhb38Ne+8Bxx9VsxxW1Y2DUnPxOaXqVEksThqsvywYM
         B+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107926; x=1770712726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NCYqdOlT9sFa8uH7kXNnGKZoNbj9Xsd6uRR6nTxrdU=;
        b=hpxah8JfqLBPBlvf4m2cIjNfj8QCNq97SmhxTx46oBPLQruX5UOkQB7dT/0+somzv6
         2Zw9qIyW5oybICsEKzR0LvCjU9s+zumcbcU6F7+DTq26GoQYjIe9H8U4DK/lstG51eci
         piQVvBiHE5Ij6NXKhdiH+5itcCy6E0EyDad6ZJHOEoyNQs4DntS7yPW0IztXusEW7dvr
         GQNdhMsHWLNSjYpH8eBiKr8eAsRABznSRwV3zRrG7wVpDv1EAiKOaLLGUzhnOaTZdZJ7
         KcyXE5ChoGmJBtg+0jd8Xf/WdcWE4dXr6X5+U335Xj5MQqkvO9zWM1iEftIEEwEoX7KI
         qhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFLFhgVpjkrcAjRoNVMwIw+0qpI8V+gB+ZRa0pyIHzGliCwcRsMSwvpYfJkZSVKKzNsJJ5smQIkRi2BrJPTSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fEjyo70lDWrTtLiUDMYLUFDceDI04QCLZrm6iB8HQBQoSSCv
	qES/uIIimCvp67qnxyO1ubFuSysjmRywvAav6zSRqgypU4Af2PLZfjqggXRqC5EWeR+rZ6DI4+I
	9EmmbG4e4J3Prj5TOYWkLcDlPX+pCjAkzd1y+lLRHh7Gi4Ijx6BnE8YZj2uNR8uLn8QtPJw==
X-Gm-Gg: AZuq6aILHMf8vuVINB3t4yQVkkj19bydreIilEYbMuFhnad/8kR1h3e6klIAYOGdLVB
	UkJt6h8pheY1cR1MbOckqCgfFwA1GTxS8xneFMwcF/tLxp7930/B4Xh8hJSQn+3SWBCbpqC+1KE
	LoWcATJIO+BWJMJBhGQgRZ6Ev5JlgsCBMcATNA7EHJs73Ywll1KI/tLZKnXspuTV7id4wI6nz2K
	eLWq0o2his3WuhzszFmq8IOX98XoZ1UdCT4DtnpNrmYTKjVhYf7zJVTliQrW0R7/PQB/g17aDH3
	7s73T98eVHaKu7LVQYjSMIyhF7w7IOx/ebfvfS/UP2FL6XgiCvi+U4CnZz75XPAHGh5XX7W0v1h
	sAVkR2XXvMmqq19cn2ET2tUMQIr/KKl5Aj+zdNm/aDFxq9KwnsItrkDCZa7Y=
X-Received: by 2002:a05:600c:c4a5:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-482db492454mr174833995e9.20.1770107926208;
        Tue, 03 Feb 2026 00:38:46 -0800 (PST)
X-Received: by 2002:a05:600c:c4a5:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-482db492454mr174833795e9.20.1770107925792;
        Tue, 03 Feb 2026 00:38:45 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da8eb486sm138469105e9.2.2026.02.03.00.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:38:45 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Elad Nachman <enachman@marvell.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support
Date: Tue,  3 Feb 2026 09:38:42 +0100
Message-ID: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit fcaf733ca526 ("MAINTAINERS: Add Falcon DB") adds a new file entry
referring to non-existing files arch/arm/boot/dts/marvell/db-falcon*.
Checking with 'find . -name db-falcon*' and the files actually added with
the commit b3370479a5f7 ("arm64: dts: a7k: add COM Express boards"), which
was part of the same patch series, the files intended to refer to are
actually arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts and
arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi.

Note though that there is already a file entry for
arch/arm64/boot/dts/marvell/ in the ARM/Marvell Kirkwood and Armada SOC
support section. So, the added files were already covered by the
existing MAINTAINERS file and no further file entry is required at all.

Drop the unneeded file entry, essentially reverting the commit
fcaf733ca526 ("MAINTAINERS: Add Falcon DB").

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d6c1df42bf5..0c474d8f62ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2989,7 +2989,6 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
 F:	Documentation/devicetree/bindings/arm/marvell/
 F:	arch/arm/boot/dts/marvell/armada*
-F:	arch/arm/boot/dts/marvell/db-falcon*
 F:	arch/arm/boot/dts/marvell/kirkwood*
 F:	arch/arm/configs/mvebu_*_defconfig
 F:	arch/arm/mach-mvebu/
-- 
2.52.0

