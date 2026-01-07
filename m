Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65432FBDFF
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Jan 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777670; cv=none; b=geBF7uYp0VQSfs0u7vFhe4IDgENBQBzZRRpcm22TXgMuuVSVqrpCsyPFaIIy4dprBvujjLv4Wb80qoAoETPZJ0QxHoc2TiyIpo3weVoCqGNaJPHhsD2KVvappT8r7FVMW1DWJxqtQVoIzWtDRsNmjM3qahj7GcSZmpm35QoYwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777670; c=relaxed/simple;
	bh=xEXgqx3dcUa1lKogMhPMSQMMTLOBA0IUou8y32c2rvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRTgEjtDKF7UJOraJTqsF6I4GYrJsekdaC9CrPZeqfmveIpTK6mOh0q6t8A2Z16e+R0W1vRTqZQacmG0EbhIkBBlepi2wi2FCAL9rQXag94U8s8PYo2S/ia/kOPVe2Cl/1812yD/CaFhj0yiMzkHS3hGYqMpkrmQfpgjEPO8q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=euVu7ckn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NT9ihlq1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euVu7ckn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NT9ihlq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767777667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Urp9ek3RCDTEdf2Hlje2SMO9RndJdD1iaFZVb1j4mwc=;
	b=euVu7ckn0mgVztSYQx7aSLlKnZ0YPkrOdm6UWgjvFZyR/XpTV8wa32Q0EF9mGYK7lqAhFO
	eVI5PkNZlT33nm3L3O8e6dj39KPZtrjkn9rlYsFV6jC0AAlRMxsy1JPmhoZAHjRoeOQVex
	h1y8EGJMnTnYAyA1G5HkRY8LBp+ve/Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-veTYrUVvPjmW-pw1naSM-w-1; Wed, 07 Jan 2026 04:21:06 -0500
X-MC-Unique: veTYrUVvPjmW-pw1naSM-w-1
X-Mimecast-MFC-AGG-ID: veTYrUVvPjmW-pw1naSM-w_1767777665
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d3c4468d8so10237445e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jan 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767777665; x=1768382465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Urp9ek3RCDTEdf2Hlje2SMO9RndJdD1iaFZVb1j4mwc=;
        b=NT9ihlq1+mUKkZJSMB0++oFILX5+YJ7YvZ7PntC+8pSoq1mlIAfYPMMYJIc8TACuoB
         +U8TgK0ks8ugb5HhH05UmxaVOJgvyyus9XuM+DS2Q7aF2oWwA9QDi5CvNWBOGYFwuxrS
         LTdkc0hpoq8uK1m4leDdZbn43WAoDr92LZT4ZPsu0h1Lt9a7v3D27YXY7KTX0QozwN6s
         MWK9z4/4YfXt2UHcFt4Y5GquDEtZ6f7bQcCKjXrEE5EWSgmX+BWMqkQk/hIAAjATDp/y
         UPE6ITEMjgs6sopPNupIg/HnHD5XhJJvQteHUWqt9t/WUnyl6mPnpQFjVrVp2j5fsgzg
         7Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777665; x=1768382465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urp9ek3RCDTEdf2Hlje2SMO9RndJdD1iaFZVb1j4mwc=;
        b=wuC0+gocZqXguswBEiqzVnu58zjm+4SZq0wDMwfMQcXFErIs9T+NHXyFxxXi2WYCzt
         udfJCV8Ulhf0/u6MZpsN/wFbpFnFcgdO5iZnbFITWSX9KyGg21an+U/A+QhKgSIvEErk
         +DvAZm7nws3/LRwevOayHRpIScdAJ7VE84aDKI9PdNXkicsdgMyeUTL1DXPVzpCFCAjk
         lruXC0V8ARpUXzvyb2+ZDQB6tFLLu0D5NCq1G1C/ITu2bCkE/LTeqfeMykkCOp03BoYl
         6pE2Ws8MKfp2KbEdEvWdeMw+TLtuSrSTMFvNgqQXnLhQKOswm/u6nLlZTBmG4S0oZAWk
         t1HA==
X-Gm-Message-State: AOJu0YwvnsSJsN/CISFpIspB7AP9UXIU+WInWgQnYAKE9igGVbJfRJpf
	QjwMOeJI2GgUlKUirzKGu5ndXdyan2M8I4R5YYxsMuW+dOv222LZekg1xkaaIn2PZXqa8mU9mBM
	KNso9hgwY57rhrSIChk+F2HFIFk2nM+ZohTHCqx7u5pw9BbZ/6pUgvi7dFrlCPviAOlgvCFobj5
	XRFg==
X-Gm-Gg: AY/fxX5I6qkhDpQ3hK0mD6c9D3UgApX7zYz39cOtpof3dOzSq6JlH9il/xO7yNLLDbj
	xyW3eu1NxXMLv8vWftosqTIOx1yo9NExbeYJ6mlEDWqoU98fhobNkvSOq/5m2wU/qQCuFjg+Tty
	rdUch0HWaUl/qNtMqzcSJClVEdir6ZFgSJG5SIJqp+OMntr3wOpEt9QbFyPe033IXkNdAD8TXAR
	ZyX/LaXif3wouHVojDLpTnczeCoi1XOeLO0Eeaqa4HvfzGwA6JVgt9G+x4eeaZgd75DeaorgGiE
	TAWgkKkrW3zCwJwsk2pd+4VvaWNCmZS2ilJ3bboEG6/6nMrmX3lcGk5bAGGdb0jV4pagaPYMPZ+
	FVXo/MWOHkSi7BCxPgkbxGkpJpa2rDt3yAgw4w2AUdhL14lCD1goX97Ubp0o=
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d84b3b3d7mr18299095e9.25.1767777664983;
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIduPPwDQFsu66VMJZrtw+FNO75/ACDwxg1ZBu88BJXbQ6099VTPtu5Sx1R2fTSkLUtjYGWg==
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d84b3b3d7mr18298765e9.25.1767777664647;
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662c09bsm9377715e9.2.2026.01.07.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] m68k: defconfig: Clean up references to non-existing configs
Date: Wed,  7 Jan 2026 10:21:01 +0100
Message-ID: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

  - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
    ("i2c: Remove I2C_COMPAT config symbol and related code"))
  - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
    ("sched/debug: Remove CONFIG_SCHED_DEBUG"))

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/m68k/configs/amcore_defconfig   | 2 --
 arch/m68k/configs/m5475evb_defconfig | 1 -
 arch/m68k/configs/stmark2_defconfig  | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
index 88832e9cd7cb..f310b5dacfd8 100644
--- a/arch/m68k/configs/amcore_defconfig
+++ b/arch/m68k/configs/amcore_defconfig
@@ -61,7 +61,6 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
 CONFIG_SERIAL_MCF_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_IMX=y
@@ -83,7 +82,6 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
index 2473dc30228e..9be4dae84ebf 100644
--- a/arch/m68k/configs/m5475evb_defconfig
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -46,6 +46,5 @@ CONFIG_EXT2_FS=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index f9ecb1dcc060..515d9b208b10 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -90,4 +90,3 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_SLUB_DEBUG_ON=y
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
-- 
2.52.0

