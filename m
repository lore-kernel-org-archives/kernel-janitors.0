Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34C22D8DBA
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877877; cv=none; b=jzBMe1alYxQxUdHiSrrcJqYi7rTd3ohg56dVHRQiIR1NEHngYhcGLND9oH0CSLGBlCUK11WG72GE0lV0YAuASXcaydXNhANi9S3c2nXbTDNIvMQKnZHWCzYHsDf6eo7qUBRdUA6hXHM6niXV7v4abT68zJzHaLQEt3OG5fgIPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877877; c=relaxed/simple;
	bh=H1nIbQ51LzP26r3FyzLrx1fsskjj5Fl+oqqOWgYj5qY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnFPqOz2xPSVGsvl9w9S6wa1NJxSmvr5JCktLSVScwgYxAoPWcDBVTvF0m/9Ycn5MbnqzQjCbq5nNp/5gVbjFSwGTNtPAt8XmbXkorCRFRGg1sQbUQwZCiWzex9nWApr4TVvPFt2WzEZ6rqJTHdgeNCuPTfV7fNbAmOqcrDjxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHHjHwSr; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHHjHwSr"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73a64e126d9so53890a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750877874; x=1751482674; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idFC2oFkGWkgRu1swz+9drrbnHgsETd3u3GhQHpoMnk=;
        b=HHHjHwSrydboVMDa2KX79ePXIg1CVsDYFiCuZoLTLipxPVDK1F/H6ny62Ygv6tAFoN
         NVndEogNM3uQeHw8P+g5t/M8X22wgaAoGEqsljiRth4kOXywyL6YBgL/27mffnC2CewE
         aQEvQwG7gLqrvrhN2xm8BW7pnKFEZg0e7zLcSw22HGEuerzJhVuLAw6oYq9Jr+cekQBE
         BnluKFVBqLP3P2++GgAXK/AT27XEqxkXCCiyhlzHfGvzJ8gaL2zYdmkc/7DRf4VwRKxC
         OmeUVRek9IYbBBpefc4jO9IcHKAQinVXA5+xbE6ximX6SHpK/Y+lIZw+mBk5bIQfD0Lb
         HkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877874; x=1751482674;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idFC2oFkGWkgRu1swz+9drrbnHgsETd3u3GhQHpoMnk=;
        b=DCC9oT9wUEJyfx1wqe4JplLfiRGk81PiJzxFARe3yUaeqpJfHmjr3aujhmR3wYScOp
         KLWPY1npXWuAUZfNWeTiMCalW8DDkSEZfpZMVh2s/0PhBKIDpA9ETeLKP5C279/Qcw1p
         EHXBEleGpRMr8WiVVMA7xB0DgHePmEMDp9/rUrO4lta9JcNBNyviYPo9gl2ePlLd9PMS
         XeKy9NW33k1gTkqjWdcnZO9UxWbPhwz0d+rbTtAMbdnbCcr/xNQM4NvYTOrRG6A5ikKC
         iHKvFQNewAHpMjg8NfpnsOcRyfL6CtrrX/Ax4u7RGpIcHgC77v59IgdD2bAcr34FopQT
         1YTA==
X-Forwarded-Encrypted: i=1; AJvYcCXhVEKcQhbTUh23FbYyQug27xVfFGKHXtgWBiuTFMHuKLIY9TDuaS0OKsg1aqpCf9XD05hGZwIWh+J25J55Rv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTh6tzgqIHyKTO8imWUAMFlr9/uQs2sCdzrcZrO/+y6c6gF/wp
	YiagFN/F4ZKScwagEEZCQ55KRD5x+deU3EcsdlC/XV/PHHEwd/d7mTwfP814a+EBv68=
X-Gm-Gg: ASbGncsuilIHieShcd4diG+BNsvqqEJaXp7/RJprKFC5Jsmv9TD98x3qxxcrD9Ilb/y
	6NVtYv43ngQw0cpU9hkW1XHp3aWNI3oo0hTrK5H/urk965HgVbWbcLbVRfBgIDMvSmkB0DlY8XL
	VlIRmv2Tz6eB3QA+txDa+UzKWexWPG9tfa1o3i5g70OEwXAfR5EZEcakHN+VyewLnPsbhF+4jOn
	h/HrFktXEbhPlk+yvjoUhjSvaanVho6zsUkL/Dzl507nTrXy3lgWgBrwnOyQutbjoN3WPbucPfL
	CpmgeQMSHbq/ij4lmNJTVlRDu1qFP3MJwkabRo+6Mvxnq9qE7QbH66GFGzKmhOApF6MNcA==
X-Google-Smtp-Source: AGHT+IFULxSdU/YC3cPv8TMpcR9HigBXOMNkhwUT8MmP1kJ8gCSc2YxGcMd40BPtiHnFyyub103kRA==
X-Received: by 2002:a05:6830:61c4:b0:72b:aa94:6d26 with SMTP id 46e09a7af769-73adc6fa96amr2404587a34.18.1750877874602;
        Wed, 25 Jun 2025 11:57:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90cc0257sm2284326a34.60.2025.06.25.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:57:54 -0700 (PDT)
Date: Wed, 25 Jun 2025 13:57:52 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <ae6286cf-4d73-4b97-8c0f-0782a65b8f51@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "einj_buf" buffer is 32 chars.  If "count" is larger than that it
results in memory corruption.  Cap it at 31 so that we leave the last
character as a NUL terminator.  By the way, the highest reasonable value
for "count" is 24.

Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Style improvements.  Add a comment.
v2: I introduces a bug in v1 because I put parentheses in the wrong place.

 drivers/acpi/apei/einj-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index d6d7e36e3647..f5cfa6310f0e 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -826,6 +826,10 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
 	int rc;
 	u64 val;
 
+	/* Leave the last character for the NUL terminator */
+	if (count > sizeof(einj_buf) - 1)
+		return -EINVAL;
+
 	memset(einj_buf, 0, sizeof(einj_buf));
 	if (copy_from_user(einj_buf, buf, count))
 		return -EFAULT;
-- 
2.47.2

