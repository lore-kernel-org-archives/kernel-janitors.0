Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CB3EB7F4
	for <kernel-janitors@vger.kernel.org>; Fri,  2 Oct 2026 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977719; cv=none; b=Kxx05wM0ZVIjVHd6oFr/wzJJw4lsxMq7yUWagDFScFQWPcTkxJm1H/O+u4i9EWoJeQYANG3sJmg7cLmV/Iy8L7VQq+24XUjfu3KXa2DptJK0z6UPGmlEgpvo1kaQMnaGk6Dd5fZep9po9uaa1xyiXWZP7FKJpadz5WgoHTZ+QWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977719; c=relaxed/simple;
	bh=h4tzRSfqBRqXyOAYKXIuoOevRer/dmHlMJ0X0TEMoGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VawmQzM+5Qz5S61Mpi2vt/R7anPoDaqaDC+L2MQRUyg1VFSnwvSe/za17wmxgvt8LhNfcHHKhq5OlJqofd1kCWkWlO/7PHlpl7J+LSspR+lZqDsH7RjdOCxH6xEX82TkLxuxHgs/Ybn7ongYxRfvUyfZhR08kaop0eu2L9xSUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic2E88SZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic2E88SZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0E71F0089B
	for <kernel-janitors@vger.kernel.org>; Fri,  2 Oct 2026 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977717;
	bh=ZB7mOpsPUkzF7dalAkbNpndV1E/i3MYqWvc6K2eVWyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ic2E88SZb1K+vD1bgcTslxISdxrRDt8UeAfceBjitl4wvFzTVX9ZSpKm3vhoZiU3s
	 P+r2BzZfL2ORqYimdiM3MQkbNvfeWNB+gkN1wuPgn9gHxnJPz+WTYR1vH7V7ye984o
	 5ell4C/KU2bESsqoFEKpc9Ik+jmQwrS8G+pFT5om0BVx0XFkxYGEV/KjRZ4RjIsoyl
	 qwmW3xGlOLZXmpZRhnqvNe0J1NZ313omqD0FM2xiqkKms3VxXIVIIKTAxPYSuisINA
	 GrMWLqTFSJ/L/KX+DSdECyzZRIfjYIIvpSEU+qSyWFACQDdozbq9h1fu2eTUyVtieX
	 Cs2NjOMPcDViQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba3adf78f5so344139e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Oct 2026 14:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCHsMS5PKBWp08x3FEVfY3GB3NNgeXxOXVb4A5kpaTyD17YmyknVJpt+u7Qc2KT1YnpBuBg2zMjd8xaRa5C/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/cLHNKQRxn98bgKfKVW58jbhc1jSpfsNGjHZJMm4zUp2dz1Bo
	f4naJiSWHJnkWZJ1S1Txa+OR/zboSbdtaIh7+oaWiHEtilb2PlU0WcOsv4wH2yXr2OI7G4Q5HtA
	C9D71BQYqkpCPQ6x9153HcJQfDggnd9M=
X-Received: by 2002:a05:6512:10cb:b0:5b8:e99c:cfa1 with SMTP id
 2adb3069b0e04-5bcb544447amr267076e87.31.1790977716056; Fri, 02 Oct 2026
 14:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_CvNPWBA42BAlx@stanley.mountain>
In-Reply-To: <ar_CvNPWBA42BAlx@stanley.mountain>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Oct 2026 23:48:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=FwSNH2Y8_Gz==cn360o8DiFSBCyp65bKJcRR5aO=G2w@mail.gmail.com>
X-Gm-Features: AclHuK9gOIwCfQRk6B1NpY0k_i_KdwiwJl2gDSLxnU8603oCAaR39Uu5TRPvpYY
Message-ID: <CAD++jL=FwSNH2Y8_Gz==cn360o8DiFSBCyp65bKJcRR5aO=G2w@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: ambarella: fix NULL vs IS_ERR() bug in amb_pinctrl_register()
To: Dan Carpenter <error27@gmail.com>
Cc: Long Zhao <longzhao@ambarella.com>, linux-gpio@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 4:42=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:

> The devm_kasprintf_strarray() function never returns NULL, it returns
> error pointers on error or a valid pointer on success.  Fix the error
> checking to match.
>
> Fixes: b40e9d140c24 ("pinctrl: ambarella: add CV75 pin controller")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Patch applied!

Yours,
Linus Walleij
