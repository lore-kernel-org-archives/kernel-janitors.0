Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2624C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Oct 2021 12:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AB21610F9
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Oct 2021 12:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhJNMqq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Oct 2021 08:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhJNMqp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Oct 2021 08:46:45 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD94C061570
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Oct 2021 05:44:41 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id h4so11042440uaw.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Oct 2021 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KkAsy1Q6KSueqlSbR+TpzKk0M7xOPwVa4poOJOTYfPw=;
        b=dMRMiX87A56C+ulAtIE7p4XfoNW3bx1Nx42FRLB6Q2RCSI1wpopmripaKo4buTrb0I
         /y2WL2bFthAKissNeJYWQs0A35CRkDzdumpUt8NI2hGBgsTflwD9EnM4YfYwJrrOWp6X
         iH3N4NDk9FbjVxXCauSUvE0KwaTg7wYIeVoj6bOT35s3AFoSivj7xuNdFrFwyY2ph7B5
         t38y6mnbFO/wR3HfhlnXeU5M8CQvvfUPHPjkyL5xX8kl87T4dYwv+4Q/CKQiZRacaYcU
         IJl5DG+h+dWzl+DYBXyxT0ixYQzDGey/0nH3OfIdXpRNiEhthFjI5M6S2R8H5b8MpbVR
         i/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KkAsy1Q6KSueqlSbR+TpzKk0M7xOPwVa4poOJOTYfPw=;
        b=S9b7i4yyI1R4NcFwtX72YGg+4Wjr9AvEQHp1nI0FhR10+ZHLQ3mKsxE+UWDn2PBjc9
         jhRh2ixTgx+AqxRHSPTA0bOmXSN6nx0jXSnLdWCsnUpNVSkqIbL4DPUlshQUZ8FEnh0n
         bL1sdpKFfazYJ0TLsJzgOE47PDmvB3tV13I2or7M/4k5Lovuxpub9wM1GJI6k3m/iNvg
         jBMOTWW342ZWSqbALXcvZI5r4xontvFkW0NnNPIdpC4Bm2hfB29jWbhJUbmYigbkxUHd
         67rogzrZCw/ELcjvDukTU41CeKvGEaCrXUQhlmfYFbPInJjUcNQyyBguRFWT4jKHe0JH
         72gQ==
X-Gm-Message-State: AOAM533kq69KA206Y3iRUF/g81icx/6OFy4WJUcXL/aCeNJw9kmSrSIq
        X9Nkz2TLvQ92YGenzYw5xuo=
X-Google-Smtp-Source: ABdhPJzHbX3veQcqqU98zgDbBELI0RUx+TOtehRdUKbZFXDL/CkIhp08eunJ5GnCkOVCFPCgzBTGkg==
X-Received: by 2002:a67:c81a:: with SMTP id u26mr6848048vsk.27.1634215480432;
        Thu, 14 Oct 2021 05:44:40 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z4sm1441844vsk.15.2021.10.14.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:44:40 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     qiangqing.zhang@nxp.com
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [RFC PATCH] net: stmmac: remove rtnl unlock/lock sequence from stmmac_resume
Date:   Thu, 14 Oct 2021 06:44:17 -0600
Message-Id: <20211014124417.199403-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

90702dcd19c ("net: stmmac: fix MAC not working when system resume back
with WoL active") introduced a section of code in stmmac_resume that
is protected with rtnl_lock/rtnl_unlock. However, the call to
rtnl_unlock() is followed by an already existing call to rtnl_lock().

Instead of unlock/lock, allow the prexisting lock to continue.

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index eb3b7bf771d7..5e69380027af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7263,9 +7263,7 @@ int stmmac_resume(struct device *dev)
 		if (device_may_wakeup(priv->device))
 			phylink_speed_up(priv->phylink);
 	}
-	rtnl_unlock();
 
-	rtnl_lock();
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
-- 
2.33.0

Is this a valid patch? Perhaps the lock is released in the middle
on purpose but I would assume it was just an little oversight.

