Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B10C001DE
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjGKGGB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjGKGGA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:06:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91003E8
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:05:59 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-314313f127fso5462172f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055558; x=1691647558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
        b=t2Yr+QWSR/YsSFFbia2YGAW7i8T8cWbZ/PRnB7BOcF91pQBS1Pv4nH0lk1C4uN5zNP
         q8pxUAMP/bKvbPykAlCZ+oyTKVG8/fXcT1fgemVTvp2NSJSS1nUxSNNdIZjuEiTqTrZq
         +9448VhPoeUmKcQ/lyxrNpUZH80KVThUiOPLs5gXk+/sILsgj+CFfQayWEzCs76AQ+ST
         b4gIzo9zbw6BuQurVJzvqcltiICv2ZDNDpFafKXClPQ3QDeLWbtatdys0U5XKTFC9Lnp
         8sQUWAhNd1XS6nxFpIlRIX/ENya9QRZD6LoIWrihNstyeRBO/TkhJWy2awk4qy3g8Ku3
         3tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055558; x=1691647558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aesAxzayxM+SEzglJ/Ypflh+S53bG0sURfwQo/p3I3U=;
        b=IWBwLZg6+Z1ZKnUGhlvhLzNBA2lVQTDf3KmKI4ENhpqq+LHFL2Cl0ibD9vS4DE5VGb
         s8XntLcS3PlKXJdAP+TMCWGI1CteyMnyvBqxN/J+A7Npf7RNPP1ID0cj3idnXqsFF1GL
         A3lBTHVS1E57xam0KCbLj3bqMJBbZbN35X+d9jdgulLXOANMKewroTVEVGG/pq6yJ8m9
         L+l7yM31Yqb9/R9YlDgZAIWHmsTFiz4UDPC1+tEs/UYkm6fPGeJMpYC2ydZ62KE5v2Yv
         oEYOILNRQngwP/0zQk6ifKYTPTO0H1PCgQrWQGQ1Xl+L+aXeDzPQSGza/VgkA6/pREvL
         rkEw==
X-Gm-Message-State: ABy/qLYaOF/U6Ss1XyJ0MiAjlsQ5gRrbvov3X0WlFhybORDy5cJkBzVS
        XrI+s9ay10I52MRsu9U1Q4tCRg==
X-Google-Smtp-Source: APBJJlFfvQKMGo1BcUF/1jUzDWo/C/kzCrN7OGJnmLUAWv27PZ4FeGr3LtF0Y+Pi9vx5yglpnCDqMQ==
X-Received: by 2002:a5d:56cd:0:b0:314:1a2e:1af5 with SMTP id m13-20020a5d56cd000000b003141a2e1af5mr13831401wrw.25.1689055558077;
        Mon, 10 Jul 2023 23:05:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d5510000000b0031417b0d338sm1247851wrv.87.2023.07.10.23.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:05:56 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:05:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5 v2] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzxP8iX8Op0lYvh@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
