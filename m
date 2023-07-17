Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA87EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 13:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjGQNXk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjGQNWk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 09:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0731995
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689600105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U9tymYFU/TDPlzixL0KdSNtmd4TxHCoMPCOCXKiyBdk=;
        b=Q9kZH/EgO23lEz62IvjLpsPjiWros6ey1Aote4uzomss1Ii9BLNfW7Rj50Mtslv6YiEv3y
        CPMo42dBrzRGRi3N3+0y+Dt0l9M5X2qrjOnGWNfTDaVDnpAm2uAhvtAPpS4j86fKpF4nS1
        MiTLSyvSd6UKmfi536NvjmE96yITSUQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-3mgWEDEKPom_D7ZsO3l1Uw-1; Mon, 17 Jul 2023 09:21:44 -0400
X-MC-Unique: 3mgWEDEKPom_D7ZsO3l1Uw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-636073f0ebfso36785966d6.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 06:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689600103; x=1692192103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9tymYFU/TDPlzixL0KdSNtmd4TxHCoMPCOCXKiyBdk=;
        b=FRIEsRPM7RzdEdlPrcmsxBTbIzs1UEhzl3YOmojWV5NaYLhSRdQ61rHBjFlj1OYbvk
         QsVGvUgko4z+RAhg2PMe8PKJm9J7/9r4ZwQ3nXGvO4xew0kl7AJs/hksj2FIORX1CE+T
         TCEasY0T2Mgvp65xjoxXhe++lVHwYxUsjbtnJz0od1BJQGLJPqz/J3WT7TOAR22Fno7i
         Hd4k9j4UMEGqsEpGyWz/2FYg8WngWUlJYQsKAx8tiuSsetZ16GSS3U2GUdbUtyJwnZ0v
         XYT7c/8QYKmE3WnfMp1LVAsUzFeb8NMboOFcTXC47fGOfEkOEQsBN8dUCuLmAzgkZFmx
         N1Gg==
X-Gm-Message-State: ABy/qLaHM2f0Ci8onMW5JgIHD3YBNAPlxk+Py73c/VPvqtoGVJeI0+FF
        X07wsZFEoqDgT7v995wu8ef+O8+W1YfmdxhA3hUbvsURcODUwya4QOttvPaU53xeTO4c5gC6P6A
        92twvIbo3+43VVmgBF2oxCyaPmtdFFypRePeB
X-Received: by 2002:a0c:b3ce:0:b0:630:22f7:37a7 with SMTP id b14-20020a0cb3ce000000b0063022f737a7mr9396612qvf.36.1689600103788;
        Mon, 17 Jul 2023 06:21:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFdBgPqGrFhNuxZuRc/YVB2KiMSNIYef/iQFEOkanZMNlfT/WOcP2vs9QKkFmkR6JX2JWGT0g==
X-Received: by 2002:a0c:b3ce:0:b0:630:22f7:37a7 with SMTP id b14-20020a0cb3ce000000b0063022f737a7mr9396596qvf.36.1689600103536;
        Mon, 17 Jul 2023 06:21:43 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id n6-20020a0ce546000000b00626161ea7a3sm6488744qvm.2.2023.07.17.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:21:43 -0700 (PDT)
Date:   Mon, 17 Jul 2023 15:21:36 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     yunchuan <yunchuan@nfschina.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, xeb@mail.ru, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next v2 03/10] net: ppp: Remove unnecessary (void*)
 conversions
Message-ID: <ZLVAYE5LjH8GOGrM@debian>
References: <ZLEQSivEvfpWXrdr@debian>
 <9880bad7-66b5-4d73-7464-8be859d8b56f@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9880bad7-66b5-4d73-7464-8be859d8b56f@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 17, 2023 at 09:33:30AM +0800, yunchuan wrote:
> On 2023/7/14 17:07, Guillaume Nault wrote:
> > On Mon, Jul 10, 2023 at 02:40:27PM +0800, Su Hui wrote:
> > > From: wuych <yunchuan@nfschina.com>
> > > 
> > > Pointer variables of void * type do not require type cast.
> > > 
> > > Signed-off-by: wuych <yunchuan@nfschina.com>
> > > ---
> > >   drivers/net/ppp/pppoe.c | 4 ++--
> > >   drivers/net/ppp/pptp.c  | 4 ++--
> > >   2 files changed, 4 insertions(+), 4 deletions(-)
> > Reviewed-by: Guillaume Nault <gnault@redhat.com>
> > 
> > While there, you might want to also remove the useless casts in
> > net/l2tp/l2tp_ppp.c and net/atm/pppoatm.c.
> 
> Hi,
> 
> Thanks four your reminder! There are about 20 useless casts in net.
> I will remove all of them.

I was specifically pointing at l2tp_ppp.c and pppoatm.c because they
convert the same kind of variable (chan->private) and cound be sqashed
into this commit.

But if you prefer to handle these separately, that's obviously fine too.

> Wu Yunchuan
> 
> > > diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> > > index 3b79c603b936..ba8b6bd8233c 100644
> > > --- a/drivers/net/ppp/pppoe.c
> > > +++ b/drivers/net/ppp/pppoe.c
> > > @@ -968,7 +968,7 @@ static int __pppoe_xmit(struct sock *sk, struct sk_buff *skb)
> > >    ***********************************************************************/
> > >   static int pppoe_xmit(struct ppp_channel *chan, struct sk_buff *skb)
> > >   {
> > > -	struct sock *sk = (struct sock *)chan->private;
> > > +	struct sock *sk = chan->private;
> > >   	return __pppoe_xmit(sk, skb);
> > >   }
> > > @@ -976,7 +976,7 @@ static int pppoe_fill_forward_path(struct net_device_path_ctx *ctx,
> > >   				   struct net_device_path *path,
> > >   				   const struct ppp_channel *chan)
> > >   {
> > > -	struct sock *sk = (struct sock *)chan->private;
> > > +	struct sock *sk = chan->private;
> > >   	struct pppox_sock *po = pppox_sk(sk);
> > >   	struct net_device *dev = po->pppoe_dev;
> > > diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
> > > index 32183f24e63f..6b3d3df99549 100644
> > > --- a/drivers/net/ppp/pptp.c
> > > +++ b/drivers/net/ppp/pptp.c
> > > @@ -148,7 +148,7 @@ static struct rtable *pptp_route_output(struct pppox_sock *po,
> > >   static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
> > >   {
> > > -	struct sock *sk = (struct sock *) chan->private;
> > > +	struct sock *sk = chan->private;
> > >   	struct pppox_sock *po = pppox_sk(sk);
> > >   	struct net *net = sock_net(sk);
> > >   	struct pptp_opt *opt = &po->proto.pptp;
> > > @@ -575,7 +575,7 @@ static int pptp_create(struct net *net, struct socket *sock, int kern)
> > >   static int pptp_ppp_ioctl(struct ppp_channel *chan, unsigned int cmd,
> > >   	unsigned long arg)
> > >   {
> > > -	struct sock *sk = (struct sock *) chan->private;
> > > +	struct sock *sk = chan->private;
> > >   	struct pppox_sock *po = pppox_sk(sk);
> > >   	struct pptp_opt *opt = &po->proto.pptp;
> > >   	void __user *argp = (void __user *)arg;
> > > -- 
> > > 2.30.2
> > > 
> > > 
> 

