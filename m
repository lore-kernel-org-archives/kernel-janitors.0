Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D6C1B4153
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Dec 2024 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314045; cv=none; b=mdA/hd/SvpIwTRg4fSqGWH4KX1i8gMCpMp56fDJ5MudOQqSAjekjum94Z4fMmqJggwO0fC76EDYLYoy0D6hnW10H/r/kx5HQTJb/LpKTNhq/3tdu8/RaOYiZ5okwI+dRQhGVg0OFKWFFG1tUk3enMmWNI7hdYk6aM3AfmmBBIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314045; c=relaxed/simple;
	bh=RvR3qOxj7F/0e9rnW7O2IklQmCFVE6f3EueDbZzyUHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBlsZXlBf0bvE/8vY0xOFAUFUVVgpedxO8BtShTERZiGXWPzKryAcvqIxwy81cACQ4LiU1s4wkCYBFLz+lF1xvKRoeXFDY7cohYAUmSEcoB000ucFVb1C+zZQGANhfFSsK10F+ptxR1mJf8mJfS6ULqnbkKg9XrMbhU0juJ2Ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nl1jZlwf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nl1jZlwf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so61769525e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Dec 2024 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733314042; x=1733918842; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h210QoOSRhdPOVfbdTSglVOfvi7IBDHS6sm3Gy55HvY=;
        b=Nl1jZlwfY1Nt1c1j+pN2QmDPxKOcAoXDPFhQJ6G3+I6gBaFxQIGeYBgx1gvlZ72kLt
         nKmJIlDnRdgB98L8bUxncMzIPGn6DRE3riy5BY24IKbVU+KZx62iteuk1rYoxd9ShIBO
         t24mdAA3fen00onL9nIzDdP9qTeg8fN9KOeQT4L2DCHXmrTqwwfxUCceYZyBGcfuaRpX
         OgEXx6TBRJmwm+5DHqG3d3HDVpeC59f0nijF4Mu0uefZaYGL8oUydjlhRRGLrH8mDTXV
         bddrm2YZnXKPiqWXxPElf5GkEkEWmqg/uwh4ltPah5KhD0O0lS4Lq7n3SmOpPqSYkolw
         TbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733314042; x=1733918842;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h210QoOSRhdPOVfbdTSglVOfvi7IBDHS6sm3Gy55HvY=;
        b=Q3I7mJhA81QPUc4g/FH55DjDEQqFlzpicjMasIxvO5DQMu1qRmT+kaatFLnPWRkv1T
         khV2Zvr24xRVWtxGlOyiczYIHK+NY2ELMNdeYS9EQg7EAk6Xr6Cf4R3/2BANncx6Vgm8
         JLd+t+I3Cip08IMRfhXZrLQG3oNptI8YvZQyPe1x8n7wgY/4ImAEPp62TsAwU51K/2J3
         Ct+EcC2tYgO6mWYTpMJOLzwrLsLCvEX9bKfO4IxGRp0SndHwAUHOR9a8MNg9KTEsSzs8
         mUJ/EnQg6Nm5yHVnxbiBJFprexby5hRhkmn/CZFN/v2KToaK2EsQTvXWIKHO9J9mS1yo
         ygPw==
X-Forwarded-Encrypted: i=1; AJvYcCU/1q4J/8nAUJBo7Dy15iPuZMPfDyPqhQ/JggTbrUyWtbLYX/nmrxnGkPsYOCfdg0/6i6m0cUGpbpIdIFfwwSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiX3Avvp5JE8E1Hfz91FSYoyCTHeKSNy+ktV4bMVzlScBCY9br
	rjWAMCNKj2rKSF9zU7k2fMlEJrMWCZTCN2NNQYhDqOrUbwUGEsql+OiQBCmZSAo=
X-Gm-Gg: ASbGncuUwaei/NHSLt5ABdw33HzzfEMz6FBHm7s7zeHSqBf8l47JM557MpfMEaVdJV7
	wyl/npXUTDSZq5S5krUyBZEpZZOmwo58zvEL9b/Ld0bPjfeXuiw8rsydrAGTqtKOH1fxgFG9wr5
	m8DT6eE00bej1fin1NE8OAhZ7NENY8d/gypcXuwuJBLSS7K3HHIhvyKDYP9Zcs1a/oKwzGjpJF2
	oV1IZPsEHuBSpMKijoZFdZtTzU5uYnvTXCp86BLNpdU8Z4cUHo1JLA=
X-Google-Smtp-Source: AGHT+IEMOOOmz0PjNc5gkcjsABrK46MDH+6JTcOtcJN37eRjlQ+sir8R5ollqwe8lrVAPHvlPmBp4g==
X-Received: by 2002:a05:600c:3b8c:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-434d09c0b53mr62649135e9.10.1733314041606;
        Wed, 04 Dec 2024 04:07:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b14csm23020975e9.2.2024.12.04.04.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 04:07:19 -0800 (PST)
Date: Wed, 4 Dec 2024 15:07:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] binfmt_flat: Fix integer overflow bug on 32 bit systems
Message-ID: <5be17f6c-5338-43be-91ef-650153b975cb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Most of these sizes and counts are capped at 256MB so the math doesn't
result in an integer overflow.  The "relocs" count needs to be checked
as well.  Otherwise on 32bit systems the calculation of "full_data"
could be wrong.

	full_data = data_len + relocs * sizeof(unsigned long);

Fixes: c995ee28d29d ("binfmt_flat: prevent kernel dammage from corrupted executable headers")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/binfmt_flat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 390808ce935d..b5b5ca1a44f7 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -478,7 +478,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * 28 bits (256 MB) is way more than reasonable in this case.
 	 * If some top bits are set we have probable binary corruption.
 	*/
-	if ((text_len | data_len | bss_len | stack_len | full_data) >> 28) {
+	if ((text_len | data_len | bss_len | stack_len | relocs | full_data) >> 28) {
 		pr_err("bad header\n");
 		ret = -ENOEXEC;
 		goto err;
-- 
2.45.2

