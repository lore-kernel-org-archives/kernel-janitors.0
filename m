Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327F1AB91B
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873404; cv=none; b=i46rWW7cwELpdzmiG7rA077dIuCEXuOj9k36QHwiNiau6ThUD5Oe1DPfVdpqWZZwCvvjpt//Bhr03TvjK/jQX+xV7k42O5JWMS81sBzJJojgHKpjDpdZvHB41/RhOjWdkqTtNStUy09f7PB2E4OCKaa1hy0PndPZE9HW8UZePzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873404; c=relaxed/simple;
	bh=E/xlmU084aOXXwFw807wZImjGPqm1ANMchdMOU8QUug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7+oKMZJaXU9WX0HHYo057Gf9BkGVXe2MA2rR9opdJHKgldgzyBVxPMBzsjMw2FwjG54uyulgtnHnaxniTShu9xdKvRnCpVdQG8iTMVf//1Yl9WDvbpvB0Zkq6aK0rKEiN002kpo691NIfSDtxPr052t/5a8ojPVc7/XkeFj8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7VeeHkV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7VeeHkV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6fb696d2e5so65304166b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718873401; x=1719478201; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPUY4GnBpPiQcbABkIr/cid7Dg+9bQhVw0p/ZhNJByA=;
        b=X7VeeHkVNnoM4c/vIDPSHLEFNAAE4h9jolRxuo4ZEwsFzcqN+IX6rwhyn8CUVcnBIK
         Ljoq08b58s8IVqjm/YIRJqY6l/ZxLVNhufoUil9vwHs2po8Rtn7Y8FaxVL6OeAt7/0ZI
         AcVuC9RjRbP4YPbT96GAyM3SlWQmbK6ilbUTPX9M2x6p79SJJ700XoHAigMkqt698fWF
         CE2HNrthqHlMWLDNqMDYvVBjEVnZpYCFvhqvoKxYM4phuyg0YwnIBEU7SrlQEX8HwgT4
         /NH0kKw1qGodIboCMVqbdaoecvAIafSn6rOgr96Fj5BQc/Dtn8eQEOCo0MtZXW//9izk
         fICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873401; x=1719478201;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPUY4GnBpPiQcbABkIr/cid7Dg+9bQhVw0p/ZhNJByA=;
        b=Y1YY7mRrka2+16EpQdx/XVs0IMQSUs21G9qnD76smuujxeUxDZIsFHuy7a58i4l+pp
         9h/D+SjQSXdmxMg8UrTS+QTq5NFpKdj/zKFktPEKj7b+ABRs9zLTNh+lP/8juagG+G3z
         +RXhXIBrEWcpwGXscfi2phN3q9rPpgqb1HJt0cD94tKC7teo/rfdTKhyOTx4JawFwqe4
         cJ/X9aMV+WGoCU8nwwS2czA6aj+DJL4W7QAPLPZrfhkOvJFCYNCv918HP8Knpk0l9gEM
         HB7x3uHNaRZW2qApGduMIt2QwHTbCnVVWwVq4kRBdTXiTC6TJ0nghWdfOZRiOedtVMiL
         mD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXrjMq2u7LXNXtKQMpGdzWxuxxiD7f/4TRXmhsp17ax3Ke1X9tZQLPE+mxe9HM6uN/v7CkfC50qd7YnAenbSbH6N50f+FsstZoU2W3TvZj
X-Gm-Message-State: AOJu0Yx/XlpQ01goJDZOJqJ/kMyo4DCfunvIAQKziDJBFv0mtDk0tXZB
	Fk1N/QzdiUAXE/ZePD/suuwaBXVXeQv0+/YmvUB2YO4ZGeDpB3c/P1RgYDDbvao=
X-Google-Smtp-Source: AGHT+IGeRQpttQkvdYS0dTEFzVkziwzBfpxbBi4M6n3CVQkw5KiESUy5y3Tp6fSmCv99sCUYOBBX3g==
X-Received: by 2002:a17:907:c70d:b0:a6f:1045:d5e2 with SMTP id a640c23a62f3a-a6fab60b27amr291477766b.4.1718873401051;
        Thu, 20 Jun 2024 01:50:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f377dd8sm694535966b.146.2024.06.20.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:50:00 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:49:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] tracing: Fix NULL vs IS_ERR() check in enable_instances()
Message-ID: <9b23ea03-d709-435f-a309-461c3d747457@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The trace_array_create_systems() function returns error pointers, not
NULL.  Fix the check to match.

Fixes: e645535a954a ("tracing: Add option to use memmapped memory for trace boot instance")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 71cca10581d6..5462fb10ff64 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -10507,7 +10507,7 @@ __init static void enable_instances(void)
 		}
 
 		tr = trace_array_create_systems(name, NULL, addr, size);
-		if (!tr) {
+		if (IS_ERR(tr)) {
 			pr_warn("Tracing: Failed to create instance buffer %s\n", curr_str);
 			continue;
 		}
-- 
2.43.0

