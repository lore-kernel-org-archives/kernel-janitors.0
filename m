Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E86170A37
	for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752934755; cv=none; b=uzKC9nxwPKJEJL7KAy/5X6riR6hbugfd1qd8vhHDAyG5PdrP961n30CT2qyWK2GSiSPZsqL4rL7pPH6HGPPPo0vp8EQOvYY3LVDGYGS7j6RhAfrhsFS2sapEoG8rngoMz8NeHglEmQikAU3/rNlLm4OECSkZCGHAfQvpf5+g510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752934755; c=relaxed/simple;
	bh=BZkhiLiNBaaHEpkcyxUOemT1nuyItl5ktC8ckt/5+cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNDzG07ry38j3e/5giirdyZrjn8QK61cHO4ikXI1Ch0tP9culWI++Nev1aVoQlEAGGQWnX9GhBn05SVH5//EhU0vVbu13b9Yos44O0QsURyloQGT89qMo9da5PdRHB5fXfATkTv3v0+Og0V8qlYoh4svMf1eYiyDW1uHCDCru2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NleAHXKJ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NleAHXKJ"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c14138668so1197698a34.2
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752934752; x=1753539552; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0idHqKxmTJuhj0L2KEoP7cF5EgTKZubwwzAqdTlzNN8=;
        b=NleAHXKJd56eWDOG0gO73cYhNQNwOsXGKtPh3S5hN/nz8tOgQzDTPzsI4JrLfChP1g
         DUiUxffuhXm9cRq6bjuHGncTpjsIzX0IIQ1EnqNLbKzNWy9D+OW7k45Ndhde1Z1teLsi
         GlKpa5sXMiy6MSC1nVuqMzQhxRzElUgAoC9TdCumOUD89R8CYqqrtfyK1+GTFZxdL8Mv
         xAyQajzAxEgmNjj1Iw2dm3Hr3RVjIITW/+SJirJkuRrkdD0Lgqew0hBB8UXRwfzb65JU
         XGUuKaYTQ2QanjxoIervpsxTT1YHvHEllq3vss/upaGrrUQN5qx6YTyGt5/hFtpHPDT0
         2gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752934752; x=1753539552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0idHqKxmTJuhj0L2KEoP7cF5EgTKZubwwzAqdTlzNN8=;
        b=R2lRETnI0n/4GzoQxac/ElCTJM60+6YMge24L6U/unSC8ZgK3MQl9oVlcAppU0CT+V
         YSbzlcpbWMIvsDd26OQtpowvWh/s/b32LaDNgu0hs6kFl+zJU3NcpJTZ3ADAQxBoOkbd
         tHPC+FuPLgtWt204gk9Wm0vih6+dd46hw0vk/jBBHTC87lQIEEFoHsovfFRpNwiaL8+o
         WEDvHCKj80I5YC4n4lXazo+nQEfl14wqSIjn444W34sQa/cvOjYjGXQuOdjaevmjT++T
         9nXRNp3M/62WHP0k3Fo+l7khVUG7qvLEFKDfRiAA7YRygLosu6UAtPWEFnAP21cV/2sA
         bRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjhRpm9apXOTHuBCWBL7o9W6R996u43pa9Tsq0SxGGGEqM/XLoOwLUM72tXVqENcmBxaOTJTR+NnPbFypgmOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYRXm69QjydqHZJVznxpGFXMS7iSiApACObOEp8BCeHIx/CWU
	P6WkRC6duPW9uJ0FlC5RLWiFmqYAK9dHwqXMyoNU4AozSdIW2bWcCkHOaZYKT3Aw150=
