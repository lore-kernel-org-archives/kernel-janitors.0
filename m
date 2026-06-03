Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FEE3FF899
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Jun 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472067; cv=none; b=p8V8s30EQiGbE80709OUzcH7JBV+zOVnGXx8ygWQC/6NTuhmRuukA9i1UsRCZVDDCbs7FpN+fbEclh7IqklIF3HndT5iO5HosOfOaTkRERWvAVv3/u3bKzGabQLqIY1UEYBRNwAz7JaIRy1h1skECOMjapZ6tT1Bkd4Z9tZ/W6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472067; c=relaxed/simple;
	bh=08RidtlahiJ8c10vz6uXOCC0lnAJVvKCOPsHPm83Rbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddD4J5GwqF1wkBC/695+f31lRq1cNuSgktdfUzJAo7qOhXV1j4x8wkZb9O5YZC2EzIFMg81SVFq7eYinxsxkif07PjHKYl3p+iVzELBI6t9/N66mqR8vEErllkuafj4DrYUz0LREKdFtObUcTQDKXflhF3NdkKGrhfpMV4/5CoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/2TzDlJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/2TzDlJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so9002186a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jun 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472065; x=1781076865; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=i/2TzDlJw3YyMuL06BYvYuUywWByQ/Sm6zwf9L4uSYtdHI+IWCxZ3wHtyL46XIBrT6
         zc11fqi61VKGe8SePKulQvOZnaB7tkc4AXmvkK3/3gjcYQJZpTgNOLSMY/TACeGUPw0e
         sOsSLP83PYFxFb2pNIKFKh0xl/ck+fztQQrrSN7h8r11ptCMnaOTP4Uh2rnDGLRCQbxu
         uQmTkjUDGDGGk0byTRoK3HOgxWKduSr7O0boFf4mFrDFYzram8neQk3WabQy53AsgsW6
         kJOMW4fOE379qCaFCM2mba6gSciAYGYBcqjU4LogULbE+N//EvV9XX2YV/4LntTxF12M
         xpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472065; x=1781076865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=jJyc/OKDRmIoUUFuEtjTuzjXIVFykNyj55HXNTJTeZ+OAbtBkbkrNxxYv5SahDw9Wf
         s4rae1B+8K3q/hExrEAXttgNwcDDvCCvIICQnOCA5LASqPNGoZsy0bU978lmJYqGwRdi
         Itri+O11NtWYCGLw7uCXyyWhyJKPImbLob6CZIY0Rbn7bjlm6ODH5CbkrzRldlP+5PLt
         k+SEMNR1Grq8eDZGEuCJAsV7fLlOuzJZmgzUMzmFXh/vIe/BaYQM4rs8LmF7RhzKO9Tc
         uT0Y7/aFOoeuaqKf4htauBLk04GWsw3Um5VmNTlHXxlCFMOECWyFzA4KfvctsHjL4lUm
         P2cQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JtYZMhsY473V2j/d8sCXLTr5dHdG9yP1pEMA4g6kc5uSZogfhCh9coKOAzizlYEtDxdPIvh96/bNEQxO/VMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IW2kIwpsi5FzejYKYO1RVbx/H4KxolOiewLpN6nTU+N54zNV
	F8Ep1UrKR+N6r47UAZYPwA5WzzzGM0EYO/lVm7Mxnfw4tH2exbBLJ1EJ
X-Gm-Gg: Acq92OG+17H7WLA5aCgMSmLCxhH8NQ5QlEQ459SkpcnUVrrqjzn8uDDLAOFhO8gVhMr
	xcPa+shQQJNqIMPLbIYqU3hsAL5WSYYzCgvA/1dvYh1HibdQkFYS0xWjukgOq9cFCPig2C1IHVA
	enqRE9lbdpGC+R1rJq0ZjrNgoZSjTIUtFoVvaEI5umyas3ngyT6e+8EXBPSW/aQQ1Sj/2GOHXvf
	WxSS/ZDMA9oMuv0Ggx/EPfDo6ugtyH++9PPnyYXBlAgZAI68iJx+3pidS0vsuQTmn9yZjKj0XZ9
	99KcsKW5qX3tcx1F7VEnG2Z5BdTkDsFO+gWqJ80HV3XIeLz7aFOucBZLCXflT8BlFhYyfPygkzN
	+cIKX+zvPCw/TZ3cyRi4G+0y9GtTzJiPPoleFJzYQhLHH4Hxunkx+6X9hmZ1kS5WpZXS9zCFL6L
	uC6YJisdQPzoh4OFYtcrfcU0jbuKJL+Q==
X-Received: by 2002:a17:906:f58d:b0:bec:64d4:3869 with SMTP id a640c23a62f3a-bf0b0fdda85mr96495066b.4.1780472064614;
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm102019166b.9.2026.06.03.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:34:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chintan Patel <chintanlike@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: fbtft: Use sysfs_emit_at() to print to sysfs file
Message-ID: <ah_Y_Y2RtqeGxchF@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This scnprintf() uses the wrong limit.  It should be "PAGE_SIZE - len"
instead of just PAGE_SIZE.  We're not going to hit the limit in real
life since we are printing at most FBTFT_GAMMA_MAX_VALUES_TOTAL (128)
u32 values, however, it's still worth fixing.

Use sysfs_emit_at() to fix this since this is a sysfs file.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..343545e83a37 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -98,7 +98,7 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	mutex_lock(&par->gamma.lock);
 	for (i = 0; i < par->gamma.num_curves; i++) {
 		for (j = 0; j < par->gamma.num_values; j++)
-			len += scnprintf(&buf[len], PAGE_SIZE,
+			len += sysfs_emit_at(buf, len,
 			     "%04x ", curves[i * par->gamma.num_values + j]);
 		buf[len - 1] = '\n';
 	}
-- 
2.53.0

