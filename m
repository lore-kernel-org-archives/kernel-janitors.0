Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ACE191494
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748962; cv=none; b=mGRl2FNhAabWbOIC8MFdnUYbDP7VJkGanruuYdIIXkWNSPsPzvxC4MI2c34Qh7pMhKWmt88RlRTnfIt8H91+V4dPIquudjV97tqteTq1Li8bCdddD2n19GiPUy/riWuUxHmwtTDG9TAoXDgxaIzMR7AGFym7STrQc6TeuuuN80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748962; c=relaxed/simple;
	bh=HDIQlLSSIWxnjcOUeF2giiJnQXHfIYD0kokOmD+7EWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNk4UtJCZjaUfcsgVQZ6F02CHieVYa8xnZp2E2h0mdcaKlbw5uNMNpLGTFSR5mRZ2M+CAbpksqNTXblqmIz3iaJTunQY0mxxjgN147lsIE+tkOgg2TMhWUqIrH0HC/+H07VMs1pC5u7xKTi/7jMnhQ5pC83Gx59wfaCwfqv6BpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ihd6Kn3F; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ihd6Kn3F"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso559211266b.2
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jan 2025 22:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736748959; x=1737353759; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pjJbm+GL3xMGT2PHevSgzgHjM9ueX6e0WLe9Qs+akw=;
        b=Ihd6Kn3FkxeURxRXPXJUVdBVw1v7iOaCLXuOfosE1vSAAlXrFNaMyg1W/DyP1y1C23
         Tei1iWQwWc46yiJegF0/Ese1+0/N4qYAOBRxhUt1NoxokZ48avxBTGMP/Y2ia02ixnNN
         HAgyYKt9rMS8dtGGIRCYlYbq74Cd+Xvn8yvHUWFuGWWNahmS270T9T5yNM+1iaO/C2dW
         zHwdQbMmmuYRlovfzMVlkQEMdFG9Qse+UVsgQ5VJp6yzFp56lpEuX+QP47APZCpJr+RZ
         Zua2WTZAY1g//Qyzplq6+Iyhh1Q+vyVgkM00/rTav/OAJHVYqOYXjJOK+uF6Qsf777KQ
         1PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736748959; x=1737353759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pjJbm+GL3xMGT2PHevSgzgHjM9ueX6e0WLe9Qs+akw=;
        b=HRmuUzOC1OSfzW22lF7OOo3pH0OYBi2cMEyOfB9QSzX9d4zr+X3t8PjkSQhBuxfPHK
         YcBQAUsQmGr+UyJRaB/mHxzXrrmw6gMq/iHLz2hl9gDAEciDD7Ctu14malREvei3iZ8G
         mx181TWSAZ/MkhnIr8rDDOTRbJIVgGFYvqa9BH9dkkg6658cpO9RLa0diJT+W+YbvY88
         bqTyKObTmgY9Cp0EmlLwsiZ/NqfNMU2pHaxTg44JyJV9bKqy4L2BJbmt0hvnRPKBnTNG
         PYDQJM/1T3t7JwjJjn5nXDXZ7sDXJ4XfAFheIj98A4W7TxTX9rvNabvFwRhfmGXflPgB
         KuPg==
X-Forwarded-Encrypted: i=1; AJvYcCWqbkAayyCtjXAGW/29JQ4sanm6noUnWqOeUoYpqbG6E5BkHQHM9z8qX1KbOoNY7TPJR++BOMAgZ4nqw6n5c3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvsXtFBLkUNTntTYqKyuNlVP9QlXlTo6XopY/CXYGcIaFVE5L0
	8ZI/wsQX2Frd2ZsgqkfX9O56S/g4WWWZy2GtjkK+BZu9FaqqE02NnBniPDoKHLE=
X-Gm-Gg: ASbGnct/+3gDtQ+XC8rFGrDYaOAbmGdiJYiIZMJUgm4Su0/ovu7y5zra685QSv9q5z5
	f2XRIN5fRyRRydx1u42PeJoHsf5z99o+Qz4M1rYjbrgsSq1gZ0MeUZ2DTfZssYb7CipSXL4cBpL
	Pj5YJ9qTWHInQiZTb1IfB7I/9aoSX49oJw/A+/3O1IipLtpIaKdMpw+FVC49QnYus28LtXBIyJR
	Ud3MHP3COQQ7IqY6Tncdc2dnVvqfH8UXLgbxHXKolLJO73DXv0/RxF41uylXA==
X-Google-Smtp-Source: AGHT+IGq08j5sMzi1AzMjZ1y83V0c4GO8GFxsXUHAj6RdJN05L0egWonX5MsDLpHWtkmf38w3+RFfg==
X-Received: by 2002:a05:6402:27cd:b0:5d3:cf89:bd3e with SMTP id 4fb4d7f45d1cf-5d972e708d2mr40816202a12.30.1736748958783;
        Sun, 12 Jan 2025 22:15:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm4308820a12.51.2025.01.12.22.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:15:58 -0800 (PST)
Date: Mon, 13 Jan 2025 09:15:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] efivarfs: Fix a NULL vs IS_ERR() bug
Message-ID: <7f7565d8-ef9f-4e5f-834b-9735db01835a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kernel_file_open() function doesn't return NULL, it retursn error
pointers.  Fix the error checking to match.

Fixes: eb11e99adef8 ("efivarfs: add variable resync after hibernation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/efivarfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 961264f628dc..968e4af7b7e4 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -492,7 +492,7 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
 	/* O_NOATIME is required to prevent oops on NULL mnt */
 	file = kernel_file_open(&path, O_RDONLY | O_DIRECTORY | O_NOATIME,
 				current_cred());
-	if (!file)
+	if (IS_ERR(file))
 		return NOTIFY_DONE;
 
 	rescan_done = true;
-- 
2.45.2

