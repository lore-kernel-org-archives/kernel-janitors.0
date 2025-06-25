Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE992DAFC1
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865010; cv=none; b=b1Y2lqdKTCFnsCCqBl+MbApqju6491XEfkFBrPe/IYsqdJXHbbcYKUMRVqV/pJPAnS9gav/l7oWqOg80RlT7PzgOC/2GGga53muYb4U+hADAVFR8loVUF2cnr2gT6a7U7n/aqD24BvzcF65o9PMZSqycFHjNEJ6k9nNUZ0Tzdns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865010; c=relaxed/simple;
	bh=5XtjxA/sFkLGx0MrFCZy1IwBNpCsiboRk5u0NA3i6Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fkrYKJQPhJJY8b/Q0+N2CIgQOWL9ovy4Dfq85wdK43EwKcU7jy11WrbY1GtuevKwPB1W26Hm2gq7dwZ63aJcQrWNjJMhLPaTw7vhH0djYqCsMbu2FB6AjYrsHvy5x+Lilu82sOa1/ERj2hNrudJLMz3dxfklNqM+IxIj/z+/mNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djEyL1xf; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djEyL1xf"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2efb0b03e40so16237fac.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865008; x=1751469808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URcIX0mY/nhVqSMfP55/sPY1bEZRgky9TRvamUcBG98=;
        b=djEyL1xfKYOING1WtmLgBb2CQjgtw+l0VS+mQT9NGVtVrWq7fVe5q8QhJilw/lHjhy
         Rv9+UVrP1j0q+IK7Pp0wE5REhl9RwHWfp+piIoMFHJxzbs/jhWU7EVFj4lJC48YtzO/i
         06ZdqCnKE9WnzaIlbF6B4wpkUd00+yQHf7h8UedakoW/R3dXiuNqKQblcvviEltAg24y
         wEM4932hr72dNSo+3IySjx8yiRohk295du38bGvaPc3+EuGdMaBsBUnPd0kMrnNhzUDK
         UP5RtZMziWuSVdyNkRRrUOmQvE13xs4P60eeNJRRRAmYIIcLA8+CUZLbpcN48ECZODIS
         XE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865008; x=1751469808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URcIX0mY/nhVqSMfP55/sPY1bEZRgky9TRvamUcBG98=;
        b=XCA4klQ79F8k+Q49+Bfy67pqytrMmdK4JqWs3b+xMPYKxmcf0LfbpqPwLWPBh7pESQ
         bNXNqfXRiX4ZpiW11ro9UejChM5H3NldluyZ0AmTSVrjbtoTBwiDKF/tVd6sl8k28AS8
         LbjaBKmbTG34eTfpW+Lre5mmrJl4SOQxYlPVwNbRi5pID8zIL5Lj4yNz6ZG63uUuglLP
         Kh7zta3DCtihtWdQvoA5hvRDfbgcLk7bt0MMrxXpAGvjZoffueBTQ21xqmO7lL0edALL
         qlzmE0yti2FAhmF/cuDQgQsKtW6BXpXiTE/I9d+1bIuSywRjFYQtU/0W4oWJ4i9/+Ngq
         8i6w==
X-Forwarded-Encrypted: i=1; AJvYcCXwT7scMlZRY7ANPR9WcWFZ7z3M6EeNIDH+FUVMfi+fVRBq3AhCdgO3bwoeLer7GsZPH1Fphz3M9fiejiU3SFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOnrpsOoLibHv2jxwQ+FdtW43JAIWr2E4F056BRmsywjKMErM
	VjvLI3q5ME0HbJrPEca+ZLjno3czUsrFa5Jdvfgn5J4/OgbziHPIf0/1gr/HTE6HmJI=
X-Gm-Gg: ASbGncsXgVLRN04+aRfwjvLW6VlPgvgh60sQ6XtxEooQJFS3+uR0m0Sy+ee/Ov3ggqy
	UpKvWXu4iewfU+QFKYWRVWAy/ifDb7y+lJV/dQi96lcA4YCBHjH8GqnhbNrHuMKp5Y1XehlRqY2
	i6GcW6E9ipseYpmIXjkyYD5R3Eqwi/hJHfZSontJnxoizd2+FLtPWfLAMiRG/UxTVQ906NUVU7o
	e6Zvyrp4OJlSYHVMqVKjuGyF3v42vddiC2w9HaMvap4677CLKLH3LEG1/iiDmiqjDGZOrZ0UlT+
	XpzED23dzFbG+O08HTvjINLTX26t0sy9HiFli4wTXHOAPvCQRU4HC9W9lh6aUTmW6V4xtg==
X-Google-Smtp-Source: AGHT+IE78ssGm4pxFnUIN1SeZUSbBSiN255lPYOdn0sAye7rxVXzd1Y/pn+8ekMWbb/p+HqcMVQI8A==
X-Received: by 2002:a05:6870:b015:b0:2c7:6150:fff7 with SMTP id 586e51a60fabf-2efb2459f79mr2603151fac.35.1750865008000;
        Wed, 25 Jun 2025 08:23:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2eead8b1a05sm2570977fac.38.2025.06.25.08.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:27 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:26 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
for that.  Also leave the last character as a NUL terminator to ensure
the string is properly terminated.

Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/apei/einj-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index d6d7e36e3647..e77c0d4b4ee5 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
 	int rc;
 	u64 val;
 
+	if (count > sizeof(einj_buf))
+		return -EINVAL;
+
 	memset(einj_buf, 0, sizeof(einj_buf));
-	if (copy_from_user(einj_buf, buf, count))
+	if (copy_from_user(einj_buf, buf, min(count, sizeof((einj_buf) - 1))))
 		return -EFAULT;
 
 	if (strncmp(einj_buf, "V2_", 3) == 0) {
-- 
2.47.2

