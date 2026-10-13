Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D164FC8F2
	for <kernel-janitors@vger.kernel.org>; Tue, 13 Oct 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896902; cv=pass; b=KEavUMDt1wXepqqNrlLOojALJqKOmupFOR6vHoYY/+MOnF6UKxyPJg5l1bB23KHlvSN5xBn8xeu01it8rVZ+neiKrppjrfctOnBd4n4zdzHi/p67MzGP9/B8pLR4Nu2ly41PBCsa0MH7MtWpcrKm/RvhEnCe/vOoDXywJpteO6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896902; c=relaxed/simple;
	bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T19zqwpzKRFGtp+yQx1idOkpuvvVn2zt/Ayw0uDareYbEsFsiQe8ya5w4fBxa8VlhyBT9qFXqYs4ygS553vubqWCUImunh6lAqP2Norcj41EmKm5cbFH9W5a5JNfOiInCsaW/hOcLYOva8Q5q9pxHlsROxnWr5H+xVhvJ/BTtwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFVxvwuo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NY7Rs15G; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFVxvwuo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NY7Rs15G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791896899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
	b=WFVxvwuorcsXkRhN9Q5yRSYoo2l60h/1e0OypH7l+R9ksPh9PCyh+Hf9VHjblBGdmVDMAY
	3rt+nt71/B+y2YmNsCofrhj+z/lH6OrL0THLfYEDeC2t2bptknVVIc2xrOYmRn3iM/ts1y
	n/Rtq92D0f76XBwlJgoMYBj2+DahfgQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-WQBht2OCPFmvEwIJAWcraA-1; Tue, 13 Oct 2026 13:08:18 +0000
X-MC-Unique: WQBht2OCPFmvEwIJAWcraA-1
X-Mimecast-MFC-AGG-ID: WQBht2OCPFmvEwIJAWcraA_1791896897
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16fefb7acso23059245e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Oct 2026 06:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896897; cv=none;
        d=google.com; s=arc-20260327;
        b=EBcT+T2xxUpN0u/8dkKYDBNCNVsJc32/+stnx+tvzVfvP44k0/NMWufpLyhgYOLyse
         kQ0n3Amob/P+f0CG0wG07BJj+74z52cOU1+QVbljfJxKP8xOG7YxJfX43M2BqSD8F6wo
         vpuuJPrsveowm1uXlGkBk6ccqIAzUxFZ2dwJPdGjBTltH3r4hATxVc5w8EnKueHhuV9i
         5IzKA1aWBpjXAKSWtU/FbN7uz7QusD6LaJ3VgQ9ItsscYTXaag2Mx9ofiYVTDKrVNDQd
         UuC3dmHbTmTHFG4EiPt3OFV1GaAPREQinFeofrwrHeLAUWqsXkmBMcbE84YAeuhE7QTJ
         TnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        fh=vdR3sL6IlcVMhPsUd65woYse32TcCJSQp3U/qaVmkzw=;
        b=lViq2LXPJuIi+F7b/v5O7ftaXz/6rhq9Jl3LfkdQy83sCsnbRzCk9RkaXT0kkp6oGR
         yfckBZkj5auS2CCuVJvRr1Cym4yloUZH8aDhjBYOkzeVtqLzN6zMB6rXtucV045srpMY
         lk6aLdlaLG7ho0aijznevnQvQFKm6F+/QzZup/KRQvSew4ULMCAB5AY1P5mxYuhzW3pd
         qRX1DUBplFbmOYAgp5nnDa6c84rrUX3H8MT8MDdpN3lkBMeE+LS6lhoTp6uCXJumzO5Y
         vCcUR7r4gJ8MDuvCfwXjT1jGAoMStp057w5DSZXtzcIjQQW4BWAonyZoHW3EE2WwTLqW
         jBGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791896897; x=1792501697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        b=NY7Rs15GuQgNYq2wjhHArYywJw5aYmmDcI5efu55g15ZB4qpbdyL1u66YAIRjHcp6S
         DGP20YJdP2DsWuL+H4pDnAhLs9WpsVvlNoQSeDne0HtZjKAS9qHjyLz0yhKilfmTgwqX
         JQ3dgWRMAYJEZXrCpEJtyNQg210D414Tqqq59g0Ei5gB0lt226eIGc+pCkq6B3xPe/SY
         FtmIU5hm9KvoSVviBbHaiACnxIOFkqB/Ug9zE3T8uTQ4XQszsDO3A4SBoN2tpxWKH4oa
         EdX9R86CtGbFc/DySHHbjBB47l9Wws1JPR0OvR4MVAVvJXGa6uVvuLvxLUqLfhxDiOXE
         ckAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896897; x=1792501697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        b=NltX7lCxFfSObL0qhO3DqlgsEAIsmSoC3DkLCl8CYUR17VZqBe/+Rg2uxbs0NDBdtv
         tcafsz5gsSvIzxxP7PERCszSLEZyZHFgT42TUMzgOwazp6pPqQJJDuDBBNfalKNi/Dxk
         S7PdKqdCDrCgL1fyWhGAgwNBzkxM1jKUmkwwnrDx1O+hM3b/NQ9sUI4zJj4l/rK5vE+S
         KFvG3OK26gRbU0pjmR/dnolGdaJT0nqS1056b4F7/mPjqHAswGhcHqhg4I/TPGkYpgaj
         kRUQ2rCt/U2Fa1jDfLwUF32YkjwKnULX3UFakz2FoyT9h6Ko8xTn8QA2EivsEoqjccoc
         vqoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpBrhh/tsgsST4lohEm4TFD+UYCX/htgCNpx01HNZKrTlym2FPqNMuGGEw63grkhNto8pDfvuZcsKTqEclTEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwXZobloUCZV9EFEcSsUjiWcm7u929N40c6vSwHerGSl6vpkcb
	z4CyjEFrl/4HGkNEozqIy85G9Ry79kz3XY5+scljt6bNjfmvQX8IOKqwdsxOp/w7VqX+ObgYGhZ
	L7cZ135yuX3l4cE9J77utfxZCqWDzEdygwiGGHWWXlnAdjZ9ra0QqS9Tam2SEbxL6TsJe5HZxOH
	deehtNhESsqvu6x55QlYzlZtxiqLOZ6uthV2YP8EonLFTV
