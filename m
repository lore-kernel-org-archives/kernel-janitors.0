Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9487C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 13:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 708EC64F7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 13:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhCRNUo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 09:20:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37952 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhCRNUP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 09:20:15 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lMsZN-0001kM-0q; Thu, 18 Mar 2021 13:20:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     Olivia Mackintosh <livvy@base.nu>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix unintentional sign extension issue
Date:   Thu, 18 Mar 2021 13:20:08 +0000
Message-Id: <20210318132008.15266-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The shifting of the u8 integer device by 24 bits to the left will
be promoted to a 32 bit signed int and then sign-extended to a
64 bit unsigned long. In the event that the top bit of device is
set then all then all the upper 32 bits of the unsigned long will
end up as also being set because of the sign-extension. Fix this
by casting device to an unsigned long before the shift.

Addresses-Coverity: ("Unintended sign extension")
Fixes: a07df82c7990 ("ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5b77e8140ba6..f13cdfd8bd20 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2926,7 +2926,7 @@ static int snd_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_v
 	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
 	u16 value = elem->value.enumerated.item[0];
 
-	kctl->private_value = ((device << SND_DJM_DEVICE_SHIFT) |
+	kctl->private_value = (((unsigned long)device << SND_DJM_DEVICE_SHIFT) |
 			      (group << SND_DJM_GROUP_SHIFT) |
 			      value);
 
@@ -2964,7 +2964,7 @@ static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 		value = device->controls[i].default_value;
 		knew.name = device->controls[i].name;
 		knew.private_value = (
-			(device_idx << SND_DJM_DEVICE_SHIFT) |
+			((unsigned long)device_idx << SND_DJM_DEVICE_SHIFT) |
 			(i << SND_DJM_GROUP_SHIFT) |
 			value);
 		err = snd_djm_controls_update(mixer, device_idx, i, value);
-- 
2.30.2

