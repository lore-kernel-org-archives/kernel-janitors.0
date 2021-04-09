Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A9EC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 20:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83CC661041
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 20:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhDIUNc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 16:13:32 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:26395 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbhDIUNb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 16:13:31 -0400
Date:   Fri, 09 Apr 2021 20:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1617999196;
        bh=EqzbmR+DJhqb9z9zKSGWyGT6bMFjSUyRnTL5U0wQp9E=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=EvtnezQZaulaWFJFWk6fCh3jklQ8Gbz7xTns7P5j1XDm5MXZf2it1XFBvFprcUEAB
         NyHRsa/486AHbrzLBlU9bHfYmNwG3w6VXl0qp2+BtzhWeNa8b/wqI5FyqHxNEbdCOo
         0A+a5e3hElFrUbBoLFzjDn0fPg2qTOexB2pd5MS+SqiJx78ON2dRJhB9akW1SjwDuX
         /OYHmfahUKE3wPcFm0p8brzN8vRZNFtZHOyVoL5tJlu5W/d6L5izNWkPBKP6T5/YAj
         D/EKjHFBgHUNCkPOxnDetQadoC5L2lE5BeoI3Xm4HU4QMAv+reiUBatnJb0n10TH6X
         EN6juZP+jb4YQ==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant initialization
Message-ID: <20210409201235.407671-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The variable ret is being initialized as 0 and is never used until
it's updated by sdio_register_driver()

This removes the redundant initialization of ret

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 5de4c70aab6a..9fd926e1698f 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -503,7 +503,7 @@ static int rtw_sdio_resume(struct device *dev)
=20
 static int __init rtw_drv_entry(void)
 {
-=09int ret =3D 0;
+=09int ret;
=20
 =09DBG_871X_LEVEL(_drv_always_, "module init start\n");
 =09dump_drv_version(RTW_DBGDUMP);
--=20
2.27.0


