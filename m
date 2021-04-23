Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE63BC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Apr 2021 06:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7208613B7
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Apr 2021 06:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240943AbhDWG6S (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Apr 2021 02:58:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33190 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240910AbhDWG6R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Apr 2021 02:58:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 8BC4C1F437FB
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     Benson Leung <bleung@chromium.org>, Ye Bin <yebin10@huawei.com>
Cc:     linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] platform/chrome: cros_ec_lpc: Use DEFINE_MUTEX() for mutex lock
Date:   Fri, 23 Apr 2021 08:57:31 +0200
Message-Id: <161916102148.2605538.6249402321169381536.b4-ty@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409095138.2293869-1-yebin10@huawei.com>
References: <20210409095138.2293869-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Apr 2021 17:51:38 +0800, Ye Bin wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().

Applied, thanks!

[1/1] platform/chrome: cros_ec_lpc: Use DEFINE_MUTEX() for mutex lock
      commit: d61b3f9b91be32f714b218377ab5081932e3ebc2

Best regards,
-- 
Enric Balletbo i Serra <enric.balletbo@collabora.com>
