Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0332F757
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734557; cv=none; b=ITfyMOtpj2wNq9TOjjFSCaQjmArY+FSvK8GLA1zLoHFXAMdDxFxNJY9zpRngtHOVUytc/M9vHt9QbgCRYQzqv4uX+R72qni5yR6EoFqYFP/n1Jdh8DMsMqCFH2DmsEITqjhxr9iltDaErloJ1M4ILNzJqIMATUvtBNvz92y7YlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734557; c=relaxed/simple;
	bh=7gxDdxyM9gVNPiVVC4eGHnzzvY2SF9OG1/2DP5fZaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9NPgP/IHdz9rXDN7DZkk84DsBS3NwcEkvvxwyCcZZcVaY/hXxbbLeGHD2+3ef3Hq1GJOwDjbClwHECv7pa9WjiVAHj0qc+WihvTfzt2odN/HBgohZcPQGnyoAP2JF1tUTPHi+V0i2yhCoLhAT18hTcq0fy45+EBMj4/mjoVOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z36sryK3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z36sryK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761734555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VO6JMeF+Y/rlXeytLrI1t4e8cSgJmr6x8lUSlNHIFuE=;
	b=Z36sryK3Jm2AxgrP4wBDRqUXvDJmyGVtW5U3Wx/6ABTOJ3D+lRn6PSdbkmWMhpCjS8RC7N
	Ao+JTMEfEOa0vuRiUgMVIC/06+ew3ebgXkAb7Supscma/Ck4C5Vcsi/NZ1454YGk74qdzU
	tcLkJDLeAPpEFHDaCtf7AsEmgFeIU8s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-SZr6mKEFN_a_bPjk1fMqNQ-1; Wed, 29 Oct 2025 06:42:34 -0400
X-MC-Unique: SZr6mKEFN_a_bPjk1fMqNQ-1
X-Mimecast-MFC-AGG-ID: SZr6mKEFN_a_bPjk1fMqNQ_1761734553
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso400141f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 03:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734552; x=1762339352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VO6JMeF+Y/rlXeytLrI1t4e8cSgJmr6x8lUSlNHIFuE=;
        b=Y2KD7FG6faSl7aPgQ/DGSo2wLx3ue5sVlYPWh/iv+1vnZ67+xK37Hu71LcBNCPZT4K
         7yERfGZIUqix65y2Uyou9qeqgNZbguS2bTS/bvfarskbGgEp7ie/g+bhJWaRJmH4WHJ4
         J+Y7HQLGil3VYBybI/j1p44VGZCbPS337SnCD7E9r5mu4seDN3oZ+n1jzHD66Gei9A6V
         u1BDk27RZIsGpw/IWj2kR4y3Vr0i5ULW8GNYth08otpW2Im/+DJa+9/VoICBfn3MBGDO
         +EWcIGYJg29iNUxw8U4eDotjlw/4WddQcLiGSkf4EDLwutcYXejrYvsXIZR3dzZvKIAo
         Wgiw==
X-Forwarded-Encrypted: i=1; AJvYcCUVjIGs/58Bzv3G4spafBseSfJFZtp/RQA6DcTB1EKRmTrB2qo/9FBa7QLTGTzU+VFnI7Vzp5Izc7FUUolih+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQS4BRl+EGA+ZSWpofEi0Z72ARtAGcBVJB+D/9BhaFHXyQKZe
	2ZPrwQ76SsSFW1GAhyE2n3LLqRP4DEQnqNN7+lT1Y53BYd7JNCaYiyoDzqPEWtR7aPcfXEVKyLU
	UuHVREJeEpDlA2m2oGGflMlcXXutrtODWeumlotFAMSd++JirCVl8GLTrPtWmMOq7ohprf3//6m
	jskQ==
X-Gm-Gg: ASbGncvUQ1rxe9e3FSJLRXvmzw/udq9Cd2fAqL9RlwiFJb52djCKrJhz7B1jTCTkuGd
	lvPWf7d4LZ/4/2npvTy2fktb9RysU9cnEvcmxHPRFrDska0XDaOiqGxYYOqj4JoX5uIvUrkrBVZ
	r77id9IIDlv0siErWq7p/oFd1DWcKiWDLBMeYwfoxk/g2TuFobYPEYq4g4pM/uJqmXwM1UYLBhY
	4+iuEzziAYpYVld45Jnus7CfZw5S8qBNpgDf+/16rmvw9hlr6T72QzzcpUlBsNDKtjnnCQD8AB6
	PePDXFCppfV4/UJh2LxwZjs6Ke7fzLR+jbUI/zArvWvHQgGNGN7zaEfPvkH2iT70v9cOwRMvRBh
	as6/bdMH0f470cJ3tvtSeOOMyBrKJA35E/rpaU9eVamsj9hsS
X-Received: by 2002:a05:6000:2313:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-429a81eb864mr5415906f8f.19.1761734552400;
        Wed, 29 Oct 2025 03:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl6mj9Yhn8JAOvs+rKKdsBa63eFivbLmo5z2lKtEdDXOT0AMmmPQdmaMB5a5oRC1AheFEt+w==
X-Received: by 2002:a05:6000:2313:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-429a81eb864mr5415884f8f.19.1761734552031;
        Wed, 29 Oct 2025 03:42:32 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e387baesm40719725e9.2.2025.10.29.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:42:31 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	Lee Jones <lee@kernel.org>,
	imx@lists.linux.dev
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Nyekjaer <sean@geanix.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in NXP PF1550 PMIC MFD DRIVER
Date: Wed, 29 Oct 2025 11:42:28 +0100
Message-ID: <20251029104228.95498-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit ebaec90ec0b5 ("mfd: pf1550: Add core driver for the PF1550 PMIC")
adds the header file pf1550.h in include/linux/mfd/, and commit
a7d6255a0bf3 ("MAINTAINERS: Add an entry for PF1550 MFD driver") adds a new
section NXP PF1550 PMIC MFD DRIVER intending to refer to that header file.
It however adds the entry for pfd1550.h; note the additional letter in the
filename.

Adjust the file entry to refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70de2f9c4a50..e428ec79dd24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18718,7 +18718,7 @@ F:	drivers/input/misc/pf1550-onkey.c
 F:	drivers/mfd/pf1550.c
 F:	drivers/power/supply/pf1550-charger.c
 F:	drivers/regulator/pf1550-regulator.c
-F:	include/linux/mfd/pfd1550.h
+F:	include/linux/mfd/pf1550.h
 
 NXP PF8100/PF8121A/PF8200 PMIC REGULATOR DEVICE DRIVER
 M:	Jagan Teki <jagan@amarulasolutions.com>
-- 
2.51.0

