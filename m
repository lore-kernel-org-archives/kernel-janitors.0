Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFCEC25B47
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 11:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345689AbjJ0LtU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 07:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjJ0LtS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 07:49:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F2DC4
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 04:49:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d895584f1so1373345f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698407354; x=1699012154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUug1qIw57mr+DRpdd7GliSwdBMty2Oz1w0OdwZh2wo=;
        b=zUbdpQTmv08t5F2FfqV/bUjHd2AENx0tS9j/5G4ZfhQ/F1nsAR4Ilwot8c7fE9h5CG
         tOuo8OxDdL/SyIYXPCqj3y+qWH/o9mGEvIO18MWBmB+ir/WDfLulA2fPt8uCFPORs0ee
         xdEzLiyiApJyeGmTSsHqL4uvUTFzJ7l7ayHrB3TqWPhfW/W0H572XUfz0EER9jMsQjSE
         oP+My/+db2q2pSxQXmw6M6lgEVEcByL5G0XzlEed47c4Phs2CXYgaLHyxth7fLhn6bpb
         1wsL5ufdbfdB640oKaxP6D0w0y3eTIdIi9RTTizTVhnj07p8FA60Hmri6MHecUodGF/G
         7z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698407354; x=1699012154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUug1qIw57mr+DRpdd7GliSwdBMty2Oz1w0OdwZh2wo=;
        b=m82xvXbxVcuqNXQIyM0KPZJoqTZc/4VsQeEQlsGsHPrGu/Aqx5npWz60y9DyrQwSbW
         3BgYSbDLy/nazItPGX3NTA6fbQR0SC0/TiExpUzdcrqokY5El5OfZXraCb5WZojXXYqL
         PZLj/G3e8z8vM21e1DhRfTrJSs8XnRIioSOt1xk+mY7w/MG/yxEBq+u/C1K/0BuQ2uoe
         bw7EH74FD9CQgzuObRCndSqwnTKW44RyRY9KIkx6WHlq1KkuW2Y1Dol/AC1i1zh6gPPz
         dr2PBY+zF+UHvWrxvYo2rOhPcCWoWJsS4OhfxaTa99ntdQILFvyceyKsgw9f9VuPLO4L
         icGg==
X-Gm-Message-State: AOJu0Yz/5+XnX51ojFL2y+iAx01aeaWlO7BBVUomFrnIILpNlng6PD92
        Q4ulYrQWocGfWESSBLE1DxNmMw==
X-Google-Smtp-Source: AGHT+IHdHIPlDJMXyZBHvSDTolKHJH+uKVMA1F9BN32sTR8LYz4kzbcC9IvfvgWuJOdhdg8u+hIgwg==
X-Received: by 2002:adf:f14a:0:b0:32d:9f1b:3a1f with SMTP id y10-20020adff14a000000b0032d9f1b3a1fmr1983922wro.31.1698407354572;
        Fri, 27 Oct 2023 04:49:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe74d000000b0032da49e18fasm1633927wrn.23.2023.10.27.04.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 04:49:14 -0700 (PDT)
Date:   Fri, 27 Oct 2023 14:49:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        jlayton@kernel.org, neilb@suse.de, kolga@netapp.com,
        Dai.Ngo@oracle.com, tom@talpey.com,
        trond.myklebust@hammerspace.com, anna@kernel.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net v2] net: sunrpc: Fix an off by one in
 rpc_sockaddr2uaddr()
Message-ID: <9a3be793-0d42-4588-8c04-c930671e7ac4@kadam.mountain>
References: <31b27c8e54f131b7eabcbd78573f0b5bfe380d8c.1698184674.git.christophe.jaillet@wanadoo.fr>
 <ZTkmm/clAvIdr+6W@tissot.1015granger.net>
 <20231025092829.6034bfcd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025092829.6034bfcd@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 25, 2023 at 09:28:29AM -0700, Jakub Kicinski wrote:
> On Wed, 25 Oct 2023 10:30:51 -0400 Chuck Lever wrote:
> > Should these two be taken via the NFS client tree or do you intend
> > to include them in some other tree?
> 
> FWIW we're not intending to take these. If only get_maintainer
> understood tree designations :(

I accidentally markedt his NFS patch as net on Oct 11 as well.  :/

https://lore.kernel.org/all/356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain/

regards,
dan carpenter
