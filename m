Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD7FC7EE43
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 11:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238419AbjFLLJg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237644AbjFLLJF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 07:09:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718AC6A45
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:58:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30af56f5f52so2675516f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686567483; x=1689159483;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdIRBmqETceRv4AXIkJcnCbFdaBYDslyf8hvML1Uo5o=;
        b=aTIIz1uzhIwDHYGznxgCwif3g/gpSmRsWRe3aQHDwzfG54//GJMJv8hNz4NAaMFxVV
         n0yqgzFld3JRgEs82PztAmYIapE/4rpdgiv4g1Oz57vzs/iWbeyGmlWNQ95ccMevBs4P
         B6PPWnKNrq0oIGCdl6H/OZqR1fSnnwlvXjoNABKD+f7Epz8Cc47QABJnFiJU1Nv+uJt1
         ZFZvqdfla9Lf/EWaBqDhyPMHKvnWwsM+NQw1/H9i3dm631W4CzekXfecCtR7rUuBHVYp
         /QRd2BFEspRoAaLe+XqgN6XXgxKfDnohAwq9xEWGaImyTFcXbAzr3VpdpdQrHXWy1BdD
         3Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567483; x=1689159483;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdIRBmqETceRv4AXIkJcnCbFdaBYDslyf8hvML1Uo5o=;
        b=PHBwGYW9Gbx63cjhAL/2JphrQPdMfoZRvf/5yJIjyErUtOl6UmPYjUi3Coyl0kRpsW
         Qp6GsOT+PR4HZ2fy0e4XWOkmaqil0BS6g44CtTZY9IDsFJ2op9/P89zK/dHR7VRGnEYX
         Jk+rXU3p9Rk5fJIElLuoj4kjaHwhCpeQkRGKNl/67GWYmH4ORQ7oQd5plEvHpmwMK419
         Y3noj9Cgz3UkO9GFMWbgvdwGJyAbjyS03O8MLXjEvb1/VDWuAqnEnKvqlZd5dvrEhGXL
         S8b/FpExYwOIdY8fKLYXOQAS57gcCF2qslahl11PBq+i3Q4LnXYO2XdznepJU/ASveZd
         wsNQ==
X-Gm-Message-State: AC+VfDwXZqG7GLcB33ptEpFCIR8I5h5xby6XdCANWXLlxvXfSgiXAvnV
        qSuTDxbqmD07owgEFy/o+llNJA==
X-Google-Smtp-Source: ACHHUZ5X3XNo0Qd1vpLxPAQAD5H7Owr80BMJaeu6uIlU+e0Y4zUKu443qPjFPAn8aLU4e2x6tGZBAg==
X-Received: by 2002:adf:cd12:0:b0:306:3352:5ba3 with SMTP id w18-20020adfcd12000000b0030633525ba3mr4312427wrm.25.1686567483031;
        Mon, 12 Jun 2023 03:58:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d5584000000b0030fc576633dsm1489449wrv.16.2023.06.12.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:58:02 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sukrut Bellary <sukrut.bellary@linux.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230602113602.1271695-1-sukrut.bellary@linux.com>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error
 path
Message-Id: <168656748193.162074.17313550564907901438.b4-ty@linaro.org>
Date:   Mon, 12 Jun 2023 11:58:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
> smatch warning:
> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> 
> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> fastrpc_req_munmap_impl() if unmap is successful.
> 
> But in the end, there is an unconditional call to fastrpc_buf_free().
> So the above case triggers the double free of fastrpc buf.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Fix double free of 'buf' in error path
      commit: 5b3006fffce89706a12741d7f657869ca2be1640

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

