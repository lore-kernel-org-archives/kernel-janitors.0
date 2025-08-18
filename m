Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958630F814
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755511192; cv=none; b=VDry3YdJxuUDIB5DkjnXgvoeZ3SqT6lyWTGlqLodxYLDX2SCHctsFv/6X8udo62v/FYdLTvaO3cSX1wLJkGkihNcefzcJWiLMLyq2R4o2nmZqMahA5bS/xLD37+9JqzQEYoAYXyQFyoCLH+cnCXE074Rgq5GjGa2QNwHtdmfkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755511192; c=relaxed/simple;
	bh=uXo2HfKIzXZcEAqe1+Cgkmi5au4JHjAcMP56tR1hXWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4oq+cLQAkijDevVvY/YVkXkFLz2DbltHjjlHdFuUrLIWNBhCDJIpZkrdi6btquhwwEw3HNibQwYPSUd6JD0bxQ80Ra0JUwLqJ+TzubaOkVMpXHUNCXwuBsyOYzKImGBezy+coD1OcGn4DZePtvy6BL8AyVJgAk7g3naWtUVpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysd5xhYD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysd5xhYD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso29478945e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755511189; x=1756115989; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAzYeYzFTOC96kJwyQ7IcW6iscdjbjDH2bcXfWJ1JYU=;
        b=ysd5xhYDGXECGnAT/n2KyxCW/wbIFMGMBZy94OODzaLfyZxJmFXkzETADId29xJTa3
         8TDcOFD6hTtRX6xc8l2liTlwmU+YCBh6Y9bcUq1BjRwJiW9HixocDe+C6p3xyDPYCM4i
         g+R7QoiUaICNqfCPAUgnbkqV8R8UWWmdnRSnI/mhwflRIFFLZjfYPWVzJuuYABadpsC6
         Re2ARFBEkoqRL3b9cwKUv0Bfm0kojG30PtEciz49yHJdzgKpvb7nEt4XFKHJl7abo44w
         7olO/9qNdg+YINzyN8S5yTCDlk3WsXkmvcsmKkWoXKWivH3+CF2AiSqKINbk49jPqqsI
         lLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755511189; x=1756115989;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAzYeYzFTOC96kJwyQ7IcW6iscdjbjDH2bcXfWJ1JYU=;
        b=Zlj3Agrv6LmpJDF56jqwpGxYMZzBrD5yYJRGxSYi/nnjMzmNhcXLyV1J9lJZWqsHTN
         yb8ZffDXhFDWsyCgKBoAJnXVPrko2vVZSwzGGaUUEu7QgCnMMbvTya4dBxUH9NBm9QmV
         5Q3BhPPt2dNHTXjzJsB6IVpWSP0Cpj+N97mys6woiGpDM7BqJRKQJbphryDMrQfm2bQD
         g6UApPBodKOdwgfrX57PKPbyIoCNXWyzk19+hKmkJ4a7diNuKunt7M/yk6r4mlWIojv9
         hbGE8mMvrP+p3Bz7lXUc+DbbAvM/VQup/kiUO9zEutIrHcEMMcHYnvilPyYjksiX1fJ7
         eS9g==
X-Forwarded-Encrypted: i=1; AJvYcCVApqIqHajNMX6QYGey/kcheUYyGA9XvTjvblvBrhmBX/MVToD+f0CdYVYQWHWmMY5FPLYteqEOqD9syQYlc7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3RUPBiX8KI/dMwZMBorhDYG3rCDr7ENsFHT9Jb4lbfHa0x5P
	Z4r8+d6DdpGQnA++mIm8O/ENhvhvsPufACmq/M4zb+/MFzLLkli9r0ijZd6HgovLzyM=
X-Gm-Gg: ASbGncurlsJG6GWOsAg24RxoKvuVLHn5FHulfKOk72qRJebXQTkqmd+TFlqz6QC/HqM
	JiRt06MkS8oI1woGEQsMZCDEZUUKJmDMQXq05LOYAl67pxPpJknFU5LjAYMEsC3sRqPdGH8JXQA
	HSQaq/IHBfbJKR8j2JaHn4t1QGabiOYpgEwsXJiYOJDb0rI3cGOwL1SVxI0+QCtRlW1S1J5vJyx
	3x+9aQjepKA0D4Y7L1/RovZmtwXHgZg2WccfYP3EEtlFaaIaxB+mQiT14nKvt5yeqK56DTqUuom
	YGDXzpdLgBL/mehFCAMukrkcQjl6sA4Vtxx4ieQVGONWTn2cq2RTu4+HmVH11yKU9hRXzxZPn1q
	yD6bF/06zDGreZ6z2BI1bVCswwCJn0L45JuHamdBCCmE=
X-Google-Smtp-Source: AGHT+IESeM6A+8YV4kbdeq3Rgqzb28xUjkrQolArR+kWnKAsQ9pql4kCFEogW9+cFxcDvalPpojZnQ==
X-Received: by 2002:a05:600c:444b:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45a2748c3a4mr49153035e9.7.1755511189272;
        Mon, 18 Aug 2025 02:59:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c78b410sm172408255e9.24.2025.08.18.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:59:49 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:59:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Karol Kosik <k.kosik@outlook.com>,
	Youngjun Lee <yjjuny.lee@samsung.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix size validation in convert_chmap_v3()
Message-ID: <aKL5kftC1qGt6lpv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "p" pointer is void so sizeof(*p) is 1.  The intent was to check
sizeof(*cs_desc), which is 3, instead.

Fixes: ecfd41166b72 ("ALSA: usb-audio: Validate UAC3 cluster segment descriptors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index acf3dc2d79e0..5c235a5ba7e1 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -349,7 +349,7 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 		u16 cs_len;
 		u8 cs_type;
 
-		if (len < sizeof(*p))
+		if (len < sizeof(*cs_desc))
 			break;
 		cs_len = le16_to_cpu(cs_desc->wLength);
 		if (len < cs_len)
-- 
2.47.2

