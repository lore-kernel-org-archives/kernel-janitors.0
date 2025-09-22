Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006623054D1
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Sep 2025 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758543023; cv=none; b=ceseSgpFJBvht3cuFB/gTQJiUg04tcYVG5CReQk0R2v1YZs7Rq6f9pzfkaHvgARCA402S7Tg5bfqhRqG7v0U7DvPaiZ1s8qGxT/+nWeKT8F/8qBSO8gu26ZL1A2JudL0Rx7u7IQlKXViJpWfRtEgeyzIUV36c4kqRhKuDGMlARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758543023; c=relaxed/simple;
	bh=D/clnD1hIlVnSt9RwqpAPzOANdJ2p5vqoO7F4SHQKHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oC6GsYSPxhhxmANqCBeH7Y+O/JBHyO29G270+XlS9rzt0zU5VIU7vpTXxe85a30sCmKFCCigLdcqeiZ3O/NtCuSCdZX3fBKdIPs8TRnRwgJI64qrjc7XNtxrmgT9L52PdCbaIAtbvEJT/Dr7wJZ7MMT9PiTUNAUpBuwQIcKBlNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWcLntuG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWcLntuG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso3201653f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Sep 2025 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758543020; x=1759147820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=71jw5Qy/VkNLzHuH4x3iqTkdWQrjxtig66ummONYtOM=;
        b=MWcLntuGxb2GSltYe7nmE8qf/7WZA0gETFKw5/s3LjGLiRx8JM5pAHaM02mbQYl3XG
         1SW6cGtsLhpDL5D/1lUbf8aEv7hxYvo4H7OY3mJMx9TuSAGj7cYzrKdCP94GDLY0hsYd
         Kx/pVKFVVTZADei1ewDy7QxmN1pXJIGbOp7kjsW1ZdnhF8iE/gWijVcYluG3+DKDISwT
         KKSXZ13Qa67Rt8b/qM/5WSJyklaPMhgvNgYUaAbhbSlGzQFVs21JG0c3a/R7cRg99d1v
         /mSiKRzki5VIC6uIKbr328WP4PjOVxkBDSz99ACpvCYs5jTKvK9gC+Vrb/wU7KXPZj5h
         OXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758543020; x=1759147820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71jw5Qy/VkNLzHuH4x3iqTkdWQrjxtig66ummONYtOM=;
        b=IWho/3PwU4kOsgKSiSSbC1HSct1jRN8fQ9xU6yzQu0AMg42tMtphVfzLaQc+tHLHFE
         LInVaZRGnlmKdNMkW7PP/fd4BwEG4c992lbehmqLXvtWQ9BuYOTK7PAlrogmCJAq9LQN
         RCkP4s0FgRyBlnjSrt2Lv384NQKWVaN8Z0N4HCV5ZYl59mpx0hFVz1cF1wxcSS3mDVWt
         W4/4dMwHPYh16RY13N/+HPsrKPjFj/WIRYi1SejPs/1x9UA+tQv6dWPPct6kyLE/s0uG
         IiPLDhxobna24VPxNJyCcmYtglnMHDqcrMle0AYK3M2D2YL0AXtauf/kAMh+fA1T+av4
         dK0A==
X-Gm-Message-State: AOJu0YzLoIuXPQg5j/A410ik1FGmugneyZ5pOmkvgWm87CeH4ftcM8Hs
	qQ8/D6oO8pKHUv7y91Wx+tapbpeqHa/J6OwK+01EJQ9EdzLdYfZqN0kH
X-Gm-Gg: ASbGncvt2n5KYTnblslKD6VeV/02ziJQEVdDer1dZ9jk1BS4LVaEgcQ6sZDISoLRzdM
	JJ7ep3QTJ9rBC8joyucJIlJaaWxghUaDFZAbhZ7tqE7RRM2RVawEuVwtSE2B10gS7SfZN9TsoS4
	wQceXlMlSqvVS+9KhYUylbAedetB5LX2mA9OsdTAAaIYgfyb/eWhdMTnPNlqxcsayBkwztdiZPs
	vsFqA0OMcrXbPtEh+Zmd/x4v0FnQZNgqjtLxbTfqX4W0I54lK/FEw2mIceTAIeztjWu/qzsSAB9
	e05e13gT/wyQtRZ1PIUrSabhWFhMdGc0hKP1WsByz02I9xSWex7SvxgwOxZBBYvMCHukw9BSdNY
	+S433TpzUIXkpgnbYfbRncw==
X-Google-Smtp-Source: AGHT+IGHW9CPoYUliHRmOI9QW83IwXhzxlqJRF4i5x3vsGF8rbB4SFo9J0Y/nPh3bivEr5ReaiyMtA==
X-Received: by 2002:a05:600c:468a:b0:45d:e326:96e7 with SMTP id 5b1f17b1804b1-467eaa86e42mr112243105e9.29.1758543020076;
        Mon, 22 Sep 2025 05:10:20 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f32141ae9sm131846735e9.5.2025.09.22.05.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 05:10:19 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH][next] selftests/clone3: Fix spelling mistake "supportd" -> "supported"
Date: Mon, 22 Sep 2025 13:09:30 +0100
Message-ID: <20250922120931.56786-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a ksft_print_msg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/clone3/clone3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index 05c3d2dcbf2a..385cf08f8cf8 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -71,7 +71,7 @@ static void test_shadow_stack_supported(void)
 	} else if ((void *)ret == MAP_FAILED) {
 		ksft_print_msg("Failed to map shadow stack\n");
 	} else {
-		ksft_print_msg("Shadow stack supportd\n");
+		ksft_print_msg("Shadow stack supported\n");
 		shadow_stack_supported = true;
 
 		if (!shadow_stack_enabled)
-- 
2.51.0

