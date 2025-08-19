Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA06311958
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596482; cv=none; b=nZ5dshRU4sSo/9R3UswqVM+Mu+5ynMp2yePAEtNesd23+1ewg9MM2WwmNUjsfqvKCGLESTSLnAhSGraxELd7Ep5ESJIGpeuRwYTigf2pLWCJ+TwIlUt706mrkFYtWpzKJeVDUH8KO1IFYXMn/f3l9fYsQG4sV0SGyecKqLgVwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596482; c=relaxed/simple;
	bh=8OzrB53Bn5TxGHC664tdW+P0TA2+NR/DwiZkzjNkzZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BI8KeM61nRCqqAE53piPGbeKsg9QDdk9mHOFLDZ0LJl6vqV7PuzmEyBQdixb7m0oLvcJo4P6s7KarrdLAmb+7Gb3eWxkTudlFK0oIMFSbMiGWHbmDYrOcKAfdBPA5mKe7X+hwO7nI+tDiiubRgKOMglp3aJpkbTVftjL2e8bkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vECM7eRe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vECM7eRe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e415a68eso2503689f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596479; x=1756201279; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKExw4rCJH6z3V+PveKbUj2X+7GksrW0bl8/wkUvABY=;
        b=vECM7eRed+zPnhTQQ6tRAwVWn5fTpl368Jau591Wr2fZij3Yr7XyNaVxSrPIjzKD5w
         U16QCwvxBZNdS3ZsHQ6cgPoyv9Bmlr3Ub4+W5BRNpGxEzumyL3Uj2nkzD51YcDGg0Lb7
         FK3qHQLqJ7VyCygn+ttLObvv+YOmIls+svsyHnG0bvIaNds/2ezTKyvyu8HOeG2Zi60U
         fuqEX/vstVyYMt+Qf0AfuqdeqwH7lyRoHhaZu3xtOiG0iVHqec9plpW5BLTs1IX3wXOD
         NK8c7/I/WvA9O0TvVPR//s1nf4R8Mv1FkLHOF4deJ6PHn6Xf+w37CJR6hGO+Wiwb3frb
         PJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596479; x=1756201279;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKExw4rCJH6z3V+PveKbUj2X+7GksrW0bl8/wkUvABY=;
        b=q32zb5LX2k7O0VrbogXnTJ4DNldSTUW4rF3a/S90UFUj1AG72P4CGGw2THHBSHLtEH
         D02l3kNRjvu92SQpPK/ZG81DriDGrEnBWzwkto9QBuxEaiS2iuygPulgOrP1+5CKpkpZ
         odmN34VujfDRgkvxhiX6ql1m9xbJa6IxdQK7VdCzcvd45B16P7PsgbrS1yf0S1bVTWrB
         neud0h90T0a/zLzhzjuVJZi2bvuMTqTuCWYTMamzS/6YwDzdSbndi1ftKqhqa8dPP7lP
         bwhycxuFiLCSQP/X51X6vrXY5Wrd44kbyltxJif6zxm2bp8IEYidjkYkoqVoc7druH+O
         iw3w==
X-Forwarded-Encrypted: i=1; AJvYcCVzdECVrV8oDBOkkLrCUDsa+7YaoYn1bqhjGOJjC9T9N/cWSwjDabU0CwDUXQQ0ULlMo8x5Qla+uS+5AqKlI9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWV1/lmvEK+LYE8ikotWVVmEXyF81vMS2haFapZHqHyEHMzkng
	OkyDcCBzCXFUvgEzBSZIClf2ajZIoWFOI6F0JyTfHHQYNHDoje6Pd3Pbb8RppfDxwM8=
X-Gm-Gg: ASbGncsvkw4Hca0XYeDdSV/ZbplPjmba818x1jbdn8PaUqqyxepdpKhtv3Xo1xXSt7H
	aSR2OIPxFVWRb+wyoD+psgbFovipMwT/8imv1rksrjaLvxyA8AmaTbIptzuMvuLs+S7UBHskH0+
	8jsDjba/pMi/RHvDykEtoPTPu8OEgahyDZZ6Tjz2B+TtXgv3vyUSLb2Fi/sCENTu2jIsB9fdLFu
	7iqfGJ/Dgq3avnhoGWdnKLoSE0wjA7TmIvdaSrZI1aJ2V8mi3bXXiEDxAtt6d4SeRuMIZRElW6D
	pVG7ZYRxEOrD5UyPGxu0717X9lvrpOq7QliT7uriYypBNaecczOxXtyWO6TfWJxnQcGo8IWixId
	lkBRxIAjWnX9SfUNzg+MJThb5f4o=
X-Google-Smtp-Source: AGHT+IFPnGBxUMbzp7/ciRb/4QDD/AoPuRkeVnisBhwmTgmtd+TF2XWKrPM0uJzG+Ht4NJS9oAj7Vw==
X-Received: by 2002:a05:6000:178b:b0:3b8:12a6:36b8 with SMTP id ffacd0b85a97d-3c0ec195bb7mr1400850f8f.46.1755596478926;
        Tue, 19 Aug 2025 02:41:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b42a97c02sm35092625e9.23.2025.08.19.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:41:18 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:41:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] coredump: Fix return value in coredump_parse()
Message-ID: <aKRGu14w5vPSZLgv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The coredump_parse() function is bool type.  It should return true on
success and false on failure.  The cn_printf() returns zero on success
or negative error codes.  This mismatch means that when "return err;"
here, it is treated as success instead of failure.  Change it to return
false instead.

Fixes: a5715af549b2 ("coredump: make coredump_parse() return bool")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/coredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index e5d9d6276990..f9d82ffc4b88 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -345,7 +345,7 @@ static bool coredump_parse(struct core_name *cn, struct coredump_params *cprm,
 				was_space = false;
 				err = cn_printf(cn, "%c", '\0');
 				if (err)
-					return err;
+					return false;
 				(*argv)[(*argc)++] = cn->used;
 			}
 		}
-- 
2.47.2

