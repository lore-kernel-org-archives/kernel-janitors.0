Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A99C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiKONEb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiKONE1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:04:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD62812624
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:04:26 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v1so24110967wrt.11
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QV+lbJxBS0m31waE+r3dYztx5VVIeWrquKXCZD5/B6M=;
        b=AW6HvEBfLy19nLtQg9xzhPzxVuonlgzSpSUwaAXKNE9kk7jhohUEk4BXlKbtFKM5c1
         ZKnfgNmS181tGWyu5yvscdM64hWI+XLlGybWYFxZPKHT6eOTUc1ikqleVesGo1vDf8tN
         cFbpmH4R/eAzNmfe/0TN8++o6itFaG7cJzafoBPWo1leUpYBaejrLhYmSthukP9W/z5U
         3RvwksAvmE2qSteHxwHs0fVTF5TRZ7A+CpHvxiN0oZiq+GRINomLe+fexb95qM4iq/jS
         ovY2sboFTnsgmn6j5/ga0dUMwPIDbVGrPnrouX/5Pt6k6UTT+Ul5OVNSWXdJgoQrkRyD
         V0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QV+lbJxBS0m31waE+r3dYztx5VVIeWrquKXCZD5/B6M=;
        b=CsjvzHEFo5Xc77Tom25h5BZekqNftM987LvxvyquCJz5cZ9WSue4YS5KXtY8lgRnFu
         rQEvTiJYkE5qD5PybqpfcSiMwHzH9mDtv2ULeVNJJWX6o1TG3dwGGY1vZJYajO7yOFWW
         sq/Z/vDyo5FmXubs9+T/B3EZJ63odpREZqKZeHl7Wg6vn4OPJYjIJTV5FChBkHKF/vBV
         z+V+Xzq0MmTDgVNAiXJOGTuDVRttMNdCobGk7BWTRtp30km2So2rqFUhkTPUtXuAk2GX
         8aB70EEifyoZZHDnXSFnGdC1NLfx3EdCVt3r+/QZpWXJOF7ojZ6+xem0in+a21KoT3t9
         y35w==
X-Gm-Message-State: ANoB5plBNEfKnsZdy8rDCPsfP54N4MOFB4XJ3vHbGncQIbmckV0zgl23
        FQePff3zzpkTnLGGHxAC1CI=
X-Google-Smtp-Source: AA0mqf6VHrf+QhXUZn8ccpDk3TXwLOGIpg4EuctgufaGtNinBLDPiRy5hf9cjAlEk4C+LOTZdHNepA==
X-Received: by 2002:adf:f74d:0:b0:241:50fa:f724 with SMTP id z13-20020adff74d000000b0024150faf724mr10312136wrp.146.1668517465283;
        Tue, 15 Nov 2022 05:04:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a22-20020a5d4576000000b002365254ea42sm12503535wrc.1.2022.11.15.05.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:04:24 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:04:21 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     jiawenwu@trustnetic.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: libwx: Implement interaction with firmware
Message-ID: <Y3OOVco21u9wg64/@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jiawen Wu,

The patch 1efa9bfe58c5: "net: libwx: Implement interaction with
firmware" from Oct 31, 2022, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/wangxun/libwx/wx_hw.c:210 wx_host_interface_command()
	warn: duplicate check 'status' (previous on line 206)

drivers/net/ethernet/wangxun/libwx/wx_hw.c
    200         /* Setting this bit tells the ARC that a new command is pending. */
    201         wr32m(wxhw, WX_MNG_MBOX_CTL,
    202               WX_MNG_MBOX_CTL_SWRDY, WX_MNG_MBOX_CTL_SWRDY);
    203 
    204         status = read_poll_timeout(rd32, hicr, hicr & WX_MNG_MBOX_CTL_FWRDY, 1000,
    205                                    timeout * 1000, false, wxhw, WX_MNG_MBOX_CTL);
    206         if (status)
                    ^^^^^^
Checked

    207                 goto rel_out;
    208 
    209         /* Check command completion */
--> 210         if (status) {
                    ^^^^^^
Dead code.

    211                 wx_dbg(wxhw, "Command has failed with no status valid.\n");
    212 
    213                 buf[0] = rd32(wxhw, WX_MNG_MBOX);
    214                 if ((buffer[0] & 0xff) != (~buf[0] >> 24)) {
    215                         status = -EINVAL;
    216                         goto rel_out;
    217                 }
    218                 if ((buf[0] & 0xff0000) >> 16 == 0x80) {
    219                         wx_dbg(wxhw, "It's unknown cmd.\n");
    220                         status = -EINVAL;
    221                         goto rel_out;
    222                 }
    223 
    224                 wx_dbg(wxhw, "write value:\n");
    225                 for (i = 0; i < dword_len; i++)
    226                         wx_dbg(wxhw, "%x ", buffer[i]);
    227                 wx_dbg(wxhw, "read value:\n");
    228                 for (i = 0; i < dword_len; i++)
    229                         wx_dbg(wxhw, "%x ", buf[i]);
    230         }
    231 
    232         if (!return_data)
    233                 goto rel_out;
    234 
    235         /* Calculate length in DWORDs */
    236         dword_len = hdr_size >> 2;
    237 
    238         /* first pull in the header so we know the buffer length */
    239         for (bi = 0; bi < dword_len; bi++) {
    240                 buffer[bi] = rd32a(wxhw, WX_MNG_MBOX, bi);
    241                 le32_to_cpus(&buffer[bi]);
    242         }
    243 
    244         /* If there is any thing in data position pull it in */
    245         buf_len = ((struct wx_hic_hdr *)buffer)->buf_len;
    246         if (buf_len == 0)
    247                 goto rel_out;
    248 
    249         if (length < buf_len + hdr_size) {
    250                 wx_err(wxhw, "Buffer not large enough for reply message.\n");
    251                 status = -EFAULT;
    252                 goto rel_out;
    253         }
    254 
    255         /* Calculate length in DWORDs, add 3 for odd lengths */
    256         dword_len = (buf_len + 3) >> 2;
    257 
    258         /* Pull in the rest of the buffer (bi is where we left off) */
    259         for (; bi <= dword_len; bi++) {
    260                 buffer[bi] = rd32a(wxhw, WX_MNG_MBOX, bi);
    261                 le32_to_cpus(&buffer[bi]);
    262         }
    263 
    264 rel_out:
    265         wx_release_sw_sync(wxhw, WX_MNG_SWFW_SYNC_SW_MB);
    266         return status;
    267 }

regards,
dan carpenter
