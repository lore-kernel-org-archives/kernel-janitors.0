Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C61C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 Jan 2022 08:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238708AbiAEIzs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 5 Jan 2022 03:55:48 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:43507 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238712AbiAEIzq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Jan 2022 03:55:46 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F1EB240005;
        Wed,  5 Jan 2022 08:55:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-i3c@lists.infradead.org, Nicolas Pitre <npitre@baylibre.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: correct the config reference for endianness
Date:   Wed,  5 Jan 2022 09:55:43 +0100
Message-Id: <164137293677.1744375.2377630941064960433.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
References: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 3 Jan 2022 10:45:04 +0100, Lukas Bulwahn wrote:
> The referred config BIG_ENDIAN does not exist. The config for the
> endianness of the CPU architecture is called CPU_BIG_ENDIAN.
> 
> Correct the config name to the existing config for the endianness.
> 
> 

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: correct the config reference for endianness
      commit: 7a2bccd1a27f0c8fc87e4ed56abd6ea9fa7314a6

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
