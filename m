Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C1383C9D
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776201371; cv=none; b=Rsggpw2/bF21GVLSpUouusB9qAcJpdvx070SRea+PtIk0Z5J20hL45H1aLr5as6MDRgG2vRLdBhUmrETQy0NEPiR8EDVM3EYWknai40rhrkZxOCnkSOCXz/TZIbXuqUaN5UdG1qD2m22G7FUY4QdzPQvHvVO04Ag0igJ87z+6B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776201371; c=relaxed/simple;
	bh=Q4INpfKWk7mxaKmB7Uf/Gsp8EUYR21VjlgB0GxYGYxY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SEHrQePzMop/HDn331lT1aGevQps80ybN7CvQN94TNp/j6PhB7/MWlDj6N6+/z79sVCkzSEYMUQ5Ps6So015cC2pr6M3dDED6dHtgTvTIgNe2tVaRF2zp+iZeFY+gMs4r1cqKrj0MGRo7b2huP7CMrnxqUVvpvUR5vNgo8hKQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJgrlgZg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRyqJv9r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJgrlgZg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRyqJv9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776201369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TyCH9SMWGwZ0uzhcSuuZUtHYH+vVfCSIhLbgFrzZ0M=;
	b=AJgrlgZg4BnNwxyoXrYRaZ7cxflZOYfc3HOr5aZEnBKYJcjScL0/XBzFYyXpHFBwAnJtl6
	TASD8hOIPWpRV39nUm1HChVOjkMTVufr6zb/BvmyEEH+UtxRaWhg2mZaU8wCHsjt9rNokk
	V81jFbT0n+5LcoGicbK4IFTBlLfyMUM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-0ao9o29gOUOpKgYOIDQt0A-1; Tue, 14 Apr 2026 17:16:07 -0400
X-MC-Unique: 0ao9o29gOUOpKgYOIDQt0A-1
X-Mimecast-MFC-AGG-ID: 0ao9o29gOUOpKgYOIDQt0A_1776201366
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-79cfec4344cso106039507b3.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2026 14:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776201366; x=1776806166; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TyCH9SMWGwZ0uzhcSuuZUtHYH+vVfCSIhLbgFrzZ0M=;
        b=MRyqJv9r0e3ouh+RXrs//POsjQjs4Go1fUYCNIopgEJ6i3wvJl0q49Qh4VZ/ElX2bm
         Djmf30gsrihnSWevTIQwdo1xGNt2tqYildA3THy2nBSh/pab4N90w2ZRxIjVPVip0rDo
         rOvZW+ZVR4jRV2OHO5kkY9/TgjOrXUaQsuJ8BQ1SQ7JRIZtxbTryW+hYGwyRW8AvDvit
         HQGKaScx/axmE9W5VpHem/wG1/HEt7ODqB06cqkR2TCiwqiekWxUDf3tHAak8Lk5fabS
         z+PQB5yD6664u8DRfH+6XISCppnvpgC2Rne3xej74dRyQ2wClImZnybrswNAiyE658n+
         nq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201366; x=1776806166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TyCH9SMWGwZ0uzhcSuuZUtHYH+vVfCSIhLbgFrzZ0M=;
        b=H2TjGBk3EfzpeyeZNw8vy2fU1PCGTD3kvoXA/OgpJtiJtg+A+hQbBLRTXZl0nsSTaF
         w3kIXcdoHXPRI+RzxcMpdUDC7x0/yyPCEK8u5VAh8K3wm2b2C/Oz9sUL/4+9utI49vWM
         kJx2tuuNArQIi9O2J9rg3M6/2DBm/tM7R7Oy4TLE42sczRcJkR8UQjMzVywMMZJ5iSCv
         6r7XTTSm0EQsMdTWtNrzhIhK591s/YMrrUTrODSFJoWIe70rOKLjCFWFGmIOgjqMUY9e
         55aFpZDRWQz+xTr6NDbOv/tlic45qng+W0ngQ9Lclt7iK9X0dNL4pJoV9/S2pWVj9VQX
         1htQ==
X-Gm-Message-State: AOJu0Yzxin/7f9yqw7DKcZB3/fPh7whaVJg5Ic6vDghQ9Y5YR39h0ECW
	fXjNWcbHV+yeJ697XX4pRc/6J1ksZsAgdkRxi9cQ5vkncovXrzRqURwVoskp7PE0fbQ8wPyWIQ4
	jyEMPD1KA9Wpah/peBd8THdJoSmrQq7gX4s/VaR5yinDdjFqJyWh/Bmv+47wd0zIShWrZng==
