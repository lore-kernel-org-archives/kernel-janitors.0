Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6B26B2BB
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622731; cv=none; b=jKzIIIhnDKuY19USYmdlVmuNl0uqTjFlJu0TZIokmqhNSYEAP8Qb29htheJ4SJCE2eh1gRx9KqyRsNn5Th5aqC0Smmr+MhZBc4dyYSah5YlqDXc656oImR6kTGTpDQYBLQhBVJu0X7Etw3ql9M+rTLtMujnK43ublaEOTv0qzxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622731; c=relaxed/simple;
	bh=kLvE+AcQ7KclAv7CielxLyfFdipeQ4rPi+ta2syVAQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0AfcderEFejXdKCZ0OJi6cFSWmNOEdGer4hTCeZFL5QShqCPG9kF31MMQDw52bKG8kTJFhCxdMT2l45WtLduGfS4Q04RN9vLY8/cV+GfnsGg2h9tlyXYgaJ5hDuNONBcKdazMqn+pKMqtUWFwJ4Q+6F2W59O+bXqzY0k2J9vBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9xUNBW8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9xUNBW8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso6172715e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622728; x=1747227528; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMMK/d2axOKLC5tTJ+JlPXs6gQ6r9aAexX5AFLdvVj0=;
        b=a9xUNBW8KVh9W3+Fs96HHSY1zabHDVR/vjn52ootqOoNOOcTSTRT2E/BE8Nl7D2yPz
         NzCfh67OVkVoPJrz/nL9Vr2SjdX5UOP0FoyazPWHY0x2NBmv+EdMV0d3q6Q5sZC+C5eT
         DxxSBlaRMWf4VfFLSRGiCKHMsWFx1ZpYL7xomLY0N1pdwCLDV0fHN9qGrpuTEpr9xxHF
         mwpCEPU+cQV9jentD7ELCGmH7G0Ou7g3sBtCRHOAy5anKv3JmYyK+YhpJrfwtSz91Pgn
         caDUrJKZeMoga59GMUPfNorhgCLIs0Gf4nQcEpAORi9TFMSWi1+ntgS5+NfvxJp0GClR
         pVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622728; x=1747227528;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMMK/d2axOKLC5tTJ+JlPXs6gQ6r9aAexX5AFLdvVj0=;
        b=tvJ5N/v2pf+u3Cf+Ynw09nHhTpu0WXwrBOBOOfL1myoJIonnLsJSs5U5+veyoTdmtZ
         cZ4Uwe5B3kwuc6/AhnLqt8FTXj+l2mP7q+/aIzkt7Rz+FTH0j126TJ5luzcHOWpQO8Dq
         kIntRaCmoV5n7s0nncGGiQDq4kq0gIJADcICM4VrP9zg2JQfxYgQHPr+M3kVcKslf3md
         gnXaVt5E3W8WKcOg7PT8zfLnKRP3umPQkzZVHWlWEcnV8G3wT5ql46BYVI1kr+kzdCOx
         ipiEx61CXDMbekl1n8f7PeZht+5w/4fYTRvQKTVGbqgbF5/+jgZAqFB3YL8GnVIkXC14
         /wJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLJoJdxVE0+zsphm4nArbqp7ihIzfbl2ZBe98beYR/7Z+mrOzYqExsry2ESEh2KMJRunJUuqk32hRJF0ip1kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHbpwdcRFk2IrRyQxe1yevGeqR0DgV/4Utwt0Dq5RHoWGH7pI
	xJ3qMJCcqjGR9IVf3if8qyW1qJ8C7UAgUaOElZbPoZqsTi2R71XkLbr5/zKTDwY=
X-Gm-Gg: ASbGncu2HIiaTXlJ9SRUxTSr568K7j2w+uTjp83PXZL6e3ETNu7rEemGCXlL3uovZkQ
	wn/BbKltjhXOs6wLL9qw9TTVTCZnPXkB4fbcwH2eFoCiLWqAUUVLn/uZr0k0cyesn7DeeDhVVwP
	7dQFEH2YKPk79BjSHO0yDBnLyWusGpAqa90HhrjXOX+LVYKmkW6dVRouCylsU7+DiblB5xmolKE
	unrubUR0oXKoLJmTUjV6Wn5vMng/e0wzbTo1W+CToX1IYSvv5MuIvVjBvvWYEjzEF1HhLnMLlX1
	TGlILMGhOLsrOHix8t5eQi0ZAttGs25QWrnRK62GjsaYrw==
X-Google-Smtp-Source: AGHT+IE4dg1iD8Jh0/+u9rOcjTZlp+cpsRPBXdiWezNvsMSF8UGKegnL4yKGdB2gFXo4NEeCGnmNEg==
X-Received: by 2002:a05:600c:8216:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-441d44c7ea7mr29810645e9.17.1746622728077;
        Wed, 07 May 2025 05:58:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd350d96sm227135e9.18.2025.05.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:58:47 -0700 (PDT)
Date: Wed, 7 May 2025 15:58:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: dasharo-acpi: Fix a couple off by one bugs
Message-ID: <aBtZBLNXxaYxMIMr@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These two > comparisons should be >= to prevent reading beyond
the end of the array.

Fixes: 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/dasharo-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index f10f52e44641..f0c5136af29d 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -101,10 +101,10 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
 	acpi_status status;
 	u64 val;
 
-	if (feat > ARRAY_SIZE(data->capabilities))
+	if (feat >= ARRAY_SIZE(data->capabilities))
 		return -EINVAL;
 
-	if (channel > data->caps_found[feat])
+	if (channel >= data->caps_found[feat])
 		return -EINVAL;
 
 	obj[0].type = ACPI_TYPE_INTEGER;
-- 
2.47.2

