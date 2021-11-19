Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BCEC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20CAE61A62
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhKSRWc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Nov 2021 12:22:32 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47950 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236628AbhKSRWa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Nov 2021 12:22:30 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1mo72t-002cT8-4v; Fri, 19 Nov 2021 16:47:27 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 19 Nov 2021 16:09:07 +0000
Subject: [git:media_stage/master] media: dvb-frontends/stv0367: remove redundant variable ADCClk_Hz
To:     linuxtv-commits@linuxtv.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        kernel-janitors@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1mo72t-002cT8-4v@www.linuxtv.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dvb-frontends/stv0367: remove redundant variable ADCClk_Hz
Author:  Colin Ian King <colin.king@canonical.com>
Date:    Thu Oct 14 16:32:53 2021 +0100

GIT_AUTHOR_NAME=Colin King
GIT_AUTHOR_EMAIL=colin.king@canonical.com

Variable ADCClk_Hz is being initialised with a variable that is never read
and then re-assigned immediately afterwards. Clean up the code by removing
it and just returning the return value from the call to stv0367cab_get_mclk

Addresses-Coverity: ("Unused value")

Link: https://lore.kernel.org/linux-media/20211014153253.63527-1-colin.king@canonical.com

Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 drivers/media/dvb-frontends/stv0367.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

---

diff --git a/drivers/media/dvb-frontends/stv0367.c b/drivers/media/dvb-frontends/stv0367.c
index 6c2b05fae1c5..95e376f23506 100644
--- a/drivers/media/dvb-frontends/stv0367.c
+++ b/drivers/media/dvb-frontends/stv0367.c
@@ -1797,11 +1797,7 @@ static u32 stv0367cab_get_mclk(struct dvb_frontend *fe, u32 ExtClk_Hz)
 
 static u32 stv0367cab_get_adc_freq(struct dvb_frontend *fe, u32 ExtClk_Hz)
 {
-	u32 ADCClk_Hz = ExtClk_Hz;
-
-	ADCClk_Hz = stv0367cab_get_mclk(fe, ExtClk_Hz);
-
-	return ADCClk_Hz;
+	return stv0367cab_get_mclk(fe, ExtClk_Hz);
 }
 
 static enum stv0367cab_mod stv0367cab_SetQamSize(struct stv0367_state *state,
