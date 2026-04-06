Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53BC31987D
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Apr 2026 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466595; cv=none; b=P31SL5dig9Mskvwsd4zDsERAjBOTKfjEHb745iLBYcKweiyRmwPM7Epean3DkC09hUA/j1eVPmFn8vvJ92kzYZ5uE8nhFu7wWqdZ0GKWInJyTqM6xwAh8ipmN1toavYOd2VSldCWcIzOBI1JFaPtKKdyImnDRak3O4SR3OLXRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466595; c=relaxed/simple;
	bh=dHkShzaaB1FzwSSJnCTbci/A1jSN+Xil0HDTvzSXpKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMtK+3UUtsyFYmUPqVewCwGkprENUo/Ar1+uec5DHzUQrTwIatUl60mTyFlkRYFIuA1g+ST4Ah7VxZJGe2ioyzM6OGWxQwLKstCArHyRSRRiQs/SOMwzs6NJ2JDxvSPl85Auzktx6Sf/BnSrQ7bqhFGVD2+KxtgajRKxf/sfl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVMcxcwM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVMcxcwM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48896199cbaso31002775e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Apr 2026 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466592; x=1776071392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXHc8wsb4o8lZNG+myCrfyCC4E7lywwXo4HWR9KJ3SE=;
        b=pVMcxcwMBMiAzARSBYrWqs0H2xcjCl1BO2gTLJSbaDbRcPTFP+N9cJ3xb3MgeJTF6C
         JEpe4UdcW+/iXTgrES9tYl5JpVBe9v6bmINdW6O7QRv+ioUolYCyha8e8VUToW/MXCyg
         +fw29Lc2uOBx/MhvFlX3ec4uecJknieOpACzU37j6o2Zx41oUffTHRrkwQvuKPCR7Pwo
         C7yV8uzg69QheA3lsBQBrwfMtJId4DNP5rjH0EqPYfz+JUAsybOKnUA8b12kjeM26yyH
         f2a2QCH6O8ClGjHfwA2N+0c//DqYswoq8UpX7jv3V7rBD8B3O6cy8OXgdQiRVz0PNHXv
         6pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466592; x=1776071392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXHc8wsb4o8lZNG+myCrfyCC4E7lywwXo4HWR9KJ3SE=;
        b=p3dfBHq/DWnMFI9oRTNQI8FomP8PieuvJ2lyO2pA7YrqVBTdK/IG+52g/FFdu/K0Yn
         IHeYQiliagFJB35ERh5srN+BT2c+OKlHXRw/b8+1WhSIl2TqY3JNSLrqCQ5dKOJ92WF9
         lJGI6pwW/XwrYfK9o/FuAO2R3/OvqpYVCUjHLYsnaP3+GTSCkhEONPiwhCzWJH006lDs
         b7uG43j87p0TF7n+Yof9CTnOIZtpA+zxA9SJ0o6My2FGigJlY3cMcPszTTzHUMY0/V1a
         ptit/4NJPobNjmV91p98oUhbLOaqFBmCnnenbsUi4Ks7cfNo3molYGXblz7WasKe4Rx+
         NUdw==
X-Forwarded-Encrypted: i=1; AJvYcCVOlx3QXip3sgrdz8NZYN95a0z0yETedV/f4R/6NzzNDmIKIsPXygescMFPoRqygsSPom+swGkIOKC+sW2Z2V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPF0U5GGnjvBgy9E3zEpbQZ1uDniSPlaaYOExyvJs32Pexdr5S
	VnwwWMBbIv2q7VJJacgrR7c9KDrLz9rBmaB2w0BAUaWPwenLP56Tc7hw
X-Gm-Gg: AeBDietP5I9URvnu++/2WxAksGdq1BoRhgeoHwh3iNJ+awoHPxb28brFsdXrwboQNU+
	UxPlPRZHrxR8kgwQvzhocwgqbjtk8gC1dm5jgD5ZZa9Bb+6YNGAiGzwe6eVmR+7+F0qZX+DNunt
	WfWcrkDTfrc/aBA2jL1Xbmmqfyy1aMZKkSh0SMXkyjvgw9xo0DIo7EbI/zFmr9Y7gI49VZT0xVg
	avfjxc+ms6x0YfQX2f8qffNNGwaNDHYdYkIQY0EXd30ztflbjJoqneySk9yzhMdClIOzD/CeQZL
	+qDc/Tz2ZHPvA/MGzvr9vsUYzRgOfFvB0FtcU2g7/d8YkeJ7Z3b9RQoXB+O8XeTWnx7n70kxQzc
	7BPpai/sGp1koBo/xI3zSTyBu3RAEHLi18uh26Lqb90vcMMvTOubn4mp6LQLF8xxjc97/owTiIB
	JBwWvD/eLPKVrdhD5XD88=
X-Received: by 2002:a05:600c:8b84:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-488997b2345mr174598415e9.15.1775466591913;
        Mon, 06 Apr 2026 02:09:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4888a7165aasm427753755e9.14.2026.04.06.02.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:09:51 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	initramfs@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH] vfs: init/main.c: change comment: opening /dev/console may fail
Date: Mon,  6 Apr 2026 09:08:15 +0000
Message-ID: <20260406090815.1495095-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is for VFS.

Today comment on console_on_rootfs says that opening /dev/console never
fails. This is false. The opening may fail if /dev/console is not
present in internal initramfs. So let's update the comment.

I tried to fix the problem itself in [1], but the patchset was rejected,
so I will fix the comment instead. :)

Link: https://lore.kernel.org/all/20260219210312.3468980-1-safinaskar@gmail.com/ # [1]
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 1cb395dd9..40cfda9aa 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1645,7 +1645,10 @@ static int __ref kernel_init(void *unused)
 	      "See Linux Documentation/admin-guide/init.rst for guidance.");
 }
 
-/* Open /dev/console, for stdin/stdout/stderr, this should never fail */
+/*
+ * Open /dev/console, for stdin/stdout/stderr, this may fail if you supplied
+ * your own internal initramfs without /dev/console
+ */
 void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);

base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2 (mainline)
-- 
2.47.3

