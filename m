Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EE35C182
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Feb 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279100; cv=none; b=kgNif8KjISOue730/AloeXDZC7SnwOZvJXEX0AJzAhPaWERxMo56HmRTBkjSvnxz4rTotGteMNQVnVRafagCQ0zS4t7uwMsSIP6a/GxOI+KkBvnS7tbC21y67R8Is+IhXGxUr8P2SGcB5eWJUE0Fh7vtVwtVpEQWKuHy8bUcp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279100; c=relaxed/simple;
	bh=6/KGEC6Gt90c6jArV8FtgQJZA1bpUaGmU4DaNQWBmdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/EkHHpZxBbPpH40Bog7W+Za97vIyYyuuFPvtA+x9K4GC3ascNED5ZjMVpcy7oOBN6YmIG/gBSiSlEpj/B7nfzzsqkMyMemCq/gFZtNlbIJbJxgi4eVm6qmqtr3oHFOgvNmKuq7kSSGQJGFHW//bDU2uyO9XQVtugIvxyvyLr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HueV4lcS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNZcv7pJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HueV4lcS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNZcv7pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770279099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yHsh3p4Z4g5WT30y3E/M2Shpq+ytnOY1Lj/yheiirwI=;
	b=HueV4lcS1xEXbIMYnkaJZtVzfedlTrdxPRyi6ehWepY5R65LGH/+VtANPQA2WrwkHRsBrr
	//5g+opiTQWgPuVBew3MEs0iXxkxbcFBybkXN3onyf2B4hNPSAe2yy/JEz1c6O0oxvqk/3
	kApMOZvRorMnwns/Dvf4oGDIs5loZ7M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-EKbBtxEfMemQEHJDEibnyg-1; Thu, 05 Feb 2026 03:11:38 -0500
X-MC-Unique: EKbBtxEfMemQEHJDEibnyg-1
X-Mimecast-MFC-AGG-ID: EKbBtxEfMemQEHJDEibnyg_1770279097
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4362456500eso238310f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Feb 2026 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770279097; x=1770883897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHsh3p4Z4g5WT30y3E/M2Shpq+ytnOY1Lj/yheiirwI=;
        b=MNZcv7pJgVJ0wvwlYTD1h+agT0aiWsUmtnE8K8Nxq93W58Xn/4TWlQG3tWFgfvZc1n
         sHgT249R/vQhEkeU+TI10eBB6NL1eudG6HbigROpqEhZrYU/Zj8aDqfZbPNS9dxuiTz5
         bKVJ3NiHSorfyoxCphWVGDGIco7sr9ZzLrlb5/jyTNmaZINL31aGd8JKkHb2vO4sxfhC
         aDnFSwqYnbgZ9FmKQG+A1XaaiF74EHX4Tk0I9+KKng9hK7jwmzwuLgQc4LUaHOB40erP
         2ECjSH+cExDB3lW9IgofbQtG6tIOPiseQ/72VtYAbv9lxYElK6IOJbcL0dcSn73oLxwy
         M1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279097; x=1770883897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHsh3p4Z4g5WT30y3E/M2Shpq+ytnOY1Lj/yheiirwI=;
        b=EACW89/FvAHcBp+heudJX32K9fBeNf8I4h+5rxuAcVJP16PvnqwtaKghLp7H9A7Cmq
         nBImiNf3rieCSSS2X9iB7u6QdvB33D8OOGs7y/ODx7RWqB5+2LvysKVyUj1hkena+uA1
         lfss8V3c+5ZpIrNzZd5QdLwW+yUuepHTe5CrWILyS8M8zdxtKTiGH6s8tM8xdsl3f92Y
         ZymLWxmtuVejy6QoCO0uesxnUIxxo/c8UtdMFeEtkDjQ3vavca6IAsGjh0slFNEctIjp
         VJw4P7sSdPP/dMtx8MlydUonXL2Z6zofnPrllprWNGZZSCxEwb0jfAJNiMWzcSFqXrxS
         CIyA==
X-Gm-Message-State: AOJu0YwLmynSoablRloi0TNqD4n9rMv+jNrwhLEMaKsn9wROcWqnQrdT
	Pog4e7e0MnRFLcOruTbr2zqwkOnYToPRoAxK+FFx70v14cWWwHhO63U83sYqYC8EQuzZ2j7/Wdv
	/ztPT6cjD3AJNDCjZGN8085V9bHIn6PTgM7W3d3RIew5tnwTt8LE31t+aEFWitRMKv84pPNnZLS
	v4Fg==
X-Gm-Gg: AZuq6aJqoV1+VPxx79rfPdyr7rMlkp4bAf7xS0kZjCNPJs+0B2hesVDJwnaNwsjkShV
	6r/rTjWIu76s7pcqhQ8O6QkEIWlAT32x5yr8giHe8X/l5S7anDVJgpueR8B1sdy5OdNvmCjL0Gh
	cUhzXhyoLvJZL1ueLUTYCji/7awYwpRMVM4HqvCmmn/ZvdrwgRVoCawTopbYbJD2m5bgo+t8hfr
	/q2EVnJvyGT1Qkp/vImCGCfE9SbVvpx4e65AvbShN3F+4DQlIM0LKlQlubWl72w3RTXfjiBmBXA
	eX/kzfUhlXK/o6WlBArWemCdX7EvyQu5AmT8I4+Z2/sMDd+yi7gZ6sq1lx1Tb7JE/LnsgTu/t1G
	ufIhA4ZSrEeNmnxjxq8Way3a2wfymHZ3OIMGv078yuzFyVJi8h/xT9vEf5/Y=
X-Received: by 2002:a05:6000:26cc:b0:430:f68f:ee97 with SMTP id ffacd0b85a97d-43618054e2amr8632135f8f.40.1770279096717;
        Thu, 05 Feb 2026 00:11:36 -0800 (PST)
X-Received: by 2002:a05:6000:26cc:b0:430:f68f:ee97 with SMTP id ffacd0b85a97d-43618054e2amr8632106f8f.40.1770279096299;
        Thu, 05 Feb 2026 00:11:36 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:a774:9360:8ecf:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fbc5sm11402116f8f.34.2026.02.05.00.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:11:35 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactco.de>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] HID: quirks: really enable the intended work around for appledisplay
Date: Thu,  5 Feb 2026 09:11:31 +0100
Message-ID: <20260205081131.426899-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c7fabe4ad921 ("HID: quirks: work around VID/PID conflict for
appledisplay") intends to add a quirk for kernels built with Apple Cinema
Display support, but it refers to the non-existing config option
CONFIG_APPLEDISPLAY, whereas the config option for Apple Cinema Display
support is named CONFIG_USB_APPLEDISPLAY.

Refer to the intended config option CONFIG_USB_APPLEDISPLAY in the ifdef
directive.

Fixes: c7fabe4ad921 ("HID: quirks: work around VID/PID conflict for appledisplay")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---

Note this fix suggests that the patch of commit c7fabe4ad921 in this form
was never effectively tested, checking the effect that the commit message
claims it would have.

 drivers/hid/hid-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3217e436c052..b91e081ef69c 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -233,7 +233,7 @@ static const struct hid_device_id hid_quirks[] = {
  * used as a driver. See hid_scan_report().
  */
 static const struct hid_device_id hid_have_special_driver[] = {
-#if IS_ENABLED(CONFIG_APPLEDISPLAY)
+#if IS_ENABLED(CONFIG_USB_APPLEDISPLAY)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9218) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9219) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x921c) },
-- 
2.52.0

