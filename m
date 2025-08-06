Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29FB28BABE
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Aug 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480781; cv=none; b=UP/3DWNmpSQ/6k5av09n1sfIMYihqeUtA2AJCx7iLWQIZs4KFoQ2ib+fJIz89hNvfxL8ilENWEzrU3E5KFrRWM9Tu0vApXUUh2fktRH6CDitsPGU2k7VNrhGZ8ZBAERCde21Ti9DgRff9Vlu0zogeQmV0QzzcdwZaeoce5r/wB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480781; c=relaxed/simple;
	bh=Fxa7WIPYBSoJoS4PyzclqGgPzfyBj56GoeXvqUyHqOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l84W3+A10iNSTXousYJKToVPATQT2AnMcS6b4wH7vF7ISL6ZXLPZ8pLxCoky0ImgjAvr7H647jeAkDoTTdInGsDigCOSzbz+qLOsQruNaVKQocHpmX/ohiHhA/dCKQegDzlzqfsxbqS0QJ9l3GKd7uK8OISZZFE8djxRx+nN7i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwxsbImP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwxsbImP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459e7ea3ebeso1804465e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Aug 2025 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754480776; x=1755085576; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/knRBN0t/PO4IhYBTGlAeQhM5GVK57F/vQLxJJzqBM=;
        b=CwxsbImPp6WIQGLXn0TBN5aWS1rFGXz0ft2VN9qFLrkdiomrOLnSvqGyXn4BocT8H2
         BUFwB3oGFEsjJ3X6zfGIzhSnWeOt7FkBSZQiIdyOt2wIrdeDPznKL8zf+utah2picdX+
         Sb6vv+h7FFYoevDgGamFvdEc7Z9PPEasS1wHvfDO5s+vIyBsMcDxY1ZW09qEdxCYIXWP
         AgsMwuZeIzX6ATsoPlt7vc3uNzLBgdeoAo/EC9ZP2XpLkv8ou5+wIewTF/5FKbl46r1A
         VdMRCihCR/pU4Fp4p0iwiC0GfOqu65H7nr7ho6+5Ual3wmVTszLg/WVGP3X42KoD8wng
         +ACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480776; x=1755085576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/knRBN0t/PO4IhYBTGlAeQhM5GVK57F/vQLxJJzqBM=;
        b=Xn7N+Lrb9mvlMqmNeickAROvr9Tj+PJNof0WKfIrXaCixJ61fq5VgNQIh/UxAuoVaY
         NUfW7hiut8p5RGx0KrRu/AyYT3/TGcNI9lT3Zk4L66F+5EGPb7PCJ368vw0nCjwRnWgg
         BaUxjGCXWxfevPmKh8fcFxYdcngfwIj1uhFTkY3yEz1Ls701LVQSK6nNRn0d0rJTwzNR
         J+e4qW0NFpYUWRlMXDB6INruoudMjMUxVUXPAIiKCWy9VsMu9okIpO/Hk/YNbpwU/IXl
         0QDyMLi65k/lflYJpaGeJssN7VrcQrkLj3oN/IPqQM0e0pejedMzYrYp7Mdj/58jlLxN
         2O8A==
X-Forwarded-Encrypted: i=1; AJvYcCUhYA74bpeFYAZ3qmc+Fq0le9st0OZIxxGVbIf8Isc35AfF4CiJj2ebckbU9KEqmLEaZ6psH4pZ3GhQHngI6bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOiozsg0yIdq25H2glguE/eXkMo9Tny+moNygViZD8QBXCKby5
	HdaweW37crpmSy+EZyxlKr2iRjps7ZiYjCFKDhIzJrM5AYPKLK/JhsWLCi8Llu0HNrk=
X-Gm-Gg: ASbGncvEMRa9Etw1/whLoCzHDHqMjXapC+bIxpSxKRbrHycRGKyZkMy3dvj3qKuKnoK
	/dgwovQ08r57W9qXhNf14pj4dJcwauJWYHOuTqYvTAse2semZJ5oTNF8qY4oyV/XpebQvgQWHgN
	nCxjHMc5kh1PJH2VmMVQ8r3vm6kZV0pons7eAJv1MhqUKLV8xZ42dBMEQahXbsf7PpD5SV4k0+N
	l4MAflR8vG8NTqRrwAvGpo3H5he0P7e6K69Abq1XrZEvNYwTzuOrCZ1k7LSp7UpLR0h2OC9H9mG
	PscMTXJw4/9b8hwqUPpmg/eJ056LofbUzqKpTGDoziIukN7npZs9/pdTfSyJQSUQJ6hTeJkcgzL
	S9RE2bYaogGba6+NMlfJvfzcWQLvhXWtZpjwBWA==
X-Google-Smtp-Source: AGHT+IHp4t97LH3g3myvsPF/lVT9OiZdwNWuTbfp/8P8OoiBNQhRDIsU1Ck8258WRDJRYx8siI0mmg==
X-Received: by 2002:a05:600c:474b:b0:459:dde3:1a37 with SMTP id 5b1f17b1804b1-459e7103474mr20600785e9.25.1754480776097;
        Wed, 06 Aug 2025 04:46:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e0e70218sm75901695e9.20.2025.08.06.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:46:15 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:46:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: sysrq: delete unnecessary check
Message-ID: <aJNAhHtKkhWjosDV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code checks if (write) is true twice in a row.  It's more
readable to delete the first check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tty/sysrq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 97f8a9a52285..1f78b0db3b25 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -1133,8 +1133,7 @@ static int sysrq_sysctl_handler(const struct ctl_table *table, int write,
 	 * Behaves like do_proc_dointvec as t does not have min nor max.
 	 */
 	ret = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
-
-	if (ret || !write)
+	if (ret)
 		return ret;
 
 	if (write)
-- 
2.47.2

