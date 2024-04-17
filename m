Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A113AD38
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Apr 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348890; cv=none; b=PAji8Dfvv5QLl6+09nrVB8xUX3N/DNnhl0BpzNF0NZZsF+v03Xkq/d0UN3oz1qOvjCwg2Y/imqBTRzd0Ssp2MF9kHkMwgfsAGDXsViBqb4zLUvc+fYriunxJLvSfYSuurobgsCCKEfQql+KqRcrW6jDeSop9tOSMt8uL8TuaeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348890; c=relaxed/simple;
	bh=Nsjf4W046CIAEyOcmt/MlZoEUduqPetqmPDoVbBknjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFCmldM1cQQv0YGtWdrJyQI/6WUPCaU2unCwJBiyv00AAms8iofUWPCWNl4LvhGjsDM8Q1plCTs97Lx/gGAsOj348AGOOv8ZPPfTOc2mFCKSJYKDeRYAkaD3cGBQXmEOMBrnQiuH4FJOWjqntIVIuD90Vyl0u0xarb8kQu1AdXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWC1jbih; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWC1jbih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713348887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfznY1Xt+1agp915j30/FccRLbon5LKlLd7NU6tQjbY=;
	b=VWC1jbihrlhykawVWWzGbX518hICl/ApFmJ8wEPiMoLVtISWkiuxpA/mfAAcCesWKYpW1R
	lNLjwpZCTGHWL2jfIZ7pXQKIlPrFPUiP99Ke85Ft1QnyyKDse99/WB52dbJxEoN3A0yIZO
	poSuG6mdm5Z0Ig9PLSfPiSHfYCHXFY8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-UZdkUtw1PO-hJmw9l7odlw-1; Wed, 17 Apr 2024 06:14:45 -0400
X-MC-Unique: UZdkUtw1PO-hJmw9l7odlw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c613c1c51eso4878543b6e.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Apr 2024 03:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348885; x=1713953685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfznY1Xt+1agp915j30/FccRLbon5LKlLd7NU6tQjbY=;
        b=lpavqw0ydX3dyC165MKCUGsxR/4v3avWCiQn3Fd6gV2t4lI+yGSEHJ6eQW/kgvrRNi
         dWWdu4eeuqX/5YTsYvvgq0JbkTNDRojm068kKpIOChFmQusmME/tEPbkPlLxWdqPuXAX
         L//rPz/YvoFv72c21mXhg1BjPZna9f8ofK56xtupQNT7ru7txrm1hwjw7zkMvuF0ZNN+
         yk6hX+nFkYxnPsUOV1CeGnD6XU8KGxoJpL09+WIBGJsoqOadqBye+LBN7+qFNrwPV8Z8
         uWI3HqwpqxcBOkKpUSeNCVW/+hYhZB16giUTfO0sn1zCpcok7NqIf6QYFwZbLuscJzRS
         lFJw==
X-Gm-Message-State: AOJu0Yxu2YV5N3jzC94mUc2DZoxBUmZaYvRukS4ueZ5+kPevvwxyWvdI
	WALe3uXJ9CwFTMdSKCctCg4epXwF12C4uWkgjYpEBMGjpe8CSJNAm2rqpff6i9A4lKdARD5Y6ZN
	JBQPycx8QyK5t5ptZCsbJL8v3VoiX3Yp/Mn/1Y6qN6NfUblJkkFXetQ19nuYtQ6gPMQ==
X-Received: by 2002:a05:6808:6243:b0:3c7:13fd:d878 with SMTP id dt3-20020a056808624300b003c713fdd878mr7873802oib.9.1713348885198;
        Wed, 17 Apr 2024 03:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDz0OAbOJqHdNWrsnzh2Aggk3FP1TUtJ619gQjpyPq9dPplYtFuLf0MpY36myUuCQuf7T1/g==
X-Received: by 2002:a05:6808:6243:b0:3c7:13fd:d878 with SMTP id dt3-20020a056808624300b003c713fdd878mr7873788oib.9.1713348884914;
        Wed, 17 Apr 2024 03:14:44 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id js7-20020a05622a808700b0043781985244sm71939qtb.59.2024.04.17.03.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:14:44 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in DOCUMENTATION
Date: Wed, 17 Apr 2024 12:14:29 +0200
Message-ID: <20240417101429.240495-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 1e596d5eff3d ("docs: Detect variable fonts and suggest denylisting
them") adds the new script check-variable-fonts.sh and intends to refer to
it in the DOCUMENTATION section in MAINTAINERS. However, the file entry
refers to scripts/check-variable-font.sh. Note the missing "s".

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this new file entry in the DOCUMENTATION section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4356b28ce625..250c8f8caa08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6493,7 +6493,7 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
-F:	scripts/check-variable-font.sh
+F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
 F:	scripts/kernel-doc
 F:	scripts/sphinx-pre-install
-- 
2.44.0