X-Gm-Gg: AYBFou3Qt6+0VYTtJxsT/xHQq33yCh029MnMFrQhoeW9tVWEWxzWmJWORv4K4xl6fE9
	KjSYLbPeZZtYbMBePFVYOva/2MoysY6M6/pWq5d12PE7l2yp/ewRkiJSoTO6TkZIrqLIeZj0JY2
	HhRSzYxnHTbV5R4CztCLvL+5SPP9dLyj7drVxlgMJps0LIyFUxbQRRlfCg
X-Received: by 2002:a05:600c:3f0c:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a18e44691emr266641495e9.2.1791896896954;
        Tue, 13 Oct 2026 06:08:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0c:b0:4a0:1723:2d8e with SMTP id
 5b1f17b1804b1-4a18e44691emr266635145e9.2.1791896891815; Tue, 13 Oct 2026
 06:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar4BZ26gjQEjZgIa@stanley.mountain> <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
In-Reply-To: <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 13 Oct 2026 09:07:59 -0400
X-Gm-Features: AclHuK8Sj2_Nz53xtduLPLt43HBfIW0FUJKisfBY_Ut16Ue4zEZk3fhpsmezn3s
Message-ID: <CAK-6q+heOWNY8CY8dgotxzEeFC_-huHnnO2pgH8kJsJSGryOtw@mail.gmail.com>
Subject: Re: [PATCH] dlm: clean up a type in waiters_read()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dan Carpenter <error27@gmail.com>, gfs2@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	David Teigland <teigland@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 11, 2026 at 8:17=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > This doesn't affect runtime but "rv" stores error codes and so
> > declare it as ssize_t instead of size_t.
>
> Can a similar adjustment matter also for the local variable =E2=80=9Cret=
=E2=80=9D?
>

What do you mean by 'matter'? It's declared as cleanup.

- Alex

