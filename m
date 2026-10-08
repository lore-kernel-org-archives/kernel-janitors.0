Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF53C553F
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Oct 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442063; cv=none; b=ZOBs5Wk1plQQn4Rggviti94Ee9JwBPKbPZIw848AWtaQkFEeDNerC3F9mp/Dzq9ZvuK+VqalgfkkaNyhUSYnNNaYT/mQQZcRMbQnC+MRuROvU8Sja5GNIIKnGHxi0Ug+HkdV+w2IQvirRrYZdjFJaWYa4HccQ03XB/GyyHZWcxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442063; c=relaxed/simple;
	bh=aSPhb7m37JJIpoDkFdsuy/s8Yx6Y8o2Wuc+YdzLkbDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeruONbEx/x70a1aL7o/5/hPxN9eXUkU2WUWznjPVUhyE6JAqf9p04+T+06rexWN+EcetVdOaC8c9agtWx7t6RKXLRZHTc1MRvuvJwG6+O2HCXHR103QNLbM6y5LzV2amXQ3LGBI+TUbNFTMyglUX+VA0752ynucVULklvJCHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CUKGpUl1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CUKGpUl1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso2952954a91.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Oct 2026 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791442062; x=1792046862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=CUKGpUl1Zqcy6Ia35PQskFQCzOxWjd3JntCL7h+h5eoQrR4Wc6syTUzQxgM7sNeDy+
         jD6GEyL9CcvG8QpTBgHEx25l01BWccqMW6wx5qthdy4Itjl/V+21nvTdA4dcwDYOShty
         Xx6xY1SwlH0XGDzKZhQxxX15QTWh/FmogRZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442062; x=1792046862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=uIRO5CK49e6oXHJjUnb5iNMuaRvQoxKR4zo1a8bTTWgof8Q/gZUlc/Qr2LShx3rxbl
         DGSjnAAS4BHayW/V5zFYUk8iOWJ2WxyIF/lOf2GZb2gsd5dEjnBYt7V8mzTVZtiDsI+t
         xRTmShpildVmqI5LrUmwu+eqtnUDJhEYqOdldUaKEN6i34oqzCeGzHIVVXJUtyddO54z
         DmNAqi69nq57LXoVAg2pm3yvgefRByemV8sithAhk0svo3maFb2kdm6EaO0KHnwdPwHe
         MNBl0V9hhS5EAeSn4ysUeP5rzyxqJB2XoI1OyYjEz7VK6CPjUpFPBr2tyFjZipH0PhVh
         Vu3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZt16XLtysEczGyKfuG1owhm6bWkY+rhpdO07kxEwiNvzkqW33/GnPMg/XpaFPM7VPNl3eBZfX1Vv4kRJ+1+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEASU12KDMZgRk8cia7tFoOF7B5UVtoT1bQ2ypaSm7UZ6BYtkS
	dAR7NX9CAL+dZ3i4QOhxm29ed7QFhIM5Wxr3t8HyhagXIxTP5NnkNUK6xbYGos5ikBZiyWCawsw
	vrEQ=
X-Gm-Gg: AYBFou1mFEUDIVtfsYAPwG1bxja+Q2wgp0YJ798QkXyQala0v0y3CSTvgC6YqMGVeL1
	pwuwQ6dquY6SX+Deh0Oxf/V4vzLFQkV0KSvyGQSj+LwpmytF/rzvyQYvGU6R24YZwxmlOlhhZ8c
	CsVSjbVqAQPIiKTOtvY4KygXzn2AHb8Kc9vya6lXNJMCtYTtzJL18biZ4tEjPHH2C0r/Jarj8+l
	6Vzmjnt5Xf4fOa3uHf3HorWVoWhqK2sbmehOfrsv6rw1GT2UBCPNAsTr0ad38Gs2ZD/G+Mjba5g
	2on/qwsA38QxxZRd3KNNfXzCzo7dSgU+LO+efZX1+LPzfU0GVO/y/bK7MCtpEm3LfBxWqdDC4vx
	cBqA6ZDllCEkoeVSqtbd47Un6dVAjeiTUXkrYrb9yYDzKPKabfyMQ+jDiaMVpNT7LoheHhRE3PS
	hhBskapSwHD15BWRZ3ZZ5h2UgpVNX+XerXCMZm1798N0lgrf3iXNc9P/WyIRKbjWC126xZkrj29
	nUuz/NTG9RAUjz5FFQMIvk9R5bxS6SFfPA=
X-Received: by 2002:a17:90b:4b0d:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab08b274aemr542786a91.50.1791442061827;
        Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm3021095a91.1.2026.10.07.23.47.40
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-141395927feso4178043c88.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyEVvNFd5kvbokHOlEHdO124HH7LGeGKJeyScHv5reeSHkTAJ2Vu+UWwenSVoYERLM0c33j5uO82XXl8DIDbw=@vger.kernel.org
X-Received: by 2002:a05:701b:241a:b0:141:52e3:8607 with SMTP id
 a92af1059eb24-162044c0816mr5535095c88.11.1791442058711; Wed, 07 Oct 2026
 23:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <20260928203105.GJ4406@killaraus.ideasonboard.com>
 <artM1Kqi41JfNSGg@stanley.mountain>
In-Reply-To: <artM1Kqi41JfNSGg@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 8 Oct 2026 08:47:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
X-Gm-Features: AclHuK-6lBsfZibyY1EbZnPcvBxs95w1QCFOQo0ockAUH-Ktg6072cpe96FFZXQ
Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all



On Tue, 29 Sept 2026 at 07:30, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 28, 2026 at 11:31:05PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > What's the status of this patch ? The issue is a false positive, do you
> > still think there's value in this redundant test ?
> >
>
> No, it's a false positive.
>
> With how Smatch works, I don't have an easy way to silence it in Smatch,
> but I'm going to publish my AI skills file for reviewing static checker
> warnings.  Also I've started writing a new tool to help filter false
> positives.

Even if it is a false positive, I think it is a good addition, it
makes the code more robust.

Do you mind if I make a respin of it with my comments (keeping you as author)?
(Or if you want to send a v2 that would be awesome as well :) )

Thanks!

>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
