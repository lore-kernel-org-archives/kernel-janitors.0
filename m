Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7FB2E0410
	for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975972; cv=none; b=QCksZY1RfSVA0UHa0+Ys1RHM1YdJShzYt5BryHMREjJyrNz4kZYlm+rC1B/lbFYFqwRjVo/LzviE6fq78UC0pntLf8yh1MRgcWPAJr+A3wj2cTD1u2aznwqUag1Af6lw8T9ItDh79tafEvOCwf/BfUSbVeb2aUHxwWIGFNxMc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975972; c=relaxed/simple;
	bh=66qh/i0NMKkwcPgrGlTEbt+Awt4CEgq/WMEYPhmYS8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCVI5WLGQ0DuVDOiOqHyxXtM7SarGhKbH4zpkVk9KeDajVOqZGMIePZQwCWgspaU8QnMqwHNn1GrW1F+FfGxkeJbpILXXORcxmS4CK5HvSC4siZK0GiOhqpMbhFmeJo09iKp3sHvwHi5ZHhFTIsMzmgR3KQVp/R1SesyXuHSCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpF9n3jR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpF9n3jR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso19401455e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758975969; x=1759580769; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1CQFEKaI/Sy/SZOKDp8joIn6sS6FqYKFWGC9eEth2o=;
        b=TpF9n3jRkox/8EYXjLy5DiJfrTfKN63C5ibO52SuxO/6yNCXiA8ZByLfHRAG4wvXlx
         goLZZ0VjBkeLFpQUps+1l3n/U1xNUE7dU6vL2pczGC2KV2lL733uaah/yiqW2Kh8HIIU
         W4cP8ix4SsVrdLaKLroxiEj7AQquLn5VlFrpF4MDYMjfEPnr+UcPrBC/nNGc4M9EG7bH
         /UcVZjSlSJbU9w9vwI6hgg0/wCJd0x2zgxiTm3T7EGtXg4EBH9XDuiEsJ+2mmEkAYHVt
         jgZzt14KzHpXj0gpcfVj2Dx0o8MvcGVkMuIBKTsYQ+XizhAQ6J0Gs/qKVpuF1LSYrH8z
         5f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975969; x=1759580769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1CQFEKaI/Sy/SZOKDp8joIn6sS6FqYKFWGC9eEth2o=;
        b=QT96YJfKyI86i8jrG7KH1ulkxO+jPjEyp4+zI0WNgDwP9EUk6tODbxQ/Be3AAy0XG8
         qY4BffSvsbmuw5ZmigV7Mz479nbFDT6JIflKcftPmtl8Ip8EDV5HreRlQ4ybK1Oljjm7
         ercKjfggT514t+ApT7C4Jgfa7G7s9CSP+wdnkhe3TGnukSJpffa6TbBcCKwlM2x8RE2A
         RXI/MQJQzhDXvJYSauXqBmMMSwpED7GCdtZza7KhBBfrXBjk1nAGa/yY9qz2i1zA6VWp
         iGUG6JZXnqrwv+EH+8TLRArSoDYKxRlpG5+u1z2NlHKMUcmo+0DQnmwFl82kFcDPEk8e
         H3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+q2FJWnQe+ACTAHhRuhtolcmJWKwdU0FN0eM3FuCT60a+GGJLAmPdAz+aeFDlLtdghDNjcQU6c8eqKNQwxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXX4LSXX8dr0Wp6WDC5z/pN1xfcl+dJR61zgB7c5t4u1xQzTv
	GE+ZwGQSdD+5fTt+nx03ZPCppV69vjz2SsXOEYxra/ZWToUzX+OqPLJif+BFwBYgmN1W8oJJWLZ
	x0SF1
X-Gm-Gg: ASbGncsbX9eBSOsTibLEzG+scOf6E8nfqE5r7bUvTGoCIUpM7cRy+n8fac3aRvcgect
	QxP2A1nHWgeeuBHFWocW+cjbgbqLOw0JAcyYrm/bmIyJDXj/SrPGlj6P3sIYSZ3hO05rkELc3xc
	G/5t5LHiN767mb9lLkPFYadRbcK+2eLXrlaV0YFolXVz6FzqUKqF9sz9od/6e7DBbdDHrUkWZaU
	igjw5+w4wnkRL8HSh38Sr++Hli8dFJUdR3OKAANCEocXqNC+BQdss7+9HcA0jsp0NrEOy4Y7Baj
	ZF61NshEKU7E+1h+6wRpVDFI/i8lzKKQfrlzj3rrIsNQYzlN7P2Qb2LiYVhU7jEqEky9feiAV+l
	r/BsdGsSGGw0Kwekdf+P5McWnBmjzDhIMk/+J8gZ2OqcNiU89KA==
X-Google-Smtp-Source: AGHT+IHsxb/x4MSuZGgdkKW/ZTkoD1gTaQGZDhqAYNlhS+sWUJEsl7l8ii9uzN93TtclonUe8lxATA==
X-Received: by 2002:a5d:5885:0:b0:3eb:f90a:f6cd with SMTP id ffacd0b85a97d-40e49e728c9mr9989172f8f.60.1758975969377;
        Sat, 27 Sep 2025 05:26:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a996bf1sm154772885e9.1.2025.09.27.05.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:26:08 -0700 (PDT)
Date: Sat, 27 Sep 2025 15:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] irqchip/aspeed-scu-ic: Fix an IS_ERR() vs NULL check
Message-ID: <aNfX3RiyIfr3A0ZG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The of_iomap() function doesn't return error pointers, it returns NULL.
Fix the error checking to check for NULL pointers.

Fixes: 86cd4301c285 ("irqchip/aspeed-scu-ic: Refactor driver to support variant-based initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 5584e0f82cce..bee59c8c4c93 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -215,8 +215,8 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 	int irq, rc = 0;
 
 	scu_ic->base = of_iomap(node, 0);
-	if (IS_ERR(scu_ic->base)) {
-		rc = PTR_ERR(scu_ic->base);
+	if (!scu_ic->base) {
+		rc = -ENOMEM;
 		goto err;
 	}
 
-- 
2.51.0

