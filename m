Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CED6C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 14:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiKOOOi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 09:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKOOOh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 09:14:37 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F292BE
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:14:36 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bs21so24503308wrb.4
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSTNXbJe7jKV8n0OFjTcddF5RhQSFJSTjTqhKMYr9Hw=;
        b=ZZXDVsdI3gcUFz/MfSrVL8JEJ5Xz6aoe7xsunJABXUqC23xlMs+jX7sVwTQdSUCsDK
         /LoYbEC6YdiLBDtH9ENIP+/j1kjfI8oU0Fn4t77lE6HUWnuj41W5u8iUdKtFbbrw+OuC
         oub0AHLTsrnpogmcECdpF35mWvZGpG/VBjYJIv+fMWLB7dCAonQhRwgB3VS/7PfuHxgX
         cEOY0Cid2bw0eHu23VotI3i5SioOx/AU3D608wu0JPMC1V+BVdTORrdU/Ys/GjqiiGAk
         Xmg7LZkUSjpYnU7tLxCjpYfO1ns2ov817bXho0eR4vfE0rDe3vt7yB2xlMkiDptLaQoM
         RwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSTNXbJe7jKV8n0OFjTcddF5RhQSFJSTjTqhKMYr9Hw=;
        b=Y3qAJ3Xx2UFmLkeb/Q1kT/acNVdbghgQ4I9V++AKmjfbokmyb88rWMceBfuVQfreSx
         VNQXQ9yLPgYwdxl/oOvlp2tXhuDsusm5SyoVYD5jsNHu2tuX1JbIzlLMaCXywrndybg4
         kdCDurB211vcNwcQ9VbrVrQRV5ED6Uk8JLpn38dwam2rnb+FpNBbCMbEhgiegysZld6O
         0huXOHxOqFPp8w9YM9q7R6WTGQrY0CPkfWjuhY3ly8GEv9TLqKu4YJVrau8TIr8UA6k4
         BzjhME6TTDpwrlTHwdXePtXRXkbkKF6AAclYKe3gD1GXjjUddmeTKP25kiU2xQ53tQ9A
         EvSA==
X-Gm-Message-State: ANoB5plQNTK2gmVT/C94cC/7OvK/pXg+Ru7kKwzAtUEzvOg3FEXe8V87
        hb73sHQsxz7ZSTCNiDO0YWU=
X-Google-Smtp-Source: AA0mqf7fbNTZB9IP7mAdFPu82holRXIu8+2GDU299sCsHmqaFnbi4mM6Kmi3CAWlHq5TpK3TunvRng==
X-Received: by 2002:a05:6000:46:b0:236:8a38:66f1 with SMTP id k6-20020a056000004600b002368a3866f1mr11030684wrx.327.1668521675376;
        Tue, 15 Nov 2022 06:14:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd10a33afsm16855803wmq.11.2022.11.15.06.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:14:35 -0800 (PST)
Date:   Tue, 15 Nov 2022 17:14:32 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     steen.hegelund@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: microchip: sparx5: Match keys in configured port
 keysets
Message-ID: <Y3OeyMRaTybk8t7i@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steen Hegelund,

The patch abc4010d1f6e: "net: microchip: sparx5: Match keys in
configured port keysets" from Nov 9, 2022, leads to the following
Smatch static checker warning:

	drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:598 sparx5_tc_flower_replace()
	error: uninitialized symbol 'l3_proto'.

drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c
    532 static int sparx5_tc_flower_replace(struct net_device *ndev,
    533                                     struct flow_cls_offload *fco,
    534                                     struct vcap_admin *admin)
    535 {
    536         struct sparx5_port *port = netdev_priv(ndev);
    537         struct flow_action_entry *act;
    538         struct vcap_control *vctrl;
    539         struct flow_rule *frule;
    540         struct vcap_rule *vrule;
    541         u16 l3_proto;
    542         int err, idx;
    543 
    544         vctrl = port->sparx5->vcap_ctrl;
    545 
    546         err = sparx5_tc_flower_action_check(vctrl, fco, admin);
    547         if (err)
    548                 return err;
    549 
    550         vrule = vcap_alloc_rule(vctrl, ndev, fco->common.chain_index, VCAP_USER_TC,
    551                                 fco->common.prio, 0);
    552         if (IS_ERR(vrule))
    553                 return PTR_ERR(vrule);
    554 
    555         vrule->cookie = fco->cookie;
    556         sparx5_tc_use_dissectors(fco, admin, vrule, &l3_proto);

Should this call to sparx5_tc_use_dissectors() have error checking?

    557         frule = flow_cls_offload_flow_rule(fco);
    558         flow_action_for_each(idx, act, &frule->action) {
    559                 switch (act->id) {
    560                 case FLOW_ACTION_TRAP:
    561                         err = vcap_rule_add_action_bit(vrule,
    562                                                        VCAP_AF_CPU_COPY_ENA,
    563                                                        VCAP_BIT_1);
    564                         if (err)
    565                                 goto out;
    566                         err = vcap_rule_add_action_u32(vrule,
    567                                                        VCAP_AF_CPU_QUEUE_NUM, 0);
    568                         if (err)
    569                                 goto out;
    570                         err = vcap_rule_add_action_u32(vrule, VCAP_AF_MASK_MODE,
    571                                                        SPX5_PMM_REPLACE_ALL);
    572                         if (err)
    573                                 goto out;
    574                         /* For now the actionset is hardcoded */
    575                         err = vcap_set_rule_set_actionset(vrule,
    576                                                           VCAP_AFS_BASE_TYPE);
    577                         if (err)
    578                                 goto out;
    579                         break;
    580                 case FLOW_ACTION_ACCEPT:
    581                         /* For now the actionset is hardcoded */
    582                         err = vcap_set_rule_set_actionset(vrule,
    583                                                           VCAP_AFS_BASE_TYPE);
    584                         if (err)
    585                                 goto out;
    586                         break;
    587                 case FLOW_ACTION_GOTO:
    588                         /* Links between VCAPs will be added later */
    589                         break;
    590                 default:
    591                         NL_SET_ERR_MSG_MOD(fco->common.extack,
    592                                            "Unsupported TC action");
    593                         err = -EOPNOTSUPP;
    594                         goto out;
    595                 }
    596         }
    597         /* provide the l3 protocol to guide the keyset selection */
--> 598         err = vcap_val_rule(vrule, l3_proto);
    599         if (err) {
    600                 vcap_set_tc_exterr(fco, vrule);
    601                 goto out;
    602         }
    603         err = vcap_add_rule(vrule);
    604         if (err)
    605                 NL_SET_ERR_MSG_MOD(fco->common.extack,
    606                                    "Could not add the filter");
    607 out:
    608         vcap_free_rule(vrule);
    609         return err;
    610 }

regards,
dan carpenter
