Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6442A9D
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Jul 2026 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296280; cv=pass; b=Pm8CUqnUefYBmwfjB5BkeI3zf2q0yEvcJl8Shfllm9FPHStRQmJ5devdYi3GlSiWKRcQ4W6aUfTx5cnKsSq+Fy+EWaXIO+EV22nj+guQ/DcnyS8o7s3p9nVUfgQlPWUtUWqEoSFS/4w6o4rUjvrW5nzWxx6sK57ahC8XGlc2Axo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296280; c=relaxed/simple;
	bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aslYvHOy+ar9DUp0VQtG82UQ9Px0DnIBEgQ6TcwXzE1EOC8l/2NC06qQ6R47a7dsgNE8w/SBhM409P+EAv2I48esIYH53OvGLSv5h6cYRhipVERg5g115fPPBbc5vqhm3YRZJRkW1N96X0hL+qW60hEnqDNOTbZFger22LQVR1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gk4kq7Qh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBVZw5Y1; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gk4kq7Qh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBVZw5Y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783296277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
	b=gk4kq7QhAiuD9jB06rYEYsf7/sj7aOI+fGN/5W9qvIP3uePPQtGfXk7ag6nIpPKg641JTH
	pQbLMbuLBtITdM+txx7zJYZKd1K5TGN2i893tgYLXCg7H8jgv13FmOMtlCXdGOR2BmZzli
	/+sgrBiXopsAnzTCscc0IzznuGT9A9k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-lrqvuip4MM2yaUmKPSoZiw-1; Sun, 05 Jul 2026 20:04:35 -0400
X-MC-Unique: lrqvuip4MM2yaUmKPSoZiw-1
X-Mimecast-MFC-AGG-ID: lrqvuip4MM2yaUmKPSoZiw_1783296275
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so216743685a.2
        for <kernel-janitors@vger.kernel.org>; Sun, 05 Jul 2026 17:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783296275; cv=none;
        d=google.com; s=arc-20260327;
        b=KWrMdxlmQJyHvsqfqTbXIPPGx0a/lIclVzCHsuSBi8d+89lbKI3fMlTwkyY00+Mnkz
         TLR6STyjB9zZNIdwsvoqFzYHVKTyBRgX3h7SuEiN3uVllOaJkg5zRIuFsj+0ZGBJXb/z
         rh94W4W8SHOhUuUTP1pZtHo/QZFvnsxNezyHLqNzrg55KJ4GkAZyj1a4Cpu4iX0t6ZqG
         rx/pae8qfxstRIJNHzwjwvepQ11FjVdkOUXj2RgDr+0cfUogrJNxSClgLUpgNBzY7KX4
         OlCwSDbJav+cQ3+huea32LkgOuTFEaPwoO8wz8glVTE4YX+x/YlESNxT+mnTbsg+Le9Z
         JIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
        fh=PpFyt0oTmlm4YTKEz1RKBGJS00br0vbBsAVIJeu20G0=;
        b=T7fxlvMP0VGE3OrS/x5st+AETTJneRKODHXFJ0svirJHTEFB5jU6hT9d34RNHQTSU8
         8sXr3d6vFRsbFKCjIn6u7xciMnQeeewlupwM0GuqxzYqHnN6jpC2TUFkD4W0bekS5bIf
         m0jlEHLyHl7qWs21Qx8oE1pEn7ibIQmVIIPgEgq6oq5EUgu9yBFjcaEinmzpqY41ZO+d
         Yl3lPjjzUzjkdbyFChwtaN9kmjJFI694da20wxdC82Jad78JfkafvTHNW6GRzxcDbCM5
         jtCS42/RiVSIdSlpi02NbliyE0Ci8go/DlB27FcvUPmmfyeHtFG/fYa/8dy+DyHafMIa
         qvmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783296275; x=1783901075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
        b=aBVZw5Y1yVpL4eUFLlW2MAJlUNaHFtNqQ7iZPRY4ZrVBp6Hmku7SiWAJ5G4erEeUdg
         r7v9jqgX/l4ZJLPfuO3Is4lneaww2sCyGKYT8A6V5dNDpxCsQgiZG9BBo+4eIXuHkLM2
         qduL58fF5z3d2pVNnegufdx5r3gtgL7j8q9D+SYRQUci3FikzArBmWoaL4FzDHxABanM
         Vt+KLr+0ACsi2UmTdCv4nDBJjNQza6vkfSJ8Ne4wO7VbV44Sgy/xCpGaa/WZjXzrJ1nv
         Mz+l1LRt9lkUqTV7qnPayluV2BJXsLo6fm3X+GFt5Bkp0Nn0aRvO+jOVIUrm+d1w7Wb5
         jCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296275; x=1783901075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
        b=gT6tCdaXzeG7vN9vt00b+PEyOMKqdqgADRtcA5aPdgCOqifoX7Uu65REq8vAvSjqqf
         44QE3NuDUZBrdCC4hpZU1A6IaT4Uzre2sFe4ZGkRyZfRLVWtI9p+HLVG1a6egGwlGRzR
         H+UcqOGDNR8gImco/2DMSrrHlADGeWCPQMNXilGhwQ6HrnUporIArHzTi/da8UHB7iaQ
         zJFBIuvSuizdPWl+Gzclg7+tMLEQpUrjKVyyE/h1fWwgbnPQNHyCK0ytbjUaVfMhUXsG
         xgT1p2pRJGhW11w7qEEgjHRacLgUiOdJo7zP96R3YDxFnMKaaYC7fO053DgFzQIFRWZB
         0Wpw==
