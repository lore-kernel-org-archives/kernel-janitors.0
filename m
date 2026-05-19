Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B93939B6
	for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181649; cv=none; b=DTyYaypkQYAFCm/plnO8T3PTih6wbzjDfIIR+/+WEkQuwkDKP5G+B79ZVWRe/aL6ziaO1EHAqh9XRqb8AwwE6d6yuKVOSxqPzyzZLWP5VV1n5oSF5WwCUyw8rWiENy2yKpisPquwQZBR+uPuIjrEgowpfYATwOCuEQ4z6BUlZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181649; c=relaxed/simple;
	bh=lAlepF2p1K4D0pPz8yCGKVbyHkktCBku7Z9+HtLuaps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIUeO/YlfJTt5G3e/i1kz60GMU9Pt3CHzuPYGCt5vk0Xc3wfxLZmNrV+MqlM4Xzie7HiJnFzNeGKq+txof6O9D5zTVmIDo5SGkkQaYg/iqhirL1kQ4ATi0SvqA56EjB54HMiXCuVUABs3WaalAxc58t37dbtNEoLhaO0Wrart7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zl4m+roB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJGMRHsT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zl4m+roB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJGMRHsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779181646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
	b=Zl4m+roB2U6SbD0lvjeGFdRe/N8M0EE3k02WeWtM6YdVZW9jJPb0D/5lYNiq8dKi6FME0A
	5tN27QBkrdKMEGKWco23RvDa7HE/RWxT6bWzkua+iXa8W1mvhRdnl94cPfEItEZ2jJII7s
	kf9eeSl0zOiFUEAKxqpdP7KQkenp9V0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-Gn7VWMm2NDKX4uozR4AxiA-1; Tue, 19 May 2026 05:07:25 -0400
X-MC-Unique: Gn7VWMm2NDKX4uozR4AxiA-1
X-Mimecast-MFC-AGG-ID: Gn7VWMm2NDKX4uozR4AxiA_1779181644
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48d127eb013so14160205e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779181644; x=1779786444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
        b=BJGMRHsTwuJPw0AgCrDEkJ87qlvt3PRa8XvsaPH53Odysz5JlkI2btYBn2cb0Ay2gP
         Trv2ZVfF0IccrLMJS/Z3aMIhNKJYRnrOuk+28mHc292a2oITNbY0agUDRi2FxfVGr/Du
         T1zdvJnN0rEeH/c9+tFAZDi+yBhW6nSu4dXNE+K8+NmFafTkdIiRXeXdQFjz4wG2JeZU
         C+3H0aeMHnVOQWBclTn6MhePEIK9kd0juo0QVCTEAihabWbPF/GRGs0JXKnRQ7G+s77e
         CtbDtJXAP3VRRVKE7HpMMDNlSFC3eoSVVKsidShYySxXvaQsm7yx0jzshQNoDYQg87qt
         LZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181644; x=1779786444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBYz/NrZc+Vq3hNBdRWZOxUhNWZcSq3yq7VxD6rnqac=;
        b=GqtspVjdTZjjdmmh6G388WHYkcl/fDXpf77QBJfli2Cdef3hgZ2PASGrGZQahM/zJ7
         q2q8++rTFXYVt1g2WUkTyUBnsI3aB0JnAYBgfw5JGg2EG3F+S2si8N+UHlldc0NNY5VD
         kpHTB325UEJjItxEIDaVBS2JxmGgQ/36Yku3iu3rpycenRsGophXjDOe68Bth22jNq+f
         ovE4RBcN8VNxvYJq9o51RZkv6CFMfSjjDYsa131SmoeZoy/eAqGDauAmt9qfKZpIQhHf
         zecIsCpR7IduBYw1ANTWwDjazfXnfhwrM5Iw/cCD090Pq383DMWc2nnTSyFACi4tLG3L
         aoRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f4zs3XOMXs0/iJZQNA3PBwMGZOB8lTiXCD+VFGlBeqkVARd5Cxjz0xD/gN4Fv+V2Fr/MXCCuxU752vaFGbKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54uTUIV3Bg6EXIkveuWU3N0BwQLyCA86J+5XzAog1n3URZQGq
	QjMMq8LMh+7BU1O6V/YX+6IvKMKXwaZQly6LiMjrHuIpPniS2UXeSDsrUe4Eoj3z4CD1a3LpNW0
	5jpyg63UPKoYJK00ELi+yEvAHZ3wA4LKuarlB4x/pSqF94Yt16AY+THhArYoL1fu4Ds9MOg==
X-Gm-Gg: Acq92OGjzl70u1LW+6giMgHxVC09eSE6hiXtW58RvxnDG2r/Inhcti36alYQNZ97GAB
	HcfcKYZuliYb/JpP8ZuZaq9bpEWG2JKuBS152ish52KE8vnUUiioUfEZq77ahEjQJTIK+YLBIBn
	UYGue01PQELdyHtfQqD23keHvKYLa8DwTT5CGX7pfFRI6/q3JKQp+HfggHxmrvVR7WwefnUyGe3
	j4JjN3mWExfuEWzUEejNCiwvp+FcHRXmfVJjS6CrUsptLPbvqZjg7ZiWHSW3xedBXg1v5OlxNHz
	xhOiNLYklYgFb+gpDcVvcvoeeUckVLNPj/XpdD5yhMRYeB31aBxnd7yN4DGZFeV05O+B0jU2igC
	/8nDdiGsyp0whKP/XfuSi91Qoq4J4hhLjM9wGpFPccnZnuKWwTgQmPUxwbADUD5gQsZnv2gU=
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970545e9.10.1779181644004;
        Tue, 19 May 2026 02:07:24 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr269970105e9.10.1779181643625;
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm40747270f8f.11.2026.05.19.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:07:23 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop obsolete file entry in PXA2xx/PXA3xx SUPPORT
Date: Tue, 19 May 2026 11:07:20 +0200
Message-ID: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 42f67e1d1cba ("ASoC: pxa: integrate sound/arm/pxa2xx into
sound/soc/pxa2xx") moves all files matching sound/arm/pxa* into
sound/soc/pxa/. Hence, the file entry in referring to sound/arm/pxa* does
not match any file in the repository anymore. As the PXA2xx/PXA3xx SUPPORT
section already contains a file entry referring to sound/soc/pxa/, the
moved files are already matched by the existing file entries.

Simply drop the obsolete file entry in PXA2xx/PXA3xx SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f986eb688ae4..e541617ac448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21774,7 +21774,6 @@ F:	drivers/pinctrl/pxa/
 F:	drivers/spi/spi-pxa2xx*
 F:	drivers/usb/gadget/udc/pxa2*
 F:	include/sound/pxa2xx-lib.h
-F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
 QAT DRIVER
-- 
2.54.0

