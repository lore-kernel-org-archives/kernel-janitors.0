Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99B15199A
	for <kernel-janitors@vger.kernel.org>; Sun,  4 May 2025 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746331853; cv=none; b=HT9Q86BhHtrax/qKfdpnHwT5jJjCFB9dOTaSa59mK2m2SR0lUB3qmU/+6mlPEPs4WoWT0T099s68vIvjdDcxvbKuK9/AZNn4H9YUJ6proTdkU6z3H2uv9oTDCllZOlK4ngynpnPFlCvEp04hyl2Zps55OzTr5BvrkGEduQ/jXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746331853; c=relaxed/simple;
	bh=58y1wlPA8jRdV6kOneRQ3qISahx75Mn9ln9rC7q2WlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fn1DANk5Lypf48/PIVKZirZ/f/kNJYG8Ot16Y8w6vaCKAWIzqNa92FNOn2UWl8gOrIpGAhxUkXPSd/HrmOmy++jsnQWX/ExYBKg91atzEQmEC6J5r/7e27fb1hnpXVrrvSRkCNnFwwqNTDM+sFTGZ49gCJ2hq5SbHj2fACIIwzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XONysR+v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XONysR+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746331850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pXg0ERkF8XHkKLcRr4bURjizOpgCnyyQy1hmk10qVvs=;
	b=XONysR+v3TIAgxCzCjDvAMatNCK1MhpEZdPEZqiQWGfReSZaUSwO/24nzRQjuWbvqZCdyp
	N3Q6xwQ3IIgNuaswyK13LqZUWJkrQ0uw6o5lQHMmawxhc/6Om6VyM5ppV+11RPIFtlvHIS
	5bxETxriOB3fbcILdAol0Km9lbIi6WE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-hM6NnkJ7PJ-l3z9AnlQE9Q-1; Sun, 04 May 2025 00:10:49 -0400
X-MC-Unique: hM6NnkJ7PJ-l3z9AnlQE9Q-1
X-Mimecast-MFC-AGG-ID: hM6NnkJ7PJ-l3z9AnlQE9Q_1746331848
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so16788415e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 03 May 2025 21:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746331848; x=1746936648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXg0ERkF8XHkKLcRr4bURjizOpgCnyyQy1hmk10qVvs=;
        b=W2KY6/nB47FqbTkZpDfgTUTymMnRGflOQOviqilVMK+ofxvt6yPpOtOyWycDoBaU9w
         HwdXQPBzK6mMr/tmEHjzEsAqapzk608HRziahsk5TMK2XYa+TCNvbyHvBlpOWVwvaPJ+
         cGSx7ckAePp65flN3QARO4T3v4fn0IKfpImNUdbEbNwkv0G65Gw2zx+fnKj90P0BcVaw
         BuALUKmc9gGohlF5mjfxyrKpFs+IDGSDTIGwQVuzprqsgmqEf/XpKOGgI56D89Un0VFQ
         2Ws72j7uCcKJwq6p0ZHL2jqyuz2FqOJvoyMn4DGsPNrQ1glxYjg526TrIM4vx/Bilujc
         htXA==
X-Gm-Message-State: AOJu0YwBZdsCv4QqtFtVOcK4yWFWGosZ5oi6PVSVtQZoj808H7Ay2HzE
	pJh2PDbldFPX/YxZFW2N7HJKM8VT3o/xEvJal0Rp8JEAnKZPSI6lqsiv5iciKnUJjE4uYAA8SRY
	N9n0ahF1TE016cfg1J3EoEiui7Sdg5dVHbCKod7NGYn9UmAJWJI9CilNX+pMEyQ22Aw==
X-Gm-Gg: ASbGnctLy1FHHXdasZ6G/oPfxxU7Ez0d0ZLl7fNx8Jx5ig1FuJcZRSKA+cpXHIghFHl
	fOTAJX++4M0Vztm96sKcFifQnARp8hE98QpOC8SqOsSg/Njn13aFXBu5fsCNmSrr/8GBAK6IRke
	oD5aQZg0YA5he2cwhTImVsgC9fn8mxP5/x7yg1ZghGmSbEHQzyJtJrQ6NjNeV6NBv+l1YmT1JfQ
	vTWfpyDyUJ9uSeBK3Gg/6PR/6hLPvBUjKdxe55YqUJl7jSYrSHtZBsn5H6gzImHNYWrCrnnB02N
	uHmMkEw5z+8oV3H3iD1DqJU1q6rVntoyZnvNmWkZD3h371J8XzmgjdCHmA==
X-Received: by 2002:a05:600c:8283:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-441c4948691mr19622055e9.28.1746331848172;
        Sat, 03 May 2025 21:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+L9gMdreyvyzyLlq3oHQYPX/FO9Npa9JrKoYnNFTKf5gqLqTcPTA+0B3G8oMkDtOUnSc9ZQ==
X-Received: by 2002:a05:600c:8283:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-441c4948691mr19621955e9.28.1746331847872;
        Sat, 03 May 2025 21:10:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af306bsm138229675e9.21.2025.05.03.21.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:10:46 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in ADP5585 driver section
Date: Sun,  4 May 2025 06:10:40 +0200
Message-ID: <20250504041040.40421-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a53fc67a1e21 ("Input: adp5585: Add Analog Devices ADP5585/89
support") adds the file drivers/input/keyboard/adp5585-keys.c, but then
refers with a file entry to the non-existing file
drivers/input/adp5585-keys.c in the MAINTAINERS section ADP5585 GPIO
EXPANDER, PWM AND KEYPAD CONTROLLER DRIVER.

Make this file entry refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b21363fdbf4d..1401209d06df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -550,7 +550,7 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/adi,adp5585*.yaml
 F:	drivers/gpio/gpio-adp5585.c
-F:	drivers/input/adp5585-keys.c
+F:	drivers/input/keyboard/adp5585-keys.c
 F:	drivers/mfd/adp5585.c
 F:	drivers/pwm/pwm-adp5585.c
 F:	include/linux/mfd/adp5585.h
-- 
2.49.0

