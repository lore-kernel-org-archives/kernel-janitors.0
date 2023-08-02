Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5F5C001DE
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Aug 2023 00:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjHCA44 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Aug 2023 20:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjHCA4z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Aug 2023 20:56:55 -0400
X-Greylist: delayed 8398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 17:56:52 PDT
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net [46.105.58.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90365211B
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Aug 2023 17:56:52 -0700 (PDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.156.220])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 95FF425E95
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Aug 2023 20:11:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-555xj (unknown [10.110.171.251])
        by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBAFE1FDB3;
        Wed,  2 Aug 2023 20:11:04 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
        by ghost-submission-6684bf9d7b-555xj with ESMTPSA
        id RP0MLFi4ymTqZgAAEZsMJw
        (envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:11:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00295aec8e1-6d36-45b6-8f41-9395daf0ec5f,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Clean up a call to request_irq()
Date:   Wed,  2 Aug 2023 22:10:32 +0200
Message-Id: <169100562784.1919254.4818687788219395410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
References: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13283648577026919035
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi

On Tue, 25 Jul 2023 09:50:55 +0300, Dan Carpenter wrote:
> This is passing a NULL thread to request_threaded_irq().  So it's not
> really a threaded IRQ at all.  It's more readable to call request_irq()
> instead.
> 
> 

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: imx: Clean up a call to request_irq()
      commit: b4fd609a2018bb0bfce9351c506a6e0dc7fb64e8
