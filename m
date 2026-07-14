Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F144683D
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046904; cv=none; b=BrCVVmU+2axOgdw/HagM1ZxetgpDjY+hAGb/qJANKlBHaF4DSVPkyrw1n8gBqDEIZu7KqJwNm4XdnT4N4x6ZpjJZXeJ1bVU5fKWnLEfer7+Vk7+oWRDiOr1uvpKwo4f87O62GH/4Unx5K090LmfPzxOGHQHQU3H7MhBhacOdIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046904; c=relaxed/simple;
	bh=KSbjRr456blZzse+yMVlwf0N6zw34OqPD9RMQG5WAO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lbjjjxY2KMaCTvMS0xUsTpCb75WMvCMyRpvm4aBDJYoIksPXFEVRmEtpsxkx4iQXCzeRGc/3qdy+Ax6bMl/KfDA7E0JDt77qDWhCtr4tey5Ouit/frN9pkDoHgtvAKaaDJ1SJo6BODjWcYYQQhQLo4m9Tn4BiZVYTSumQBsTAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULfrO9oC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULfrO9oC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2792082f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046902; x=1784651702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf0gaGl0whSy4I1zhkPo1jGCzqq1JMGLNHicB43ROvw=;
        b=ULfrO9oC/KR7AELASC9gmTB/wvHt3G41u8FKDvhzKDBnMTU1ZyAOHcXXgOalmwH25J
         vqCRRcRO6roUlpdF38IzYP5MrbIZkqjv0Iu8hK1pqJoLWVD5T2ef0XfZ53oE0F9S3JJL
         WYoiuKkBthC3h4oOGrMS1DK+6lJMU6tua1xj1Yv5OxpC410HQMCvVXs9RZNxOowun5kI
         CTBooyCH1xOx+HnYKl8ozsA70fj/6iHuv285RXV5XRAqUbq4boGiXDMQ3GCQ8z1OAHAv
         C894GCDKDTPozwqkzdYHWW6y3z+6e5+kdglUwl1vCp8P0hBdunRDwTKhMl+GMfjC6uY0
         7+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046902; x=1784651702;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uf0gaGl0whSy4I1zhkPo1jGCzqq1JMGLNHicB43ROvw=;
        b=I7EVowUnB9VobeGD0eceuyADVwG6iuCJtXofpqsZQHnQ1aAId4iW17lDc8OmV02z6Q
         JZ7snvj8EodLg2Cbuu5C9Ltk4fD7ISlInKmNtAOLTfo4r1ykZLLXdZ6v3U0hI5MbBxbt
         xt2NiISLUeu8xP6zOjMbu0IoXiD2K7iSjQhXr9ilrGNd0E9nxAJKKD91eXlueDNbYShL
         ZKsCESqk4XDnXqizeAMm1z4xaQbS0CEJ/JJIiXNJ18hg1HN68mt1RrrVmzKMp79Ga3TL
         uBVtDOJY7ae9Ti5jgRY5Os8uJBlfQ4y5cE62/f6xpwCs98mXd8DsFXP5hrAAo/B0aDG+
         wRRg==
X-Gm-Message-State: AOJu0YxJB/H/mBmA4s1tOr5SWRBtMAQP6i34JH1lw/P+pI66ceBZrlr3
	wuC3oSP+7hMIINBP6+OB4jFlUO/mDwtOh153Z2+WB/gZKxMf7VT30Y83
X-Gm-Gg: AfdE7cmHEjjkt6rN3KMwoaRQa2xnUHJ7fmw9UDq5o9Z2IPyiSgW5QmiX2/u8NOH6Fgy
	YcGXqJcyBCqD3jonW6Iege752eKRL9LY6Ffo3g3noVUZx/BaKMVvoKin97tGxCCzb0RO9w194bp
	rOOg/DYLLa56vb3zzjJ8t3qASJYGvIq/2t9f0Cf6zpdA1vo5QBNrQ1Pdtp7U74bVX2DakF3MX0t
	z44oBYCuOoXC5MZc2V+WGucBRhcN2e4BnWjcvrOiTR7mehtIqWNkhpy3PyOy99UFKcXcqHMCiw9
	KIqu2HUOB3BMs3I3JNI0hsKWCHuJ0tGGKqR3c36hPSkr+sJlXTcZkIvO3BwCyM6ZqnmF1Z0cjU2
	kXDQDWfoepoiaYRR408S5m3Wp5vPLF/t3WD6rook2AmUro9+eh6QC12TngsESDqHqHdta45OJWm
	txPqVrZBTHQC1SA4S71ctxsw==
X-Received: by 2002:a5d:6f02:0:b0:47f:4c5a:dc76 with SMTP id ffacd0b85a97d-47f4c5adc92mr2090012f8f.56.1784046901581;
        Tue, 14 Jul 2026 09:35:01 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c89e5sm9262117f8f.34.2026.07.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: aloop: make read-only array texts static const
Date: Tue, 14 Jul 2026 17:33:16 +0100
Message-ID: <20260714163316.183165-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array texts on the stack at run time,
instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/drivers/aloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 236f49a7fb8b..7ebe8e5c9303 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1668,7 +1668,7 @@ static int loopback_channels_get(struct snd_kcontrol *kcontrol,
 static int loopback_access_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
 {
-	const char * const texts[] = {"Interleaved", "Non-interleaved"};
+	static const char * const texts[] = {"Interleaved", "Non-interleaved"};
 
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
-- 
2.53.0

