Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7CCDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 14:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377507AbjJTONl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 10:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377447AbjJTONl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 10:13:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E4E19E
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:13:39 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507a55302e0so1104534e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697811217; x=1698416017; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHYdL6+h/KwcGSepRnbK+lQxAZl07VmP927iBVBWsTk=;
        b=aDA093I6+wUOa2nTsnZMtjmUVGC3+m21rsklqWtMESuAcFm2BCIS8onba/i/9j07pW
         M41MDxzMZ+89qWAMpfNXaLCy08ffpBJPGvyLDo0vErpJLrH3BDDXz2t9KMTXytJm7kyY
         7zUxlVNQCUw8mzWabnl6GD29j1+E8XlWxgqBcQSqh9LpjY3R5KhcOvYd8aT/UrdvU0jn
         ywJne3BUk9v9lBn8hoo77pasqgoeiP4vradjmbUND6+UECE2z3QixypkK8dtJrem9sOu
         86AReeqd5RxerZn98OiKBVS2sEAVYO8p/swaQUuybsozO7PhEkDC9dcYO2LNGV4IFebr
         SeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697811217; x=1698416017;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHYdL6+h/KwcGSepRnbK+lQxAZl07VmP927iBVBWsTk=;
        b=eEVuv3U74P0x2R5y7HKO9sz8V2XXzH+mWvHXiCvw9P7tnIqRPenMQ7rnyuUr5S28DF
         OifFFbo4U4sIIZBgGmY3AQNTZPOWFI0y18UPkep4s+i6uqdIoz+JASXY62yX41wFjLyT
         IG0Fzl+KNc3yWrPrcNvB4MfDwmE1/8MZTK2AyVsCGryvBP/NGH8klMHnAyAU4F6N6kHg
         q4+zI9oHG1iQkj5ZoptVpk+gF8NFClyLJT2nN4B8oKn0qEkKhJ2hDKkAa+JMrk8Mme0g
         vtPrCelLmGPtmTwDrCA5KWA/k4UxNBd7ACx4Aps6AL5sBsyS0pdR6jMVq87BtsMAk6+8
         sOSw==
X-Gm-Message-State: AOJu0YxF9j9JFk5fzbkQ0fWMvyuiYChSNDLbEjjgqiL7Vy2lgQqx4bU9
        hvdo9+5jdSVZQAtD4xdVrBTxMMREVZVYqXDjDIo=
X-Google-Smtp-Source: AGHT+IH1LYjTguHo+MHaRdY/6I5NY/1iAzCe0zVXaxylTCz7I0h9K0wfoZx/8GaCPtGlTYREXSVw9Q==
X-Received: by 2002:ac2:5456:0:b0:507:b074:ecd4 with SMTP id d22-20020ac25456000000b00507b074ecd4mr1394560lfn.7.1697811217367;
        Fri, 20 Oct 2023 07:13:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k12-20020adff5cc000000b00326f5d0ce0asm1783191wrp.21.2023.10.20.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:13:37 -0700 (PDT)
Date:   Fri, 20 Oct 2023 17:13:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Zach O'Keefe <zokeefe@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] mm/khugepaged: Fix an uninitialized variable bug
Message-ID: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "hpage" can be used uninitialized:

    mm/khugepaged.c:1234 collapse_huge_page()
    error: uninitialized symbol 'hpage'.

Initialized it on this path.

Fixes: 50ad2f24b3b4 ("mm/khugepaged: propagate enum scan_result codes back to callers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 mm/khugepaged.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0622f8a5175d..a25f5b7c3e7e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1062,8 +1062,10 @@ static int alloc_charge_hpage(struct page **hpage, struct mm_struct *mm,
 	int node = hpage_collapse_find_target_node(cc);
 	struct folio *folio;
 
-	if (!hpage_collapse_alloc_folio(&folio, gfp, node, &cc->alloc_nmask))
+	if (!hpage_collapse_alloc_folio(&folio, gfp, node, &cc->alloc_nmask)) {
+		*hpage = NULL;
 		return SCAN_ALLOC_HUGE_PAGE_FAIL;
+	}
 
 	if (unlikely(mem_cgroup_charge(folio, mm, gfp))) {
 		folio_put(folio);
-- 
2.42.0

