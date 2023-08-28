Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45623C83F12
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Aug 2023 19:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbjH1TTy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjH1TTk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Aug 2023 15:19:40 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Aug 2023 12:19:32 PDT
Received: from symantec.comsats.net.pk (symantec.comsats.net.pk [210.56.11.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D203A102
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Aug 2023 12:19:32 -0700 (PDT)
X-AuditID: d2380b23-3c1ff70000007104-96-64ecefbb2bd2
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 57.06.28932.BBFECE46; Tue, 29 Aug 2023 00:04:27 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=USPlqYz10SGigGCHXDMy6TGiHFtATjnyQw1/TPs+eeXi4f9vMXLuelYNUTtAu8XQ7
          ZwsKXuyLl65lIs1dz3wFZ7b7ji2ClCWeZzvuDI02JT725UWEjcRxtoFKq5uTmyB9c
          ePqBCmlxUZqBeV+XJznNjXCtD2L4H0oUpPYFhb/UQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=olmk80cLmZoXHNEULi94oyNYNSuJDPnVFjLFsR7WPgY=;
        b=Dkq2GaQIL1wQwbliq8rDm40u39aq9lNuNlKsqAVCBeg1DlDKDPrQAcAnIbwYwxP3W
          gWONvkQRCIlM29CNzFiH/bIADJ98eFKtJKlEdJvqhYrKjKI36V3C/+1IDZ2lMBTO3
          k529xYcSR2q2gL3T0QgRwkR+Sxpvehex+lKUKUZ74=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Mon, 28 Aug 2023 23:54:11 +0500
Message-ID: <57.06.28932.BBFECE46@symantec.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Thanks for your response!
To:     kernel-janitors@vger.kernel.org
From:   "Hou Qijun" <conference@iesco.com.pk>
Date:   Mon, 28 Aug 2023 11:54:32 -0700
Reply-To: qijunhou02@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc/tKeRaePh6/zipjySO6RDM2lmYxzmwz/KFTN7ZsZk6N7kmf
        tKG0Td+DCdkSVh2yBhxsRUpVUuY262SZgYgIA7tOcGo3B7O6wIaOVTIKo0zWWWMMu68/aP+5
        ufdz7vec773nXpJgRkgVqTOIvNnA6VmFUj66Li/tqf7grOaZqamsdefGVr6ENi905b+Gdio3
        aHi9roo3P/3CO0rtiNWfauonDjjaXKm1yC+zomUk0GoIX2smrEhJMnS/DBpO/RNZyOkzBPx1
        7mBKdPEHAW3zfiRJGPoggnsX3pDmFL0ejrX1EdKcoAvh1xabIsoz4EqbXx7la+HLjhm8h8Tz
        1RCyihLOpFl4NPRIIeEsugCa3KkSVuDd3c75iFJOr4LGU4fl0haGzofLPVVNaIUjqZYjqZYj
        qZYjUcuJ5F+hXKG6gsNXVlpYaqwQOFEoNPBioam8C0XuL62gF51s2utBNInYdKq+dlbDpHBV
        WORBW0kZm02Nf4DR8n1GTbWWE7R7zZV6XmCzqPUBjKklvK9SX86qqLxbmGYuUQP/rqDnRdww
        DwKSwLLRjQEs03DVNbzZGE3mQStJOZtL5a2eKmXoMk7ky3nexJvj0TdJkgXq9DTOnGHmy/gD
        +3V6MR7GOvfWGQ1DJ0ciZh6n3s7AtXKSA8l+ZOQyD9pMpmNTJXelswgmrkLQlcXyZkZpepxG
        cj5GnfkFQyYOE/muIiPZfuTiAEHWz3nxGOqxuglGbjAaeFUudWgOq2hJpa00LHlX5VDDQ9ji
        iqSAVEaVRw1KPDuJJyrF330AhRHuWSaVHZR84m+RMM9QP45hmBaDEe9APTcjXWGMJRI+exbn
        oTtlMDH8FvzgdKTAJc+4AsLuRRK6LQ/TofObezkw57QDdHZOA/gueIvgxt3f1eDvePA8HP/u
        +02wWDu6BUL1U9ug66GtBI54h7aDyzK9HwIz/5pgwt1YBfaw7X2wz/fgL9R8NPgRgpYTww0I
        bnt/bkRwI2j/GMHfV1s+QbCwONiK4P7NYTxOdtiPIfjswcAJBKO+iXY89nV/jgK4cTLcONt5
        6TUJIicmNy5tICA1LkZjjUuRIBOHidOralHByV5xZ8llNvCk/tvDI3dujTdM+D501dzZUryt
        rs7iHbwm683v1qYOfq0Wvwjb1Ldr6l2y1k//C7UjXWjXn1cW1L/lN4y9XMzsOH3c07epqcgS
        fCJ7z27LK77W63VrNhzKfXXyp6OuS2d3XD/fkeG8qHsv3Kzki5f7Nr54f/J19ez0TVYuaLmi
        NYRZ4P4Hrc3LBOQEAAA=
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks for your response,


Kindly reconfirm your interest to further discuss the investment Thanks for=
 your response,


partnership within your country as I explained earlier so we can have a fur=
ther discussion to facilitate the process for mutual interest.

Looking forward to your response.

Hou Qijun
Vice President- CNPC
China National Petroleum Corporation
No. 9 Dongzhimen North Street Dongcheng District Beijing.

