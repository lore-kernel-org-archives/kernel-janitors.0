Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A81A08A6
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325252; cv=none; b=oG1t4DZrNtfdvtBH3Zh0OsWrOI+6yQ8JRnNvj7ASZR4QPyhmHz8QOxOwg0a8xBAqi8XyQLxibcK05GgYScXb1qEdpFcuxUDDLBXRsVpyL9q4Q11noxr4UJ4jfkVlC0PjSCpeRLXw07Cm/Q82Wwz1ZqQYh0Ddu2pIyvk7RXnwdyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325252; c=relaxed/simple;
	bh=HjTMatqeqVA60Vr2vbz4oeS4Caye/UgdIEnm2hUQ/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7xFdyo37sWY7ZL7cBgsz8q0g8KfL/lg2mOvgleIr//3VeEICruT5qYX1mH5Tzz2FbbbMKKdmwaCSdPdy1f5OJybLLx7Hpd3ANwkFgckru+LzA/SWC7duwQ/jFSR1Yca9ZQuHhgbktcIs5wHc1y7cWqNTD08ELsj/gag769EHGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQMrMWvx; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQMrMWvx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-602c3f113bbso5399411a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325248; x=1748930048; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMBOVGdnQVQ4NSm9o7YnP9x3OdPGFH+Y2T5UF66g6X8=;
        b=RQMrMWvx4fsspDWHyLKJkHMZcDB5yWogw/Wo6jgqUL47r2qJj/zmYDrhqm7seVX/nP
         3rsXu7PdhmUICkx+WKJT1R0Cm1ZzLzNI6uqBMm6S0GmAjqpU2/yHWnND6YD0XgiFAZjz
         2zvdR+CF9NS7wxNUU1Nf4ZPQfAQ43Qbno68xXVzZyxjnbFhFiVtUB6e4QWLCBvTelmcv
         2Q3HrMl2a0de5WZrKo28y+3Xi3JpsNvQCln/PNIYwlTKWvdi7Ku7fjJasGOEU6ZsBTzJ
         MXoqcgI5Pr8wmc7XRrAtJ7VRR1aDmR2x8NyK5L/vyuGhqmSq+mLaxEPmJqSc2qPKG0IE
         /ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325248; x=1748930048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMBOVGdnQVQ4NSm9o7YnP9x3OdPGFH+Y2T5UF66g6X8=;
        b=d83RoStj9UFfBQbOV+4QqgDlDk7m1yqvxxRudOJl9kfaPNwyJKrOiMFBJPapfzwWnC
         a4QtQ87lcFw0LEZpYFlY2wV8M1Q5bgIclEDMrJ7w7KxOyQucQsKWkuJXj/NMNXQPjy3r
         7prsa6Yocp/9TDHfSYIs3JpI/akpfCNPuIxj1m1IeAYuLx88ReK/jsr1wSBPY3Qwiekf
         pFJqiOQvIJdYPQkx2K+w+rUEY8ROyvtFoCh0Z1nShYADjiO5/xaN+DfIqhcuAeo2bRir
         cZEOwdxou29m00HyWRrPS/JQ+/nPD5H5MCKjHiduhpPADkn0HahNvLvmhTW6WVzPyuwS
         HbtA==
X-Forwarded-Encrypted: i=1; AJvYcCVg4mh/TxQC5HGXldW01B8ewNqo3GcWBhow5kmDC+C/dKGQKut9FQRx7f177V0Y6s9d9Wyy/Py5bz/9lSQyiio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMW7sc/tqnpPPr//yfX4pkFegHBit2Qdaafz1hOL5s9Po7SNg
	tVk6CxMcYFCUqaQwIlvd5iOCI3IJ3EnWGYql3O06TIB+gBijAidzFwVvI6HFVfJy40A=
X-Gm-Gg: ASbGncuURTBwWuP79SI5XJ1iAc2DJncM9167kEH3s0BHDft4zP0OksLc+rXgmWzeMEM
	90BiDfHiEd5tzMyZeE0smQfrjyD5DDYOjdwXEwJVPBDvgwWG8CeB2F7zcSZW1C+J7m4tmLzn34c
	+/gBZop2mGLNe+fZ4RrBF9sx5kaVirR6kTu2C5QFTESSZGOGkIitnXde36Jg7OaAkOPp16KtwMQ
	ZrhBIPOLMsFO2gyh8SrUcQbTmPbTtluWASIbusGMJwSgSQ/WE0CI+mEE6q8kunPmkNJarZO1PHw
	Sx27fP74tm4jxeFXya+CPrlNtLt8WwLJ8TcAojrgFmsAQJg0ljj4XUT+7kwZWEQk1+EKPSYfkrU
	=
X-Google-Smtp-Source: AGHT+IG2ab0KIO3Z5oiiNuKbor1U3QysoZKdFmQOlEh6I2uRnGXcGTV467zCuDRfsK2qo6oElSKgYQ==
X-Received: by 2002:a17:907:7f17:b0:ad5:2137:cc9e with SMTP id a640c23a62f3a-ad85b120246mr1089746866b.3.1748325248139;
        Mon, 26 May 2025 22:54:08 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad8816eb7e3sm171917466b.50.2025.05.26.22.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:54:07 -0700 (PDT)
Date: Tue, 27 May 2025 08:54:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tony Luck <tony.luck@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: MRRM: Silence error code static checker warning
Message-ID: <aDVTfEm-Jch7FuHG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error code is not set correctly on if kasprintf() fails.  On the
first iteration it would return -EINVAL and subsequent iterations
would return success.  Set it to -ENOMEM.

In real life, this allocation will not fail and if it did the system
will not boot so this change is mostly to silence static checker warnings
more than anything else.

Fixes: 04f53540f791 ("ACPI: MRRM: Add /sys files to describe memory ranges")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/acpi_mrrm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_mrrm.c b/drivers/acpi/acpi_mrrm.c
index 2f22f013959a..70088cdfde13 100644
--- a/drivers/acpi/acpi_mrrm.c
+++ b/drivers/acpi/acpi_mrrm.c
@@ -156,8 +156,10 @@ static __init int add_boot_memory_ranges(void)
 
 	for (int i = 0; i < mrrm_mem_entry_num; i++) {
 		name = kasprintf(GFP_KERNEL, "range%d", i);
-		if (!name)
+		if (!name) {
+			ret = -ENOMEM;
 			break;
+		}
 
 		kobj = kobject_create_and_add(name, pkobj);
 
-- 
2.47.2

