Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541E413C676
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811792; cv=none; b=i/0unFLhjwpFOVnt8XXTms5CnCk8qUObEAfwdMLvRKjzGLEB1ok2Cmeo0YveWpNxxhLzdDKr3Zk1KQvTB/PN7apo0N74Bsg4T8TY4PYz+xei2PhIQqnpM/sR4Qy9QOYoAFbVa/LBTIv110dOZff88ljiiDmVVeddCXPKsI/Hq5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811792; c=relaxed/simple;
	bh=TvH6TCVgnMATPSKOuH94vxgD6+OFPlbAAQCEQs9hoqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZ/bIfTO9mb+xzwf4Ro1nSkPSXKkItNkq6NLXOBnxTZvUT0Dney6mmDXztywH+4YAU0ikMfeRYYKNcHCAsJLKmjPqbNpOKpy57A2q2CZIL5mAIhRPaRt9zFg2OjAHOvA2Xk8vKdm8rqnxeJl+G88d1Wv5w7hyFnWLBvPHyDUYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D29mvb7p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D29mvb7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712811789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oeHu73ZcJFVvJyZ55x/dnWlLLWe8HGo5I+YvO7V0U40=;
	b=D29mvb7ptQIPmeYO/y+AaqM/iVslSBZ5pxUhP6t0Cnjoe+aX7TMceGoD3B8mWf7gU3nVoy
	AHMT/V8iYNKZZn6DSMhT53PclqUoMiMuLf0pewd+jeVmP5IEFZmLLC4gpMgHx+wSCvy5bW
	59nmQ0hSndgwELzr+6wlVPBuFuA5CtM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-fwY2friUOFKjJcJ0-vIceg-1; Thu, 11 Apr 2024 01:03:06 -0400
X-MC-Unique: fwY2friUOFKjJcJ0-vIceg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56e34264982so2280267a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 22:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811785; x=1713416585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeHu73ZcJFVvJyZ55x/dnWlLLWe8HGo5I+YvO7V0U40=;
        b=r5tBNznrTEQsvLjZzXIcFMJGmDuHdicKsl9lu0zN+v3ugB/M29NlIZxNt8vaWBjJuM
         lcTnw78BHd+HCnKmgf5aENMSyQsaVzZS987hDVhSYmpPmgtV0z8rhac9ztCmLsfEqlMK
         +IYDnmKStXWSKTLEkPcUWKYAIEgiQE4QOaCO372ruemMOcBZq15V0ZHjX4kq7qJMlPUf
         LkMlUtHHSg+hv3QJlatw1+VVAs/d901ZgYzKnfFhtbZUn57FSYLP/QjhTldM2Aa2MbjM
         3L/fr3YEw+sjhegn2DpRMmgxP+sYeAsC3vExnjjgB6j8As2Jkiug5wMjt0q+UkncpkV7
         7hOg==
X-Gm-Message-State: AOJu0YyuxH4KpWR0yjlOXs5EktQHXwHNec6dQRLwy04w0TSbBdlp2Q5W
	+u0LZTI8c3aOQH9d4ZsIvtt2EfMN3/X6AkZzWSSNZnpGw8gK/7ayQK643L8GrovqOHRcJdc6vI1
	02ETuQldH1jdVBGzfi7RUd48SjwrLb8Zxvqbc+pKBBMQJkQdfY8+aIo+8NvP/ziTlDQ==
X-Received: by 2002:a50:a451:0:b0:568:3362:ccd1 with SMTP id v17-20020a50a451000000b005683362ccd1mr3738112edb.1.1712811785466;
        Wed, 10 Apr 2024 22:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYDiEm5uYLCp9Y2cNrKiKw+GCEoP2XQC/NiQOax90o2ewqRFDQclGGyG9LYC0R8itI1t1O2Q==
X-Received: by 2002:a50:a451:0:b0:568:3362:ccd1 with SMTP id v17-20020a50a451000000b005683362ccd1mr3738099edb.1.1712811785138;
        Wed, 10 Apr 2024 22:03:05 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id c1-20020aa7c741000000b0056fd8155792sm323337eds.25.2024.04.10.22.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 22:03:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Date: Thu, 11 Apr 2024 07:02:57 +0200
Message-ID: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 20c9819ccd9e ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema")
converts i2c-pnx.txt to nxp,pnx-i2c.yaml, but misses to adjust the file
entry in ARM/LPC32XX SOC SUPPORT.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in ARM/LPC32XX SOC SUPPORT after this conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06d685a97b4b..edf6176a5530 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2360,7 +2360,7 @@ M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
-F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
+F:	Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
 F:	arch/arm/boot/dts/nxp/lpc/lpc32*
 F:	arch/arm/mach-lpc32xx/
 F:	drivers/i2c/busses/i2c-pnx.c
-- 
2.44.0

