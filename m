Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848A1D933E
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230500; cv=none; b=DhHo1uheRSRssW5wadHQebON/dPhO3EwXWNt1AwyR/yuaJCceEkXWQWU9WV7nUy1V6XgfC9UWAClmyalA1+NExIF0XwCHJ4xvogSH+clydkAGhvIirW157/kZTWPDLowgSbXZEdDF5gx0/Rd2ZKkUuku3EB2VVb2/U5V13ZDTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230500; c=relaxed/simple;
	bh=0iJqFXz26XdgCQSvH/h8w9WHh3L/KON+49FMx3a5V0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnHSANvSXfMtSoA4B3L99s5U7x7MIkWn6gwvAc67dIkZI+WuYjQN2ZQp/UH9bt78fSSPjIjGEJ9THvTOsgUi6x/qwdeZ4oVPMCeIhtemuH5buTZmlVJx2pBEcQIvm5ueI7596S9RZ7QR7Ik18F1Ruspfd2G8FOG2dp6GLPYWi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DzBS6YMj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DzBS6YMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726230497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0iJqFXz26XdgCQSvH/h8w9WHh3L/KON+49FMx3a5V0A=;
	b=DzBS6YMjWy7MPLDxyn5W4icM/NbjR0IEfZEeAdGT8RLJS4ke3Q9QxxyzWiIay9LJONpieP
	KgNxyzu+Xh8d1i5OcGIOzcE/8nx0ySernV/ANAWliuIsYouL4Nrmf816Uk1igA5F8jUja3
	lUXEQiLUOcvibPGuuZdntZrXSzpG3Og=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44--Kj8OyITPjqsHeMfbbNf0g-1; Fri, 13 Sep 2024 08:28:14 -0400
X-MC-Unique: -Kj8OyITPjqsHeMfbbNf0g-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d8a1e91afaso2088417a91.1
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 05:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726230494; x=1726835294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iJqFXz26XdgCQSvH/h8w9WHh3L/KON+49FMx3a5V0A=;
        b=hEMm3oGHju9F2tVH6Y3UoumkKVDcXPGnoo/wvQ8QLF4g9+An4wAMyiv8QVzdTwEiAt
         FFucEeXTWkVvwhQxlXx7qrzdS2rUJWBe2r+S7vav/sCsy1HGzpnIzxymvdIB91CyHvD3
         euFX+EiukRhMC+I18k5S7DfA9JRUQRBkgpknR8caWqJIyQkWcRn8GHsYp3Kkt5L5mUof
         jiB9L9TdXyjB7rS5CBw4O2ZeCURVPvlUhuSISeRuWwfHE3TUWftNMsczREEFg7AF9C70
         V0muN5jzo19Tu5ujkSQ0tLzqP39kmnFuOYQvHaJVJvfkXBYOv+4Qo4Uwjo+gQBjDNJ1U
         BzjA==
X-Forwarded-Encrypted: i=1; AJvYcCWOvl4KuUpXXOk0ocXMKgStkmP0eg1N2RZ3AIAuYmHsjOLOi4BwC6RQs3Rl5xMoEZhJgt10hI9cUJKM70am/g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1XkF6aKaw1iMfsHsSSuK/1lcG80JbyPPjijaw0G3Gu6DeQcz
	ha3nIgeuMnS58P2Zj7rcPeuNzVEI927hKnIakKFDKqHKx0AAnwDKOYasK9+O5NV/fd8E3J3xT5p
	0bWmkz/NFa0mEkasqJuAhoRECR5WvhE6KjLx8TSEENQ71uM7hbK/a4CoQ2wCUX8oyoQaTb3kjiK
	w1EPR0tI+QXaocFFFETwaRWKH3H1FauT+tM8f8CADj
X-Received: by 2002:a17:90a:ac09:b0:2d8:898c:3e9b with SMTP id 98e67ed59e1d1-2dba0067f9amr6608897a91.25.1726230493772;
        Fri, 13 Sep 2024 05:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTGktECP8iZMnogTt7kyrdxvDWlfqIbjHUry2VvX13OCACikqY9Yv9ppzeu9lYjEd+EdPSuCBCK9aAudcW8I=
X-Received: by 2002:a17:90a:ac09:b0:2d8:898c:3e9b with SMTP id
 98e67ed59e1d1-2dba0067f9amr6608882a91.25.1726230493458; Fri, 13 Sep 2024
 05:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913115021.58405-1-lukas.bulwahn@redhat.com> <d125b5a5-8118-48ec-8af4-243a217170df@app.fastmail.com>
In-Reply-To: <d125b5a5-8118-48ec-8af4-243a217170df@app.fastmail.com>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Fri, 13 Sep 2024 14:28:01 +0200
Message-ID: <CAOc5a3NEJkHfmWymRsXa1AGLK1K6XOtT5yEsuaaqr9EarOArQg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: move BK3 machine support to CREDITS
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lukasz Majewski <lukma@denx.de>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Sep 13, 2024, at 11:50, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit 3e0bae7f35c9 ("ARM: ep93xx: delete all boardfiles") removes
> > ts72xx.c, but misses to adjust the ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
> > section, which is referring to this file. Hence,
> > ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about a br=
oken
> > reference.
> >
> > As the corresponding file of this section is gone, remove the whole sec=
tion
> > and note this previous contribution in the CREDITS instead.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > ---
> > Arnd, please pick this quick administration fix on top of the commit
> > above. Thanks.
>
> The machine should still work as before, I think we should
> instead adapt the path to point to
>
> F: arch/arm/boot/dts/cirrus/ep93xx-bk3.dts
> F: arch/arm/boot/dts/cirrus/ep93xx-ts7250.dts
>

Okay, I will do that and send a v2.

Lukas

