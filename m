Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F11FECAC
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Dec 2024 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733144283; cv=none; b=alkgO98+Y2tjt3jeF0aA7eoplPJMHZlozowL+u+IHRX/ZMIKNdY9GWbp9ggpD4sAkPQ5UNX8gNyBXY4aOfHWdOd7m86BijcG5iqJcl2YgMn5x8XyOpOI5/iRMF8Q6NJ4kJ1qu9v374oS+n7wjc9m2kch8SYXoa8uw+Mt0sUSSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733144283; c=relaxed/simple;
	bh=GEQTVkp0q7S6wbPvLRUNqVr9Oj8O3XKdaZNNO+BsE7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJLSaePq/ZjyTqxm+YwBIV2XLVWEYVyvyLbWVfquVhMG0+1c3iSNpmwYW7txQwRj2z+12docBhjIutmNmQTS7Hlkgkg9X6pDqFKbz44N7TiS7ZrqLEKJZnzE5fd7RKJybEhu1HkLJ2geTUYuOwwviuYIAlAeJ2FiRDsbtrLGdPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6ZL0xRI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6ZL0xRI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e06af753so1535673f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Dec 2024 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733144279; x=1733749079; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZEzOmy1c1zMqWMX7Wa3GA2/fvlPtEiXHjsYcmo7LSw=;
        b=q6ZL0xRIu3aL2KyRhkSIo0cPAs4T9/ZGXOMmadRsXoW/3S7lcYEvw/fuy1oFiaB0LL
         hSQzAWjNInzf05PZhRkA1fbEIRXaElY8iwURlelf8iXWY/Y07XyLCXYC85Fc7E3CI5c5
         ExU8vekbT/oOX1lrQ3qc/HR9r2/xjylOosUSxT04SXayGoaxvhpUHjh+kH3ECXUa7ab8
         wzzuhow3DD20QVu2d3zdWs286p18yDP2rOXUxNbLowuyFY5CM0/alk9Ldi8FQ5s2xWUh
         sTLXO5oNFz8mzOElU+YxMI1LE5rVak1aRAw/C0l8wI251ZqVJMkNLXUi47iq+n1/Fhrf
         T3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733144279; x=1733749079;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZEzOmy1c1zMqWMX7Wa3GA2/fvlPtEiXHjsYcmo7LSw=;
        b=SuiuytrMutuj3+m9Pn7vh41slzS+s+Nnk2IvWtfcKCuV4Fh1Jg9uz8/mdV4mP+2ZAd
         K0S6UdPECqHA4TENDpZPKMNHZ7aVYxUxLJeqiUocXsl3SGNw0DMtTwrohvxTqYx1PbjT
         AxfvLMTLx92OPH+XLIU+34+8KgsGSIu4ID9xHMrOZVJgYDjc3xqvZkHs2lQG4W6NigQH
         cycXacPtEuVsjo5YGsaqNimlry0qQaysFhlwUzmjAb2ICB9rtSsQh+zbMOhTokKuIJQm
         eFu7T6GgNimD9lPtU/AnsqTDUJkvE7zq6CPVXm3z1MXZmNkbTmvHoXg9g+UpNKJvMZ5F
         +7hg==
X-Forwarded-Encrypted: i=1; AJvYcCUjShLITihZMkugNXY7hoUJ7YmRohcaMrjPc/EK86h2shVZHJuZgtPXDNlz2SGb3E7yTrZ82EbtVN0MHUqDMOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7K53xTpGZgiPaID41uy1htWD7UXTHuxMFQf4SBRm13HWX0w7R
	Dkv1NOOcDVPRSRPZqATL9BnWqU0iB023kHdR5U4gQB8dgu20eT6f6fDxGXMRXjw=
X-Gm-Gg: ASbGncs5n/4QCQlPz6Ons8RXKrdoOvcLmBo2kH7BLbL49A0FmvJNadxWtV91yEjSn/T
	dGxmJ2oBG2Rg9IJM14MTIeRdlpRcJ66cy9cWHv0GdRlu1vwX+x++5hQB0SBqXzNur+aecqWrQhq
	IGpaHtn4uisTf//fUI9zjSBXMM97OZMv6rYjEfziilZBQK3obdBZrgrw95W2RoZ0OqS8bmeFvUO
	6+cnGLL46/lQPMeIK6nKvKm6yp79uU4wFYqWZNRgslo3qvQ5/0KJ8g=
