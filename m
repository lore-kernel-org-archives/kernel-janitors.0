Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D3E3B7770
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jun 2026 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670419; cv=pass; b=NL1xoLZ+ZAIBQoUHXrQQtxQwbtFazBRAlo61U0xZbYN/xgQpmFduPrSFVFc1hD0XA8MUD0xpkn7rAkC8MfJsGO60oSCPsIuyAW9uOvW8kST+ZQheIHqm2/1F7U/4mz6m/qh1SjW2x0qrav4uOHB3xoEtHxXOGy9B8nOjstVAFoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670419; c=relaxed/simple;
	bh=XudTaUobkCqpMUk/mD4J3kCOpdjuFbbcE/1FmyL6ub0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QglxdeyF5KKifOeY2HC1eGIRvUsI5JwgWe0zL5u4BlYXv2OYLi3HgFU38xcYsf3hX+LaSquR4hw1yZt29ZHKU95MQcw7CrMo0Nx2ZQekhr4ij1WTVnCV1o6wJ2hIb93AHKRj4EHkSaktIdKSP3+O/k//EpTKYYXFgS6E7O9X4D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl5c//UM; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl5c//UM"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7dd7818ac2aso25559037b3.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jun 2026 07:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670417; cv=none;
        d=google.com; s=arc-20240605;
        b=FGo97Y4ZM97n2gjvNz/ICWNLKo1EctMruIALiWOw0gFgSN7syYo3Guv+KO7f/5bV8H
         kgU564HfALIkXdAZi0CUrl8o4bOnjsWljmHZGsqHsXWQTFLn6KKkyhO29zsrQw1JnJdB
         M9doNatdRpMERdZdzWdwlFruttWInRu2tbyjfq7q3476/8KQJY67FIEKSRgVuxtm1m4U
         vu+0d9RRkdMJOuSxScN+JbEQDEY6MySyyiOLVDWBNSNga3/GM2n+gxRowQVk0AdrZX7d
         E4V8dgN+c1gAIDihUway9kUyJHYyTKO2ohCuzERYAmP8xEQ8VuLbKNfQapoU1I4zcUrn
         eoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIBuaMp5eVSsZqmc6zEU/S8/Nh91rW1LUCYzFy6pAg8=;
        fh=ibmIldD/2sCwk08BJELU1ULPrm5euiZ7Ze11Yw8HSyY=;
        b=ZKcjkB9ktLYyw/GLOYB/7ePX9Iz0LQ1bOjxbCUv+deei+hpE504zdLVlFYpU5CMTbC
         2au77sIEJSnf7S0Bb48KRfElkjocOKBMtCcXErHDo1StDn0FS9royFW61r9wnMxn/Hrc
         pm6aEyb2IQ8FurzrT1nzLOG/v4hk2CDbp8niHoU/scC9fKjKVOuAZNUlSAs7nUsL2Aok
         FdssrhCdV+kvjDamOv+BufMbGGp8QkSoEDPKEf+QscqlBu9sBrOgImwClBLe1eBNmMt5
         KIhiZE1OAcHy97+2mnrnnwaCMqbuagJ1EQaq2TcIldpxk6bw16tiDxiAAlZhFaAfSSxR
         RNPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670417; x=1781275217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIBuaMp5eVSsZqmc6zEU/S8/Nh91rW1LUCYzFy6pAg8=;
        b=Fl5c//UMzpCP5xl4NzvS5ZIUwnUMF/kLYMVm2gqZpGY772v/YGJDHdh/trRj18BuST
         +hzVD8UZreJdUn+3XoGuzrHj2DTk+D7ph73+KxhT0AasyiP6o2foh1oImJtlqQs3+KDP
         1Fq4hWTnul/PSlWacA+3XACO1dNXwpNmwJa8ErdksK3WHfNdTADaFPjADGfa5ajdMWMe
         1mrMJLUS/aEwn/wlupftsABVcMWoHoxJy6U1skvytseNMlBvgMvIe6fqj/RbY6XWM3Zt
         82SlkU3N3b9Q090/Ucy8s7GUet+K5en1gBIi920oa68EZ5ZPBRBmYzu0FAtIeDfMKh7Y
         epAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670417; x=1781275217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIBuaMp5eVSsZqmc6zEU/S8/Nh91rW1LUCYzFy6pAg8=;
        b=LNf/sE2yXfzbAn6CotLWIXTnyxUE5gcnWvdAvKMISm0WYN0+cBFw5GVyuvgMhaxQaK
         iJjX2MYOE5HH7q1ZZn4sHVTcY0upPH2+ETXi0UlTmfi5Rv6WqKWx1lq2XX66FGD6GNJS
         Wv5AssuD23PXnjxIZaEUweZKGtyu67QV+LEe/tvqEGRhZyMhE2bexgQmLpUv7JpLFOuD
         jE8wqgeY/QvEBkNrcU3nUl04OsriFUtzSeT9QxWEXGsfts1pHkjiqsogwkSKte5/Cwi4
         HE/AUhBGmzmlgb6Xl0l2z+IGtkA5PnIASqa48Zu+sOtPGBna6DK+0SIJ3mznFSl5Tbr/
         nwVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NDKTwve9iDfGJXm5YEoNVzsSFcPT/528texZ5PBixuAduHSligzz46sBot4KCFueSqSR9nPOzg1uYjbPwS24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86CqWS+sUkd3yRn35JG7qAyCFtCN80ULh1Tjs5wAH8x3aBk0G
	C4wxzvtfFOHjJtWud0tm7peAko4EzJcw0B1YcPc6Zi9sjXiGUHgPHxnJLmKZLVRheNvuFUmVWVv
	3GT2pbWxdfmdihFT5itFQJ7vyEv2L/Ps=
