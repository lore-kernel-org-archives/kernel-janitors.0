Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48E6EB64D8
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jun 2023 02:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbjFOCSH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jun 2023 22:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237394AbjFOCSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 22:18:04 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 98B0E26B6;
        Wed, 14 Jun 2023 19:17:58 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id A9E97603087E5;
        Thu, 15 Jun 2023 10:17:33 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, maciej.szmigiero@oracle.com,
        yangyingliang@huawei.com, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: [PATCH] ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
Date:   Thu, 15 Jun 2023 10:17:32 +0800
Message-Id: <20230615021732.1972194-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

smatch error:
sound/pci/ac97/ac97_codec.c:2354 snd_ac97_mixer() error:
we previously assumed 'rac97' could be null (see line 2072)

remove redundant assignment, return error if rac97 is NULL.

Fixes: da3cec35dd3c ("ALSA: Kill snd_assert() in sound/pci/*")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 sound/pci/ac97/ac97_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 9afc5906d662..80a65b8ad7b9 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2069,8 +2069,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 		.dev_disconnect =	snd_ac97_dev_disconnect,
 	};
 
-	if (rac97)
-		*rac97 = NULL;
+	if (!rac97)
+		return -EINVAL;
 	if (snd_BUG_ON(!bus || !template))
 		return -EINVAL;
 	if (snd_BUG_ON(template->num >= 4))
-- 
2.30.2

