Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358A2C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 12:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D756115A
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 12:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFVMRv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 08:17:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49742 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhFVMRu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 08:17:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15MCFFQZ053902;
        Tue, 22 Jun 2021 07:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624364115;
        bh=VXl+turadXEnbo1KvsAjQeLsr8jDoDct/9xwVEpSP24=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vfk9zw3qA8STy8oMrHARhDBi+4Pq2AgjZ+aUCsfAaTshQKPMGcAV4+FeD6VVo2Lwc
         8j1+UBTA78bzjRGfcOYucXfY/GRPFUk7tXWwHEXgHR+EL4yBqzDuMx877X0OSgzTb/
         HxtG2RtZt0pFNEMEhDXm6PEaa4n9gVUtEnqAC8a0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15MCFEjD048546
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Jun 2021 07:15:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Jun 2021 07:15:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 22 Jun 2021 07:15:14 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15MCFBHg049752;
        Tue, 22 Jun 2021 07:15:11 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
        Colin King <colin.king@canonical.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Richard Weinberger <richard@nod.at>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: remove redundant continue statement
Date:   Tue, 22 Jun 2021 17:44:47 +0530
Message-ID: <162436407038.6751.408040408294040312.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618093331.100006-1-colin.king@canonical.com>
References: <20210618093331.100006-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 18 Jun 2021 10:33:31 +0100, Colin King wrote:
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: remove redundant continue statement
      https://git.kernel.org/mtd/c/c17e5c85b3

--
Regards
Vignesh

