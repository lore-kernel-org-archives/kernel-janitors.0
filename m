Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78325785F
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Oct 2025 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917081; cv=none; b=SfyqKThc09MRDTCz3+gcEolI2CWb6q1dUc7Qirpy1lv6QRjwColUnDjBUa22VEbL4ivhfnS7PLsv9eoqJ41//vPQ/NgF3usSmkVS8XSbWVjkFIb0aE0C4lCPH7q/2qlps4ULKT5lLzHXoMW7UArxgrWU6GV4zQ4p1citRsfWSis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917081; c=relaxed/simple;
	bh=x5nbI9AkIsrsiz0hS/4vrtpxaRXtMX8vw+zw9R23U8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKMgSU3xbDBUkPQSNsFcORSNpedTS+gboaP8zvU61YgYo3lQF074zP1b8z3UsQ46Rrw/5j/Q5QSbrDeQyg5uHuoxAOu4jfvaItpEaLQbY+JFOepCip6S8h4VqPeug20hdvfMx/IAVPi8Sab/p4BRKpog4YWkdDNmOhgjaXPxfVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4Bjr0Fi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4Bjr0Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759917078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYv27Cm4bmfghZ2+pFJmEaAynMMJr8WvQrLSP3odbZQ=;
	b=D4Bjr0Fi3pbhSAtY2vyv/oKsnA/w6Nvw2K57Y0IAWZ/PjGzNs/RKY/Xm92Zg9NlVNshsjt
	voAdw211IX4QZFGoDyvJN3mhs6+PKKZRHM4EuIwPfur9QMy8Cc78Un0MldKpeHBlPq0CTA
	TbmSx4KvDxI7eKjxS7DpbDZt7UE5GRM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-eIbaFJ66M5amdk9BCuAZtA-1; Wed, 08 Oct 2025 05:51:17 -0400
X-MC-Unique: eIbaFJ66M5amdk9BCuAZtA-1
X-Mimecast-MFC-AGG-ID: eIbaFJ66M5amdk9BCuAZtA_1759917077
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3f4fbdf144dso3795977f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 02:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917076; x=1760521876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYv27Cm4bmfghZ2+pFJmEaAynMMJr8WvQrLSP3odbZQ=;
        b=cPlmabnXiM6FWvtFDrvykcIvycdeBMtqdEOLZYUqd8SPd9ZkEj17MDP6/vSi8lHXkL
         0uggsa04zO0dHsaqNMbMkwQ00axKAcHba8sqmx/7qnaG9WA3MF9vsaJusM7sTXVYDAJR
         7fijM2IXshJ3W+M8PNk95KWz5ljT2zNZXmd/zik8kgF3mgHYHkVmfz/A8STjwiillB6z
         QFtXuMeFCHKJWcubUSa8UxzAF6yU1pJjttQ7xOgGMX1OdNYZmcThtGF7fb56MkjrJtxX
         Az8TaM/z/D1+Xnzo5HfrGIPxmIzb5WT0l3SoVq3vZnJfsx4IPpf8/h6HO8zq4z4E1Xr3
         sgGQ==
X-Gm-Message-State: AOJu0Yw1MeiGq4leur+YrVSpuhCj9/QiHhzHQd9NEdMlny4AfegdlTYH
	8jJKwQT4WZ1m8kBkE95+lz5N8+f/W24dNVLrwsnUObmplRRaparM+T9KS6Cb0/9mPrP+5FKTCz/
	Q3RuNeqbNPzDj0oq9VeD36hJumxvbZmih8DMZ93xZaSizzEtKXU2Sm2A3MtQXKap9Pe6ACFVNO+
	B3+A==
X-Gm-Gg: ASbGncuCTfpIbMDm5QeHseWi8AZRpiLuGhLBEqJYnEKuImr5MUxI/sDzkOa0QCGggGL
	9eKBxNdX914tT6Th/Izf5yJiOFpMHUnbZ24ov4l7S/FfYGynRbAvXDzqqIvxO5MqKuBSHoILpbK
	Gj1hioLlyQPxu6kbYL/fc0cKfedHXUJHaHXeEXSvseCvZ9rRKInPtDvKKJX89vom3/NCs/uMky/
	Yg6xnBSDR7CMd87kBVtK+eezQ+cVI56/C9PFVvxAMgE3CLCYI5T2Nd/nmTc5QU7cof9K/3Ito2Y
	Y45keJFBgQykQ3JdZ0Tc+2dTt7iumMP6FXmiJuoku8rBf8xE6u8T1ngV2w52MeRhHF9yM2OM420
	1/owszgkI3/EH1bAs50g=
X-Received: by 2002:a05:6000:2409:b0:3ec:b384:322b with SMTP id ffacd0b85a97d-4266e8e0802mr1458703f8f.46.1759917076086;
        Wed, 08 Oct 2025 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENsEzpnWwGCU/M0XivwrkdfnYW40qXyMKMvxtHr7XN7VKUUIvpOrhP5t58nBFFuiZGWfQk5g==
X-Received: by 2002:a05:6000:2409:b0:3ec:b384:322b with SMTP id ffacd0b85a97d-4266e8e0802mr1458678f8f.46.1759917075663;
        Wed, 08 Oct 2025 02:51:15 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b005dsm28753409f8f.25.2025.10.08.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:51:15 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lukasz Majewski <lukma@denx.de>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: update entries in ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
Date: Wed,  8 Oct 2025 11:51:12 +0200
Message-ID: <20251008095112.104995-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e5ef574dda70 ("ARM: ep93xx: delete all boardfiles") removes
ts72xx.c, but misses to adjust the ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
section, which is referring to this file.
The BK3 machine support is now provided by the device tree source files in
arch/arm/boot/dts/cirrus/, as pointed out by Arnd Bergmann (see Link).
Update the file entries accordingly. Also add Nikita Shubin as maintainer,
which is proposed in that mail thread as well.

Link: https://lore.kernel.org/lkml/d125b5a5-8118-48ec-8af4-243a217170df@app.fastmail.com/
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
Arnd, please pick this quick administrative fix. Thanks.

I noted a year ago, I will sent a quick v2, but this got onto a pile of work
and I only now got back to this. Sorry.

 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f41dbfecec91..e6e615954c6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2558,9 +2558,11 @@ F:	drivers/net/ethernet/cavium/thunder/
 
 ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
 M:	Lukasz Majewski <lukma@denx.de>
+M:	Nikita Shubin <nikita.shubin@maquefel.me>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	arch/arm/mach-ep93xx/ts72xx.c
+F:	arch/arm/boot/dts/cirrus/ep93xx-bk3.dts
+F:	arch/arm/boot/dts/cirrus/ep93xx-ts7250.dts
 
 ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
 M:	Hartley Sweeten <hsweeten@visionengravers.com>
-- 
2.51.0

