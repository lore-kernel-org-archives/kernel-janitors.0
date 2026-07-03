Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A90E3955F7
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Jul 2026 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077115; cv=pass; b=AwbDM7V3F8Ad04o8OyV4XuqQFIXNmkqTTZb79HQSY3TPO/crAdRDsmzyuBAZU8up6qEf5uUiKp0L19ZJ902Cq03NWwGDL4FobhZvJAjdvT915LPlYG4eiBCV0QcovZG1umSvP1ni2cS5oxtkAFb3I+JWCeAubWTkTIKIX2+c2jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077115; c=relaxed/simple;
	bh=JCgy0GaVc3z11BFwL0X3R12vVkyNJAAxfQevHyr9czY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlCZrRtHFn4LuWRWvGYO9V41na4W1DnmdRfg2e/58aoyRjKXiKNseDkUq3TDhN3XWPMxURwNLFANGLgOdjmfMBtU7dyox0cu2yG8yAnBd6KwROJkAb35URzDx4glE13JKI/7RCCJ0GOqxDbzb6duwBux6rZl7NMn8Fus/+DlK8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCXkxgpJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=luM+g1vl; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCXkxgpJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="luM+g1vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783077112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
	b=WCXkxgpJmt6DZIAM8CgzWvmtHblTDasHcV3776dJxBk6mnOG7yUGOBTCFq9+/B5W5JXt6+
	pHl0eQPq8DBDW8f0cslEbQ8qJwtJ8CpBCHrwfF2bqPGwc9ayEV5dae5KmlfLDATDCtDbGR
	HHZ+gsjPyGf9MMTo8uz55Ll5/7A7+mA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-5bgC5_76PEGVFaJMGFPITg-1; Fri, 03 Jul 2026 07:11:51 -0400
X-MC-Unique: 5bgC5_76PEGVFaJMGFPITg-1
X-Mimecast-MFC-AGG-ID: 5bgC5_76PEGVFaJMGFPITg_1783077111
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso5361471cf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jul 2026 04:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783077111; cv=none;
        d=google.com; s=arc-20260327;
        b=b/H4ogiGwnkRMZ6zPOzWX6AlKl+UYyrzZUjzRKdpvTeVyzCv/zqgMwstBkKSFb/e0k
         W0ugKJEdv6toOxqlWtueuNNu1pXneV/+DFy2p56dKyA5OP5RcOfAv1AJtc8iWEi86T7L
         O72TO2kcI5O0j/l4sFmfICl+80enuaEfSsFtYnnrcSXEz3ckj7TFevci/xxkUie3s5UL
         P3kqBc1XdHf5UVVJg01B2w0Zr0S46Tet0tJ9LZFN2fK5OTm+/2ZG2TOMJuanTh6cZyin
         wc3Y+5SMp+KRqb7UoLb6tkUzxWEKxxw/ATE6kRe79flPJ7CdDs1kA9t0FqAm2+tgF+g1
         Kbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
        fh=AdY+Mu2oa25T9Wg9bd/9s5yQCcMvNfuuOgWi+7Txg68=;
        b=czfuJLMTrkjGwT1BrIfgKBLtr9EB07r78H2FG97IbRudRcUwpBu7xNc8PA6Z8QVBXK
         HJvtUgAPwYm/vSt2AxhPBUEKWZcfkremCB5b62iS0cZ74MpOdN9iQqdMIAQFQqbHV8Ks
         q+ly4iuKQoUz/pkhfTo7j0YPIuS0RNXTClZE4TycCxyIXfbGrfyH6td74MRUBCw1bLgM
         O+tEY02G1MieNoGzCf9dj3YkEo2uYftAoCqbybnsGYd2zkSDGW6GZgZYEU4sX0tYPcc4
         yCucf9p6a8l8gYqxAh8Ht+W/9mhp22rNNJlU+ycVgzXl1kF7fHWVLMQfx7VjzxG7KKic
         koYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783077111; x=1783681911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
        b=luM+g1vls/Jv/+hOhENOxvBeW98XrI8loXpDi8FeO/CHxIgnUVpchuZRrT5T4xeCvt
         NS935rb4d5s2qcAZsZbCYZgFuPD+nFcpCPlKtBB42O8Fwopty2McfJMuEQo8Pp89ksMR
         +tofZLY3h/CLX/PresyITM9iNA4hu5FAsxZc3ZC/cSY/X/s5amZ78jOWthXzo2CY6Jqg
         Gmr9Y8ttEdvpVrs5DadUFGvwMqw5L9qlGRb77NrmA5PJZZx+7OijkRyHGtKjFcts3bTu
         c8qWz7xYfF1DeGjZwK7jE9qldCfg+Zv6rLZYnVlTgjsga91Pwrn8XdPrMcSqfR85CzJN
         XW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077111; x=1783681911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
        b=mDdVzd6ZDq0dWvuHBKV/mAjfFe1U8HK4ZrT90xmwRUGW43ySNWO/qH6y9+WHGGFuDA
         utr2rlBralPN2AxcGUvU5h7BEKqlD3wvKoh79Mx8bY0Nq/CXjwGFhMivwo+zCxr48/qC
         3Ouzxvyitn7NgSXbxmcaz98ULJy2tOsH0EidAkfe0vP3UebykRVjQl/MQa7p0h5tk9v9
         9n4+NR3VpOzuSL0JqS1iQe6gAKCauQFazbgojPrjYRve8G88ls25ZoUItojcSVdBqe4M
         eAThK6utKIIewzbO5IxJN9jVg2Sd0j68qWK2pW85mTQFdmqZIP4j8IEijmQ5gNnukGQv
         QvbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+73FtgNe5dVHWYAeTuriq4MWSxZ39YNGEHg3njfW3+fOCS9gPl7J+LTFgp+TyYTkb+Be39FIardbEmWIo1IDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2ay1sDPn+2Y3LPmWsMlhRqcn2w+qQ5y0wEqF33M3vkT/SucB
	rI9wmEYoVG8oLEAdlFIdKptlXz8qTgq8WUrJX3v5rZUWbThmbTmXqDrsl4C4BmCVPSIChEmdWA1
	5+U7s8nz2mrIYdLmtquXuV7xh3sgxuAuy1nkGLNtapf+dM2W6ui/c73jWXPImpSdFrDmnKc6ohu
	w3vmWRhYLFWSNljdcq+UdDKzYbQ8x3q+WOoHo3yywwfvkv
