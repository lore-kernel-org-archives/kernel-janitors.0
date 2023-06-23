Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AC6EB64D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 06:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjFWG0M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 02:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjFWG0K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 02:26:10 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B48189
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 23:26:09 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so4030855e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687501568; x=1690093568;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdFRPwIpzTk0k/qrVNkicgaQ/q36X641ga6hn2FeuTs=;
        b=uYDW4ZN3IzogoQcVuJNGSGWVMwaz2c9DfyoC7qyXxo9e5N/0Eqzt5ihKXnfrU913Ix
         9mcUjG8y2+gquIhpgayGwd7hIzielvswQH3MTh6x7YG4jqi+eS6T8Obp02r1iy7JGO/H
         Wr/V300WLVzwlaef5ybb9aqtEJR7Bj13FRWlyS+qLsSlGWkzhts9mycKR94eFXsNjRO0
         CezDBFGzrYEYU/VKU2LVBnw77gkbM7G9d294EOsRced7txoG55ihkASp996osIV2euGI
         bDRA5SK4Bg05UZE0Ul8rLWrUgjrtfc1NgaF5l1dQML/XaKfWCs/wnGbsfD4OoIZPpIFJ
         Ypfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687501568; x=1690093568;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdFRPwIpzTk0k/qrVNkicgaQ/q36X641ga6hn2FeuTs=;
        b=jb0BR6K8EMmbaFIEO9HIrnb/DaKoP4pPjQbJjjbKVIHFCHUjxV43UKN2+JZ/avGnGf
         xG3fVMF9Mz78pxJJeTPhw2jhisnIUcBRxmyhsP5QfxCiJcgEAeOlw1iOK8uahmLVZKXw
         9veF807AaKf4yLnffKENHBarmo80W9GOspy8/7WDS9dBjwWLehp5kV+PgoCEzdbqCQ9J
         T4n+3SveqHyrE6jeaBVl39WfvU2sQpcXM3F9yNTa2aJ8ogajt+x2kmxIarokj0EoL1/G
         qBvVQQpcpRGBBISJHdtc2YZobTo6A8/QamuR7MdujEcLn8/i71SSTuWNBdsDVREanYK5
         KB1A==
X-Gm-Message-State: AC+VfDz/ClraQIMHJJKU4d8vMcnMQsbTBX7bOk/4nT48duS/yJ2RdtZi
        N7mYX/pUveYoKaF4qDHlQBRwBfG6oYfREjdNEmk=
X-Google-Smtp-Source: ACHHUZ7VEewFTpl/xMnWD50YBKgpY7nOkzln5AIOV5ir9m0t1JHDVJ8FYmnApnxoE5lyC8wVxU0xhw==
X-Received: by 2002:a7b:cd89:0:b0:3fa:77f2:e255 with SMTP id y9-20020a7bcd89000000b003fa77f2e255mr2326234wmj.5.1687501567879;
        Thu, 22 Jun 2023 23:26:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c290500b003fa786b5195sm1330218wmd.42.2023.06.22.23.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 23:26:05 -0700 (PDT)
Date:   Fri, 23 Jun 2023 09:26:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/hugetlb: fix hugetlbfs_pagecache_present()
Message-ID: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The filemap_get_folio() function doesn't returns NULL, it returns error
pointers.  So the "return folio != NULL;" statement means
hugetlbfs_pagecache_present() always returns true.

Fixes: 267d6792f43b ("hugetlb: revert use of page_cache_next_miss()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 mm/hugetlb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cb9077b96b43..bce28cca73a1 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5731,9 +5731,10 @@ static bool hugetlbfs_pagecache_present(struct hstate *h,
 	struct folio *folio;
 
 	folio = filemap_get_folio(mapping, idx);
-	if (!IS_ERR(folio))
-		folio_put(folio);
-	return folio != NULL;
+	if (IS_ERR(folio))
+		return false;
+	folio_put(folio);
+	return true;
 }
 
 int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,
-- 
2.39.2

