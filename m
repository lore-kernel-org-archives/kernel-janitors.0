Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F29C0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjGKGIt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjGKGIq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:08:46 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82A01BC
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:08:44 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3159d75606dso1617831f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055723; x=1691647723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
        b=pwQgrr3VfqsIgF/yJ9EbzF2OfgeC6Kk4wADko02rM0LorUIA27+Ha3kMJunYExsAHp
         /4lsB08oS/IAr8GtrR+eZcR6LuS7x6a7s8KSxXB+1JKNhPeT068p58oK/dY6rqN3zHJ3
         CReWuhFXLVqk8UBZODqoGHRgLsAu51i+i12gHkSJI0pAKmHX9nyd2KRNrH17ter1e5Mp
         qpKrfP+jE43bNmqtEJKVNZ/xCqTIHlz86unr9juLo6T/ECDGE/YsbM3YiTs5KQDxY/Ir
         qguM3gjnEzREAeoYzQ5AUmN2ShnmdcTEaOUPhBmoKh7WL6A5EYZzCPV7Bx8pPjm5S7wA
         NHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055723; x=1691647723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8werb2SBWZr7v/sXzjx6gnxExhvkujqij807vJmKy30=;
        b=jMaRp5sqA5uHvSuXjN0ihYU2/Iik9HHR8foIs1lPHOEj73DQGIlqkwAQIV0YwVtZl5
         K5BZXRK6uarW14rXAXJDOtTkIfDopgMazdUNOn3hco9lqhRAmB81i3L6QnDYiXHtKOUa
         gs3Hi6Gy8A1ymn9M1NPQepNR+P2croPzjcd4GX8RcYQ3Ypl+ooAHOjHunw1LmyvBK3pY
         XI/DKP78JW6Tu0p1lY83FOtYVIdaLFbXkw6nMB6/C+0kW+uJqwfTKjUKZ3byU+rUkSrY
         kiJZ1b/NSe8oTTrUP3TNDZ4j1UEfKf/oVUxj/9E4oQGUKyzrTBEWJ8r2RBpCVTyC+Pmh
         Rneg==
X-Gm-Message-State: ABy/qLZp8V5uazQ4fNZGaL51aMxH3FYNlS2C4zpuBz4Nv3y15r9kIv3W
        qWdgBF2lbAQGPmxdC4LPxKLPAw==
X-Google-Smtp-Source: APBJJlFnfJolRPMMeoYKAGfu5dCjeSnPio4DalzndKJ3lrBfZ4HJWeBfTMi4c1ww8WbLyIRRzLI9iw==
X-Received: by 2002:a5d:4b87:0:b0:313:e3a8:b47c with SMTP id b7-20020a5d4b87000000b00313e3a8b47cmr12330315wrt.8.1689055723407;
        Mon, 10 Jul 2023 23:08:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d4b82000000b0031432c2fb95sm1251399wrt.88.2023.07.10.23.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:08:41 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:08:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5 v3] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <ZKzx5nA6Z/0yhBJj@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fixed in v3: Redo messed up threading

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
