Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32900C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 17:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3E4661019
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243959AbhDLRXf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 13:23:35 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:23908 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239023AbhDLRXf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 13:23:35 -0400
Date:   Mon, 12 Apr 2021 17:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618248195;
        bh=qUCysYX4tPVItNo0/id4iEMpc8mrXGypUPYi2NbpZJA=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=InbkLCUwJsLxQRBcYJc2HW8v4fOdDBWZwAlIGJmV+jhmDyCuTu60/Ijb/8Qu+mypQ
         jzqABam54XgAi2VNT7RlKwen2s88tu/z+yAqqED88Gl9OcrMdO27S6Wbw+kYYLkaPs
         xbbKe/fRW9GoysW0y5jbBSYHywnH3A7AcBNYLBcbB6IFSmzVxE2nV5ASqDOxiur0tH
         DVIuV91plv9sUKYGlgpmU7TZ1bFVzNOSKX+ktuwZfVRgagR5NX73wPhWvlfo6MzpGg
         pFCXpuMraracBgYlTROFB/7L3d4DI9KLSYBKSIqCJUA420nkOTyagndJ3zAGPAAHl7
         nuMVVE6YxxCeQ==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary adapter
Message-ID: <20210412172147.43509-1-hello@bryanbrattlof.com>
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
Changes from:
  v1 -> v2: resolved merge conflict with next-20210412
  v2 -> v3: added change log

 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 10 ++++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/stagin=
g/rtl8723bs/include/drv_types.h
index 19da27fb5ddf..bf3de9a78f16 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -268,7 +268,6 @@ struct cam_entry_cache {
 struct dvobj_priv {
 =09/*-------- below is common data --------*/
 =09struct adapter *if1; /* PRIMARY_ADAPTER */
-=09struct adapter *if2; /* SECONDARY_ADAPTER */
=20
 =09s32=09processing_dev_remove;
=20
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 7090c1b3cc2f..a9a9631dd23c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -369,7 +369,7 @@ static int rtw_drv_init(
 =09const struct sdio_device_id *id)
 {
 =09int status =3D _FAIL;
-=09struct adapter *if1 =3D NULL, *if2 =3D NULL;
+=09struct adapter *if1 =3D NULL;
 =09struct dvobj_priv *dvobj;
=20
 =09dvobj =3D sdio_dvobj_init(func);
@@ -383,17 +383,15 @@ static int rtw_drv_init(
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
 =09if (status !=3D _SUCCESS && if1)
 =09=09rtw_sdio_if1_deinit(if1);
=20
--=20
2.27.0


