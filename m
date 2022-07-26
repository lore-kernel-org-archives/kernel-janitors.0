Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A79C04A68
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Jul 2022 18:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbiGZSak (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Jul 2022 14:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiGZSaj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 14:30:39 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A19B1DF
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 11:30:38 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 23so13810074pgc.8
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=FLXa0nbDXsZ+vL/FvW/ivGkItaQ8+NiszDubboZHV+4=;
        b=tBxl2XsnT0UvG7y63UlNq6ZaEUvROQ0MHYpaphHCFglPzqagwz3XImxX/ckF9kjV4c
         sAZF1rPVeT+zzl2imR+Zeb/9pb6BO/AQVRI7PlyU8GT8VZATbGP+LmtC6sytHEGnuG8l
         q9AD+G02jheCB+lEDSCiiS6+mRDLd/rMfMIpVa9+UJbACaefvEkMDOK3G65FaO+LBgJm
         v0xkwRRTWBf0wBn+sxo+Rrn+Zq2lj8DutZmt/J9NaVK0fPwPCIj04b+gQfX7kRWrwYZm
         85+QbuCpWILke2toxJVB/HPo/BW63W9atEx5PHKqQ+U5ReK/eDEkupbhx+AHA0tw4rOL
         fe6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=FLXa0nbDXsZ+vL/FvW/ivGkItaQ8+NiszDubboZHV+4=;
        b=XBRENMqbyvFhJKTHk4qzrF/ITlcSB1kNjYtQb7T3/xZeMre40EtOjGmDkozKKk7gt9
         HGAgD/F6zM2k0antqGSzzGVZBhuHq5epzTDoT3lwBg5NGqzrl9XHytJoS2nhriMzI2BT
         Boe2BFkkoFjDCS+hCaB4LY2ReogyHJsGlg5V/aVkziTfoOtSjMe8/DiKBvDgd8aHPp0O
         x4rTeF29U9aWDdd2kBZgpBaKbszUNkDSLxMtAelS726NOf9ZK7SRv+oAOJJN3Ps40H7b
         RzVjVs93cYBvbnoUQLsSLURs/L4d9ySWpqtoXKNJ01TvMnmT0kOdgeTOaE0wIRrFYJ/L
         uspA==
X-Gm-Message-State: AJIora9D16AhMv+XhErh5ts46F5mD4pdh6+Td8OmEHEyKdHT8cPYVFW7
        /rAVl+TxUwebR8X4567wr3J3lw==
X-Google-Smtp-Source: AGRyM1vXugtp8/huehQJFWMzvdzFyJBHWnHc5ad7vEGtguX2DehQ2H+XmdBhJ+BmFFqDtuxuMcztsg==
X-Received: by 2002:a62:3086:0:b0:52b:fd6c:a49d with SMTP id w128-20020a623086000000b0052bfd6ca49dmr8916113pfw.26.1658860238108;
        Tue, 26 Jul 2022 11:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id h2-20020a17090a054200b001f0ade18babsm13356932pjf.55.2022.07.26.11.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 11:30:37 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     ming.lei@redhat.com, Christoph Hellwig <hch@lst.de>,
        dan.carpenter@oracle.com
Cc:     kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org
In-Reply-To: <Yt/2R/+MJf/MSoyl@kili>
References: <Yt/2R/+MJf/MSoyl@kili>
Subject: Re: [PATCH] ublk_drv: fix double shift bug
Message-Id: <165886023723.1524809.5862125257342957251.b4-ty@kernel.dk>
Date:   Tue, 26 Jul 2022 12:30:37 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 26 Jul 2022 17:12:23 +0300, Dan Carpenter wrote:
> The test/clear_bit() functions take a bit number, but this code is
> passing as shifted value.  It's the equivalent of saying BIT(BIT(0))
> instead of just BIT(0).
> 
> This doesn't affect runtime because numbers are small and it's done
> consistently.
> 
> [...]

Applied, thanks!

[1/1] ublk_drv: fix double shift bug
      commit: 8d9fdb6011b4d413271eba3a62e10f89efecc419

Best regards,
-- 
Jens Axboe


