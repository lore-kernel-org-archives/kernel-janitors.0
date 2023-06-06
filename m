Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FB8C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbjFFIcr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbjFFIc1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:32:27 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700391703
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:31:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30e412a852dso1825468f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040252; x=1688632252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVaNEEknPNEqjTcU9c3I2SOFRr+0SoFHBYVEPW8rQwc=;
        b=E4p8iOHEiXa2Sf5sPIy5QO8QQgteUX1ppUq/1Puu/lsSpAj0MoOgHK+YK58dkhv1k4
         iQaS6LIPJxzwom1GblobcLjWYczSixKWqGkCWWljmH3Jd/e2LhLsOcGlel/vuuoVn3Un
         vVd6wRyfrOV3o5X5huX3HuKFHWgMfdcW/9CzwvRRBCJHGOTgRdulEeDiL6x3qLgHI/5W
         FIGiaSdsZI8a7/7zl7y+201Hn/12N2FzP4/NQqgtF9TmEkDD6Wu0ptkOCzJLKj3nFtAe
         gP53pdjP61E+ZS2qNlXnsfEx2uzM+AH//uCv6WQS2Oij6uiFtjCaB3pJsb3+5PWCtPPG
         xekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040252; x=1688632252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVaNEEknPNEqjTcU9c3I2SOFRr+0SoFHBYVEPW8rQwc=;
        b=BJrk4DyoZWm61oDOFnQHQEos677ZgQrTI7OODxXLOLNBRaV/SHGxUa38e6WlBWH5vN
         XydCFpuBBmgmbYboLLxNtIFrwVKHY9ZhZi6QzsHNDid7byjTxy7jkd42zIA/9/JotR4E
         q7IPK5E+NdlmEx2wkLLJLVK24fs55lAKyfl9d/OavR9wUTYqElnLdtpYM31eVxDplaAR
         92V5ycP2FC36cQO9FqNKfOjWOc0jUEz3+ncXYKPT3mEODdIxgC5SP86c8AGTYWL8abT5
         kKTNES4c8+buHPt1uJ+N9D3DS/Qr5ajQHloZEoXlkrkBJugwAmCNuCPTptivbwokVHXX
         lSkw==
X-Gm-Message-State: AC+VfDzbqzRWhTfFDLkiVwO91Ym+sT9rk+Wf+gpxmd71IJWQnNxW02jv
        WMnYA+UsB2VMSqfGiqZUm24Olg==
X-Google-Smtp-Source: ACHHUZ7eko1dRNlZL4BqZUFeq9vLzWSrReQcVbs3jM+TKttCwijtE/NUzeNwL8/XWGE7vJSU7D3/uA==
X-Received: by 2002:adf:ed02:0:b0:30d:43ca:55ab with SMTP id a2-20020adfed02000000b0030d43ca55abmr1150761wro.38.1686040252446;
        Tue, 06 Jun 2023 01:30:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0030ae3a6be5bsm11977728wrt.78.2023.06.06.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:30:51 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:30:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     brouer@redhat.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] selftests/bpf: Tests using bpf_check_mtu BPF-helper
Message-ID: <ZH7ut+bZsorTyx8+@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jesper Dangaard Brouer,

The patch b62eba563229: "selftests/bpf: Tests using bpf_check_mtu
BPF-helper" from Feb 9, 2021, leads to the following Smatch static
checker warning:

	./tools/testing/selftests/bpf/prog_tests/check_mtu.c:192 serial_test_check_mtu()
	warn: unsigned 'mtu_lo' is never less than zero.

./tools/testing/selftests/bpf/prog_tests/check_mtu.c
    184 void serial_test_check_mtu(void)
    185 {
    186         __u32 mtu_lo;
                ^^^^^^^^^^^^

    187 
    188         if (test__start_subtest("bpf_check_mtu XDP-attach"))
    189                 test_check_mtu_xdp_attach();
    190 
    191         mtu_lo = read_mtu_device_lo();
--> 192         if (CHECK(mtu_lo < 0, "reading MTU value", "failed (err:%d)", mtu_lo))
                          ^^^^^^^^^^
Unsigned can't be less than zero.

    193                 return;
    194 
    195         if (test__start_subtest("bpf_check_mtu XDP-run"))
    196                 test_check_mtu_xdp(mtu_lo, 0);
    197 
    198         if (test__start_subtest("bpf_check_mtu XDP-run ifindex-lookup"))
    199                 test_check_mtu_xdp(mtu_lo, IFINDEX_LO);
    200 
    201         if (test__start_subtest("bpf_check_mtu TC-run"))
    202                 test_check_mtu_tc(mtu_lo, 0);
    203 
    204         if (test__start_subtest("bpf_check_mtu TC-run ifindex-lookup"))
    205                 test_check_mtu_tc(mtu_lo, IFINDEX_LO);
    206 }

regards,
dan carpenter
