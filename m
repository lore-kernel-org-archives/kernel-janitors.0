Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7315C636D7
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 04:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbjBWE5D (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbjBWE5C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Feb 2023 23:57:02 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AAC36FFA
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:56:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so5161582wmq.2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDbv2jiJa9zxEilavh9JBpEpBpqPBqz1xlE+NB4Bpdg=;
        b=Wqd4k8wpSrQN+aDKAEQJVSeTtQI4HtjzekNSGqUjq1QCP8i2eR/KbYCLD1R8irShHy
         1xQwrpA8xv/4COI63IkRWvFJGWrW+xGyeB3nvaNw2yWZCtOcD7A9KZC1SO0T8UBfR6H7
         53890cWKYejtlicXuPuccQuvETVPB/m4AB2sCAeQwodOo8ZMigWky6bQkXJlQxKqDbKs
         EWgMHrboDS1h4YHM6Aym1cmIAbnml8kaWbYoT0jdS5cB6haCl+4ioYDoM9ES2nc4ibMD
         v8n2Cjkc4CKkz/u4ZT3ru0UPl7q15DhNxKZ52pBPNcHmgsQ3EZEjc9e2Cv+TuOkLOLMu
         Zfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDbv2jiJa9zxEilavh9JBpEpBpqPBqz1xlE+NB4Bpdg=;
        b=4lVrzukokINoqpI7QgxifSMYRpZP+LDqUjvzSfu21kOjw4vC8pKiVSk+iko2sq6Zk1
         1KUZqx1+E6h119UtT7oaY7+LmQ6Q+iGzzoK1TN6nhYWcIs6E8fWgkxWqqNZoJrmDXTvJ
         Mr88FR0qEo53YMJQCxLv0GEp3YnppQb5XTM0zZqqXuXQHhJQghfNnjZiVEQrHK75zzXc
         2to0sdAjh4MbyCknrewwTkJanmJfyQfFIgTmApud3Vi10GPxpNBo27iDK9/xQ2qhmbMo
         l8LP90nOokBioaqk3hzrpeFO0UAopfPM+KxMzNXMKTkcZyRXD1WsH7DwtF/5nefzPi0l
         Eb4g==
X-Gm-Message-State: AO0yUKUCXP16iYx80sQ0EkueRwr7JgHY2zgO2MRRNnaVK4tjrRWrpeWe
        FPq1SYQMKR4F1mnya/psLts=
X-Google-Smtp-Source: AK7set/EgObRPS0I+3lLbeWNKpAkEMzbxHveqf1t9vcXsEWGE0Z4Ls3x/QzkubkqlWIx+ZuKDX6bDg==
X-Received: by 2002:a05:600c:1887:b0:3dc:4cb5:41c with SMTP id x7-20020a05600c188700b003dc4cb5041cmr7317956wmp.0.1677128215974;
        Wed, 22 Feb 2023 20:56:55 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003e7c89b3514sm6763567wmc.23.2023.02.22.20.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:56:55 -0800 (PST)
Date:   Wed, 22 Feb 2023 10:54:11 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     pctammela@mojatatu.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/sched: act_connmark: transition to percpu stats and
 rcu
Message-ID: <Y/XKI5EcXRamuVyC@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Pedro Tammela,

The patch 288864effe33: "net/sched: act_connmark: transition to
percpu stats and rcu" from Feb 14, 2023, leads to the following
Smatch static checker warning:

	net/sched/act_connmark.c:167 tcf_connmark_init()
	error: uninitialized symbol 'ci'.

net/sched/act_connmark.c
    98 static int tcf_connmark_init(struct net *net, struct nlattr *nla,
    99                              struct nlattr *est, struct tc_action **a,
    100                              struct tcf_proto *tp, u32 flags,
    101                              struct netlink_ext_ack *extack)
    102 {
    103         struct tc_action_net *tn = net_generic(net, act_connmark_ops.net_id);
    104         struct tcf_connmark_parms *nparms, *oparms;
    105         struct nlattr *tb[TCA_CONNMARK_MAX + 1];
    106         bool bind = flags & TCA_ACT_FLAGS_BIND;
    107         struct tcf_chain *goto_ch = NULL;
    108         struct tcf_connmark_info *ci;
    109         struct tc_connmark *parm;
    110         int ret = 0, err;
    111         u32 index;
    112 
    113         if (!nla)
    114                 return -EINVAL;
    115 
    116         ret = nla_parse_nested_deprecated(tb, TCA_CONNMARK_MAX, nla,
    117                                           connmark_policy, NULL);
    118         if (ret < 0)
    119                 return ret;
    120 
    121         if (!tb[TCA_CONNMARK_PARMS])
    122                 return -EINVAL;
    123 
    124         nparms = kzalloc(sizeof(*nparms), GFP_KERNEL);
    125         if (!nparms)
    126                 return -ENOMEM;
    127 
    128         parm = nla_data(tb[TCA_CONNMARK_PARMS]);
    129         index = parm->index;
    130         ret = tcf_idr_check_alloc(tn, &index, a, bind);
    131         if (!ret) {
    132                 ret = tcf_idr_create_from_flags(tn, index, est, a,
    133                                                 &act_connmark_ops, bind, flags);
    134                 if (ret) {
    135                         tcf_idr_cleanup(tn, index);
    136                         err = ret;
    137                         goto out_free;
    138                 }
    139 
    140                 ci = to_connmark(*a);
    141 
    142                 nparms->net = net;
    143                 nparms->zone = parm->zone;
    144 
    145                 ret = ACT_P_CREATED;
    146         } else if (ret > 0) {
    147                 ci = to_connmark(*a);
    148                 if (bind) {
    149                         err = 0;
    150                         goto out_free;
    151                 }
    152                 if (!(flags & TCA_ACT_FLAGS_REPLACE)) {
    153                         err = -EEXIST;
    154                         goto release_idr;
    155                 }
    156 
    157                 nparms->net = rtnl_dereference(ci->parms)->net;
    158                 nparms->zone = parm->zone;
    159 
    160                 ret = 0;
    161         }

ci not initialized if ret < 0.

    162 
    163         err = tcf_action_check_ctrlact(parm->action, tp, &goto_ch, extack);
    164         if (err < 0)
    165                 goto release_idr;
    166 
--> 167         spin_lock_bh(&ci->tcf_lock);
    168         goto_ch = tcf_action_set_ctrlact(*a, parm->action, goto_ch);
    169         oparms = rcu_replace_pointer(ci->parms, nparms, lockdep_is_held(&ci->tcf_lock));
    170         spin_unlock_bh(&ci->tcf_lock);
    171 
    172         if (goto_ch)
    173                 tcf_chain_put_by_act(goto_ch);
    174 
    175         if (oparms)
    176                 kfree_rcu(oparms, rcu);
    177 
    178         return ret;
    179 
    180 release_idr:
    181         tcf_idr_release(*a, bind);
    182 out_free:
    183         kfree(nparms);
    184         return err;
    185 }

regards,
dan carpenter
