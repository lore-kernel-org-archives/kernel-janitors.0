Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE58C4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Aug 2021 05:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C2BC61A04
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Aug 2021 05:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhHPF0E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Aug 2021 01:26:04 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:19196 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhHPF0C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Aug 2021 01:26:02 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d03 with ME
        id i5RW250023riaq2035RWZ9; Mon, 16 Aug 2021 07:25:30 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Aug 2021 07:25:30 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, vkoul@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] ASoC: wcd9335: Disable irq on slave ports in the remove function
Date:   Mon, 16 Aug 2021 07:25:28 +0200
Message-Id: <8f761244d79bd4c098af8a482be9121d3a486d1b.1629091028.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The probe calls 'wcd9335_setup_irqs()' to enable interrupts on all slave
ports.
This must be undone in the remove function.

Add a 'wcd9335_teardown_irqs()' function that undoes 'wcd9335_setup_irqs()'
function, and call it from the remove function.

Fixes: 20aedafdf492 ("ASoC: wcd9335: add support to wcd9335 codec")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
As said in the cover letter, this patch is COMPLETELY speculative. It is
untested.
Review with care, because I don't know if it make sense!
---
 sound/soc/codecs/wcd9335.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 47fe68edea3a..d885ced34f60 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4076,6 +4076,16 @@ static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
 	return ret;
 }
 
+static void wcd9335_teardown_irqs(struct wcd9335_codec *wcd)
+{
+	int i;
+
+	/* disable interrupts on all slave ports */
+	for (i = 0; i < WCD9335_SLIM_NUM_PORT_REG; i++)
+		regmap_write(wcd->if_regmap, WCD9335_SLIM_PGD_PORT_INT_EN0 + i,
+			     0x00);
+}
+
 static void wcd9335_cdc_sido_ccl_enable(struct wcd9335_codec *wcd,
 					bool ccl_flag)
 {
@@ -4878,6 +4888,7 @@ static void wcd9335_codec_remove(struct snd_soc_component *comp)
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 
 	wcd_clsh_ctrl_free(wcd->clsh_ctrl);
+	wcd9335_teardown_irqs(wcd);
 }
 
 static int wcd9335_codec_set_sysclk(struct snd_soc_component *comp,
-- 
2.30.2

