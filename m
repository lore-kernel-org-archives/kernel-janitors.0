Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA8FC10F1B
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 22:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiLHWIt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 17:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiLHWIP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 17:08:15 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB8879C38
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Dec 2022 14:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670537281; x=1702073281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BNVcmw3p0eharH1YaGnuUamwOi/8mEyVmXMjxWOlEQM=;
  b=ciTF4Bbif70qBa5wjb+8lI3qP2xfI+Db7fpJcPmpNoe0kVpui6Y589HM
   n1gkPsWy/y2RE873NnYjg5t8l4UoePcEgBifc11fXcS23rp+N82RRUe6z
   M2QAvSCoUiHghftrbWhQtCHU1vkK+Sw7eQkAZpOYZjtZiLK4liwiPnRoB
   2h+hQVdyEudN4oa9W/aIFMzxKb8SxL47BhXMr8Bzzeca0ArPai7bTLsM0
   qcsmu5KeWLBqPFw41WKYgZ1l3PnB29XjyF2tG1NcA6DeBc/Wp30EKfF7q
   AQGLwwBJPM97iSt7Wq+Xf6/wA6UDMCnbhXmZCut5L3j5aJK8bIoN3ZsIB
   g==;
X-IronPort-AV: E=Sophos;i="5.96,228,1665471600"; 
   d="scan'208";a="190772312"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Dec 2022 15:08:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Dec 2022 15:07:56 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Dec 2022 15:07:56 -0700
Date:   Thu, 8 Dec 2022 23:13:03 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Dan Carpenter <error27@gmail.com>
CC:     <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: microchip: vcap: Add vcap_get_rule
Message-ID: <20221208221303.msbtavyk2cwznk4g@soft-dev3-1>
References: <Y5IJ6huWhdBN8afS@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Y5IJ6huWhdBN8afS@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 12/08/2022 18:59, Dan Carpenter wrote:

Hi Dan,

> 
> Hello Horatiu Vultur,
> 
> The patch 610c32b2ce66: "net: microchip: vcap: Add vcap_get_rule"
> from Dec 3, 2022, leads to the following Smatch static checker
> warning:
> 
>         drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275 vcap_show_admin()
>         warn: passing zero to 'PTR_ERR'
> 
> drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
>     263 static int vcap_show_admin(struct vcap_control *vctrl,
>     264                            struct vcap_admin *admin,
>     265                            struct vcap_output_print *out)
>     266 {
>     267         struct vcap_rule_internal *elem;
>     268         struct vcap_rule *vrule;
>     269         int ret = 0;
>     270
>     271         vcap_show_admin_info(vctrl, admin, out);
>     272         list_for_each_entry(elem, &admin->rules, list) {
>     273                 vrule = vcap_get_rule(vctrl, elem->data.id);
>     274                 if (IS_ERR_OR_NULL(vrule)) {
> --> 275                         ret = PTR_ERR(vrule);
>     276                         break;
>     277                 }
> 
> There aren't any comments explaing what a NULL means...
> 
> Intuitively this doesn't feel like the correct way to handle NULL
> returns.  It feels like it should be:

Thanks for reporting this.
You are right, it is not really a hard error if the vrule is NULL.
We are planning to change a little bit the things here, as the locking
is not exactly correct.

> 
>                 vrule = vcap_get_rule(vctrl, elem->data.id);
>                 if (!vrule)
>                         continue;
>                 if (IS_ERR(vrule)) {
>                         ret = PTR_ERR(vrule);
>                         break;
>                 }
> 
>     278
>     279                 out->prf(out->dst, "\n");
>     280                 vcap_show_admin_rule(vctrl, admin, out, to_intrule(vrule));
>     281                 vcap_free_rule(vrule);
>     282         }
>     283         return ret;
>     284 }
> 
> regards,
> dan carpenter

-- 
/Horatiu
