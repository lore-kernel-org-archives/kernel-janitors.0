Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4976C433ED
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 14:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A4D461242
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 14:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344917AbhDMODE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 10:03:04 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:21533 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1345022AbhDMOCq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 10:02:46 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d76 with ME
        id sE2N2400F21Fzsu03E2NeZ; Tue, 13 Apr 2021 16:02:24 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 13 Apr 2021 16:02:24 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] ASoC: cs35l35: Fix an error handling path in
 'cs35l35_i2c_probe()'
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
        tiwai@suse.com, james.schulman@cirrus.com, david.rhodes@cirrus.com,
        linux-kernel@vger.kernel.org
References: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
 <20210413124323.GD5586@sirena.org.uk>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <3f276ab6-1704-84ed-3681-d639ba1e0010@wanadoo.fr>
Date:   Tue, 13 Apr 2021 16:02:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413124323.GD5586@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 13/04/2021 à 14:43, Mark Brown a écrit :
> On Sun, Apr 11, 2021 at 02:51:06PM +0200, Christophe JAILLET wrote:
>> If 'devm_regmap_init_i2c()' fails, there is no need to goto err. We should
>> return directly as already done by the surrounding error handling paths.
> 
> These are stylistic improvements rather than bug fixes so it's probably
> better not to call them fixes.
> 

Ok, agreed.
The error handling path is a no-op in such a case.

What do you prefer:
   - you fix the subject?
   - I send a v2 with a new subject?
   - we leave it as-is as this patch is a no-op in the real world? So it 
doesn't really mater.

CJ