X-Google-Smtp-Source: AGHT+IE6fYWnBhMoQgAuqEUuYRVJcRW1Ua9iOjCZrmiZOy42mMa37ZKinsmWcYvq0V848TnBhQipiA==
X-Received: by 2002:a05:6000:2b12:b0:385:df43:223c with SMTP id ffacd0b85a97d-385df432391mr8837794f8f.13.1733144278635;
        Mon, 02 Dec 2024 04:57:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f18bsm187503585e9.4.2024.12.02.04.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:57:58 -0800 (PST)
Date: Mon, 2 Dec 2024 15:57:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Beno=EEt?= Sevens <bsevens@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Manuel Barrio Linares <mbarriolinares@gmail.com>,
	Lianqin Hu <hulianqin@vivo.com>,
	Shen Lichuan <shenlichuan@vivo.com>, Cyan Nyan <cyan.vtb@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix a DMA to stack memory bug
Message-ID: <60e3aa09-039d-46d2-934c-6f123026c2eb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The usb_get_descriptor() function does DMA so we're not allowed
to use a stack buffer for that.  Doing DMA to the stack is not portable
all architectures.  Move the "new_device_descriptor" from being stored
on the stack and allocate it with kmalloc() instead.

Fixes: b909df18ce2a ("ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices")
Cc: stable@kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/quirks.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8bc959b60be3..7c9d352864da 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -555,7 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor new_device_descriptor;
+	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 
 	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
@@ -566,15 +566,19 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
 				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
+
+		new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+		if (!new_device_descriptor)
+			return -ENOMEM;
 		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-				&new_device_descriptor, sizeof(new_device_descriptor));
+				new_device_descriptor, sizeof(*new_device_descriptor));
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
-		if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
+		if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
 			dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
-				new_device_descriptor.bNumConfigurations);
+				new_device_descriptor->bNumConfigurations);
 		else
-			memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
+			memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
 		err = usb_reset_configuration(dev);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
@@ -906,7 +910,7 @@ static void mbox2_setup_48_24_magic(struct usb_device *dev)
 static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor new_device_descriptor;
+	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 	u8 bootresponse[0x12];
 	int fwsize;
@@ -941,15 +945,19 @@ static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "device initialised!\n");
 
+	new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+	if (!new_device_descriptor)
+		return -ENOMEM;
+
 	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-		&new_device_descriptor, sizeof(new_device_descriptor));
+		new_device_descriptor, sizeof(*new_device_descriptor));
 	if (err < 0)
 		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
-	if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
+	if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
 		dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
-			new_device_descriptor.bNumConfigurations);
+			new_device_descriptor->bNumConfigurations);
 	else
-		memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
+		memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
 
 	err = usb_reset_configuration(dev);
 	if (err < 0)
@@ -1259,7 +1267,7 @@ static void mbox3_setup_defaults(struct usb_device *dev)
 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 {
 	struct usb_host_config *config = dev->actconfig;
-	struct usb_device_descriptor new_device_descriptor;
+	struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
 	int err;
 	int descriptor_size;
 
@@ -1272,15 +1280,19 @@ static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
 
+	new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
+	if (!new_device_descriptor)
+		return -ENOMEM;
+
 	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
-		&new_device_descriptor, sizeof(new_device_descriptor));
+		new_device_descriptor, sizeof(*new_device_descriptor));
 	if (err < 0)
 		dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
-	if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
+	if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
 		dev_dbg(&dev->dev, "MBOX3: error too large bNumConfigurations: %d\n",
-			new_device_descriptor.bNumConfigurations);
+			new_device_descriptor->bNumConfigurations);
 	else
-		memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
+		memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
 
 	err = usb_reset_configuration(dev);
 	if (err < 0)
-- 
2.45.2

