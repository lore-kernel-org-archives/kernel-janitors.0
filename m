Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2801E34F47D
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299462; cv=none; b=NXVqZ0Os+8QImtfQkJr8uwHC1v3Zpc3M1epHslrklN7qIKjDz82hk5wdh2N3XvkaObUbxCiYafvEc0Yz60ipKureZ6q2rlLqZPxDeBWciyl9V98ZAyKcxqe/oQ+eRGnFeT84zlEl8VA8dXX2LzyApZk/Q7P0kCv6ye5+62i4PSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299462; c=relaxed/simple;
	bh=IVQvp15wfNkLgDcY12BQoE0NmPQxYuWThoUBl1tUWxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcC+PT/eQEz0jN/WcB/3ROIipjtZ2sLI4yNiuf8M0tfaZNC2x4MF0hCAe8U1HNsCmahY6T6lniuRfa780D/8UJN151uFvhW7CfFucSIWqxMCXr5B2uHMrqwHMJi3TkKRS9KpCLmT+LGdzePcJlD/MynvAVFO+J5lGTmr+OyiWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROQyeSXt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROQyeSXt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b004954so54013075e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299455; x=1756904255; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qt3k+9WJ1vxtDbvUOLITs++A80wdPJ5qfZ84mPyZtBY=;
        b=ROQyeSXtvrK2+APnbNXPM9OoO40s261Y6zCB6D/C1eUzr65UiWGuXZigWKEIRkTvMu
         GRgHf/XjogakwKg8yibhQ93RK39QlTPPbUBzYX5+AhDwZuIhOimp/uMX/WutvlWjwuBx
         YnGLl2VgIarMF3cLK14XBa1SYAHceY9z2uUSGpns4AlIBrBDRYtS3ywl9Ls/GwK59aQi
         ujLD7mArJRFf2k33dQ1d2dYKo9EblTQ7EpUJAJq/pYA4LTp4Y+Mmds9nfQRbNMKX0KCU
         D2Co7zLlRVAC5ZFQ6wXkG5LyF6Ml09FtyZM/KdjzeRV+RHLamKz2am4AUu4Nxe1m25Pi
         G1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299455; x=1756904255;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qt3k+9WJ1vxtDbvUOLITs++A80wdPJ5qfZ84mPyZtBY=;
        b=dIZ6QLUGV0XKzcw4r8woM4SWce6wx1Hf483PhtYaHu/6bzvji9OpkaN8UqCIW9B9Ex
         avXOgBzgfos3rPNpJB8mSIa4f01hOtvNuW2W8eoCg+WZm4tNjlYoxjHj5JfQZ1s0n5no
         tw5b93K9c5mtGt0dSYcYS0egxVG9Ca3COHGo1zr2SR9aFr2rTEIMnwI+/yNWOZV2f2hX
         0lgNl9s0OVwI4LxNB5m8YbbwLwejIlP1P467zsfo1wzN9qVJgr5oM6NrrY590mgXidLV
         wgHL2RGEb//ue6pYvFh5wIYPeDg1D0TwsIh+OX0mq0xo5r+QxmjMevlVIDoz2juk5p2L
         z9wg==
X-Forwarded-Encrypted: i=1; AJvYcCWDpSb+S+e58U24OxRBv79LIvvWf6k4n32EK2ISGm+F0e8sXT5tEdbX8I8bawKEbg7I3JUYp8/uMLNyDrD8a/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WVs3JCYSB9cMZ8j0p+ukdq59J18pt15YYoLERboakC3sQO22
	b1cI3vrW9yodLGUTZ6hMhXFSEaHzx8dY+ESlkfKYsYeeAQIZBXDIudGiTi1YhiHZyfM=
X-Gm-Gg: ASbGncvGIoV6rbY/pbwj0sey1G/OPe7aySMo1VXkwmnXUqQeC7aue5wa3EqBGJOgaEV
	a2m543FpWCVWxpVxgA7K60Tl4S/ywKcqwfHWwo7csVddC+MjBVtGJGkGBH4U/aOjBU+KyYQHc1J
	V9E02QSXi0L284FWeWZ8sMuXjaElA92WpCdod706Zc5lEIQUDRniF+R0NfCmPQfhLZeTDgrnmtM
	QZZ8sd9MUmM/7xOgYtXA89RsU0cgk7YigRLj8gMcbOEFCpdd4vfDusKnWrD4ucJFnhX05HHAF+7
	L60ByD6uL6ZjxU7ZPjEnVFWYQO+1ILzcegE5nqqt+uh1lIUEkAz65Gib9D7loy/DJ521ZtswwaC
	x/YulzeC/tGZ8tU4df7P2MvKdBJ8=
X-Google-Smtp-Source: AGHT+IHjUEVNRaMcvygKv+iGwtxqWwlTGN/e2l08ILhSI6zslwistJVIxeihubmkK8ZmS/PqRK6l8w==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr163145305e9.26.1756299455350;
        Wed, 27 Aug 2025 05:57:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711211e87sm20190252f8f.44.2025.08.27.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:57:34 -0700 (PDT)
Date: Wed, 27 Aug 2025 15:57:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	=?utf-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: i2c-hid: Fix test in
 i2c_hid_core_register_panel_follower()
Message-ID: <aK8Au3CgZSTvfEJ6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Bitwise AND was intended instead of OR.  With the current code the
condition is always true.

Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on after panel is enabled")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 99ce6386176c..30ebde1273be 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1189,7 +1189,7 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	struct device *dev = &ihid->client->dev;
 	int ret;
 
-	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+	if (ihid->hid->initial_quirks & HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
 		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_enable_funcs;
 	else
 		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_prepare_funcs;
-- 
2.47.2

