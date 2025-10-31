Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C281EA7DD
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915832; cv=none; b=lbmw4CUB4z0OsaG1X7Qm6ZBaTuZnOMX1l+48Hr24uc9OGj2bcITEyGYkYxJn+HK+Z+r/xp1nXFf7mNy7JgYXnpj+93HlAfCZWv8UVkEDwpU3BSzhIk7zy+EXu/Si7PfEFUNK2TPOB4czuXkYDcRzuEAhW1XA8EHKFViHZyNlyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915832; c=relaxed/simple;
	bh=PVe6ChdFzqsrPY5cNbPkVd3xBg+1jaFSAtH7ArWrwWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHtuWhoqdobl9r0czOp91zmlf70bAaROvYYZAnWXzsCh9Mx0VeSIWF6XpTlR7GpBmTAaxSSv24ZFWMHYlwcUJq1ad9t/SdWVQDkRiWr+R4+fq2sSdBeVpGq5cYEOTQUlYlHvDOuBVQkWLc3GHzs7AH0fsXzvOFkv0ZJTYiNLWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQR60u0X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQR60u0X"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710683a644so19615215e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915828; x=1762520628; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mDV8O3FoSMhSVn/a5ZT560ij4xBeHKhaaWQkgweA8k=;
        b=iQR60u0XklIfO7r3iyZkrG4ta/sGjfTpM5dX3gLOJfAyXb7adaIOh8xF4MLuzI3c4S
         fMJGALstKYNs89lSobplaX0yemRVP0xsLBnKG2qOVwbdZsJQ+cq1gXuGj8gxFKJF8e2G
         tRtGgQ4b1o7gDdEd9RCV2yrmNVaUrFTXL8/1bfsXHPGeArL0oVs4KAB2Ji/vZZxp+v+Z
         5jM5BK3Uv96RpZLJJjBQ6WgNVwlrscy4+C1EO3EV1rlxnj6nnFz/BsXJYpo/tiLkrBp8
         b6gynjmbbhWXbVre49gecy+S6FHD59CjeOb0cASGNSluiOZTyRXKUc64V4NfDrFTsDrz
         QF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915828; x=1762520628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mDV8O3FoSMhSVn/a5ZT560ij4xBeHKhaaWQkgweA8k=;
        b=estliuvU/g2OA+ZmpC2JwAdh07lzsqb5x/kXM2kUwmCfHY4DRxmjgS73pImwyS4xcI
         zE9mlotkh7q7I2XPY32+obHGamGNhyQ+wBtCWul8WtSYNa2mbj0GCGzOB56IRcyUMhXv
         t6RKGjiDL6/lcEd206KS+QAAaV1FgAjYg20s7XyItwRpbQmCDktqIDuCs+s2NBTl0WnN
         FWkpbfJuUjuvF/Fm8hQVugKxb/5ciXNVpHovr3LpmWTYODoIFbOlCGcGFcII67/EOuOl
         aZOjxlcO+5bdKp9ybtoBTJMbi/zY/gWZTflCsF94ZLn0ZvukNZD2pkrklv1yoBYyLjUp
         u8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUBP418n8ZaxrNQVRlJC7v8CDztP+83wtS2w4EpHUN1HJephcZXTH/sVtyE7aAg6S1JpnM6eq4zBS7uF+8yp/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dZHTBd9v40Yx9Wihf1P4cxiKzqHRlpWw75sSwipGiTomrTa9
	r822kt1U5TmIGV84DDxwWoxT3LIdfqQjbvma61Tqa560qVBeEyICGmgKcLwKpjX7O7A=
X-Gm-Gg: ASbGncsoBXxCVnikk2j9Aq0ivrzShiDERtnBjEwX/8FGdTcGskkEupHQ0z3pfpChho4
	kM1UyLlHkkbfES1UcsfKXsDlaKRxhutNox047n9nOgWtuazyx9WmQSbOLrRYKwIvWXCT7nGYkv3
	fh23/ItRhnAgoNhCG8L4mC3YgWUTdRVrbEDBJw0O7CdFJBa1hxcsvjUPT9iYqENVrvVukUqD55e
	WVbAVUKfrXzdJuSbtrBCOp44Oyq1nXFUlxlHXTsiHCMqPn+p629YZEOxRBpybgAqwrfoKj0aa8N
	wOoSgEINwv8E+lDYevkAURTfWVxedkhF8wYKc2XR+cpe7TLhBxdjAG1p9mD04F56oxejX0gOeYU
	yVtdKKW3y/nU4/c6asB4PHf0mPeJ12O4952Ovl9s9jOOPPfUMcdu0GS+lAEENjFE+G08PxjeduQ
	PVy8Bp7ZQbKOqVZhRz
X-Google-Smtp-Source: AGHT+IG/dcwtB3BjhLCI+K3wmR+DpgBUZwEX6TgzCgzBBCTL3vH0oZwBfJnMRLLw2rYEixnMOXzTGg==
X-Received: by 2002:a05:600c:3495:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477300980dcmr36025765e9.6.1761915827364;
        Fri, 31 Oct 2025 06:03:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4772fcf38c6sm21694675e9.11.2025.10.31.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:03:46 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:03:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexey Starikovskiy <astarikovskiy@suse.de>,
	Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ACPI: SBS: Fix present test in acpi_battery_read()
Message-ID: <aQSzr4NynN2mpEvG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The battery->present variable is a 1 bit bitfield in a u8.  This means
that the "state & (1 << battery->id)" test will only work when
"battery->id" is zero, otherwise ->present is zero.  Fix this by adding
a !!.

Fixes: db1c291af7ad ("ACPI: SBS: Make SBS reads table-driven.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is a new static checker warning that Harshit and I wrote.  It's
untested.

 drivers/acpi/sbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index a3f95a3fffde..d3edc3bcbf01 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -487,7 +487,7 @@ static int acpi_battery_read(struct acpi_battery *battery)
 		if (result)
 			return result;
 
-		battery->present = state & (1 << battery->id);
+		battery->present = !!(state & (1 << battery->id));
 		if (!battery->present)
 			return 0;
 
-- 
2.51.0

