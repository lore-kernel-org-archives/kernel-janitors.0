Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1B6C4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Nov 2022 09:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241106AbiKRJus (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Nov 2022 04:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235150AbiKRJur (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Nov 2022 04:50:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFD22D7
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Nov 2022 01:50:45 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id y16so8394482wrt.12
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Nov 2022 01:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xB4oB90o4GsGb3v4LZgaWmnim9yVCggHRlRb5GJWqEM=;
        b=lOh/jUGSx6AKdTbKUWIoK2zda/UqMh6fTewUe0dDAFEodtk+INORBsAKeg/CLCUYKB
         NvAzwlSO1zX54whCWvBMV8iwjmfhtrkPM+uS2gdTmPKOvTlg28erj8BscLMg23Aw8D5+
         2RDF0NVaqMNDQP/zKpd34Br+XOsUYCv4gFv633eqodcI/hmQDSuFbc0QqyzxETbniUQ+
         LbjCYZv0trkn07n6u48zAWoSe6afrmXWM/wJr/6d+pPsz2JfN+PR1O99SZGKCCtXNjhh
         Q0Va7v1DBKDpVD8nj0DWJCCuGR2ZivaRM6aPHCoFPVA/vGZogt/h6Xr3t99k/j1Zz3/l
         M8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB4oB90o4GsGb3v4LZgaWmnim9yVCggHRlRb5GJWqEM=;
        b=EjFgfj566R27Hg71f5Brfw3Py93B5+Krt9ghZd4VAtQ3fNoQaAMp41ZJWNSj1G3gC1
         fOUbN9kp3qLKhnwNVHtL36Ke1TjpM8ukyFRimpTcRPCgx86N9RCpTBx9yk0Rsw1Ofz0g
         S6/IWUMwlWhmW1Uwtub7b91JDf51R0hJqhFiUyXBM4naIjwxRwKmzMEt7/Y4cD1t28KS
         YW2NZ0sCgwJtOW4uK12OnNfa+htSO9JZ8AfqUoRkNOlsTlj3mj20OUna/jLgrheNjUcL
         JQ2q7ZGR3QYNdCEpzB8HhULufFza9aohKM3qufsoVmN6eN0B5dg9U6juJ41uFz9FHrDk
         yLZw==
X-Gm-Message-State: ANoB5pkgbTNo24iRRZEo6M4vJ0xJgwRlLxtfI87yf1yIv1BiPyWnV/TL
        fp2/QGTme7dkEwua1KXi+eZpj5YgY0AA+A==
X-Google-Smtp-Source: AA0mqf7tY3BSDVPa+LjELZs4GYo8iRaEhYxKHzjdekpZGLOq6rnLd7OWKNEyzGm6GCHin9P7Ow+2VQ==
X-Received: by 2002:a5d:4cc5:0:b0:22c:d758:6fcb with SMTP id c5-20020a5d4cc5000000b0022cd7586fcbmr3779096wrt.542.1668765044459;
        Fri, 18 Nov 2022 01:50:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6b81000000b00226dba960b4sm3143232wrx.3.2022.11.18.01.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:50:43 -0800 (PST)
Date:   Fri, 18 Nov 2022 12:50:40 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Alex Elder <alex.elder@linaro.org>
Cc:     elder@linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Message-ID: <Y3dVcNt32yPgP3EC@kadam>
References: <Y3OOP9dXK6oEydkf@kili>
 <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org>
 <Y3W83708rvg1Krvy@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Nam/uiCjUp4BJHfW"
Content-Disposition: inline
In-Reply-To: <Y3W83708rvg1Krvy@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--Nam/uiCjUp4BJHfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2022 at 07:47:27AM +0300, Dan Carpenter wrote:
> Heh.  It really feels like this line should have generated a checker
> warning as well.  I've created two versions.  The first complains when
> ever there is a divide used as a condition:
> 
> 	if (a / b) {
> 
> The other complains when it's part of a logical && or ||.
> 
> 	if (a && a / b) {
> 
> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition (logical): 'hash_mem->size / 8'
> 
> I'll test them out tonight and see if either gives useful results.

I modified the test to ignore macros.  Otherwise we get warnings where
macros are trying to avoid divide by zero bugs.  There was no advantage
in treating logicals as special so I dropped that.

The results are kind of mind bending.  I think maybe people sometimes
accidentally write "if (a / b) {" meaning does it divide cleanly?  When
that should be written as: "if ((a % b) == 0) {".

Anyway, attached.

regards,
dan carpenter

--Nam/uiCjUp4BJHfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

drivers/nvdimm/claim.c:287 nsio_rw_bytes() warn: divide condition: 'cleared / 512'
drivers/nvdimm/bus.c:210 nvdimm_account_cleared_poison() warn: divide condition: 'cleared / 512'
drivers/rtc/rtc-m48t59.c:135 m48t59_rtc_set_time() warn: divide condition: 'year / 100'
drivers/gpu/drm/i915/gvt/vgpu.c:124 intel_gvt_init_vgpu_types() warn: divide condition: 'low_avail / conf->low_mm'
drivers/regulator/aat2870-regulator.c:142 aat2870_get_regulator() warn: divide condition: '(id - 1) / 2'
drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: divide condition: 'shift / 16'
drivers/leds/leds-bcm6328.c:357 bcm6328_led() warn: divide condition: 'shift / 16'
drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:22554 wlc_phy_rssi_cal_nphy_rev3() warn: divide condition: 'result_idx / 2'
drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:22926 wlc_phy_rssi_cal_nphy_rev2() warn: divide condition: 'result_idx / 2'
drivers/net/wireless/broadcom/b43/phy_n.c:2202 b43_nphy_rev3_rssi_cal() warn: divide condition: 'i / 2'
drivers/net/wireless/broadcom/b43/phy_n.c:2403 b43_nphy_rev2_rssi_cal() warn: divide condition: 'i / 2'
drivers/net/wireless/intersil/hostap/hostap_plx.c:232 hfa384x_from_bap() warn: divide condition: 'len / 2'
drivers/net/wireless/intersil/hostap/hostap_plx.c:251 hfa384x_to_bap() warn: divide condition: 'len / 2'
drivers/net/wireless/intersil/hostap/hostap_cs.c:164 hfa384x_from_bap() warn: divide condition: 'len / 2'
drivers/net/wireless/intersil/hostap/hostap_cs.c:183 hfa384x_to_bap() warn: divide condition: 'len / 2'
drivers/net/ethernet/intel/iavf/iavf_txrx.c:300 iavf_clean_tx_irq() warn: divide condition: 'j / 4'
drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:77 i40e_arm_wb() warn: divide condition: 'j / 4'
drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:77 i40e_arm_wb() warn: divide condition: 'j / 4'
drivers/net/ethernet/intel/fm10k/fm10k_netdev.c:759 fm10k_uc_vlan_unsync() warn: divide condition: 'vid / 4096'
drivers/net/ethernet/intel/fm10k/fm10k_netdev.c:779 fm10k_mc_vlan_unsync() warn: divide condition: 'vid / 4096'
drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: divide condition: 'pin / 8'
drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: divide condition: 'pin / 8'
drivers/ata/ahci_imx.c:411 __sata_ahci_read_temperature() warn: divide condition: 'm2 / 1000'
fs/hfsplus/bitmap.c:46 hfsplus_block_allocate() warn: divide condition: '(size ^ offset) / (((1) << 12) * 8)'
fs/hfsplus/bitmap.c:88 hfsplus_block_allocate() warn: divide condition: '(size ^ offset) / (((1) << 12) * 8)'
fs/freevxfs/vxfs_bmap.c:62 vxfs_bmap_ext4() warn: divide condition: 'bn / (indsize * indsize * bsize / 4)'
sound/soc/codecs/rt274.c:881 rt274_set_bclk_ratio() warn: divide condition: 'ratio / 50'

--Nam/uiCjUp4BJHfW--
