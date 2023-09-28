Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D34CE7AF8
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Sep 2023 05:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjI1FRp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Sep 2023 01:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjI1FRo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Sep 2023 01:17:44 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542E698
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 22:17:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so22753925e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695878261; x=1696483061; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIJ02qSOp4xVGoLXSfG6FeVc5mYTe6HFTw5ng2uAEW4=;
        b=eNBJ1lzMHaQrmWqk4bjAs0nC2WiOzl8dsEYMQb6b7voRwZZoPeIcS6mmJDzyeGIeKh
         mccz/Sx5WG38acz151Z6DxShaN/xHRKx2hWK8ywXAvetPYvbmfCerX/7TOndQMjQyosj
         51hybLmD4yQ8eZJEKIq42emVzhpfSq48U9Nj8j5xu9H0cxARj7s9DrvdB9j6d1MtiRss
         Ay0zFoWlaTmQvQW/cDfuC/s497NAqVnoDCdZxeqZUkc7Ksb4Knu8fdbF1aczQeJp6i5/
         5QmFtD2t17oShTWwuDAsgZ3Zt3YCEijfX0n2A4B4SAJovzvjpUR9xGT6qF2oB5bQ3udG
         KAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695878261; x=1696483061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIJ02qSOp4xVGoLXSfG6FeVc5mYTe6HFTw5ng2uAEW4=;
        b=pdoq43LIbbVCDbMMPnZKRw8FI6iyMnxbQqteSK4iy18EpBKqKS2bFKW8cdOy2w3FjO
         URZ2Zqwzo4vBU+bQBQ0CM3XxXy1dI7bznBsG1NxVnCxqyywnmFfYayklAHvRwAYLaV9q
         gNyWWRNQNnuoLUQvkulD6i1ARfJm/XETeC58YJ+CRWtqMQhxUPVQ5+C1YYxXv532ijBZ
         M0gEAdXFr17K+jHq5L+QLyyeivJNkSYVgzxuWxrbh4oCekOuDD89lOHyFK9EmPYIwWHi
         RyZc0/9k+ibwRRbEaoIS1hrRnerhaqU6h1/QMjF5uQK/ZL/auZy+XWYbLj8/1n3mFMVO
         WFiw==
X-Gm-Message-State: AOJu0Yz/pM68/gUpzzIsLdKzjgdvOaMl8mKwlp/ltRzG/Wm+RufVfs+A
        LiwLQUuC3bNoPZPFgrdehmhEXw==
X-Google-Smtp-Source: AGHT+IGW1VktBGa6+a5T5jdmOd3Atafh7P5YxQirMnTaHLGkZodlJVLzcEa/horPK5LxM8anOVAyIw==
X-Received: by 2002:adf:e58f:0:b0:317:e68f:e1b2 with SMTP id l15-20020adfe58f000000b00317e68fe1b2mr183865wrm.28.1695878260718;
        Wed, 27 Sep 2023 22:17:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a056000156b00b0032485046055sm544180wrz.5.2023.09.27.22.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 22:17:40 -0700 (PDT)
Date:   Thu, 28 Sep 2023 08:17:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hugetlbfs: fix an NULL vs IS_ERR() bug
Message-ID: <1772c296-1417-486f-8eef-171af2192681@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code was converted from using find_lock_page() which returns NULL,
to calling filemap_lock_hugetlb_folio() which returns -ENOENT.  The
check needs to be updated to match.  Also IS_ERR() has an unlikely()
built in so we can remove that.

Fixes: 4649d8d5bb81 ("mm/filemap: remove hugetlb special casing in filemap.c")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
filemap_lock_hugetlb_folio() can return NULL if huge tables are disabled
but that isn't the case here so there is no need to check for that.

 fs/hugetlbfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 3f2f0a4bfad0..91034b6e5b69 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -354,7 +354,7 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
 
 		/* Find the folio */
 		folio = filemap_lock_hugetlb_folio(h, mapping, index);
-		if (unlikely(folio == NULL)) {
+		if (IS_ERR(folio)) {
 			/*
 			 * We have a HOLE, zero out the user-buffer for the
 			 * length of the hole or request.
-- 
2.39.2