X-Gm-Gg: Acq92OEUVY9UjPHe15odJ/JaTad4b26u1CfcuZWVZxT3BbV8P3YdHHvfmjs36etCNyL
	GzFWFUpe8UvniS95F4xA/Lf55JQTNdZkl5mIovY09syQfiHtB5SbiOAG3D73crVbVoDXgNx5/6A
	0eZPWGNX9ljiWKOCMIsFI2FsjV+0dQ1QUe0hR7t7vl5wxwRXGPkw0LDXq2+2ImN+YFj2By5/cj7
	SIYmd07JLVQNkwTDCH2DdLOtKiXUzE3oNJBIAmRfRoLU99i7W4FrdZWx3ax0Qp2s5Ap7XhzrNRO
	Uk8jXThI3z+a1301TQ==
X-Received: by 2002:a05:690c:680b:b0:7cf:af41:50d9 with SMTP id
 00721157ae682-7ed102ebf89mr38276587b3.36.1780670416478; Fri, 05 Jun 2026
 07:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
 <20260526191946.409160c8@jic23-huawei> <aiEpmqKwFuIMRfdl@ashevche-desk.local>
 <aiEtIGOFhF8AfUCT@stanley.mountain> <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local> <aiFVuvVtaWbjfVzA@stanley.mountain>
 <aiFWg6vC2cVbONTK@stanley.mountain> <aiGRzFrSU6QUL4R2@ashevche-desk.local>
 <aiJo1kjN3_XDUdBc@stanley.mountain> <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
In-Reply-To: <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 5 Jun 2026 09:38:17 -0500
X-Gm-Features: AVVi8CcB2xdyAloYYt76tcmuErFY63mlZK_MqQnyHeOABHPlNJaoZTICrRdPL-g
Message-ID: <CAKqfh0FMsor4WnrdMcXrF4+G=m-Vu=nGq5ieDz8C=bUOvicT-g@mail.gmail.com>
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > > > >    168          ret =3D sscanf(buf, "%i %i", &back->cached_reg_ad=
dr, &val);
> > > > >                              ^^^
> > > > > Uninitialized variable.
> > > >
> > > > s/variable/data/.
> > >
> > > With what I asked in the previous reply and what you explained there
> > > (thanks, btw!) I still think your patches are not fully correct. They
> > > will require to atomically write all or nothing. If we want support
> > > partial writes we need to go with that differently (reset ppos when
> > > we got enough or more than enough data).
> >
> > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > works well in practice.  These are very small writes.
>
> Perhaps. In any case your patch will break existing partial writes, right=
?
> I'm still considering that resetting ppos is the right thing to do. Just
> need to find where the best place is to do that.
>

I'm certainly no expert on simple_write_to_buffer() but something in
me tells me that writing in the middle of a buffer is a code smell.
But you all seem much more informed in that regard so don't trust me
:)
