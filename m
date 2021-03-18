Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C258C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 18:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB47664E90
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 18:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhCRS5Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 14:57:16 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:42676 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbhCRS5A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 14:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1616093821; x=1647629821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/hnLRqx6NLOgaf2jzoAU/O96+VWdPTGbbLKhxbbMuhA=;
  b=F5EK6KYc1AEhdFphUL2nltKDK6BEEgOFHhBztS9DinMtPlS2eX5khK2J
   KadQgLihCNuO4nNQWaJ/64/7eF5IYbSQKUobcrzIBANjPBlhssS0u5Y0u
   KJJ7k/rvD7QD8ljm38XMKh7cwJGp+8egjFea6tZ/7pAH5rI/iTR+kYQIE
   PH5mv71sDwIIDTymhP5oQxAt+ue/h1EdDUgph2zRNFfajQ5A/TA6s36op
   HMpOWObYkE6/dFDp/uRzeHNMJXkVsr1rTnXWp1k+NszSpFCHQ81PevHIU
   4OsvhGOxz4MmPohyvYfvqalgrI6frSOrEbDYd+3m6MdHZb8hkiEcuNQWY
   A==;
IronPort-SDR: 8TQzuXzz/8mJyr/azurBrlfthpxyyoTTxIu05ufEn02nRgkanca6YK7cG7w1M6fVRVKWH8ntZ1
 jOqsB30idvlw1GF21boaQpvnP7PUgRMhGXzZS/GPRM/xJhDhFTTyYfpF08zIA48eAX2u2WlCb+
 z0sANrLy3b+vqolyB7RudlthnLhQ/aEFOzgTN2qzpbEKd68ipfrd1kwwShUUODpH6xrTLc6dDQ
 MtN1oz2ri4C15phAhdzaYuEgx7z7znK26SiKpJqFuhvLGL8u+39hA9oBhykTFrEc6QxxOcNTqP
 6ug=
X-IronPort-AV: E=Sophos;i="5.81,259,1610434800"; 
   d="scan'208";a="113292920"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Mar 2021 11:56:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 18 Mar 2021 11:56:58 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 18 Mar 2021 11:56:57 -0700
Date:   Thu, 18 Mar 2021 19:57:12 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: ocelot: Extend MRP
Message-ID: <20210318185712.sti3dgni7k725slr@soft-dev3-1.localhost>
References: <YFNChN/C6JwVAV2t@mwanda>
 <20210318121128.GA21246@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210318121128.GA21246@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 03/18/2021 15:11, Dan Carpenter wrote:

Hi Dan,

> 
> See also:
> 
> drivers/net/ethernet/mscc/ocelot_mrp.c:254 ocelot_mrp_del_ring_role() error: we previously assumed 'ocelot_port' could be null (see line 247)
> 
> regards,
> dan carpenter
> 
> On Thu, Mar 18, 2021 at 03:07:32PM +0300, Dan Carpenter wrote:
> > Hello Horatiu Vultur,
> >
> > This is a semi-automatic email about new static checker warnings.
> >
> > The patch 7c588c3e96e9: "net: ocelot: Extend MRP" from Mar 16, 2021,
> > leads to the following Smatch complaint:
> >
> >     drivers/net/ethernet/mscc/ocelot_mrp.c:180 ocelot_mrp_del()
> >     error: we previously assumed 'ocelot_port' could be null (see line 173)
> >
> > drivers/net/ethernet/mscc/ocelot_mrp.c
> >    153  int ocelot_mrp_del(struct ocelot *ocelot, int port,
> >    154                     const struct switchdev_obj_mrp *mrp)
> >    155  {
> >    156          struct ocelot_port *ocelot_port = ocelot->ports[port];
> >    157          int i;
> >    158
> >    159          if (!ocelot_port)
> >    160                  return -EOPNOTSUPP;
> >    161
> >    162          if (ocelot_port->mrp_ring_id != mrp->ring_id)
> >    163                  return 0;
> >    164
> >    165          ocelot_mrp_del_vcap(ocelot, port);
> >    166          ocelot_mrp_del_vcap(ocelot, port + ocelot->num_phys_ports);
> >    167
> >    168          ocelot_port->mrp_ring_id = 0;
> >    169
> >    170          for (i = 0; i < ocelot->num_phys_ports; ++i) {
> >
> > This loop tries to verify that all the ports have ring_id == 0 otherwise
> > we return.  It's slightly confusing why this matters.

It is trying to detect if there is any existing MRP ring active on the
node. A port is part of a MRP ring if mrp_ring_id != 0. If there is no
MRP ring then we need to remove the entry in the MAC table otherwise
keep it there.

> >
> >    171                  ocelot_port = ocelot->ports[i];
> >    172
> >    173                        if (!ocelot_port)
> >                              ^^^^^^^^^^^
> > Assume the last element of the array is NULL
> >
> >    174                                continue;
> >    175
> >    176                        if (ocelot_port->mrp_ring_id != 0)
> >    177                                goto out;
> >
> > This would be more clear if instead of a "goto out;" it just did a
> > direct "return 0;"

I can change this.

> >
> >    178                }
> >    179
> >    180                ocelot_mrp_del_mac(ocelot, ocelot_port);
> >
> > We delete the last mac address of all the ring_ids are zero but if the
> > last port is zero it will crash.

Yep, it should be ocelot->ports[port] as I have done it in the first
version.

I will send a patch for this.

> >
> >    181        out:
> >    182                return 0;
> >
> > regards,
> > dan carpenter

-- 
/Horatiu
