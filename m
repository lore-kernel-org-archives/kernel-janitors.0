Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9921FC636D6
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 13:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbjBWNZi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 08:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233835AbjBWNZh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 08:25:37 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E1656781
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:25:36 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id t22so12646020oiw.12
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMSNiysYt+6xRZYCPnzKeP2K01DPviwuFV58obdLcso=;
        b=WEsLM14mJBi1ElySg+ddNpg/517QtgiuG6tczZFpdRDV3M+PNInk44YjhFRABA5uBZ
         jWEfYqp/EZqIqYpj8W/TOdzwHTO/q8kiFdax5ULlSPywZUbGFr6xTjFlemrhdsSA3P9x
         M+LAJd0ghQIXuty/oNPDMEopLhVTnuLNtOAwaFLocz9KttlAmcuNMSf0UfzwLKrxuheb
         UTxO4nDDXL1QfJoBdVWGVcj37vTbHW8ZbBLPF0JLJ8nCKwgz5pLwPojzEFWqKqvA712t
         b0O6U3ViJCLO3sZN4KXjSpldRPLCeY7qbSl1tawdT8XPeTtdmMtoX1I7/yQ55HIyg2rD
         92HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMSNiysYt+6xRZYCPnzKeP2K01DPviwuFV58obdLcso=;
        b=hRmCm2sI/s0H6gvd/FQ+j6UqkQ5+mo9qcYNwSRbQM96qv0aeT+f2ThSsXFdgSIrqSG
         tVfYXnkur0MOa4gqwYiqkSisKs1QmhqAB3XA82lccSxYBHa0ihpIKhQEN7yWsD5r7VP/
         rxeY3/FizIQjUUpaoIg4cgclVuKr8+CSgC3npWO5F7rxa1Sh6divzpMJDfEG0u+X4+vN
         F7C8Y8djcxHWyg8Iqpgcd0F3uk9kMn7zilig6m2+FeSjHlBFuA7zyoSIpvuT/Y+KgDPp
         WMFQh0Cb0xhK1YUc0jCnvg67k5R+8A2oqaoKH8rsH6hUeMGjwW0R84dGDucBLcI4v69V
         G1Cg==
X-Gm-Message-State: AO0yUKXOwIw1FUDsEYbVHz56b353w0uXHvVo1mv3cah8NnxaMEkuCsLu
        j98XxmExCyeCwO+YxIk6dSaKqY1i7OmApXGD
X-Google-Smtp-Source: AK7set/xWmkuMBr+OSrF/47SBhwpFZzf4BQvYxlJ4BaYszHDjZkhivTNi29+XhP4Xf2KnpMbb4e4tQ==
X-Received: by 2002:aca:1108:0:b0:383:b801:76b4 with SMTP id 8-20020aca1108000000b00383b80176b4mr3836908oir.13.1677158735404;
        Thu, 23 Feb 2023 05:25:35 -0800 (PST)
Received: from ?IPV6:2804:14d:5c5e:4698:8178:eccf:90ea:bc1e? ([2804:14d:5c5e:4698:8178:eccf:90ea:bc1e])
        by smtp.gmail.com with ESMTPSA id m204-20020acabcd5000000b00383e12e20c5sm606368oif.24.2023.02.23.05.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 05:25:35 -0800 (PST)