X-Gm-Gg: AfdE7cnXEjmWBbjRCQ5PdgL+Vb+5E917n4ymvyEW1OzSYdc+2SeU3rGpbuGmz3TvRip
	Gr+bX1FIba8yoeCksoETn9ZC1UqsVkZY9DE7fM16+pqxdru9akHkeNLe27z/5ZNQX/QHlMCflyD
	F4W3C2CPdGE0bdc299tk7f2FY0yibCUgBBhhk5/GboBQ/yDWXRlju4S//Qv/e/3Bqh+g==
X-Received: by 2002:ac8:7d53:0:b0:519:e91a:f4bb with SMTP id d75a77b69052e-51c26a8f88cmr125087391cf.31.1783077110665;
        Fri, 03 Jul 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:ac8:7d53:0:b0:519:e91a:f4bb with SMTP id
 d75a77b69052e-51c26a8f88cmr125086941cf.31.1783077110290; Fri, 03 Jul 2026
 04:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <4b21e0d5-07d1-438b-a6ea-a2be596a3044@web.de>
In-Reply-To: <4b21e0d5-07d1-438b-a6ea-a2be596a3044@web.de>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 3 Jul 2026 23:11:11 +1200
X-Gm-Features: AVVi8Ce5GouoiHvVypy54hHJATfssSZf7IVivve4m9vb8B4fIq_nNJ7KXKAOoB8
Message-ID: <CAO7dBbW_vxnRiq9QrZK0+nuNUkzOG8qrqYhKqzrz3FdRcayVOw@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, kexec@lists.infradead.org, 
	linux-integrity@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Baoquan He <bhe@redhat.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Wed, Jul 1, 2026 at 6:01=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> =E2=80=A6
> > Fix this by simply adding a check before copy.
>
>                                            a data copy attempt?
>
>
>
> > Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
>
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc1#n34
>
>
> Would a summary phrase like =E2=80=9CPrevent null pointer dereference in =
machine_kexec_prepare()=E2=80=9D
> be nicer?

Agreed, I will improve it in v4. Thanks again for your guidance!

Thanks,
Tao Liu

>
> Regards,
> Markus
>

