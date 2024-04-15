Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0A608ED
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713178956; cv=none; b=Pgr4uKbgu7LvjN6eAnagY8J9PLRA++TWRv9XPwkof3B8hcTC75quVC5qjjcUk8JUfGIjYw2MtrR4yvTiBMy3oQQYnUnW7/etuaZS8uUBBh09VnBq9BMOnYFIA6DWDJWuZPamPb2wqUHfWbGw5xgmgVro+8G83R2h50FBCXxe9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713178956; c=relaxed/simple;
	bh=MIhq8mJ7oUvBQxJxZxPYeRGvclWcASUEntuazUTpXjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEwoHamJFScTKFChJsYzlhXn/961wXeUeeKf88LYfMzOnDO+yIomb/TrPImpK3n/rFvWd2XYV7rgc9tPI4LX77bKBPw2ZI3ipjFCPpJBa89RNShqk0g3do7YhLy8H3zjW9nPCrC5kLU2Twuedf1Da2P8Z6lUocoG4XwtNLv2E78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i0kqZI/D; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0kqZI/D"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so6660330a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713178949; x=1713783749; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkJt8HeL/rqFcaJaZy8EN1qlqgI1FfXx/hyDHSkD2yA=;
        b=i0kqZI/DtRidLnChzqNVe/ndRuPifY1gJbZDP5lj8ZDRNAn8bjHsINz0OJ32eNsQ/D
         0Fw2jhYK5a2PIKK3CBHdJ4OSfCU4cFNzuIq7zH4mr1JB6BrDxe0W0hqE7tu8DRmjfEPT
         TNa0FKxd+lewsQ8gJ7DvpKodGAqgE3JLZ2x7smoLyCUVfYNFWg9cYJBarFC+BXsOQAdF
         e3RxQT+jwn+Ac+90mYe7BHxR8yU18ptfrbllJxdbclaMhRgXuW4ZLJLwC7WPxDjM/Bwv
         0StKgFgTR8zG1EwC9PM5UyVMkTkebWPsUiqoqEWGXm93XrKMWOqcmXhZruODDKNS22z/
         891Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713178949; x=1713783749;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkJt8HeL/rqFcaJaZy8EN1qlqgI1FfXx/hyDHSkD2yA=;
        b=C0PrScDaxG05dGl9iA15XC5hG9oitLaydyZaVsdZAXtZq2SfREHt2IWBpU+Y9pwbzO
         zAuHIqvhYG48PG3ZL791lqIZIT9x9c4vGwUkF4N88m2j0zYkdPpHvFFBILBO3uz9mU6n
         Emu0b/Qn30bJwFsMvCN8+t5K1KjREKaqg0EsOJzP1ML9WbCU5uxObrnvc19b0S4I1w37
         tg5W6gs2Dtpg4iw1yneE2VKJEgBei78YOYvpZu5gjxEBdrhIJoH4srHXlb0fpFxYyIu7
         QdqGDxq3netRnHidIW8ZlJONE2Hs3veUmQb33eIEYRiRvYQELP3y2DsOon+OEmtcTtmj
         8Y1w==
X-Forwarded-Encrypted: i=1; AJvYcCXBHdNP002wGhf4OpziPmmmLpLwA/T5M8aUe5M8j/Zs+jbwUS9oE4tJXcT3BThJt9AlyVu9FmImwSvJOboyQRCJi7rGY3mVsE3/X8X6F2YF
X-Gm-Message-State: AOJu0Yw/0M45/6/UHYg17mEa0OveTWbjOFpfrXmYh7lfmtnFIanEBZTa
	PWo0HPzAA0vnQ7tP36QUfQB7qW9V4L1dWMI99j6G29BYPMWK8CIpcbpxTOa10gQ=
X-Google-Smtp-Source: AGHT+IHqkqWiXTI3T2/BJrFEReF5SDv1Jethh7csBvaDPHHglMpeUb/vl41fsK+ns3JtlOqsePRXFQ==
X-Received: by 2002:a17:906:1713:b0:a51:8979:a7e6 with SMTP id c19-20020a170906171300b00a518979a7e6mr6895315eje.14.1713178948252;
        Mon, 15 Apr 2024 04:02:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709063f9200b00a523cf3293fsm3868215ejj.59.2024.04.15.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 04:02:27 -0700 (PDT)
Date: Mon, 15 Apr 2024 14:02:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] speakup: Fix sizeof() vs ARRAY_SIZE() bug
Message-ID: <d16f67d2-fd0a-4d45-adac-75ddd11001aa@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "buf" pointer is an array of u16 values.  This code should be
using ARRAY_SIZE() (which is 256) instead of sizeof() (which is 512),
otherwise it can the still got out of bounds.

Fixes: c8d2f34ea96e ("speakup: Avoid crash on very long word")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accessibility/speakup/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
index 736c2eb8c0f3..f677ad2177c2 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -574,7 +574,7 @@ static u_long get_word(struct vc_data *vc)
 	}
 	attr_ch = get_char(vc, (u_short *)tmp_pos, &spk_attr);
 	buf[cnt++] = attr_ch;
-	while (tmpx < vc->vc_cols - 1 && cnt < sizeof(buf) - 1) {
+	while (tmpx < vc->vc_cols - 1 && cnt < ARRAY_SIZE(buf) - 1) {
 		tmp_pos += 2;
 		tmpx++;
 		ch = get_char(vc, (u_short *)tmp_pos, &temp);
-- 
2.43.0

