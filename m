Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3FCC25B46
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 21:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjJWVqB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 17:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjJWVqA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 17:46:00 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19BBD7C
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 14:45:58 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E0C9321B30;
        Mon, 23 Oct 2023 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698097556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nFrlB0ZSECQCYvBjPP/UdyQ818M2Ekn7XUxo38mmv2M=;
        b=nhrLhWzarRTgEP7/W8m8OpjtzThw4zBto/5f5lNtWKf5ULViG7nOJo8PnInTN4gGzhNmsx
        IuKP2np4y3b+XKKA+13dWkaJ2vsJ2MQcuS1jbq1GjOErTEr16QchM+xCr/zIr4XVf4W9i4
        l47lAkYEtUKerPL5i/S6z1DbSKBuF3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698097556;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nFrlB0ZSECQCYvBjPP/UdyQ818M2Ekn7XUxo38mmv2M=;
        b=tS4L14K2pgr7gRy6CH7gG6fQ1XD3gqWoB64aP2vhdzuWEQEpB3mSceaT5/tWr82fEEQvs8
        JBAlhBwd4gU2MfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FCF3139C2;
        Mon, 23 Oct 2023 21:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oMhrMZLpNmXTQgAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 23 Oct 2023 21:45:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Andrew Morton" <akpm@linux-foundation.org>
Cc:     "Dan Carpenter" <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
Date:   Tue, 24 Oct 2023 08:45:51 +1100
Message-id: <169809755184.20306.3698252725424588550@noble.neil.brown.name>
Authentication-Results: smtp-out1.suse.de;
        none
X-Spamd-Result: default: False [-9.34 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         MIME_GOOD(-0.10)[text/plain];
         REPLY(-4.00)[];
         RCPT_COUNT_FIVE(0.00)[5];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-1.24)[89.50%]
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 24 Oct 2023, Andrew Morton wrote:
> On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org>=
 wrote:
>=20
> > Yesterday someone on my lists just sent an email looking for kernel
> > tasks.=20
>=20
> Well here's a task: write a bot which follows the mailing lists and
> sends people nastygrams if one of their emails is more than 95%(?)
> quoted text.

Doesn't your email reader automatically hide most of a large quote?
Mine does :-)

NeilBrown


>=20
> It's happening significantly more lately.  Possibly because the gmail
> client helpfully hides quoted text.
>=20
> Probably not a great way of becoming popular.
>=20
>=20

