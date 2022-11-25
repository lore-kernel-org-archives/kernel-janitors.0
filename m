Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A9FC4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Nov 2022 12:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiKYMXr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Nov 2022 07:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKYMXq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 07:23:46 -0500
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992B817E38
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Nov 2022 04:23:44 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id yXk6oYM8Mbw2uyXk6oXmQy; Fri, 25 Nov 2022 13:23:42 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 25 Nov 2022 13:23:42 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/5] octeontx2-af: Clean-up some bitmap related usage
Date:   Fri, 25 Nov 2022 13:23:41 +0100
Message-Id: <cover.1669378798.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The main point is patch 4.

The other ones are just minor things spoted while looking at the way the
'id_bmap' bitmap was used.

Christophe JAILLET (5):
  octeontx2-af: Fix a potentially spurious error message
  octeontx2-af: Slightly simplify rvu_npc_exact_init()
  octeontx2-af: Use the bitmap API to allocate bitmaps
  octeontx2-af: Fix the size of memory allocated for the 'id_bmap'
    bitmap
  octeontx2-af: Simplify a size computation in rvu_npc_exact_init()

 .../marvell/octeontx2/af/rvu_npc_hash.c         | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.34.1

