Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87403101D4
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761859316; cv=none; b=oKkGe6CqcnxZiSlyioj2g0WgXwf7c12tiVZdrGiSwWRYFOP/6zKLdJ/GOhtaz9wLBAUqS2Q0Bssgn7zY31/ipLP1WM/GXkgTtRUTs9AWTK+xpicWr0w4/hRsHZbPufOCdCIIBT0j8vJiWUZjQQCNteLt25x3LmvfISXUIGCCEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761859316; c=relaxed/simple;
	bh=41yO0rIy9bUDs+0nOWpnQwIwChMHRHfPwl3EMAqji84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXW1lT2qpEZK63hBNU1AxXgzvZZs1Ia0NS0woFGIY79Sb2BfMyEFOj82mpDLWHoVSDz1OQu4oo+r9EnLbd0B2xQsWBBos6/9iDCFiGTsxS7VKJBoM6Hy+eYKJn15rcHloaTNDqZHpq0PfJGSjYGW6jEuJf92/tWmm8gmGnenbrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3uG3RpU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3uG3RpU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47721743fd0so8460305e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761859313; x=1762464113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xUY9h0KJ8iAZKk6ldG2UouJ9y8peB0TN173ET5ZQ0=;
        b=b3uG3RpUN08X+DBJDKu7yS6odt+XdhWYZkched+r5U5cu4wl82rGTJ7zcgOe6s65SB
         CHJPYnEL9+EsdeKwyvCr6ftzvymNwxGeC38tDYaISUvLUlHTGME5QnooHbjTgAGNZSpk
         FnQ+HGz2I33/qKs9DBpm4+3hiMT9LOayyNjX0LIsyTBtf1UeoJLKoSKRhL1BwqX+o7dH
         FSpnq9PAwKqolYdWVlmkVb73TxMjddHrzPtAtBvQJ32qPoK5O1z7IMHBXnfGl9mFbOnb
         H56xW/IdIeU/dvmBrbL+pUQuHEYqVmyeJJdbvdAaeWN5yVBXUkkFVtG5Q2QRTdc0CBXg
         nOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761859313; x=1762464113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3xUY9h0KJ8iAZKk6ldG2UouJ9y8peB0TN173ET5ZQ0=;
        b=gkEl06O2pE3Xy0V6Uayhn1atO6r3nitQ3Q5a8y/9dnkk4WHqYNG/FcSfu45AS4na+e
         KbALQxCMPw9SKeAG/+RAll6Wrklf8eU6NLLdiSoy6cgSd4jP/Z+h7jzCw7cMY/aF6UNq
         GYNNzbPXM0dATaMmwNul1EILzQ+/rVm6NOBFGRWQD8VenDff0km5OiL4ivmJ62p1xdbk
         txEHt0CxBVrRl61KdVuHBCMIbWmJWnjfXGnn4FvOKiysKbrWr0osD0crv9cNZ+nOKonz
         VdG2OAAjVqfzeVz5gdxlTgDHMK9qS/2o4wz/yctQTJf8W4wDQaTJYQMnuwGsJJij0evn
         riCw==
X-Forwarded-Encrypted: i=1; AJvYcCUjrMNIzs7qcRdvV2xMmqo9uCPlZLSJ4QlZlfiUEdQ1vGlMwUUZ6nnhXQHbKlvjRJsMYsrfyw+Ln+9aCLGvYeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIl5BEWZ8vEkgfDNlXXVOj7dNxgwT/BdonUybgOw2cJ+MN1lze
	ATOwNJCbyQ/IgdMJokP5o3SKoAKVo9dEW/LkN6GuyL38l6lEb9xaoN1O
X-Gm-Gg: ASbGncuarlu0oN2Lq1IiCLLuEaZitCTMjs2SuvDKFBRoo2lEORhs8SbprhwxETKpyK5
	F1b/yeRJE1t1Xvreu3ywSSsedn4i16CzBQToEVy+orS5Vnjmc0WL8gEj/xboLlPo3MVepEHUuhO
	xOdS/Vu/KMghzN9r7Ko2a9s+EHTUI2YzAe3CBGUQq4jmJO1ynoDmV6oLYTPw/oXwwGw+qDB8hGv
	YMHjnAw5FIFaKs9yl312Kp4WizhW1Ztp+fGdhY+h11xXBgZj0U0GMC0NCnE6NFrsZz8p3iiTQ24
	Ur5t48MbdLotXyldt8e8ZERiP4o8oNFb/2v3DKr3BmoJnjyQfl+dDmvUIA54/q6EW78Xap42CcP
	3B3CK+u5ZrRqnFiLFsNpV6bp03ZXinwLkZsSTNOqAhSzmCeYqNyfahYlAYSIjl+2+TdmUPdFQko
	LyqhV9P4E94I0SdTn7PMIo/42VLV+jkAHR72us5DM1IA==
X-Google-Smtp-Source: AGHT+IHRzVaOlp+5YsC2cfS+t1uX4CV5lhiv1MUcpedd26aU/rB1wa07+4lpdiM8MS3Ql59DtlOQRw==
X-Received: by 2002:a05:600c:3d9b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-477307e2946mr11654555e9.15.1761859313090;
        Thu, 30 Oct 2025 14:21:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fcf439bsm7028125e9.10.2025.10.30.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:21:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:21:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, David Brazdil <dbrazdil@google.com>, Joey Gouly
 <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Suzuki Poulouse <suzuki.poulose@arm.com>, Will
 Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miaoqian
 Lin <linmq006@gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use pointer from memcpy() call for
 assignment in init_hyp_mode()
Message-ID: <20251030212151.352e9a8a@pumpkin>
In-Reply-To: <aQOlPy7W6xljdkJW@J2N7QTR9R3>
References: <6e962260-5069-490a-89fb-908a4342ccd9@web.de>
	<aQOlPy7W6xljdkJW@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Oct 2025 17:49:51 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Thu, Oct 30, 2025 at 06:11:03PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 30 Oct 2025 18:01:41 +0100
> > 
> > A pointer was assigned to a variable. The same pointer was used for
> > the destination parameter of a memcpy() call.
> > This function is documented in the way that the same value is returned.
> > Thus convert two separate statements into a direct variable assignment for
> > the return value from a memory copy action.
> > 
> > The source code was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  arch/arm64/kvm/arm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 870953b4a8a7..feab88c31703 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2600,8 +2600,8 @@ static int __init init_hyp_mode(void)
> >  			goto out_err;
> >  		}
> >  
> > -		page_addr = page_address(page);
> > -		memcpy(page_addr, CHOOSE_NVHE_SYM(__per_cpu_start), nvhe_percpu_size());
> > +		page_addr = memcpy(page_address(page), CHOOSE_NVHE_SYM(__per_cpu_start),
> > +				   nvhe_percpu_size());  
> 
> This change makes the code harder to read, and harder to modify. It
> saves no space.

It might save a register spill - but really isn't worth the effort.
memcpy() is really best treated as being 'void'.
Indeed most implementations would be better if it were 'void'.
Although you could define:
#define memcpy(d, s, l) ({ auto _d = d; void_memcpy(_d, s, l); _d})
so that the compiler would optimise away the save that memcpy() typically
has to do.

I even suspect that memcpy() is an old enough function that the return
value is 'what the implementation happened to leave in r0'.

	David


> 
> As Dan said [1]:
> 
> | No one will thank you for making these changes...  :(  Please don't do
> | it.
> 
> [1] https://lore.kernel.org/lkml/aQNsecHJSO2U68Fc@stanley.mountain/
> 
> Mark.
> 