X-Gm-Gg: ASbGnctwwYDVgwNMDTzaPx5hRMtIzlfZKRyjcmuxr32BQgDMouBeGmIJAfAAgOoNQOW
	QOcyjivwNHQ0AwWmJv2+VTFOIPQSb0qVJWPSNARDhFnxF5/BGfMDMOVTDnNfKypDv9EoXx7eInj
	JkqEBrwdVuftetup7dID9ojDM/8FAq5BGsCasnFTU7W8T9FVTeYXbRyEVJkAMv/2RUZyjlpvVEO
	hFejIX6YNyWKMRHYKnt7AQl1Hnio5Q09rMavXoJe6AT0Ku7qw7ccm44XUNTxi/7OQ/heY7TtRoV
	OkWABkTdHsqYwFoEi3jIslS9vf/zhSWq3s4bwzurfmoH9UseGct/21ORxTjfc5+lV9qKv6HSk0x
	jK6HPw7siVBTTa+xylrR26Q==
X-Google-Smtp-Source: AGHT+IEZOcpRl7U1aHBWudyyNCCkirYut88+0gEsK9gTfyQxPBTvvJ/MXoCvXLBTC94QwN8GQcEFEA==
X-Received: by 2002:a05:6871:3582:b0:2d5:2955:aa6a with SMTP id 586e51a60fabf-300e8c77f14mr4390379fac.7.1752934752464;
        Sat, 19 Jul 2025 07:19:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e83b0a51dsm1439995a34.36.2025.07.19.07.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:19:11 -0700 (PDT)
Date: Sat, 19 Jul 2025 09:19:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Brandenburg <martin@omnibond.com>
Cc: Mike Marshall <hubcap@omnibond.com>, devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/orangefs: Allow 2 more characters in do_c_string()
Message-ID: <842e7e14-bb93-4a2e-9ad9-2b4e11d2c441@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The do_k_string() and do_c_string() functions do essentially the same
thing which is they add a string and a comma onto the end of an existing
string.  At the end, the caller will overwrite the last comma with a
newline.  Later, in orangefs_kernel_debug_init(), we add a newline to
the string.

The change to do_k_string() is just cosmetic.  I moved the "- 1" to
the other side of the comparison and made it "+ 1".  This has no
effect on runtime, I just wanted the functions to match each other
and the rest of the file.

However in do_c_string(), I removed the "- 2" which allows us to print
two extra characters.  I noticed this issue while reviewing the code
and I doubt affects anything in real life.  My guess is that this was
double counting the comma and the newline.  The "+ 1" accounts for
the newline, and the caller will delete the final comma which ensures
there is enough space for the newline.

Removing the "- 2" lets us print 2 more characters, but mainly it makes
the code more consistent and understandable for reviewers.

Fixes: 44f4641073f1 ("orangefs: clean up debugfs globals")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/orangefs/orangefs-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index e463d3c73533..802bbbbe9a79 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -769,8 +769,8 @@ static void do_k_string(void *k_mask, int index)
 
 	if (*mask & s_kmod_keyword_mask_map[index].mask_val) {
 		if ((strlen(kernel_debug_string) +
-		     strlen(s_kmod_keyword_mask_map[index].keyword))
-			< ORANGEFS_MAX_DEBUG_STRING_LEN - 1) {
+		     strlen(s_kmod_keyword_mask_map[index].keyword) + 1)
+			< ORANGEFS_MAX_DEBUG_STRING_LEN) {
 				strcat(kernel_debug_string,
 				       s_kmod_keyword_mask_map[index].keyword);
 				strcat(kernel_debug_string, ",");
@@ -797,7 +797,7 @@ static void do_c_string(void *c_mask, int index)
 	    (mask->mask2 & cdm_array[index].mask2)) {
 		if ((strlen(client_debug_string) +
 		     strlen(cdm_array[index].keyword) + 1)
-			< ORANGEFS_MAX_DEBUG_STRING_LEN - 2) {
+			< ORANGEFS_MAX_DEBUG_STRING_LEN) {
 				strcat(client_debug_string,
 				       cdm_array[index].keyword);
 				strcat(client_debug_string, ",");
-- 
2.47.2

