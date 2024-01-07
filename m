Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21B12E48
	for <kernel-janitors@vger.kernel.org>; Sun,  7 Jan 2024 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz/poFeq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d4ab4e65aeso12064415ad.0
        for <kernel-janitors@vger.kernel.org>; Sun, 07 Jan 2024 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704626391; x=1705231191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PY8iA9WaluLS8RJv0xl6nX9zy/AO9w3CB+MQ+FgmbD0=;
        b=fz/poFeqwgkCbdEd9BSe4UFxIUJVGO03qI87DNmyf2eYQ6EZ/Q2LGk4G1htD+RrmIk
         eghpd+il2niBm4PefxEgNzkXe4EwiyxV8YjgHuc67/AaF6pv8h2pIYQAkh4JuG6tTO/J
         xVOwfw1TJAMFWyNPQfg8DpxiM2UyjS5f8Mo7dw95118ukuYEdDCPf3hqw8UYlde+oDtq
         Amn7wujUBTcHxHGMHuI8hgOU2OyQK6tZDyGztveerxaf/swvaTa88rtAgeCSkHGpqQCX
         +diuDcskYYLN7GMNcXyktpxDuZfsesK+lzDAImL7yc9ilkXbz8JYPytQjzDH0soS0gNY
         ym2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704626391; x=1705231191;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PY8iA9WaluLS8RJv0xl6nX9zy/AO9w3CB+MQ+FgmbD0=;
        b=J8hyGzCNUAWEPpNwLt/MnAqAW78OoNrL98tcanuSsTZSmKZl+m/DMmWnBgy4h5yKLP
         put0Mb2ThK2eGP0qbbfrtJQ8t4zpd7ix3Ehz46rLP269cAQWKaPIuY1x2yv4RvLnS6Eu
         NW+4NEJWXalA363Qf8projw6tctJ3NCISNlmW2AtyyGuVOEF/CTtJXtx87chAsWfZNdW
         NILbsOMAFllCRBUJEl+YHcQC5CdO30uesFpDYAqxN6zeS2m/bfNXzaoM32ppc6UArhfp
         Wq0NTv9a6KB63LfhBIU3uG0E4XznRC1VE0QbTWRsEp3HkabfH8d3SambxRiXM/1fe79S
         BwpQ==
X-Gm-Message-State: AOJu0YxU5Zx2VTwtqat4aH2K8u24it/IQzZnzB0AgcLHks/XssjgiRGu
	PGSpu7KZ1GFdyjDDPtweeJ3CJ8M7zN4w4GtfZXC8ZLLwn9o=
X-Google-Smtp-Source: AGHT+IEkKjZl+9mSoQpUlRO/qiT0dXGaRVfFzS2yYq+CfIUqSbUNPoAH9zhaYjcOhWXrkQ8ntzP3Y2kLg81xojxy8fA=
X-Received: by 2002:a17:90a:f98d:b0:28c:ee69:c1c6 with SMTP id
 cq13-20020a17090af98d00b0028cee69c1c6mr5761324pjb.41.1704626391024; Sun, 07
 Jan 2024 03:19:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Jan 2024 03:19:50 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 7 Jan 2024 03:19:50 -0800
Message-ID: <CAO=gReFGZV92mj8cz7Y=uZayYpoJBiLig9-p-G6UUNp7mH4Dxg@mail.gmail.com>
Subject: [PATCH] MAINTAINERS: correct file entry for TQ SYSTEMS BOARD
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Lee Jones <lee@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Rob Herring <robh@kernel.org>, linux-imx@nxp.com, 
	linux@ew.tq-group.com, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 7564efb37346 ("MAINTAINERS: Add entry for TQ-Systems device trees
and drivers") adds MAINTAINERS entries for TQ Systems Board, but these
files were moved to vendor specific directories in Commit 724ba6751532
("ARM: dts: Move .dts files to vendor sub-directories")

Fix the entries.

Found by ./scripts/get_maintainer.pl --self-test=patterns

Fixes : 7564efb37346 ("MAINTAINERS: Add entry for TQ-Systems device
trees and drivers")
Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c4cf8201e0..a62c40cf24cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21983,9 +21983,9 @@ TQ SYSTEMS BOARD & DRIVER SUPPORT
 L:	linux@ew.tq-group.com
 S:	Supported
 W:	https://www.tq-group.com/en/products/tq-embedded/
-F:	arch/arm/boot/dts/imx*mba*.dts*
-F:	arch/arm/boot/dts/imx*tqma*.dts*
-F:	arch/arm/boot/dts/mba*.dtsi
+F:	arch/arm/boot/dts/nxp/imx*mba*.dts*
+F:	arch/arm/boot/dts/nxp/imx*mba*.dtsi
+F:	arch/arm/boot/dts/nxp/imx*tqma*.dts*
 F:	arch/arm64/boot/dts/freescale/fsl-*tqml*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*
-- 
2.43.0
