Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA96C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Dec 2021 09:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhLNJRk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Dec 2021 04:17:40 -0500
Received: from www.linuxtv.org ([130.149.80.248]:37768 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230365AbhLNJRj (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Dec 2021 04:17:39 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1mx3wI-002aEl-6q; Tue, 14 Dec 2021 09:17:38 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue, 07 Dec 2021 10:29:57 +0000
Subject: [git:media_tree/master] media: media si2168: Fix spelling mistake "previsously" -> "previously"
To:     linuxtv-commits@linuxtv.org
Cc:     kernel-janitors@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1mx3wI-002aEl-6q@www.linuxtv.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: media si2168: Fix spelling mistake "previsously" -> "previously"
Author:  Colin Ian King <colin.i.king@gmail.com>
Date:    Tue Nov 23 10:06:45 2021 +0100

There is a spelling mistake in a dev_dbg message. Fix it.

Link: https://lore.kernel.org/linux-media/20211123090645.165299-1-colin.i.king@gmail.com

Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 drivers/media/dvb-frontends/si2168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 8a3c41a80c03..196e028a6617 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -549,7 +549,7 @@ static int si2168_resume(struct dvb_frontend *fe)
 	 * device untouched.
 	 */
 	if (dev->initialized) {
-		dev_dbg(&client->dev, "previsously initialized, call si2168_init()\n");
+		dev_dbg(&client->dev, "previously initialized, call si2168_init()\n");
 		return si2168_init(fe);
 	}
 	dev_dbg(&client->dev, "not initialized yet, skipping init on resume\n");
