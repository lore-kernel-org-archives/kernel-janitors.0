Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0EBC48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 07:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC24D6128E
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 07:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFVHgd convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 03:36:33 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:53462 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFVHgc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 03:36:32 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 2553860A59CD;
        Tue, 22 Jun 2021 09:26:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gnEp7wI087K7; Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id D845E60A59DE;
        Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id hJjPVIp0vUEK; Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id B844D60A59CD;
        Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Date:   Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     chengzhihao1 <chengzhihao1@huawei.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1855987833.142283.1624346779725.JavaMail.zimbra@nod.at>
In-Reply-To: <20210622064419.GJ1901@kadam>
References: <20210621152249.20901-1-colin.king@canonical.com> <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com> <20210622064419.GJ1901@kadam>
Subject: Re: [PATCH] ubifs: Remove a redundant null check on pointer lp
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Remove a redundant null check on pointer lp
Thread-Index: LtxiwfRXOC2sFlJZKjZSpX+xuqDRmg==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

----- Ursprüngliche Mail -----
> Ugh...  I'm so sorry.  My patch was clearly wrong.  I've tried before to

No need to worry. :)

> add a Smatch check which warns about duplicative NULL checks, but I
> think this gives me a new idea to try.  Hopefully, it will prevent this
> in the future.

Sounds great!

Thanks,
//richard
