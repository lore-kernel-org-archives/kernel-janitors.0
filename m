Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653BB2AF10
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328894; cv=none; b=EQ8YIXwPz8nz4MUPH8ZJs4WMfBC8YiOE52HXF1ZkR2gJSMG4/JxpsCntPjf94IZSwsXHPx2wFE+iQFR7Lb64OtTZVVlgPTlsZPvh3/9dUIKu2fcUK/XlJqbT+dWcTxJkWwOVAxKrx7ErvOkS94pT3xxob3LQJwnld0rKUJmNuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328894; c=relaxed/simple;
	bh=pueDU+2IVTTmzOG2Vomw35iAiyVvIagwvaJGKUbfBiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSfctngFSL/jVZ1fL2M/lu/OHEEOpLU58DT5wE63lTCfmyFKRJfGAItHwZSFJjVfHa17TTpg2i+Uxi1K2sKK8MDkcgjndge09tyw2704Szi6GMPi3168rQsW38dzNiSMWVCOLvW5c1FRGOT4agHFRK4dj/kQQ5N2/2rCd7el3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWTA4Sy5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWTA4Sy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748328891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
	b=EWTA4Sy5jW7FA4kFoOECr3Ykn8Hh0j3EZnMIDtT+92liYFZrTOeQvG5lYQV+FRnJKpmY/M
	bofzqg+Gt1DXBKyvUpZWjXO/9CeFSdPBY2QU/v5CE39KbXGiYmGBFHgqFaadd5eqDPBUOO
	7tWcHm2SlyqKsNvvVmfv0Lpr+eFRfp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-5COkmrlKM5WvT8P3CLtB1A-1; Tue, 27 May 2025 02:54:49 -0400
X-MC-Unique: 5COkmrlKM5WvT8P3CLtB1A-1
X-Mimecast-MFC-AGG-ID: 5COkmrlKM5WvT8P3CLtB1A_1748328889
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so19032855e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 23:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328889; x=1748933689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
        b=cOhdZsk7oF5lu8J+Sem3+/9HPSd0VJEeCvYgmUqTu202cWvghSnWrqPJpYvnjowyhh
         6xVhpABNiWJ3RKRSSL6plEPXGq+BAyuh90Wsp1TkRoJgLC91Bvw5jDgW9wwK4ZE12mbN
         Ry9bxshjauu74CFTs4Ev9K1IhzLZ9+vdmAzyqWy0w8QOn7JyvNEQ9HUrsPuZCP31H/sQ
         4s5X75KZVLhGn5WMfddqQgriPez8iMEZXGg7TjrFB7pG1eEdfIydJ0dRUw81y11uYWX9
         GIOuMt+rHSkGMn9JM5ZN52XwSvGill93Xy/4TAXKpK0RxdZAtV8VEIEI3FNAQkDq4lZX
         LZ5g==
X-Gm-Message-State: AOJu0Yz/y4On1vKRxMTwHWr+tFzkEe84LTV5IIfdj6lKzveT6POsNe4B
	jRgTlkWGoongaJ0LvT+U6YmUzLPnmbGimeksB1FluEBxNbj8zrBlFBTPoyY8bIfIR+/VnD/NTLu
	t5KwDbgXlEAhdiT2w06NjVm7/8/NDxYGMbNlVRkRxkxpTib3ZZWhp/2PWd9yUyhk5tkVSJA==
X-Gm-Gg: ASbGncv/TFY2M2UY2HxfAyr8tqxP3+tzno5QbdC0Sj6djLbYOcxZwj6O2QIWEC+gjZs
	V7jfFwDttZwOC7HRQeg4TCFeDykeXhSrCfSSJsHFlDvhfPHo8XYLWpsfWnxGEESd3/4LTFjaDYC
	GqK/jcqks6RpgOFkGJRX5ggM/RIF1Nn6+TUkTmKeCdvheuy3A8P7vhArtuxHbKTu7P6kxninE2N
	tr8RdOhIOBqa77mAxlmGxjTB/21cSCG25OTvvbGwCsiP1T/bLa2RzosWz+sbkjU44QaitTfba18
	N2AQzzkqVD+uoQv+DjOgDkC1zY3lcMU8hoqNzS+jNV3+s9MimvCJ6vKVia8=
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543245e9.19.1748328888623;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvlq2u3HtOzGNrDrF6DdnIHv/xATBiGmzadzOCj185iZIcGz3tFT0jB+qadEvps/mZddgsA==
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543105e9.19.1748328888257;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm260066835e9.23.2025.05.26.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:54:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TPS6131X FLASH LED DRIVER
Date: Tue, 27 May 2025 08:54:34 +0200
Message-ID: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
Instruments TPS6131X flash LED driver") from the same patch series adds the
section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
referring to the file ti,tps6131x.yaml. Note the subtle difference between
the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
complains about a broken reference.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..0c4f0eb7f49c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24518,7 +24518,7 @@ TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
 M:	Matthias Fend <matthias.fend@emfend.at>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
+F:	Documentation/devicetree/bindings/leds/ti,tps61310.yaml
 F:	drivers/leds/flash/leds-tps6131x.c
 
 TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
-- 
2.49.0