X-Forwarded-Encrypted: i=1; AHgh+RrdCMowDx4jWpnWVn2VnQUNamXKZOeRx/wRbNOtPvw7MuDl5jVMUuvJwUrX0HP47VuTYLI77zi500efhUZ8Kgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3C2ZtargBnrN4ndVWWSUDKYIDSsVL8kikYAap9b/IINiyUP4
	NUFy7+KarOAg1ujf6Q0DPtKO+LMtfhAm2vHwrQdbTRGM9Cj+kH+bbAN5nTTkxfpisc3xdJW8pza
	vzkHbweaaQB/6b4I7+74VR5Hj9Q7kg6HqVeaJUPNzOC5puinZjP8D/nHt/f48NyQbLawQMSGZ5f
	sFv96DbFD+lkTnBt17Y6XZPZqiTmOOSi1UYSLqN7BEUkT9
X-Gm-Gg: AfdE7clUyjOhVmtp0+B7av/geEbdulJG62q95k9uvLl46q7CBL7egtO39//vNRB0xLs
	TF1jo0YoXrWolTKNzoCTQVtBR/f2/+PfBs1bpErj78cnUX+zcuBO6xWVXVKfNr7I0VuNASRmkf3
	5zzgsuS8JCzKA6cjZl2OQTniRP2J+8RTLRb9uZWbCg5h6ybqNcxEwZ
X-Received: by 2002:a05:622a:16:b0:517:580c:bcd3 with SMTP id d75a77b69052e-51c4c20cba0mr122057601cf.19.1783296274723;
        Sun, 05 Jul 2026 17:04:34 -0700 (PDT)
X-Received: by 2002:a05:622a:16:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-51c4c20cba0mr122056741cf.19.1783296273461; Sun, 05 Jul 2026
 17:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703111530.91285-2-ltao@redhat.com> <5df82d42-89cd-4e39-95a9-a0f164c0ac58@web.de>
 <2vxzqzlkf7a3.fsf@kernel.org>
In-Reply-To: <2vxzqzlkf7a3.fsf@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Mon, 6 Jul 2026 12:03:57 +1200
X-Gm-Features: AVVi8CcjKi4ma2Wic4NJ9zPTMxZKVqVzntIjTUPD2jSDdeylkQQJ6VcTIYGM5zI
Message-ID: <CAO7dBbVmLi8gWcntM9tn2g=GWgAkYQB1P7_-J1Kf8wYrd0Ucww@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Prevent NULL pointer dereference in machine_kexec_prepare
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-riscv@lists.infradead.org, 
	kexec@lists.infradead.org, linux-integrity@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratyush & Markus,

On Sat, Jul 4, 2026 at 2:59=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> On Fri, Jul 03 2026, Markus Elfring wrote:
>
> >> A NULL pointer dereference issue is noticed in riscv's machine_kexec_p=
repare(),
> >> where image->segment[i].buf might be NULL and copied unchecked.
> > =E2=80=A6
> >
> > Would it be helpful to append parentheses to a function name also in th=
e summary phrase?
> >
> > Why was such a hint not be taken into account from a previous suggestio=
n?
>
> Oh come on, this is a really really minor nitpick. The fact that
> machine_kexec_prepare is a function is fairly obvious when reading the
> patch. In fact, the first sentence of the commit message uses the
> parentheses.
>
> So yes, it would have been nice to have them in the subject. But no,
> this is not at all worth anyone's time to fix. Certainly not at all
> worth a v5.
>
> Please, let's not nitpick our contributors into giving up.
>

Thanks for the review and for pointing out the issues in my patch.

I'm still new to kernel patch submission and clearly have a lot to
learn. I appreciate all the feedback. Thanks again for your patience
and guidance.

Thanks,
Tao Liu

> --
> Regards,
> Pratyush Yadav
>

