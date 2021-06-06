Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2404C47082
	for <kernel-janitors@archiver.kernel.org>; Sun,  6 Jun 2021 00:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D6861415
	for <kernel-janitors@archiver.kernel.org>; Sun,  6 Jun 2021 00:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhFFA17 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 20:27:59 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38571 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230025AbhFFA16 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 20:27:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 7B1EF1605;
        Sat,  5 Jun 2021 20:26:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 05 Jun 2021 20:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Nsy7FBok3E07qQqMA7OkliRXpBi
        ITK1Kz/IxExHgNs0=; b=TW0W/YSFl8div1hslQekdgqt4a6LydIpFQ7Tr6cf+k5
        AMOCFEs05NpDWYn5qyziC4+eByk8to6zjXGxuDPydN5okl2VogmsXDnlwgZP8BFn
        /Tfx3JZHz2P5mKvUvC1a4CMTK4+WkgpDZAZySj8G2npKtMAqrCW9kuNDL9CtnJGI
        uwwxQJNoF82zxBSbaKCslf90IabLQu/r26Arc/UHfNS3O4Aq9GQ4RxqoI4TUc+Kg
        WwDvZqWW1Jre7Ih8vwd0UnNZI5QgrmH22mwZuHbQ5w2fE8tjOILnBlHdrcRBAqWj
        PVfuq9yy3Kb5ZNVDlZS8/pcfP7AoRJSSRix8EWhsiog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Nsy7FB
        ok3E07qQqMA7OkliRXpBiITK1Kz/IxExHgNs0=; b=PaIu85dfGJ616V73AuMUmG
        Gkw3yKhfIkJFTrF/oAesuzal0vMgMZcWTJSm3ZxUlC31XcX26atX76ATzJphxuTx
        K8l3dUaVx0jhUwFa1aR9XmI48wFJ89i9bKJIfESJ5hdcz7VfXVB+JyqWM8aKTFpe
        3eozb9f7hZJq5X3UQBcwXQOk6O8WWzuKF9cGhqRTYIFGKWuQgQ/YAHvaw00HBIBd
        xaZiV1LUox+w9Pbo/VnfO+ZConNDN/Ir/y9Zaaja3nlvQbQO7BOn+S7cPWDiEaYt
        InesurtTnJYIqUFCagmKzCqEKGrw6AZUaNMVNY+4wyFqjJtuMLlhCNnPf0Db+wuA
        ==
X-ME-Sender: <xms:IBa8YI5_CSoXyRkuvPV2n2MF3Z1siatI1G5CmU59AQW5CPR-3Pzr7A>
    <xme:IBa8YJ7_gnFA5s8dq0WkvEf7zBJtuJLw9Di_rgLL7WUj0qMPppYPXYnUKwwtuDoXq
    3OSXpD8CT6H9JJuajU>
X-ME-Received: <xmr:IBa8YHcid6eRVaGllj1mFW7dKDK-fN7Me8XPFUfFlmUfemSE29GbTk7Tz9XkEst2ll400rFrhJoitwIEU8qMuej_HDQkFtBbzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
    tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:IBa8YNICSJNqzywXJ7oFOaIynIJeSLugxQ4q8vn48VhozvzxMFdFPA>
    <xmx:IBa8YMKjDVoJMp1G-uXrDIcGX18SkcqCehV80RzXbgZxg2gBRIEdWg>
    <xmx:IBa8YOyhrUx2rvJ54xc-IxbPzfa0q4c2OW_g2VjdKUkBccuDnqmfvQ>
    <xmx:IRa8YBG42ENDjlpflxIVBbK3lB8mbSB30UdQh7Rn4BVco__ZjWGKVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jun 2021 20:26:06 -0400 (EDT)
Date:   Sun, 6 Jun 2021 09:26:04 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-lib: fix error codes for allocation
 failure
Message-ID: <20210606002604.GA4284@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <YLtyL4VoArwVLor1@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLtyL4VoArwVLor1@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Sat, Jun 05, 2021 at 03:46:39PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if kcalloc() fails.  Currently the code returns success.
> 
> Fixes: f9e5ecdfc2c2 ("ALSA: firewire-lib: add replay target to cache sequence of packet")
> Fixes: 6f24bb8a157c ("ALSA: firewire-lib: pool sequence of packet in IT context independently")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/amdtp-stream.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
> index 945597ffacc2..b37cec3cc579 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -1625,8 +1625,10 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
>  			s->ctx_data.tx.cache.tail = 0;
>  			s->ctx_data.tx.cache.descs = kcalloc(s->ctx_data.tx.cache.size,
>  						sizeof(*s->ctx_data.tx.cache.descs), GFP_KERNEL);
> -			if (!s->ctx_data.tx.cache.descs)
> +			if (!s->ctx_data.tx.cache.descs) {
> +				err = -ENOMEM;
>  				goto err_context;
> +			}
>  		}
>  	} else {
>  		static const struct {
> @@ -1643,8 +1645,10 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
>  		};
>  
>  		s->ctx_data.rx.seq.descs = kcalloc(queue_size, sizeof(*s->ctx_data.rx.seq.descs), GFP_KERNEL);
> -		if (!s->ctx_data.rx.seq.descs)
> +		if (!s->ctx_data.rx.seq.descs) {
> +			err = -ENOMEM;
>  			goto err_context;
> +		}
>  		s->ctx_data.rx.seq.size = queue_size;
>  		s->ctx_data.rx.seq.tail = 0;
>  		s->ctx_data.rx.seq.head = 0;
> -- 
> 2.30.2
 
Indeed... Nice to catch it.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto.
