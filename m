Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1892AC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 21:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 033CC61994
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 21:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355148AbhJAVbb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Oct 2021 17:31:31 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45259 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhJAVba (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 17:31:30 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 66E0FE0006;
        Fri,  1 Oct 2021 21:29:43 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Colin King <colin.king@canonical.com>,
        Romain Perier <romain.perier@gmail.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@thingy.jp>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next][V2] rtc: msc313: Fix unintentional sign extension issues with left shift of a u16
Date:   Fri,  1 Oct 2021 23:29:41 +0200
Message-Id: <163312374938.6051.17877024620555330727.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928134654.991923-1-colin.king@canonical.com>
References: <20210928134654.991923-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 28 Sep 2021 14:46:54 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the u16 value returned by readw by 16 bits to the left
> will be promoted to a 32 bit signed int and then sign-extended
> to an unsigned long. If the top bit of the readw is set then
> the shifted value will be sign extended and the top 32 bits of
> the result will be set.
> 
> [...]

Applied, thanks!

[1/1] rtc: msc313: Fix unintentional sign extension issues with left shift of a u16
      commit: f3606687b447c41d28a011c98373b62b1cd52345

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
