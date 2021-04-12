Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1D9C43460
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 14:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBE8F61220
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 14:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239682AbhDLOCO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 10:02:14 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:43848 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238735AbhDLOCO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 10:02:14 -0400
Date:   Mon, 12 Apr 2021 14:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618236113;
        bh=03onwTU9Um31w8Mfn6QH4RSR6w5lr0DBC+K+sh5MACQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=JzW5GAgMQtt7/FbwM8bH6zxd6LxgBLViXP9kO8fg5WuTonXWwVI/yF7vdUzd8OJ4o
         z9or4fvT2bmubghYlJgO14bbPqCrqrC6d0odNWYIU1o4+uTt/SaABJCuL+iV/RtKNY
         55Ct8IEGyPR59bM7lMyUl8ReGBliDx6zhZJgExQ/fH5mPdz09p2vCOnZVNauRjfKv8
         qTr0j6ExqlpDRU550J/Ch5Yes8mNt+LRBu/OjAZovmFxI1fCT8nsHyiyslzGzTg/VD
         FoWQXPusv3JoGiD+fT6PXllzAD03B2Mi3TDQPfXQ8qJ82LblYghHocrJY2Oin2G3dT
         Rl34KktR+1Ywg==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary adapter
Message-ID: <20210412140054.27629-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The if2 adapter is defined in rtw_dvr_init() and in the dvobj_priv
structure but never used anywhere in the driver. This will remove all
definitions of if2

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 10 ++++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/stagin=
g/rtl8723bs/include/drv_types.h
index cec8d5ac0e2e..35882dc2654e 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -269,7 +269,6 @@ struct cam_entry_cache {
 struct dvobj_priv {
 =09/*-------- below is common data --------*/
 =09struct adapter *if1; /* PRIMARY_ADAPTER */
-=09struct adapter *if2; /* SECONDARY_ADAPTER */
=20
 =09s32=09processing_dev_remove;
=20
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 2b61a4bdd8a1..3545cb6ef886 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -381,7 +381,7 @@ static int rtw_drv_init(
 =09const struct sdio_device_id *id)
 {
 =09int status =3D _FAIL;
-=09struct adapter *if1 =3D NULL, *if2 =3D NULL;
+=09struct adapter *if1 =3D NULL;
 =09struct dvobj_priv *dvobj;
=20
 =09dvobj =3D sdio_dvobj_init(func);
@@ -395,17 +395,15 @@ static int rtw_drv_init(
 =09/* dev_alloc_name && register_netdev */
 =09status =3D rtw_drv_register_netdev(if1);
 =09if (status !=3D _SUCCESS)
-=09=09goto free_if2;
+=09=09goto free_if1;
=20
 =09if (sdio_alloc_irq(dvobj) !=3D _SUCCESS)
-=09=09goto free_if2;
+=09=09goto free_if1;
=20
 =09rtw_ndev_notifier_register();
 =09status =3D _SUCCESS;
=20
-free_if2:
-=09if (status !=3D _SUCCESS && if2) {
-=09}
+free_if1:
 =09if (status !=3D _SUCCESS && if1) {
 =09=09rtw_sdio_if1_deinit(if1);
 =09}
--=20
2.27.0


