Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7B7EE645B
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbjIOM6r (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbjIOM6r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:58:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6DB10E
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:58:41 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313e742a787so1381578f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782720; x=1695387520; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7ZWYDZGQuzlBAXJCNo7Xno7YKGhDfk16+TT8ZwVTUw=;
        b=hAyF3SgTTjKfV7U6v7qzdp1Sv0zwbbiyuKTb5j5gRmrZRsBPqRsCGOguu9DVvJKFVp
         1C46Jjhnob9SDRC5j6IIFiiO/daQ13ubq+px10WaBiASwnatJhNHR2OIwPCK9aREHMBx
         D8zWGypDZng4t3tkDhW12mlrpbv3DWa5fZjawVRThZq8o2ozvpaDt2QBOozsbmHTxFzp
         rrINXEzUL4cA92KZyFE8SLKQY1JOOQHEGVoLqFA464mK/vGtS/d0APye1enWqmT9fUQj
         3RqIBKosMK21qcU+oONsBSeebghfeEZHNXJfnbY17i4iK9g+iwB+VeWmAKDHmVHbYDoc
         CeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782720; x=1695387520;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7ZWYDZGQuzlBAXJCNo7Xno7YKGhDfk16+TT8ZwVTUw=;
        b=dwnzfdNJfU2NJRWmvpFpE0iYJ8/8kvhbWNr0GRjzEEJvOGHPWjDighIT7+QIxQyirt
         RD/Y6qmN/8j49V5z4qS8+RwglWdQ2GHMrvKLKFpCjqwUMmkQ8jXibkW5YOzY07u2ARoN
         ao/+vnCkU3zyBZWeCODP7crHjaQxEaJ6hgisLCjr0DjJ8rZiSWqW+77Ygo1JCC10pE/v
         5T65hpWnkFdslOwfy2zRQ5YGE5PwvE2g5xo4kbooiEI0KEF9iCUVgDHJQSWbs8Ho8APN
         PVGfc2HWZO3FBRhJY6HgqYoBLRWVxDl0QKxs2SxTiKnaiRnoLt+MrijSbOCbo0wfZ8sp
         TYHw==
X-Gm-Message-State: AOJu0YzkEcXL3+OWwMTbg+87rk6zgIokR2th9Rk6bQkH+L4ZvXNLEsNu
        iQNDlCYSCm7Xb4FIJuV00acmCg==
X-Google-Smtp-Source: AGHT+IETdqMFnPZsMGf7ZX6xA1sbJ/Dg46j6mhed2L+2K/snLfuksADiUBenVOmBPxVHnslA4OD/Iw==
X-Received: by 2002:adf:dd8d:0:b0:313:f75b:c552 with SMTP id x13-20020adfdd8d000000b00313f75bc552mr1149560wrl.15.1694782720260;
        Fri, 15 Sep 2023 05:58:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f10-20020adff8ca000000b0031ffa453affsm224905wrq.17.2023.09.15.05.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:58:40 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:58:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Daniel Latypov <dlatypov@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] kunit: Check for kunit_parse_glob_filter() failure
Message-ID: <3ff9d019-75b6-45ee-9b03-9d6ec7c5364f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that the missing error checks would lead to a crash:

    lib/kunit/executor_test.c:40 parse_filter_test()
    error: double free of 'filter.test_glob'

We may as well do it right...

Fixes: a127b154a8f2 ("kunit: tool: allow filtering test cases via glob")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/kunit/executor_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index b4f6f96b2844..176c9c9dfcfc 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -27,13 +27,15 @@ static void parse_filter_test(struct kunit *test)
 {
 	struct kunit_glob_filter filter = {NULL, NULL};
 
-	kunit_parse_glob_filter(&filter, "suite");
+	if (!kunit_parse_glob_filter(&filter, "suite"))
+		return;
 	KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
 	KUNIT_EXPECT_FALSE(test, filter.test_glob);
 	kfree(filter.suite_glob);
 	kfree(filter.test_glob);
 
-	kunit_parse_glob_filter(&filter, "suite.test");
+	if (!kunit_parse_glob_filter(&filter, "suite.test"))
+		return;
 	KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
 	KUNIT_EXPECT_STREQ(test, filter.test_glob, "test");
 	kfree(filter.suite_glob);
-- 
2.39.2

