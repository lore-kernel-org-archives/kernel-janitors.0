Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B05C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 15:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D6136113A
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 15:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDJP1Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 11:27:25 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:52286 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbhDJP1Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 11:27:25 -0400
Date:   Sat, 10 Apr 2021 15:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618068428;
        bh=zFaYA7o/vFomj+mE5w9U/463Jwtdduv9PSyc4Ur+rQk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=P3Fb93P4jqk60HcCP22zxyI6Kp4F8OmF20WBPDmdYlSPTDFZkZquydkRvFr+fof0Y
         LYHdixD/pT62qMZdKwIpYd5NRhz4wbfGvumgR0+lRQKuQXS2zF1iUzYNafjEODqXbr
         9qvSAydxvDx3JcKXOGaYmaUgu3l7TGL9QWpKfcxyYzNzFFufoDob152wfi3cmdEVAY
         1baXM1VEXfyyLi6rlTimmcooRHNMmm90ylw9mCT8UHDZesd2R9Szzs7MbqT1V3Qsf7
         RIePllRsIDmCcwSzZq4YIOP4kVSRHsbtu3JuwnVxjT8n4hCn2HSZORoXFTcr98yPro
         JfbwPEbXH9hZQ==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <20210410152536.426047-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The next instruction for both 'goto exit' jump statements is to
execute the exit jump instructions regardless. We can safely
remove all jump statements from __init rtw_drv_entry()

This will also remove the extra line-break before module_init()
that checkpatch.pl was concerned with.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
Changes from:
  v1: removed unnecessary edit of DBG_871X_LEVEL
  v2: elaborated on steps to remove a checkpatch.pl warning

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 9fd926e1698f..39b6d4b6dec4 100644
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
@@ -540,6 +536,5 @@ static void __exit rtw_drv_halt(void)
 =09DBG_871X_LEVEL(_drv_always_, "module exit success\n");
 }
=20
-
 module_init(rtw_drv_entry);
 module_exit(rtw_drv_halt);
--=20
2.27.0


