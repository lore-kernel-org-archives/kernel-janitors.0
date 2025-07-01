Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C891805A
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 04:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751343924; cv=none; b=FTUuPb4bqKlDWtd6OTkSf41Fih2HXNxoztTM0cermxIdXeB4wse6N2wu1UnVxTMCWw4AO+1DYkYsYpKiU6OkFcpNAmUtkGD26Pj1EOyLQ8zRSmA/HkkebdIH7eDLUksmwaQxzHpTLwQcnC/qx8WbexeoMWOWWIm7TcKVVLkImT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751343924; c=relaxed/simple;
	bh=xTlkawP+HrT86XAI/odIWysClFvPD3RipF39W4vJ9BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oC26VIHxalDNC47WzTvVv2UJfHXKyiTJGw0MAiUAfToplR7Pfgc05g6uMAB8pjnCbOgIcFFYGhsmzjYL0P6y+q9PjHC30sUE+muo8PbE8spjmRbjTzuRFZblAUvJAOcszALbmEgVf4kqSy14G+jy5k8gdH19F5KcSUxyiYxA8xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JN0wvjj8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JN0wvjj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751343920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lt5n5LVbk2ID+rT7ZU2EFy8ISr3xny14Ax772QH5whY=;
	b=JN0wvjj8QrCO1H1lluvOLxBmTy31r7CI9k8g2yv2JUOG8ko6+Arq/Piwo25T6VVSw95Tdx
	zAA3zMrgtkC38t9bR+9IvEYgGJ33oZ+AgouIjkuce7jyiUfQA+56KYjuGQ0WIOkENdDxBZ
	XkGsdtqID3lc2oZIvvs8MmkcNxgc/yA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-3NXO8kj3NyOgu1FnD0lOJg-1; Tue, 01 Jul 2025 00:25:19 -0400
X-MC-Unique: 3NXO8kj3NyOgu1FnD0lOJg-1
X-Mimecast-MFC-AGG-ID: 3NXO8kj3NyOgu1FnD0lOJg_1751343919
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so4532544a91.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 21:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751343918; x=1751948718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt5n5LVbk2ID+rT7ZU2EFy8ISr3xny14Ax772QH5whY=;
        b=XMalEVwsp5GQ1zxiLJCFQ+GcNdQaE9hZHRratfBosXapgm/Cj0A+czFmbb4REEIsE3
         3raoATL+HZjWzyVOgOaP3bxutk+6hZ1rC57MUqzVCSgz21ZuywCg9w5TvfSMArG0vHjK
         tvtL3++qrzljfKb6aindjxou9sw0cDbTCqsSlOoWiT3FqHcdMcVc6r/XYH8m4H/WZbyx
         eWu878UbCQcwA1AI2ptqB7NMs9god7pRBJ4ZqWY0wH/PG08bMV/ITh6aMWKa3SgcXepT
         lGHjNxr5CMUr7vzAS9BbC3X+VhIfxeOHIL3wyJ6STP0cmvNGXMSdlslvr875ekfoyKD+
         fpCA==
X-Forwarded-Encrypted: i=1; AJvYcCWEH+n3/ViCkQRjqyx8zBLYbrOOp38e/BfteqOn2a6Q+uNtJGsnFTjUyQVP8AXFs6lN2bob+zsXXdMRLCIWoJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOJwaXoEh5NlUJUqj/VQhsE2Q7VmVIr7qrNXqHMw4LLc2me27
	RcJbmL//asj2AxduglX2vd5VNh7cJ8VhXQ3jyCsNinGKpcM21FFgEs/jXd/ZIGpL6OwvFEr3CRZ
	uln8E7d+BChYmg/yaU7wwdbsaCjsOqP9D5lRFT1YU/AwoiFje5jDHX4SKbU+I6kEibveGQyPwcm
	duCOATFPdGA9yTfq6DTMvByVY97Kqaq92rGWZo6TsYhH23
X-Gm-Gg: ASbGncs1Wxvq+Cs0iIYBvZTiL7Eh7anb3ynhD9WmGgEnSRB8lVSGxAcpXZXMlsbaBG2
	KUsKq1bLaDSwkOMAhhAMq7ZDnhr4NQd9PUnJK9rX94qe2N2plBaGkymsp/YTDuWzhpZzfx4SNzh
	5k7KFZ4CkCaP9Y5Hm5XtIOW14PJxkrLpKWKOrU
X-Received: by 2002:a17:90b:2b8f:b0:311:c970:c9bc with SMTP id 98e67ed59e1d1-318c93163femr22043035a91.30.1751343918369;
        Mon, 30 Jun 2025 21:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxKlGG4WvUerf1hIySc5Q4e0hBA1I+MU4h86nJ5f+QmEoWisEZugXjnyRVoXPsHJjf2V8JJy2CrCJiYHhgCQA=
X-Received: by 2002:a17:90b:2b8f:b0:311:c970:c9bc with SMTP id
 98e67ed59e1d1-318c93163femr22042996a91.30.1751343917793; Mon, 30 Jun 2025
 21:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca> <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
In-Reply-To: <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Tue, 1 Jul 2025 06:25:05 +0200
X-Gm-Features: Ac12FXx0YPqImk2pHJoHlYsKvkQAmt3M_ggfe90dhOUWS-Ju8K63DftgHGRkUxU
Message-ID: <CAOc5a3NJCtwHd+dd1fmGunMz90XCSAyFLaDmUuLJtufL0iZJtg@mail.gmail.com>
Subject: Re: First pass at janitorial kernel cleanup scripts
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	Kernel Janitors List <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:19=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Mon, Jun 30, 2025 at 02:02:25PM -0400, Robert P. J. Day wrote:
> >
> >   As promised, I have the first small number of kernel cleanup scripts
> > that should inspire some obvious janitorial work:
> >
> >   https://crashcourse.ca/doku/doku.php?id=3Dlinux_kernel_cleanup
> >
> > There will be more scripts coming, and a lot of them will address some
> > rather obvious cleanup that relates to identifying leftover cruft that
> > was overlooked when something was removed from the kernel -- things
> > like:
> >
> >   - are there things being #defined and never referenced?
>
> Quite often people publish these deliberately.  They sort of function
> as documentation.  At one company every time they expose anything
> about the hardware interface it has to be approved by the legal dept
> so they publish every single define that they can possibly think of
> as early as possible so they don't have to go back and forth with
> legal later on.
>
> >   - are there things defined in Kconfig files that are never used,
> >     or vice versa?
>
> Lukas Bulwahn does a lot of this work already.  It will be interesting
> to see if there is anything his scripts miss.
>

The script I use is in the kernel repository at
scripts/checkkconfigsymbol.py. I have not written the script, though.

I know its shortcomings, and I would have written it differently but I
have not spent time improving anything in that script above.

Instead, when I started, I used some kind of bash filtering on the
output. Then, I also have a collected list of known false positives,
as I sent out patches and got responses from developers and
maintainers on the mailing list. And finally, I currently often only
look at the diff between two runs on linux-next.

On my short list concerning Kconfig clean-up:

There are several directories named configs in arch/. They contain
parts of config files, specific for some hardware, but these files
seem to be not reduced to the essential content of relevance, though.
Now, to make things worse, it seems that when changes to Kconfig
symbols, nobody touches those files, and nobody really maintains them
later on either. At the moment, this adds up to 55,000 LoC in the
repository, and I am pretty sure---once it is understood---what each
single file is really intended for, this can be reduced to probably
around 1,000 LoC or even less.

This may also be picked up by others if they are looking for work.

Lukas

