Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE913BAC8
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713884165; cv=none; b=ZC5m8xyZOJ9onWQG+byYhuK+MiNfPXW6XpjK1QitC0EdZ850omJeBV2WVv65Lxtpl6mWRESyTRAl8T+H06t2KA5dKTeA+KBdAFGu3cqG+tMiM5wBtxNxMHaB7in4Dj4dmfrs3MEQ16RlQim+E2UH6cwda1WTG/lwzgdMgIBZJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713884165; c=relaxed/simple;
	bh=zb89nfLrW3+wAcpukVR4Q7BqXQCPFLkFUFrPmhqKtu8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=exWsDJ29F9iqKBmv+f+RZ8o5JnlHajCAyzun2YrFIcGN4d32DxWoEpATvbeq7zN/oeV/37UymAfMyrXTbunErYqbdBV9alHhTcxcdPWqACc/83oA9FLM0LKapbMFgR2gN6MPecDS+VJ+6BBj85Nzkbi13V82F0xqkeWVBed/yKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waP6Xy+M; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waP6Xy+M"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6ed2f4e685bso5436509b3a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713884163; x=1714488963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QL1KGuBF3PiImvOWnmAJwJ7TVqcvvvJM7lUaOvdwil4=;
        b=waP6Xy+M8P8WLgHTdwUDaGx+EbTdSV+wYBhQc7Cr+H5OdljkNJf+bNVI76pVXHcqcV
         3svmuMy3K4sy6iTgUHrUFw3D31i3PprJN8g6Pcs6YE2w6ZRo0gc8ogd8FgTli8Py3GOZ
         jSHh3bxxA5X39RZyrxqvgk0Q/o3fiLKOf8bUB0hBJUqsMj413Z/4Qb1kD5aMQIrnByLD
         ssihZ5H1SKM8XDO8MpmyFoNR8Gyox9xyUU+OwnIemO5RCmKO6a41YDMUWOCp0JI6mvei
         23Dq+JeJKUzvGLzCDytQgEsSw5u/4v2Ox7IRYzC30FCWqnYUEns8Xksnlcx+NuhM0SJo
         ty6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884163; x=1714488963;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QL1KGuBF3PiImvOWnmAJwJ7TVqcvvvJM7lUaOvdwil4=;
        b=MGhCQ81hN0F9sebN6GmuHRC2LuMJ2zcGL9EkkYjia5676p2qXsGzVkf358hH906QZw
         UGpeAptG/4Y/hc0acRXgdICliO6v32qh/wJ2rCScCuH+DMFofS9wQWZkDozur7wPusPX
         uXVjb/xjTV12D24PABV3Cz4Y8eibGPW9h4i+JEYKQOgJMMp/3OLsg35sTFV8I8yL2XcC
         GihQ13V89dP9dVj5/99zCf4DjHi+2TCu8zhYJ+Q4ZMPr47ktGu1U3gVdN292RB0fKfWP
         jr6q/Hz2BUBXRK0/GM/72ST9Oii6xv2CEIHCrxfrtcyuw38ZcZ8JzP37LGCP/L6/CIYJ
         4g7w==
X-Forwarded-Encrypted: i=1; AJvYcCWzn+QOodphGEwwbw259lrUBWpw1CYYKOadgQNNgggqNpmbp2JxR/vu3ghJjlfgOC5/ExzEGaGdBzmP/sAXeVHNMUnOb6GuzcQHb14ish3x
X-Gm-Message-State: AOJu0YyXhemCiWohkudmgHID4vj3NTvk81lyJHcjJGil+aCIKzCXvsBv
	L4VtcMhQw90k6qmBb7g68vVSxFk3qlD+25WQKKP4H02IaiNqr2YcsU/9fMzNQhM0BMOKJGwdWIH
	uAQ==
X-Google-Smtp-Source: AGHT+IEofZ+0phYC5RHnU3tk4kyICMGRgIj0E0NU+50sKVZM05N3Vtemrp3mHgtpb6tSAfXkGXRAJET7QAU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8713:b0:6ec:f3e8:46a8 with SMTP id
 hj19-20020a056a00871300b006ecf3e846a8mr21432pfb.1.1713884162882; Tue, 23 Apr
 2024 07:56:02 -0700 (PDT)
Date: Tue, 23 Apr 2024 07:56:01 -0700
In-Reply-To: <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240423073952.2001989-1-chentao@kylinos.cn> <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
Message-ID: <ZifMAWn32tZBQHs0@google.com>
Subject: Re: [PATCH] KVM: selftests: Add 'malloc' failure check in test_vmx_nested_state
From: Sean Christopherson <seanjc@google.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kunwu Chan <chentao@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Thomas Huth <thuth@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+others

On Tue, Apr 23, 2024, Markus Elfring wrote:
> =E2=80=A6
> > This patch will add the malloc failure checking
> =E2=80=A6
>=20
> * Please use a corresponding imperative wording for the change descriptio=
n.
>=20
> * Would you like to add the tag =E2=80=9CFixes=E2=80=9D accordingly?

Nah, don't bother with Fixes.  OOM will cause the test to fail regardless, =
the
fact that it gets an assert instead a NULL pointer deref is nice to have, b=
ut by
no means does it fix a bug.

> > +++ b/tools/testing/selftests/kvm/x86_64/vmx_set_nested_state_test.c
> > @@ -91,6 +91,7 @@ void test_vmx_nested_state(struct kvm_vcpu *vcpu)
> >  	const int state_sz =3D sizeof(struct kvm_nested_state) + getpagesize(=
);
> >  	struct kvm_nested_state *state =3D
> >  		(struct kvm_nested_state *)malloc(state_sz);
> > +	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
> =E2=80=A6
>=20
> Can =E2=80=9Cerrno=E2=80=9D be relevant for the error message constructio=
n?

Probably not, but there's also no reason to assume ENOMEM.  TEST_ASSERT() s=
pits
out the actual errno, and we can just say something like "malloc() failed f=
or
blah blah blah". =20

But rather than keeping playing whack-a-mole, what if we add macros to perf=
orm
allocations and assert on the result?  I have zero interest in chasing down=
 all
of the "unsafe" allocations, and odds are very good that we'll collectively=
 fail
to enforce checking on new code.

E.g. something like (obviously won't compile, just for demonstration purpos=
es)

#define kvm_malloc(x)
({
	void *__ret;

	__ret  =3D malloc(x);
	TEST_ASSERT(__ret, "Failed malloc(" #x ")\n");
	__ret;
})

#define kvm_calloc(x, y)
({
	void *__ret;

	__ret  =3D calloc(x, y);
	TEST_ASSERT(__ret, "Failed calloc(" #x ", " #y ")\n");
	__ret;
})
