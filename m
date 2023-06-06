Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37541C77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 11:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbjFFL2u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 07:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbjFFL2t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 07:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7369E47
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686050881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UkJxXpGSy6A+QsQd9yPAmbw2JAjq7fYtSO7PJ9i931A=;
        b=MN/fhLWvOH0e8FZymneMIgP4AISUDJpfXYUNp97/qf+H4L8N8S/LycljEASD3b7AXowMSz
        kOhkQ/eDCbH2EA0j290NNnUiJEg+0A3Gnda+seV+EEVTNLQCeEnMgE3jukH9Lubp0mI0lu
        tTc5Ka7j8liLRnzKVmHwo/vxPhuevI8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-JMrq85H1MlC6zvmX8DVU2g-1; Tue, 06 Jun 2023 07:28:00 -0400
X-MC-Unique: JMrq85H1MlC6zvmX8DVU2g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-96f4d917e06so774304466b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 04:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050879; x=1688642879;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkJxXpGSy6A+QsQd9yPAmbw2JAjq7fYtSO7PJ9i931A=;
        b=HIecEZ7Lf3ALJAiKP9+eiwOiaQiajDYKLR3kj9ZW8iwFRTpkmfLGGjmnMjttGKdZ8X
         mnDKIBo3NYJnUn0bjbEIz2obgz1ngsO2rebbYCAXyBhEaymxkZcurXR/JVptaJyKSP+P
         Os+38Qz/Hh2mlddvO8J5Zp0+CCKdavV2llHAWYyLW1gNZNCWCrnlg7IXCN3q8x+usVc+
         g3fh4OgSFhbPBUKJVpvQ1bSKI6+CFNJ8D8v/pQa+zBsL26zTA7oaQolbxV4ffspQsTtX
         0YWUooiWOoC+bQSrA6BQGC2QaqQOwWfzy7k+MCj+MWXwo6iZN+oVf23b4Hi9JbgQfi0j
         4Yrw==
X-Gm-Message-State: AC+VfDw3XHZouKBm+Dm1LHmeOyCrE1c8KB/Iqe7mhTeadw1AkwYUwRG6
        TvY69ZnwCcdybawiWehcWIrfm68/w85dL32soM6ZwPVAen3EezzyC6T+YHnMJrB3DMJsGT/f2UD
        3amrVB+O4esAa68NdNuu3GXbCZD9gEic0dbzU
X-Received: by 2002:a17:907:8a05:b0:974:623c:f129 with SMTP id sc5-20020a1709078a0500b00974623cf129mr9875201ejc.15.1686050879335;
        Tue, 06 Jun 2023 04:27:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zRABHM4d/8qfor5oDIdBIvAEhTMrLZ1IfzgrkFaUBiSO/H+Q/wE5idMLYvqjMoY3SJEyuEA==
X-Received: by 2002:a17:907:8a05:b0:974:623c:f129 with SMTP id sc5-20020a1709078a0500b00974623cf129mr9875191ejc.15.1686050879087;
        Tue, 06 Jun 2023 04:27:59 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net. [194.45.78.10])
        by smtp.gmail.com with ESMTPSA id u26-20020a1709060b1a00b00977d7bd9069sm2767497ejg.179.2023.06.06.04.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:27:58 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <50d2ab13-7583-95b8-a7b5-627ca1a56bf1@redhat.com>
Date:   Tue, 6 Jun 2023 13:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc:     brouer@redhat.com, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] selftests/bpf: Tests using bpf_check_mtu BPF-helper
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
References: <ZH7ut+bZsorTyx8+@moroto>
In-Reply-To: <ZH7ut+bZsorTyx8+@moroto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/06/2023 10.30, Dan Carpenter wrote:
> Hello Jesper Dangaard Brouer,
> 
> The patch b62eba563229: "selftests/bpf: Tests using bpf_check_mtu
> BPF-helper" from Feb 9, 2021, leads to the following Smatch static
> checker warning:
> 

Thanks for reporting this!

> 	./tools/testing/selftests/bpf/prog_tests/check_mtu.c:192 serial_test_check_mtu()
> 	warn: unsigned 'mtu_lo' is never less than zero.
> 
> ./tools/testing/selftests/bpf/prog_tests/check_mtu.c
>      184 void serial_test_check_mtu(void)
>      185 {
>      186         __u32 mtu_lo;
>                  ^^^^^^^^^^^^
> 

This should have been an 'int', because read_mtu_device_lo() uses minus 
as error indication.

I'll send a fix patch shortly.

>      187
>      188         if (test__start_subtest("bpf_check_mtu XDP-attach"))
>      189                 test_check_mtu_xdp_attach();
>      190
>      191         mtu_lo = read_mtu_device_lo();
> --> 192         if (CHECK(mtu_lo < 0, "reading MTU value", "failed (err:%d)", mtu_lo))
>                            ^^^^^^^^^^
> Unsigned can't be less than zero.
> 
>      193                 return;
>      194
>      195         if (test__start_subtest("bpf_check_mtu XDP-run"))
>      196                 test_check_mtu_xdp(mtu_lo, 0);
>      197
>      198         if (test__start_subtest("bpf_check_mtu XDP-run ifindex-lookup"))
>      199                 test_check_mtu_xdp(mtu_lo, IFINDEX_LO);
>      200
>      201         if (test__start_subtest("bpf_check_mtu TC-run"))
>      202                 test_check_mtu_tc(mtu_lo, 0);
>      203
>      204         if (test__start_subtest("bpf_check_mtu TC-run ifindex-lookup"))
>      205                 test_check_mtu_tc(mtu_lo, IFINDEX_LO);
>      206 }
> 
> regards,
> dan carpenter
> 

--Jesper

