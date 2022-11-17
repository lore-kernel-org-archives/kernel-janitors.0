Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECA6C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Nov 2022 15:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbiKQPER (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Nov 2022 10:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiKQPEP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Nov 2022 10:04:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25E1748FF
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Nov 2022 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668697395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4kP3I1EFsocj5neBUfNHWwkMSIOfBtU0NTLvuRyv3+g=;
        b=DElYZwWlpfXwA/EQzjP1XcnLWceNAQ3Coud8pTBtBG0Ar5i6NH5/wt5L3C6Gwl8w8hfnyS
        9WwEQWpBAY30u0NNrYL0Q1xxDtEN9cPJF9Nz8flcxs4TlH/7vNC6VhzqDb4MLXxfqWpsxu
        r0df63OTWOMlkx//bjBZXY1e9pwXXtw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-hA4phJrgM2yZ781WZa32fw-1; Thu, 17 Nov 2022 10:03:13 -0500
X-MC-Unique: hA4phJrgM2yZ781WZa32fw-1
Received: by mail-qv1-f70.google.com with SMTP id l6-20020ad44446000000b004bb60364075so1797783qvt.13
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Nov 2022 07:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kP3I1EFsocj5neBUfNHWwkMSIOfBtU0NTLvuRyv3+g=;
        b=5sNZpAYTz5D3+qvyvtUNNU7yGV93FDw4O53kG56mn4bNJFOlcQVGguQnVeyWLSvX8j
         LGX0XGMLyeU5Ri9GLB4Z9bcuxK9fkmooRz20Vn0H7CLWXQ7avpyqBygHLh0+JZKMpL5f
         VZUn5RtvZzJrKtcDP7ttey4Hpxq9tC99QYcGr9lN8Xs0+s9ppZg0sqP0C1r9UfrVCI2u
         yo5djddf7/MbfaW4woRvd8xQph4bnCVKHZkykVwU98kRzUhMbK16TjxwpzBwEX9+KDEv
         azgy5qJ8aFs5TAAfFBGB/sC4iygBBq2PsRhrdBwikF+47/pWe/+42KgWSyKFlEnXJG4j
         Ridw==
X-Gm-Message-State: ANoB5plmB2Ouv8j3FY+ryt1K2AapAuxRKJh9xxvWv7Ax9hsXzD63vq3j
        Tx8+JoOYSy/JnirRNNkMCrok5AikqnKeQ1Xq1ZlIdY+7F/L5iFQD9+0OEGSg2RE3fHVexG92PWZ
        UM0Mb37R0ayLZfFRRXhSYguPJVnL1
X-Received: by 2002:ae9:dec2:0:b0:6fa:1c6f:1674 with SMTP id s185-20020ae9dec2000000b006fa1c6f1674mr1957806qkf.219.1668697392573;
        Thu, 17 Nov 2022 07:03:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ETfSrHfnC9NDbUvs1Ku+VUyCrRN60tL3WKkpDiJahvICyf3/cs/lgtM0qGX5O1Kk8IWsUhw==
X-Received: by 2002:ae9:dec2:0:b0:6fa:1c6f:1674 with SMTP id s185-20020ae9dec2000000b006fa1c6f1674mr1957782qkf.219.1668697392326;
        Thu, 17 Nov 2022 07:03:12 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-203.dyn.eolo.it. [146.241.120.203])
        by smtp.gmail.com with ESMTPSA id fd3-20020a05622a4d0300b003a586888a20sm472747qtb.79.2022.11.17.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:03:11 -0800 (PST)
Message-ID: <519cbacf20b10909ee362e0bcc9aa87cbb7137f3.camel@redhat.com>
Subject: Re: [PATCH net-next] net: microchip: sparx5: prevent uninitialized
 variable
From:   Paolo Abeni <pabeni@redhat.com>
To:     Dan Carpenter <error27@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Machon <daniel.machon@microchip.com>
Cc:     Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 17 Nov 2022 16:03:07 +0100
In-Reply-To: <Y3OQrGoFqvX2GkbJ@kili>
References: <Y3OQrGoFqvX2GkbJ@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

On Tue, 2022-11-15 at 16:14 +0300, Dan Carpenter wrote:
> Smatch complains that:
> 
>     drivers/net/ethernet/microchip/sparx5/sparx5_dcb.c:112
>     sparx5_dcb_apptrust_validate() error: uninitialized symbol 'match'.
> 
> This would only happen if the:
> 
> 	if (sparx5_dcb_apptrust_policies[i].nselectors != nselectors)
> 
> condition is always true (they are not equal).  The "nselectors"
> variable comes from dcbnl_ieee_set() and it is a number between 0-256.
> This seems like a probably a real bug.
> 
> Fixes: 23f8382cd95d ("net: microchip: sparx5: add support for apptrust")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

checkpatch complains about the From/SoB mismatch - 
'Dan Carpenter <error27@gmail.com>' vs 'Dan Carpenter
<dan.carpenter@oracle.com>'

Could you please send a v2 addressing that?

thanks!

Paolo


