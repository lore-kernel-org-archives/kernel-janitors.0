Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D01E008B
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755511164; cv=none; b=sv3hA64NDVHsiXcPlM9c18ASOAyEgE3l/zejLs5aZwtCPpvecarQY5rsv/UOpzexU8BrJbKxhCZvAn7hxSiamLFWqTpm6RSpaZCEm9D8+U3ncED5bOtMpc5udHz6Ztfo7nCRWMYcipdPGqhMpWhyk2rhPrF+mzBjhk5Qf5nSUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755511164; c=relaxed/simple;
	bh=/C9Csrxdh1sYcqWltONMtXTrt08x9QqeTMlZNgDLvCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/tgY7nBQYOtITt6xW2nZmguiz6a2P2/SeSf0B27FPZIh+kFXU5QNBL0wjDR0paAjzbOeF0TNdPi7iSg3JcKJFOnYB6BCSrOjpRfcOLu3SZP+N+yEg3AdBpPCUUghc5V+xYXiNlkVpQurVgtISoAP215v+BBa5k25+9je/9rw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuEHS/mf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuEHS/mf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso3739229f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755511161; x=1756115961; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZDLlNuYLU9UmeoCuzZO1+X4n+CJQR7oR8AjhafJt6M=;
        b=kuEHS/mfIyAN3GAxIk1mSA1lt4VDPAKXPuOoZDzsOUvJgimm7zdIbPsix6fbyNMtZt
         kEfQvqKia2oFQHzd4rOLd+gwM9DlKm0NrXVLZ3KOXKvTPtEoY/y4bbTvAu1qeU46Vg2H
         mJNChdIixR2De/GddNzrHS+/ktE5suyDaulm96HyhgpdE8i1UjDk2oSIuegAvmDJGAjw
         WtxG0X1O+dTVQHgR/K83bjTwq8dg1tlt2zOgAfcdWybu7HR9lPN/hnq22Hak9hxdQoyH
         54FqEsRRakwPnoS5UYxTR68itfMc4INvkLOD0YYXtk3W+JgVvpeeKCQccmoDppARhaBB
         wcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755511161; x=1756115961;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZDLlNuYLU9UmeoCuzZO1+X4n+CJQR7oR8AjhafJt6M=;
        b=GPf1/VqgJbix2co+AL2n6TD63iXfgHYUUlBbOAf961dtgD680UK+n0HURZOqMRrgGd
         tVpnQL8fSOyMcwbPzu0HAQmbHZlG4slPeGUMs0z9KxvzZddmDWFK0uVKXWrgZqCRik6y
         S9zXeFEE6N/2qONHY3txJ54QWMSqni44M6u6uDXlZBlnKxa/vFmqXcxpgYC5WIjGkRLC
         c4dsVvvyhimYza/SoAUqI8fC6olE61u+TvyTO97jA3uMwjXthYx0WOvvJSetaVPupIIQ
         DbrpQNK8r2k/mRsP2otJBdqzKSSA4fUHA3vgPeXaEnB8dxAKNA4yG4V2/S9RpG/ZF8YG
         IwVg==
X-Forwarded-Encrypted: i=1; AJvYcCUIhHZnJMGlPeGr+t8skFW6ofEa17MLz5wXw5O56BMghEN3i/OTl39JlvN+7pcW425n9juKfoPaW0k40CUScw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz7SAMj+otUNjYkngD6Ewi6Jx0fFswyXG7ce+XR4PhC4NaoM8
	lsHl8erBn0tImComGd6zF5lDYPno6T5p0AIDHl6QQIZ5xSCf2Rl6xmGE5Y3FBh5KM+A=
X-Gm-Gg: ASbGncsYWd/XYFmF37gFyN/eVfQBMrCPOQev9r/XdBpwQsLCCMm1uEP8mtyDRe8KwwJ
	liQrImcnWa+4p6Ss1sCeMJmpQVGK+AttU8U2CuNUriYlUoCb01MCh7EAPk+5q9A5ILGx0xRLxZ+
	LF9Y74lPq76yu/u+ojAKxEJwTeSpPq9+PllwMH/dNZCenWX74KgvbOGH4ZrU3pp/okqoevlWwKN
	SOuKMU+h8AtrQECgJiG7ikbzxWh136p9ua1zA0Ew51b+KducGFnErN3D0/I9A4zxstZEY/XrB97
	MsJXjy6cGb4l3wXuXCvskrbgQM6w1g4SpYzbR+SbCKzyKNsYiLOlCBfBkNXueCt+872h/5BXJ0v
	N+1ukArPLVb5evZeJG8c1lU06fPG1VxKXGFSBWYihpMxKa4LIWxDqvQ==
X-Google-Smtp-Source: AGHT+IEAVhk6tBtT8QiYf3c/clKbpVmq0dinSHoKmOjMnv18pQ2Ji8dtljdjZJFXIYwlEZU7sho8fA==
X-Received: by 2002:a05:6000:24c2:b0:3b6:936:976c with SMTP id ffacd0b85a97d-3bb66f0f6f2mr7896857f8f.17.1755511160898;
        Mon, 18 Aug 2025 02:59:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a22329b12sm126502615e9.24.2025.08.18.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:59:20 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:59:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] smb: client: Fix NULL vs ERR_PTR() returns in
 cifs_get_tcon_super()
Message-ID: <aKL5dUyf7UWcQNvW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cifs_get_tcon_super() function returns NULL on error but the caller
expect it to return error pointers instead.  Change it to return error
pointers.  Otherwise it results in a NULL pointer dereference.

Fixes: 0938b093b1ae ("smb: client: Fix mount deadlock by avoiding super block iteration in DFS reconnect")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
index 3b6920a52daa..d73c36862e97 100644
--- a/fs/smb/client/misc.c
+++ b/fs/smb/client/misc.c
@@ -1116,7 +1116,7 @@ static struct super_block *cifs_get_tcon_super(struct cifs_tcon *tcon)
 	struct cifs_sb_info *cifs_sb;
 
 	if (!tcon)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	spin_lock(&tcon->sb_list_lock);
 	list_for_each_entry(cifs_sb, &tcon->cifs_sb_list, tcon_sb_link) {
@@ -1141,7 +1141,7 @@ static struct super_block *cifs_get_tcon_super(struct cifs_tcon *tcon)
 	}
 	spin_unlock(&tcon->sb_list_lock);
 
-	return NULL;
+	return ERR_PTR(-ENOENT);
 }
 
 struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon)
-- 
2.47.2

