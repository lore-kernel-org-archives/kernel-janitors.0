Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3B8C46CA1
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Oct 2023 21:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbjJRVho (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Oct 2023 17:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbjJRVg6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Oct 2023 17:36:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A35210C4;
        Wed, 18 Oct 2023 14:36:20 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40806e40fccso16400635e9.2;
        Wed, 18 Oct 2023 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697664978; x=1698269778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCVhrp90okWSl9RRgMNdpBPnBJhruFjjACD6W7aKPnE=;
        b=fMYLrq/Wp45Ig88rjE3KTV0ATRN2Ui6Q+yQhIhCyG81hL+Hfpo/HSUyoI6IS9S2wZe
         Mol6t6hncOWwXXCCYwfn01MUDGDztJ0KHJQTcu1aCiZsafnm69dFzBxh0g08CRpEz+kO
         1MB5JXE/KTGn36iuvqEeN3vmszxGTEMo1P1p+RH9ZEQdRiRi4ACyoOHfWBvA31TkGpVm
         AwaTzhykr830pSOyQNsC/P4QavSGU2jj47YKFhMZycLnudCSbSktB/KifFf5iPbpBPal
         hfKGw/ryAx9H8UCo69/mRD81ScA86XUzIwzsUn6YS1ruEjI48F3VEmU/ryZq65fFRGwf
         TOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697664978; x=1698269778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCVhrp90okWSl9RRgMNdpBPnBJhruFjjACD6W7aKPnE=;
        b=LnURJyIRn93elarE8MxRklVxjhBvKkWiXLHp5vDx8dfUHCNLkHIVLVQhwwKJtIZNaQ
         E/3dlEMOy4Z0ouHTDTJxlth0s4E6Gx4SnSVxPVYlOMNizERwE0ir0REypNh0TpclMc62
         gu7na9QyePw4fUDDL9cGQSbk5M0irdWgpalnqdzp2ptTfCE8Go35Me60tANgEHB3F5Tc
         qIcrRDkrTYL/b0cgVpZkOZIGNzYZGryXjBttAgM6j/Vwrm4Ive/u8JcQaWekOBZ1jsx5
         AnWXL8WXmAvgIWVr5fQRhHMhBj80rNowDlEdyTHKLOXCkF9gqZHaWXhIZwnUKmfCvH6S
         sH5w==
X-Gm-Message-State: AOJu0YxuncAz0w5at4qArHaIwH139YzV7Kp7uqN08TO2xUDH1mIwCj1c
        2bobm9NkrPoaR6vAbXDk49k=
X-Google-Smtp-Source: AGHT+IHjqcHZlWwSZER6472scqSi0GlbXjVK2Qg9iOIon9lhuOzZOXx7h0ejemyGWbBMaK1zGnxvqQ==
X-Received: by 2002:a05:600c:1384:b0:408:4160:1528 with SMTP id u4-20020a05600c138400b0040841601528mr409741wmf.30.1697664978620;
        Wed, 18 Oct 2023 14:36:18 -0700 (PDT)
Received: from reibax-minipc.lan ([2a0c:5a80:3302:f900::978])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b003feea62440bsm2617007wmb.43.2023.10.18.14.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 14:36:18 -0700 (PDT)
From:   Xabier Marquiegui <reibax@gmail.com>
To:     dan.carpenter@linaro.org
Cc:     davem@davemloft.net, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org, reibax@gmail.com, richardcochran@gmail.com
Subject: Re: [PATCH net-next] ptp: prevent string overflow
Date:   Wed, 18 Oct 2023 23:36:17 +0200
Message-Id: <20231018213617.3196-1-reibax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <d4b1a995-a0cb-4125-aa1d-5fd5044aba1d@moroto.mountain>
References: <d4b1a995-a0cb-4125-aa1d-5fd5044aba1d@moroto.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Nice catch Dan. Thank you very much for the fix! Looks good to me.

Cheers,

Xabier.
