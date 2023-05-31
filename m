Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D684C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 May 2023 04:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjEaEeY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 May 2023 00:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjEaEeX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 May 2023 00:34:23 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 905F78F;
        Tue, 30 May 2023 21:34:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 69B04180106EEA;
        Wed, 31 May 2023 12:32:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>
Cc:     bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: [PATCH] bpf/tests: Use struct_size()
Date:   Wed, 31 May 2023 12:32:51 +0800
Message-Id: <20230531043251.989312-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use struct_size() instead of hand writing it.
This is less verbose and more informative.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 lib/test_bpf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index ade9ac672adb..fa0833410ac1 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -15056,8 +15056,7 @@ static __init int prepare_tail_call_tests(struct bpf_array **pprogs)
 	int which, err;
 
 	/* Allocate the table of programs to be used for tall calls */
-	progs = kzalloc(sizeof(*progs) + (ntests + 1) * sizeof(progs->ptrs[0]),
-			GFP_KERNEL);
+	progs = kzalloc(struct_size(progs, ptrs, ntests + 1), GFP_KERNEL);
 	if (!progs)
 		goto out_nomem;
 
-- 
2.30.2

