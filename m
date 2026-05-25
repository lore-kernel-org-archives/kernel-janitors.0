Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544263CE4B6
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693377; cv=none; b=NJx2glDVe6ZM6bbcBDqMSY64Vhch/iI4q7jeXbMgY1q0Yw7BGywehp0Gl6Tj7o6RJj3EyWFZfl2lGgkGfqWxchS+qfFt8V72jAzGINlGl8bngjP7yu5o5/lPhYESUCGxXqTVC81Vf/u43TaB4AagCMdzJgoeP24Oj2IkbZ103E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693377; c=relaxed/simple;
	bh=yb9iCBjubMy8cqbf0mqGvOkZzltsHQjCblbvEcLwPEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ygx5+KBJcq7hlxi3XFHXDEtPkFEvtcj4ePgRIU7oKwx3hL/B5L6wQ0PDQAgr6jpNwIO7oatefjMltVktX8coqG4Sb9fE8JphDgJOFSXORWX65+nbgeK90LY5MFA+q0ydNPGF7TlHi8X3aFZmk25h+yPTmrRKuvRgsQQaB/FcDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dknh6AI0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dknh6AI0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ea19f412aso2286496f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693375; x=1780298175; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BK08x3VsdmyZ4ejRvlhzjQsojnP0aGkq6kwREEPRSvE=;
        b=Dknh6AI0Sb/bzcgxoWXrYojoIihLMj5O4+E5U1hL/jKwDEHYEoPmzYCHy5OzTDGVlu
         yR27Qt8AopL3gYSxVOlZMZHwWOOcTOh0B52HBLwoCYCCvrCi7zj1g+ZLrwXaRGOLRNeq
         3vt8lqAeAzae4ZZ3jk58tP2A1fNMATFXTc+mRVqR8Zad6DMhsVU3QKGZ80iIOqJNq4Ku
         UPzlO73+QydIgcU1GiZvpCvdKz1j9fsW/xZVWTyMeWb1wodhCf24tS3DeEcRCCt3nas1
         nmRFn+kSG2KLXqw+yPSiNl5IjqkgaRWvhQ/f+MU4018dYEIwmqprBr6TeeLy826IlY8V
         9RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693375; x=1780298175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BK08x3VsdmyZ4ejRvlhzjQsojnP0aGkq6kwREEPRSvE=;
        b=NBxEB1xmAC4m5B6GpXypFTwwPIK9i2Pr0ulGb+7SBDdlOPCBIMLgAm3HK+m0zv/Meh
         YXSoar9/QeO5x7ggpT4uc7RVaMqnG19iQOET96n2bW+PPpl39nPhZrg7uu5wMDUNhxRo
         Kl43Hw2fX/FiWSKmhPbjtPFDKvb8onyxHvKfKoTyP9MKZ/boaXO+X7SWmCnKGPZ3h33a
         N5dcSUuBIquoIIXAw5BhRUEbceYrgu/KQ+yNVm2js8d5TgA0znRJfNpRYybygQmT+hwc
         HOVpf+c+NHzA40Fnjn2yyIYjT6l3aQxgUWpGBASs7akdmWddXNMaPD1omA5Ut1tYC8k0
         9Mag==
X-Forwarded-Encrypted: i=1; AFNElJ/ykOun0b8Qy1Xu48SJJQd1cZGH/038TCsJY5WRTKNJU7zb/KtmgQZ6VXC0hAzKs+M2K0WmpoVQckF/uED3qpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzen0eE4kEc0zmRjGv4lO48zDLBgagGQtQ0lIn9xSEeY45RCvAJ
	HV6ihamzCXDH3cmvT8v79lHnrnIIX4cIPGsKpgffKE3mq/bBUZHJgMIe
X-Gm-Gg: Acq92OEt9GhmB6RumSZLJhnUciiK93NStJT+Zrwe0zca1EmacmpBQyoYHzaVip5Iy40
	jcpd50dPHJOKo9fmrMgWMD1IMdd4BffzC1P1tQcCp4aZHn1CNHiiXXIUip883OSirzfvT3JjstB
	ZgEjOupzbHD/a5eT7MX0ylnUYANi37gYzCc8MDsbA6z/ZCnBCvCSYsu8140v3OYMv8JLYz59GkB
	8a3lE9FvdM7YqatAZ43+FY5DZ5hmqkg1tbSHUDiyzhrg/ISwqJW88YG2ELpwSguz+Mmf5BZBrCL
	5KT6ZQfC8J62SDcCcYGU9m3qvwMwQKk3X5Rv+n+AWNr1IYaAQHxp8LoCP1+qPP4IF+npr15JOBb
	cwiN9nduukgodJZYCXPRinRv5UINBFhUU+kbAMIO5Z9DBvX5iSunEDPaY0gUW77W3bou8lPY2fG
	fKMB9N1krGIZIRsU9Bia/aLq8=
X-Received: by 2002:a05:6000:2003:b0:45e:653a:40df with SMTP id ffacd0b85a97d-45eb38e4d0dmr20990334f8f.41.1779693374740;
        Mon, 25 May 2026 00:16:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9dd03sm27464361f8f.7.2026.05.25.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:16:14 -0700 (PDT)
Date: Mon, 25 May 2026 10:16:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <ahP3O2tQdu4dNx_c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the *ppos value is non-zero then simple_write_to_buffer() will not
initialize the start of the buf[] buffer.  Non-zero ppos values aren't
going to work at all.  Check for that at the start of the function and
return -EINVAL.

Fixes: cdf01e0809a4 ("iio: backend: add debugFs interface")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iio/industrialio-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index 138ebebc9c0d..4763e224ebc6 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -156,7 +156,7 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
 	ssize_t rc;
 	int ret;
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -ENOSPC;
 
 	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
-- 
2.53.0

