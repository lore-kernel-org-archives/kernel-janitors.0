Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE64C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Apr 2021 13:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B186610CB
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Apr 2021 13:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhDKNhG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Apr 2021 09:37:06 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18867 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhDKNhG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Apr 2021 09:37:06 -0400
Date:   Sun, 11 Apr 2021 13:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618148208;
        bh=S+1fGAVV8UQL2Dd8l3RggPscvGMHVfdyONCHp5RBFt4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=czKFh2c9sv+IQ4oyKxhSmRTc3kFleH5nErGuc1aEg8oFWnZHqnsVy5XxHaHGEnOGs
         sUflTx+qhKo9FTqB2AMjPxvuojTY/B3KUxjGOL6ZZB3dm5vJ1jpmnhQXh8meCIv/Es
         +qjg0f7e2r9xw8bPlMsEJexDV1OhKkzlkDFw7ChpheU7gYDZB6x71IzpzJ0bju7WR+
         zq1/Nmuh0uVJPQWHYipSga23BaeGqVtjdCfBjdHHC7VYRtO58ZMguEiQ4f7WHqxqhm
         lZp+4iN2jIyUDYSuHpBy+/0ZERN7UjBxm8KK/uB6h06C2I4jGonquRY1Cs3EjMMkgc
         TZLc/MmnT9cfg==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <20210411133625.38195-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The next instruction for both 'goto exit' jump statements is to
execute the exit jump instructions regardless. We can safely
remove all jump statements from __init rtw_drv_entry()

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
Changes from:
  v1: removed unnecessary edit of DBG_871X_LEVEL
  v2: elaborated on steps to remove a checkpatch.pl warning
  v3: separated checkpatch.pl fix into separate patch

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 9fd926e1698f..2b61a4bdd8a1 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -517,12 +517,8 @@ static int __init rtw_drv_entry(void)
 =09if (ret !=3D 0) {
 =09=09sdio_drvpriv.drv_registered =3D false;
 =09=09rtw_ndev_notifier_unregister();
-=09=09goto exit;
 =09}
=20
-=09goto exit;
-
-exit:
 =09DBG_871X_LEVEL(_drv_always_, "module init ret =3D%d\n", ret);
 =09return ret;
 }
--=20
2.27.0


