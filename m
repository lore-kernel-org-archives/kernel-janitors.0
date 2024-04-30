Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80DA48
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Apr 2024 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714437812; cv=none; b=XCwkHYWD2fASrWTv1RMsHD+uDvJnX8jDFo8AkzCgSdyDM+Lul/rL95khSujsiwyC3fixcVmhpLLHQRj3M7e6aI2yCjeKVT2ojw0AYLFspsTjxFvwkYCFNiNB3uM75jsaANhZYmRPa/8T6DJBP55sWcHYOvw7AdSMWDQVBI6dQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714437812; c=relaxed/simple;
	bh=Nl3vIVccFoXuhiVoNsPjYFj7L+CWbBMwdwLms1/tMfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDRyVgymutGdLQI108u/hqgFH101EtDhmeKzXwfOIugk5dGyTHk4LyF7GwbUFxpN+ChqcQ2Zr16LxfzFHcDILO7gwXdZBNeBbMY0FYRrqYVMYlxxMGsHu5ULv0ZH/mvtTln+iBY22LAcCuhxtG8ZqwxpyITRvxJb0Rd6BcaBFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTtTM5sY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTtTM5sY"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5722eb4f852so3983a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714437809; x=1715042609; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl3vIVccFoXuhiVoNsPjYFj7L+CWbBMwdwLms1/tMfk=;
        b=YTtTM5sY/SaIpVZ1prp8+958RMMgCod35fuDBJMx3+5JoZ64JTbtVUMEGu0fhmoYKX
         RoC6GndTQ+myCIS/afsbUnjyhxREdwJ8fDXxdPn4vQ/rElD6cNjsGS+y8jERVfCnzf7D
         2r5VX8bi3GRXUyb8J8aJl9pNpmZ3sItw7T9t8iDM40TS26idoIXLCm/W6oSV5b8O78G0
         pk+2xDUPZSPZv1ehs7CTuVNNwoYkrjy5kxYWF28ZckBNHNTNhXJsLgFEny+vWD6M5c6Y
         LaHsKhtBYL10nGkSY+NQ3KWmb4t1zx4/h7Y8LC8H+GfcY5OizGRYK3hJF7up4/eXBUzK
         0rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714437809; x=1715042609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl3vIVccFoXuhiVoNsPjYFj7L+CWbBMwdwLms1/tMfk=;
        b=sfkNwgpf6khK2Bxat6v0OZCCGX2zwNadUMaX3jIVWdC0xdga+R4YDhuRvLCFXlWwVm
         bOFpx3xj3G1zd01ZkB+cNHQTuPTXwKKM41D+P0J2odmUyzgf5FwfEpH70hmJWgIvADYK
         SzSgg7N97LQ1jQRMPgHU6y9CG1viJzhD7H1GSCUCWDeOXcQlWLEzvirLzP3U5+dkLJ1L
         VW0ocVaRAqCTs4gE/hLnrPXI7Ttpe4u+x7d7X9Ms+uGI1XoQPyNCupjYpO1MTLtbQ70A
         CJ6TC5IH4hLyC+JvD1QDtd6lexAwHaYRIHoHFs+Zd4IaeTj23up7oOIbYWK1/0wY3ZZ8
         R20A==
X-Forwarded-Encrypted: i=1; AJvYcCUq1hATTtt9gDAz931piCco7mvEW8w9JCD9g7QfokFMTtiNl1lS8LICRnzoJOG5srXDAqAGjKaA+lraRig7CQfDT/L5Yl5OtBiwy8fHtQ2U
X-Gm-Message-State: AOJu0YydEdrvjP0XOn/3IZRGJcMu7FGTKIWmzHIw4GecvHXSb2iwfpVv
	K9pvo+wLH3k58aRBoAiFG8exc+WpdnSoZ6j7UQZngJflu+QCljwXxOyiwUAxHShvzv0JSkVNg9w
	xJ6NFfkI3+d4Py2LDBwtzu7pE6GksawvRzuzz
X-Google-Smtp-Source: AGHT+IGt9PUEdlFEraByU733LKE7yYh5IRg0/NQ/C1cyVJcW9jesZtQayq8ssQfHwZsnICq7HDA59pz98jE9Gf64snQ=
X-Received: by 2002:a50:ed0d:0:b0:572:3fb6:3d0c with SMTP id
 j13-20020a50ed0d000000b005723fb63d0cmr90047eds.4.1714437809040; Mon, 29 Apr
 2024 17:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-2-jthies@google.com> <6e028bfa-9063-42ac-b40f-cf17a81c2af2@web.de>
 <2024042547-shimmy-guileless-c7f2@gregkh>
In-Reply-To: <2024042547-shimmy-guileless-c7f2@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Mon, 29 Apr 2024 17:43:16 -0700
Message-ID: <CAMFSARfOYWy0a_iZyuh9e8++xHdAYXcs2pT1_yJaJ60tHR17xQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, linux-usb@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Benson Leung <bleung@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Hans de Goede <hdegoede@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Prashant Malani <pmalani@chromium.org>, Rajaram Regupathy <rajaram.regupathy@intel.com>, 
	Saranya Gopal <saranya.gopal@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,
what are your thoughts on Abhishek's comment? I think we should
attempt to register the alternate mode when CONFIG_TYPEC_DP_ALTMODE is
not enabled. It would give us a more accurate representation of the
partner in user space. I understand your point about ignoring a
potential EOPNOTSUPP response from the non-stub function. What if we
leave ucsi.c alone, and replace the stub function's null return with a
call to typec_port_register_altmode(). That would register DP altmode
as an unsupported mode when CONFIG_TYPEC_DP_ALTMODE is not enabled,
and fix the null pointer dereference. But, it won't change behavior
when CONFIG_TYPEC_DP_ALTMODE is enabled.

Hi Markus,
thanks for your feedback. I'll update the commit message to say "null
pointer dereference" when I upload a v3 series.

Thanks,
Jameson
