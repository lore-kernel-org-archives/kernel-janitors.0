Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046002D838C
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139645; cv=none; b=cUsDLg6h80Z4KHfnTYTUin1UWND1GLOXOqFAuDaVnTpsn8GgttJsT3OvZckQcqsWeC6jzoX9OAcpQgyd+OghoNPtufm8kQLlS6ihPKiXDwH2HfLEMUSEpG35Fr+irbjJJXaBQ2/QC0082Cn5xDI2Znh2OzOo4G3nj5U//0yKQGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139645; c=relaxed/simple;
	bh=EtA1UvQXNDSrbu36LBg2FInciYHKXGPfHiCSB7Mq5pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jSZAdGKjOUrjmKrlkJdGBuLPf450RexJ4z3J4jdq5sJURqrZgqgUkGbWvXjZUaVK5sRf5NSUeS7LYj7t+jfJvD2KDRt7fXnokoSarBuUb+xauLMcPjEa7RKV6yIlqB9kiY7qqeYXBYUOpgh0wI51HCktbKLHHELJJ3lpd6mG/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxdtvyX7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxdtvyX7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so10846095e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 02:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766139642; x=1766744442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKmQW2VL0lP4jQVJJLKVMF6y7hK6YF8gQUYY7g/64lg=;
        b=LxdtvyX7KZO/WnVWrMaoncULjf/x2SmSeGLAGTWJ1/8j0TMrMdId0jlkGD7raWOURx
         j7jmtBf3Pj5vHvhIlppdzOvoIJQG/iIYjJziwsajrKxWEVIKVgSM2eG6bPenmNhQyF4D
         sf+2eRVtsGDvob75mveCsWfFlxWNAmDzxpyy/LQFb8mefNe0YOW2fdK+JiuPij9hUPl9
         FV6nQUTtXYDPngBPc1DwDadlc1HcfebvlLi74cKkxl/8/Aas/xo5TUWz+e9NnytKr9wQ
         Bygu96eZ2d2FZWsLopS1sl2sk/AhLOuvVtptSgEvcSGdyHV2oQsXI9dvZ2ROKXmezrlj
         f1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139642; x=1766744442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKmQW2VL0lP4jQVJJLKVMF6y7hK6YF8gQUYY7g/64lg=;
        b=jUtLnuvJMbZxJpFihSGwf+zQdKPUch7x4XC7P0zXoo4CHki9XwGAiZ0YhqtFm5CjOh
         ElJw3mAtoWXAGmSkDEXJGmVKdqRLLDev0M+hVCN1Ya14cjT5AkRL385NVYq8Cs5NZtXv
         J/xvzHvbKGvl/oEHKKBXATP2HfsJPk7g9Rtv6kAhJgb3l7sM/LLCZUpLScK/beFr6MYZ
         pLseK/Ul1T5kUjrFLy+LLBMaJGY5r79CUDMBGjuPqCPF+CAz3D48b2nXI28a/HdNVN1Y
         dBsIVBi2gusZ/Mlscpp8RUQP4fMNqdJB1GVVirtC1LAhO+KMpEyOMckvH3c+NCArV2/8
         Hrgg==
X-Gm-Message-State: AOJu0YyPdLsqI9BgDGe0L9i5/FKRorcQzt6CV0gS94w+5oBKGDjEmBIi
	Fq0MBeNu/blK3pGIip0oJu5DLi0Q+WW2xQi2ls1iUuLK85Vk0DLmGN0R
X-Gm-Gg: AY/fxX7WBFEGmzC/Oy+mDQ2GYzNl6l1AlUbSYAbwess06E0C7ZZncm/hi9aGDQ+lt7y
	G3KrnVr8zytzUXU/vjivvsbRepPfmipq4hMd2jRJ8TVf54L1KCXsDlOZf7hAgi7zMi/KteSfl2u
	65kFA1XRlp7kVX8lZvOUF6SVqM6sko3pGg0wK9yCVOYP1deW2LXh4X/pj/t/VLdBU73cRWt6kiE
	xH+Eg3ytQpzMshQqgnRvWZr2RFBtbt148tpwZhlYDT4f1s969csC3i/0mHVX1tgNyAl99p6b5JM
	i+Vz2wM3iV/PIFeCs0u53lb3/OkV2zxrmK8qU0WoeXQ+lQ3AsCftakZTFxVaP8iWo+K8U8bD0I/
	Zg3tHgWQKqXr+sqEMT+FwkfEf1m3wSKLztTUN5K7oliUm1+q8WCmexev0pamc2eH0XcWs5d4pwL
	hasJXL7Vp6WsRNGXrXBeiK
X-Google-Smtp-Source: AGHT+IF/viNctiITZ/Iq4gzTfBEhhKTG+UOx4RyQbQKXp+W9fu1haO9i+dGSFoj+fYG6pr4WxlhJ0Q==
X-Received: by 2002:a05:600c:8588:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-47d19975bb7mr14433925e9.30.1766139641960;
        Fri, 19 Dec 2025 02:20:41 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be26a81b6sm90643935e9.0.2025.12.19.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:20:41 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	NeilBrown <neil@brown.name>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mqueue: remove duplicated ; at end of statement
Date: Fri, 19 Dec 2025 10:19:41 +0000
Message-ID: <20251219101941.463509-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a duplicated semicolon at the end of a statement,
remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 ipc/mqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index c4f6d65596cf..b4f671b76cd9 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -912,7 +912,7 @@ static struct file *mqueue_file_open(struct filename *name,
 static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 		      struct mq_attr *attr)
 {
-	struct filename *name __free(putname) = NULL;;
+	struct filename *name __free(putname) = NULL;
 	struct vfsmount *mnt = current->nsproxy->ipc_ns->mq_mnt;
 	int fd, ro;
 
-- 
2.51.0

