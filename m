Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C2301001
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763673243; cv=none; b=rlhsvQxzvzlFiC3S2T0MwLeLslXbEOJslxo1Q6QMnW3PuNlzboNW24CLmpZejMfgWga4WyyNvwF7JZWgRCeQwBT44/MKc6Ej9W1zvXkg3CN1m0pT9U11bKfnwlnusrA2+KGHm662c/drQfwLSlmYQl2h96PBMzem2dlDLikSK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763673243; c=relaxed/simple;
	bh=cQMX/usI8gqcSln2UFa8v99XXRwzaizYb3BPi10FYFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yrj8igUeIfw1fOpNMRxB0EvnEcqrYeVBbrIQD9rI34+4Jo6wmax+e+2P53kVZJzmQs0jvU6Dkc/Wh3VIgS61tMY9wZtt9ILddRMxRVXQAU9Y4rny/r24I2sj9qnObH9mA4sNIRnFiSVZbJKUNkLAN5gkI31gZ3tmxnVUGn3y92Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4ahJ2y9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4ahJ2y9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so2334284e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 13:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763673238; x=1764278038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4d7IAZGUxK1m7h2GDkMHE2QpE3zLGipSmtQ9os7xNBI=;
        b=E4ahJ2y9Dr2smEtT2XU7QMybWZpsABlFm76xydDHK7yLVYpHSwFhDwbcviGStzq334
         JJJEAfwMv81Ef68b2dNmyXqfDmDdWG+u34jhB7EfefVRttZ7yxCG61ufnY9rsx9LZIRD
         Bp4/u//7kgVbUw3Qq9z/vk5TtJjyhxzpgvodzKI8AlDGGZ21cCg8Jtlnqj9M3cuzEYm5
         3p0MAf35RtCEwgI7XoLTIkoXXrVPMxpbdr5KrQcTAWOq3CdDsjmObKlqIHBLwzAGmGqv
         yGWIp6n6m7pfY0fp2qQ6oCJeWuhYi5D4djkxCIyR1K4vFBZBoRXJUgqmxYQPpkLBjBSi
         /odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763673238; x=1764278038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d7IAZGUxK1m7h2GDkMHE2QpE3zLGipSmtQ9os7xNBI=;
        b=sRs/H7EX4VReV95sLq2TFukFOZUK7ZELb5U+ol1Rv7jrk5xNWapoJqGk+9zbJBNnt4
         FNPKAUL8ceMlIplECV0mi6/P2hTKDT388Fs6RoyIIzxaJOXbaFS7OCPovQNq+428q1Hn
         rqwZcRhiaRyt7YQgv7ABX27hWU8HUIsINSAadeRXoikgsc7m3kUoGs2y3g4ZgIpfZb46
         BC0PXv4/5OtTEdq+TI2buDPXGvbS8OE40kh3yEzHz5YLHf9BiKGB1ZaTyjLvL5tYIjXk
         96hvM+W694/tVByyy17d0rN1gGMPh6O8cE5zrexYBA61FpXAJi4NBKabws+k30yBYBvw
         aHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWcIAmF2IKjWKiHIbswU6UGXAoX1Wkyi7bdbtqz4dkuPu6Wmi1969QEx5OyYctYmrUnNiIam6Auasy5RIWKlHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyESvvLL877j8gJnOkGwFgKsNtoELCJYnbDSAJlvzeocjjvlO9B
	T2efHeImODJ/ks0Zqb1brzjr2qNc/zrq6w+8KssY5Q0nTTMCI5eX6TmY
X-Gm-Gg: ASbGncug2QA5xvJqAimtT9rC2m8rXl22kro0QhS0bdVu4mE0Tz1FQuRMR4dqqLrES3+
	fHs/VqsjRqLvcYCpBGw9TEI88TCYjfpZuCgEiaANG01fuIYkFeL6LrRaFfhie95f79i4NXPFJdw
	IcrNgAXZTfvqedXyYKssCARbWaqLuXDZA7FkN6uJwAkARQBKRzw5TmkqW7J0GPfhbfL1wmMDrNu
	GWYXAq4VbOJ5LwiFJBwV/Vk2zqn5ammHv/TZq0eBwAOIXzLFlc0vRItIFgyibGtD8+YnQue54Zx
	lg6zM9no2/20aG7r9YXzhkSnIjp07H3+fG/2xENak4cj9zBf7KOznj0W95dHXHcZCFeLla3LaWe
	J6Z1kGdz4cfTm+QY2fJ+2nygARcNFkbgl02tZRN1Nk8bzKnrskGjsZlC2JGkKfkGxt5NSaYVXbD
	8Ws6NJ1vuN
X-Google-Smtp-Source: AGHT+IGhpshH5PO4QTdDzSqAVgMyMOZ968ZCv3rtjofzqeUqpZ5T2qu6vbZdUcrZQBx0KF/2QP0meA==
X-Received: by 2002:a05:6512:1293:b0:595:8a7d:87cc with SMTP id 2adb3069b0e04-5969ea2237dmr1408150e87.16.1763673238128;
        Thu, 20 Nov 2025 13:13:58 -0800 (PST)
Received: from localhost ([109.167.240.218])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5969dbc5964sm991716e87.70.2025.11.20.13.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 13:13:57 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/splice.c: trivial fix: pipes -> pipe's
Date: Thu, 20 Nov 2025 21:13:16 +0000
Message-ID: <20251120211316.706725-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fix.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/splice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/splice.c b/fs/splice.c
index f5094b6d0..d338fe56b 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1498,7 +1498,7 @@ static int pipe_to_user(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
 
 /*
  * For lack of a better implementation, implement vmsplice() to userspace
- * as a simple copy of the pipes pages to the user iov.
+ * as a simple copy of the pipe's pages to the user iov.
  */
 static ssize_t vmsplice_to_user(struct file *file, struct iov_iter *iter,
 				unsigned int flags)

base-commit: fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
-- 
2.47.3

