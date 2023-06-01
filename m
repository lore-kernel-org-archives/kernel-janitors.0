Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5172DC7EE23
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jun 2023 11:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjFAL6L (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jun 2023 07:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjFAL6K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 07:58:10 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D840EFC
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 04:58:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30aea656e36so716929f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jun 2023 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685620686; x=1688212686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUSulgTLXxlOVF8EDkOlaJ2QI+WY4czf5wWhGzKYhbQ=;
        b=aMrUFP6ez6D/RZVRs4aZNITYGGGOZiCndSE3NsTWL8PyCDDRFxSB8ywBoOO6gCUUWb
         8ZrNrgmskWsPulacj8dr2RZVGgBMYSZiEBshz3mLIyaOp/lqhgxmv0E82fIWdc0q4YNU
         KIW3Oy6G7tqkHuq5WL2RTmiUBPpgF7PbTrS7p9zuS8mxwgrgGGV2qRS6CItbhB/VIZ/i
         geHqzTz09ehd6grtN+ElGcf6IfaTILALsWmtNK0sWrn+4XRpAdta7+QSDr1urdryUGHH
         7Ttph5yV6LGeHugr6YeNjayinsaLkqD3L0QHiZp0na5DnbFsmvOPOZTk9FZK67NIbfdf
         lxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685620686; x=1688212686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUSulgTLXxlOVF8EDkOlaJ2QI+WY4czf5wWhGzKYhbQ=;
        b=Gjhr1/gptDm97QGn7CQmgpxHk4Zuvo+3TP/OVsC3O9yIHpILEhOIbQ3nzdSrQ7By9B
         5c1f9stZVko25QRtksDn2eNq/mDCdMnE2NSxXsE8B/Qye9JYOGCowEjO8SRwUoJv87Jl
         2FtNS+Sl8Hxdd5Wxec8DxXqv67PLXaIKOoAklMOX+CUzP5i/h7g98FWapRpdkcSm5wI6
         nlssJyD4LdblafAheQiGprQGqDpgQiFjzAdH/emxfioIBXGq/WKsXHdKPpU+6lqTF/57
         h/U2QSAH5a7NiPotCXEWeiYV6ZFAl/FkJzPLLEfwSX1yaAnVx/s5WfwdkkTToB6VJD/4
         v6Rg==
X-Gm-Message-State: AC+VfDzj7PPl/JZE7apx10WEwY0QvR/v7IV4a5e2OSJuBSXZ47lNOlLm
        2kjosydGiYjU4NwcoApas0+a8Upnt5/Me8kEN796MA==
X-Google-Smtp-Source: ACHHUZ52iMSRH40/L7D5CH94xI49CeJwSsSIGmdJvp46dbH42zFra7WR/rub+naOqbjq8eSUPO8y0Q==
X-Received: by 2002:adf:ebd0:0:b0:306:32fa:6737 with SMTP id v16-20020adfebd0000000b0030632fa6737mr1586077wrn.8.1685620686209;
        Thu, 01 Jun 2023 04:58:06 -0700 (PDT)
Received: from [192.168.1.70] (29.31.102.84.rev.sfr.net. [84.102.31.29])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d440e000000b002e5ff05765esm10175259wrq.73.2023.06.01.04.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 04:58:05 -0700 (PDT)
Message-ID: <80312ffc-fe9a-6a11-8dd9-27c794abd8b4@baylibre.com>
Date:   Thu, 1 Jun 2023 13:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
References: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
 <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
 <cf3ada2f-0c44-4389-9758-b72af9d138db@kili.mountain>
 <5d9f2dee-7c56-0220-48fb-c9fbdec1af29@baylibre.com>
 <65b0fe53-ec91-479e-b55b-06af0678159b@kili.mountain>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <65b0fe53-ec91-479e-b55b-06af0678159b@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


> Sorry!  These underflow flow check isn't released.  I probably could
> though.  It doesn't create too many false positives.  See attached.
>
> drivers/clk/qcom/clk-rcg.c:618 clk_rcg_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
> drivers/clk/qcom/clk-rcg2.c:617 clk_edp_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
> drivers/clk/qcom/clk-rcg2.c:794 clk_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
> drivers/mfd/tps6594-i2c.c:159 tps6594_i2c_write() warn: 'count - 2' negative user limit promoted to high
> drivers/gpu/drm/radeon/si.c:4594 si_vm_packet3_gfx_check() warn: 'pkt->count - 2' negative user limit promoted to high
> drivers/gpu/drm/radeon/si.c:4697 si_vm_packet3_compute_check() warn: 'pkt->count - 2' negative user limit promoted to high
> drivers/net/dsa/microchip/ksz8863_smi.c:66 ksz8863_mdio_write() warn: 'count - 4' negative user limit promoted to high
> net/wireless/chan.c:456 cfg80211_set_chans_dfs_state() warn: 'center_freq + bandwidth / 2 - 10' negative user limit promoted to high
> mm/page_isolation.c:558 start_isolate_page_range() warn: '(null)' negative user limit promoted to high
>
> I think the radeon and wireless warnings look like real bugs.  The
> rest are false positives.
>
> I've looked at all these warnings before so they should have all been
> false positives... :/
>
> regards,
> dan carpenter
>

The functionality is interesting. Pity not to have it in smatch.
Maybe you could differentiate 2 levels: "warning" VS "check",
similarly to checkpatch. :)

Julien