X-Gm-Gg: AeBDievciJljuQYsRlpNAMb+1VQghwfXdu28RejPgiuE+lwfpGr2t6PyJbU/TZSN/oG
	Ye18jVKrg3/K0zMUJUPekMWbejQKFqOZ56qu52r3RN7yVtv3BsfItBZ+3drABu5fy2QOP3pOPA3
	abdc6uKYF/j4oTcsGhZO+a8R5litRcoBmNVkLh4yLIDQtMYs/gwUu+9tTwTY5IPk914rS8wKKr7
	bMS1TdINS1NAZnqXb/glTm8U/Fk2fmxvyUCmgxJSQ2yomVEJm0E2zMz3thZ8aRkV6rySe4wHgmQ
	JhsEnywTqpp92v66YrIbjcdi1T+KywGk41/TRHuColVFAQEq7GF6xBZZff3+irxE+GHQslePV2b
	syRtt6NYpDQ25WwWd26OgDWnWN4K22Q+zUn7HYxkNjgHAR+uQ6jebmYwBSY7hb1E=
X-Received: by 2002:a05:690c:c1cc:b0:7a1:a31a:bfce with SMTP id 00721157ae682-7af715776famr166038037b3.32.1776201365721;
        Tue, 14 Apr 2026 14:16:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c1cc:b0:7a1:a31a:bfce with SMTP id 00721157ae682-7af715776famr166037817b3.32.1776201365354;
        Tue, 14 Apr 2026 14:16:05 -0700 (PDT)
Received: from li-4c4c4544-0032-4210-804c-c3c04f423534.ibm.com ([2600:1700:6476:1430::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af3d1c07absm73967887b3.19.2026.04.14.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:16:04 -0700 (PDT)
Message-ID: <f57f2eb9cb81dfd11f1b4dbc9f345b7713dbb5f4.camel@redhat.com>
Subject: Re: [PATCH] hfsplus: remove xattr error message
From: Viacheslav Dubeyko <vdubeyko@redhat.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>, Viacheslav Dubeyko	
 <slava@dubeyko.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Yangtao Li <frank.li@vivo.com>,
 linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Apr 2026 14:16:03 -0700
In-Reply-To: <4a6a9ef3-cfa1-46df-bf82-d083ef30041a@gmail.com>
References: <20260411125338.165758-1-colin.i.king@gmail.com>
	 <b0e9b8218a2daeb65c8481d1f4646f3ca89d713a.camel@redhat.com>
	 <4a6a9ef3-cfa1-46df-bf82-d083ef30041a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43app2) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-04-14 at 21:19 +0100, Colin King (gmail) wrote:
> On 13/04/2026 18:12, Viacheslav Dubeyko wrote:
> > On Sat, 2026-04-11 at 13:53 +0100, Colin Ian King wrote:
> > > When exercising hfsplus with the stress-ng xattr stressor a large
> > > quantity of somewhat unhelpful error messages "hfsplus: xattr exists
> > > yet" spam the kernel log. Remove these.
> >=20
> > We can convert it into hfs_dbg() and to add showing inode ID + name. Wh=
at do you
> > think?
>=20
> Yes, that's a good idea. Perhaps the phrase "xattr exists yet" can be=20
> rephrased as the message is not really that clear. Any ideas for an=20
> improved message?

Maybe, "unable to recreate the existing xattr"?

Thanks,
Slava.

>=20
> Colin
>=20
> >=20
> > Also, there are other pr_err() in xattr code that can be converted into
> > hfs_dbg(). Could you please take a look into other ones too?
> >=20
> > Thanks,
> > Slava.
> >=20
> > >=20
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > ---
> > >   fs/hfsplus/xattr.c | 2 --
> > >   1 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> > > index c70bb6f494b2..e10e1d8a5862 100644
> > > --- a/fs/hfsplus/xattr.c
> > > +++ b/fs/hfsplus/xattr.c
> > > @@ -301,7 +301,6 @@ int __hfsplus_setxattr(struct inode *inode, const=
 char *name,
> > >  =20
> > >   	if (!strcmp_xattr_finder_info(name)) {
> > >   		if (flags & XATTR_CREATE) {
> > > -			pr_err("xattr exists yet\n");
> > >   			err =3D -EOPNOTSUPP;
> > >   			goto end_setxattr;
> > >   		}
> > > @@ -348,7 +347,6 @@ int __hfsplus_setxattr(struct inode *inode, const=
 char *name,
> > >  =20
> > >   	if (hfsplus_attr_exists(inode, name)) {
> > >   		if (flags & XATTR_CREATE) {
> > > -			pr_err("xattr exists yet\n");
> > >   			err =3D -EOPNOTSUPP;
> > >   			goto end_setxattr;
> > >   		}
> >=20

