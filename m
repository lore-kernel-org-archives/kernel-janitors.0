Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE08C07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 08:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbjJXIxC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 04:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbjJXIw6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 04:52:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548B710E4
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 01:52:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C12FAE;
        Tue, 24 Oct 2023 10:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698137546;
        bh=eC0wg1C0jbKrGc+1IvsfFBgNaqnr8aajGTx78YLd/VU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PiFjJc2aTQHIpMrC7hjnTf7+n0OGTXUKOC28rBdK9amF93EA5zp7bl3MQtOi0m6mV
         XpRZulR+b6mohr2APaaYZiqKWeyFjZeLQD8EYixmqiLa9qDIe6mJM5qaBEDKbi3Rg6
         HemU7+rT4ZVIyf/MUAipHgq+uj47FclnPx01VPQo=
Date:   Tue, 24 Oct 2023 11:52:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        NeilBrown <neilb@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024085245.GD5121@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
 <20231024072506.GC31956@pendragon.ideasonboard.com>
 <875y2wbedp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875y2wbedp.fsf@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 11:42:26AM +0300, Jani Nikula wrote:
> On Tue, 24 Oct 2023, Laurent Pinchart wrote:
> > Get a better e-mail client ? ;-) At least with e-mail you have a choice
> > between different clients.
> 
> Yup. What I see is excessive quotes collapsed, replaced with something
> like this:
> 
> [ 18 more citation lines. Click/Enter to show. ]
> 
> All the actual replies stand out, regardless of the length of
> quoting. Now it's just the Outlook style "quoting" without >'s that bugs
> me...

On the list of tasks I will never get to is the development of a mail
filter that turns outlook-style "quoting" into real quoting when
replying to e-mails (in mutt in my case). Does anyone know of anything
like that having been developed already ?

-- 
Regards,

Laurent Pinchart
