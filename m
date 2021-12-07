Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1A6C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Dec 2021 10:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbhLGKeL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Dec 2021 05:34:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44144 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229919AbhLGKeG (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Dec 2021 05:34:06 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1muXk3-00ARA6-ID; Tue, 07 Dec 2021 10:30:35 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue, 07 Dec 2021 10:29:57 +0000
Subject: [git:media_stage/master] media: c8sectpfe: remove redundant assignment to pointer tsin
To:     linuxtv-commits@linuxtv.org
Cc:     kernel-janitors@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Colin Ian King <colin.i.king@gmail.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1muXk3-00ARA6-ID@www.linuxtv.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: c8sectpfe: remove redundant assignment to pointer tsin
Author:  Colin Ian King <colin.i.king@gmail.com>
Date:    Sun Dec 5 01:37:45 2021 +0100

Pointer tsin is being assigned a value that is never read. The assignment
is redundant and can be removed.

Link: https://lore.kernel.org/linux-media/20211205003745.227491-1-colin.i.king@gmail.com

Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 4 ----
 1 file changed, 4 deletions(-)

---

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 02dc78bd7fab..e1f520903248 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -930,12 +930,8 @@ static int configure_channels(struct c8sectpfei *fei)
 
 	/* iterate round each tsin and configure memdma descriptor and IB hw */
 	for_each_child_of_node(np, child) {
-
-		tsin = fei->channel_data[index];
-
 		ret = configure_memdma_and_inputblock(fei,
 						fei->channel_data[index]);
-
 		if (ret) {
 			dev_err(fei->dev,
 				"configure_memdma_and_inputblock failed\n");
