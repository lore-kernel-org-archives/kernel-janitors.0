Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D212E40;
	Sun,  7 Jan 2024 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVdMdPmn"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5955a4a9b23so650579eaf.1;
        Sun, 07 Jan 2024 03:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704628778; x=1705233578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/ZOCsEOdTRnjl9JS3Dur7qUjFsTr+s9XLe2Eb9oHUyc=;
        b=lVdMdPmns4YwrI631EhQGqhLqG6mE/TQwjJEjDnGDS22f2DUIEiNmLrvjJ7WWMVO2r
         J6rCtiroA29oxlnVrmfIXiiLQCmqUi0shDUCFNGfI7yelhVIEDSH5Po5TOlC6B3fBeWS
         /KZa/nynz7z/QqnCds3R3pDIZJ4f7xM1CC8ptWijgkG8VSxy2cqXD/8m2tBpG3ZkWTY4
         heuwy0+egXTTLymdwIddmth+4i+efiDeQpmCo4Ai6s2pRo/Ub2oZXjOgJ24ubtCWAwm9
         W2ECtkg93vQ4sftl347Rexj8Ebi9T/3rKlB+3JVa6wZJ4/JO8Lx/eB/nbSlmwISHwMMI
         CchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704628778; x=1705233578;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZOCsEOdTRnjl9JS3Dur7qUjFsTr+s9XLe2Eb9oHUyc=;
        b=LdlNoNm9AvRGDekRO/MCkv5DwlqgwA8DzdppOTUBbar1bgxZV/VMqkVEWLQ7pqnu5X
         v+3OFI97mVEoYSXwFJjAnPdKXL90jC4ZZ2YG4FCtcP9M7kqnNB/LiUmrVHjkc/WW8hh7
         J7nWwzvUqAqPPlQ421V+NalrlBkL6B78EpyVTio5seKQsHGO1YMlz+1VLlmv5m0Ez5fI
         xWTdZIk4CSvtAZmp+0FdQJwtoMYoHfF39xrKuALOqg6xlw+CifmAhYfdUABJ21OVNHqj
         XMr+UJN5byjKbtWK1zZGUoKopoK03ncahRXkGoC2FRkMIhLLasAb852SmiKjbJkVpzRN
         yXmg==
X-Gm-Message-State: AOJu0YxtuhylDzNA8viWvExL6D3ebdZRckQXWUwctDMMnwOpTReOkafn
	5i/ETENzJHRzrMQKWBuekJIM3JrkAf07328j0FQ=
X-Google-Smtp-Source: AGHT+IHmP1NKipM6r6r6tLU4mh89q39VTGQ/rufr8EbUJQngGH0pdsDPzLqtctIks0MsVRG5OTciBRV0mp2YDGK98pk=
X-Received: by 2002:a05:6359:6e11:b0:174:c5fb:7f1a with SMTP id
 th17-20020a0563596e1100b00174c5fb7f1amr635808rwb.52.1704628777799; Sun, 07
 Jan 2024 03:59:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Jan 2024 03:59:37 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 7 Jan 2024 03:59:37 -0800
Message-ID: <CAO=gReHEWnw0fnktH0Ka-bvJdy82HHsoyAuZXyPoEzMDzNu1qQ@mail.gmail.com>
Subject: [PATCH] MAINTAINERS : Correct entry for da90??-watchdog in DIALOG SEMICONDUCTOR
To: Nik Bune <n2h9z4@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Lee Jones <lee.jones@linaro.org>, wim@linux-watchdog.org, 
	Support Opensource <support.opensource@diasemi.com>, kernel-janitors@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit bd888a4377ae ("dt-bindings: watchdog: da9062-wdt: convert txt to
yaml") updates the files itself, however the MAINTAINERS files was not
updated.

Update the MAINTAINERS file entry with the new yaml file.

Found by ./scripts/get_maintainer.pl --self-test=patterns

Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>
---

Not sure if this warrants a Fixes tag, but if it does
Fixes: bd888a4377ae ("dt-bindings: watchdog: da9062-wdt: convert txt to yaml")

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a62c40cf24cd..d11e72f364fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6096,7 +6096,7 @@
F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
-F:	Documentation/devicetree/bindings/watchdog/da90??-wdt.txt
+F:	Documentation/devicetree/bindings/watchdog/dlg,da90??-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
 F:	drivers/hwmon/da90??-hwmon.c
-- 
2.43.0