Message-ID: <df0374b1-3924-3349-5005-b9bc65252663@mojatatu.com>
Date:   Thu, 23 Feb 2023 10:25:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [bug report] net/sched: act_connmark: transition to percpu stats
 and rcu
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
References: <Y/XKI5EcXRamuVyC@kili>
From:   Pedro Tammela <pctammela@mojatatu.com>
In-Reply-To: <Y/XKI5EcXRamuVyC@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/02/2023 04:54, Dan Carpenter wrote:
> Hello Pedro Tammela,
> 
> The patch 288864effe33: "net/sched: act_connmark: transition to
> percpu stats and rcu" from Feb 14, 2023, leads to the following
> Smatch static checker warning:
> 
> 	net/sched/act_connmark.c:167 tcf_connmark_init()
> 	error: uninitialized symbol 'ci'.
> 
> net/sched/act_connmark.c
>      98 static int tcf_connmark_init(struct net *net, struct nlattr *nla,
>      99                              struct nlattr *est, struct tc_action **a,
>      100                              struct tcf_proto *tp, u32 flags,
>      101                              struct netlink_ext_ack *extack)
>      102 {
>      103         struct tc_action_net *tn = net_generic(net, act_connmark_ops.net_id);
>      104         struct tcf_connmark_parms *nparms, *oparms;
>      105         struct nlattr *tb[TCA_CONNMARK_MAX + 1];
>      106         bool bind = flags & TCA_ACT_FLAGS_BIND;
>      107         struct tcf_chain *goto_ch = NULL;
>      108         struct tcf_connmark_info *ci;
>      109         struct tc_connmark *parm;
>      110         int ret = 0, err;
>      111         u32 index;
>      112
>      113         if (!nla)
>      114                 return -EINVAL;
>      115
>      116         ret = nla_parse_nested_deprecated(tb, TCA_CONNMARK_MAX, nla,
>      117                                           connmark_policy, NULL);
>      118         if (ret < 0)
>      119                 return ret;
>      120
>      121         if (!tb[TCA_CONNMARK_PARMS])
>      122                 return -EINVAL;
>      123
>      124         nparms = kzalloc(sizeof(*nparms), GFP_KERNEL);
>      125         if (!nparms)
>      126                 return -ENOMEM;
>      127
>      128         parm = nla_data(tb[TCA_CONNMARK_PARMS]);
>      129         index = parm->index;
>      130         ret = tcf_idr_check_alloc(tn, &index, a, bind);
>      131         if (!ret) {
>      132                 ret = tcf_idr_create_from_flags(tn, index, est, a,
>      133                                                 &act_connmark_ops, bind, flags);
>      134                 if (ret) {
>      135                         tcf_idr_cleanup(tn, index);
>      136                         err = ret;
>      137                         goto out_free;
>      138                 }
>      139
>      140                 ci = to_connmark(*a);
>      141
>      142                 nparms->net = net;
>      143                 nparms->zone = parm->zone;
>      144
>      145                 ret = ACT_P_CREATED;
>      146         } else if (ret > 0) {
>      147                 ci = to_connmark(*a);
>      148                 if (bind) {
>      149                         err = 0;
>      150                         goto out_free;
>      151                 }
>      152                 if (!(flags & TCA_ACT_FLAGS_REPLACE)) {
>      153                         err = -EEXIST;
>      154                         goto release_idr;
>      155                 }
>      156
>      157                 nparms->net = rtnl_dereference(ci->parms)->net;
>      158                 nparms->zone = parm->zone;
>      159
>      160                 ret = 0;
>      161         }
> 
> ci not initialized if ret < 0.
> 
>      162
>      163         err = tcf_action_check_ctrlact(parm->action, tp, &goto_ch, extack);
>      164         if (err < 0)
>      165                 goto release_idr;
>      166
> --> 167         spin_lock_bh(&ci->tcf_lock);
>      168         goto_ch = tcf_action_set_ctrlact(*a, parm->action, goto_ch);
>      169         oparms = rcu_replace_pointer(ci->parms, nparms, lockdep_is_held(&ci->tcf_lock));
>      170         spin_unlock_bh(&ci->tcf_lock);
>      171
>      172         if (goto_ch)
>      173                 tcf_chain_put_by_act(goto_ch);
>      174
>      175         if (oparms)
>      176                 kfree_rcu(oparms, rcu);
>      177
>      178         return ret;
>      179
>      180 release_idr:
>      181         tcf_idr_release(*a, bind);
>      182 out_free:
>      183         kfree(nparms);
>      184         return err;
>      185 }
> 
> regards,
> dan carpenter

Hi Dan,

Thanks for the report. I will send a fix shortly.
Is `make C=2` enough to catch these warnings?

Pedro
