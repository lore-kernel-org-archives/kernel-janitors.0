Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B5C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 17:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE1A613B3
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 17:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhDMRMJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 13:12:09 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:28632 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbhDMRMI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 13:12:08 -0400
Date:   Tue, 13 Apr 2021 17:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618333905;
        bh=JRgenIaLUI4xNF3fT6/o+CfeGgQ3ycbu2skgPulPjiI=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=el1X2abuLZXwA3e5DlDZ4teIaFcaAL7MIJTMwOlKmD9MiVRFaxtH0VvUE/DxjVnb0
         wxON/ImnI9/nMl8lDQjVIc7AFD8nQIz2cCh5XgYiGCAlO2rLAewBWHK25fzi5V7cCQ
         DjQ1AKX44wYKg6CcSSaNixgn7bLYhx+eUH+ctkJ1624VQbzqS1Iy0Ve9Rjzhgq/Rmd
         ezY96vOYsRTNUquaitSQx5GQLg6AWC8vW38+2J64ELPl3pbEs3OlmII3jgjU1BTM9h
         zac+ia0bQoPWSS5cK65xlMl1xGF6XIvZl/oAYYLvfuCL7MX556/fOhkuSpd2is8Eq2
         Tc4lFeZ577fnQ==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove sdio_drv_priv structure
Message-ID: <20210413171124.174008-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sdio_drv_priv structure is a small wrapper around sdio_driver in
linux/mmc/sdio_func.h with an added drv_registered integer.

drv_registered is never used anywhere in the driver and only assigned to
during the sdio registering and unregistering process. We can safely
remove sdio_drv_priv and use the sdio_driver structure directly.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 32 ++++++--------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index a8ef95ab14da..816b5bf6e3ed 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -36,17 +36,12 @@ static const struct dev_pm_ops rtw_sdio_pm_ops =3D {
 =09.resume=09=3D rtw_sdio_resume,
 };
=20
-struct sdio_drv_priv {
-=09struct sdio_driver r871xs_drv;
-=09int drv_registered;
-};
-
-static struct sdio_drv_priv sdio_drvpriv =3D {
-=09.r871xs_drv.probe =3D rtw_drv_init,
-=09.r871xs_drv.remove =3D rtw_dev_remove,
-=09.r871xs_drv.name =3D "rtl8723bs",
-=09.r871xs_drv.id_table =3D sdio_ids,
-=09.r871xs_drv.drv =3D {
+static struct sdio_driver rtl8723bs_sdio_driver =3D {
+=09.probe =3D rtw_drv_init,
+=09.remove =3D rtw_dev_remove,
+=09.name =3D "rtl8723bs",
+=09.id_table =3D sdio_ids,
+=09.drv =3D {
 =09=09.pm =3D &rtw_sdio_pm_ops,
 =09}
 };
@@ -498,18 +493,11 @@ static int __init rtw_drv_entry(void)
 =09DBG_871X_LEVEL(_drv_always_, "rtl8723bs BT-Coex version =3D %s\n", BTCO=
EXVERSION);
 #endif /*  BTCOEXVERSION */
=20
-=09sdio_drvpriv.drv_registered =3D true;
=20
-=09ret =3D sdio_register_driver(&sdio_drvpriv.r871xs_drv);
-=09if (ret !=3D 0) {
-=09=09sdio_drvpriv.drv_registered =3D false;
+=09ret =3D sdio_register_driver(&rtl8723bs_sdio_driver);
+=09if (ret !=3D 0)
 =09=09rtw_ndev_notifier_unregister();
-=09=09goto exit;
-=09}
=20
-=09goto exit;
-
-exit:
 =09DBG_871X_LEVEL(_drv_always_, "module init ret =3D%d\n", ret);
 =09return ret;
 }
@@ -518,9 +506,7 @@ static void __exit rtw_drv_halt(void)
 {
 =09DBG_871X_LEVEL(_drv_always_, "module exit start\n");
=20
-=09sdio_drvpriv.drv_registered =3D false;
-
-=09sdio_unregister_driver(&sdio_drvpriv.r871xs_drv);
+=09sdio_unregister_driver(&rtl8723bs_sdio_driver);
=20
 =09rtw_ndev_notifier_unregister();
=20
--=20
2.27.0


