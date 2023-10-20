Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262BFCDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 14:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377530AbjJTOOs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 10:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377547AbjJTOOp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 10:14:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C577D53
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:14:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507cee17b00so1218287e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697811281; x=1698416081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEix6po77+AMxuWac9tyRezPTBXoF+z3J1JlBq21Qdw=;
        b=fDVGVrS0Yi0lbzMifWv3PkpLZDPIn6MUQqF5j5FrUGkYqYKxBf9QyGW4nplv26jkm1
         I+dDJCHHRoq66eW96tGAW02WfrdQiTiEw3CwRHFEkusiblel/8Jbj9XuZltr/QMSKODk
         aTNrxs/ZtYP6Uf0yfJbMP9EEW4xcNJFvkIYW2NIyIQ+lPa40OiSxt9/Gd6C35PI505uo
         Rpu0u7agIa04qpqAzIlggzns5tpLZW9I34fpYIInkORVgUDNFzDklw2Mput2dcvUU3AF
         yhMvcH8qp7dQagCmegkw8ZDVfdLPjNANLz6bs5vU+8rdGrDcvsOsFG0fSW//qTdmj8FO
         7IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697811281; x=1698416081;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEix6po77+AMxuWac9tyRezPTBXoF+z3J1JlBq21Qdw=;
        b=l/zFL6hOJa3jUQy8I3o3ppiCy3DCh2erCtSHf42GdPNW1E6yT2CEzg0AhNLRiHXaRU
         F42Bc6dQIhssiFxsVMWgox2pv2h3olnk59rdRSNnHyFLbjKBSQW/ZcyebvDL1Eg4KRiD
         lhFgCh3ftm8/GFo1upBOqQfazmXPG+gbO1rwAiVmx0J9uFSZEVT+YRvmlY3kPrfIGGGQ
         nSbY82tE1l39jHLUkqueWnIVfe5HMmnhd6jkgEzRk6CYc55XB3MyQNoc+I889XkQ184O
         8vzem7C3SY9JuVrin6PhPXEadCBeABlNS/g08/6kDFRG7dBLBeJroNWiv3WqeN91P31P
         xT8g==
X-Gm-Message-State: AOJu0Yw0VbPxBN1M7SBoajdtgPCZBp0HwuOvKzCWREMVIqGiPoP/++ZD
        kW2pP/zJ5fFnjibT+lrs9z9XuQ==
X-Google-Smtp-Source: AGHT+IEY2Q9dTva1HRYc1JRcPd5non3mbbT8bCtSnB6B4Az9MRd90pdBRPvphDwQxh4UQwpNLeOgYQ==
X-Received: by 2002:a19:9156:0:b0:503:985:92c5 with SMTP id y22-20020a199156000000b00503098592c5mr1303266lfj.42.1697811281442;
        Fri, 20 Oct 2023 07:14:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m10-20020adffe4a000000b0032ddc3b88e9sm1822215wrs.0.2023.10.20.07.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:14:41 -0700 (PDT)
Date:   Fri, 20 Oct 2023 17:14:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vishal Moola <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] mm/khugepaged: Fix a NULL vs IS_ERR() bug in
 collapse_pte_mapped_thp()
Message-ID: <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This was changed from find_lock_page() which returns NULL to
filemap_lock_folio() which returns error pointers.  Update the
error checking to match.

Fixes: 8f5654d233e3 ("mm/khugepaged: convert collapse_pte_mapped_thp() to use folios")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a25f5b7c3e7e..d977eb50704a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1508,7 +1508,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 
 	folio = filemap_lock_folio(vma->vm_file->f_mapping,
 			       linear_page_index(vma, haddr));
-	if (!folio)
+	if (IS_ERR(folio))
 		return SCAN_PAGE_NULL;
 
 	if (folio_order(folio) != HPAGE_PMD_ORDER) {
-- 
2.42.0

