Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23DC8BF6
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Apr 2024 01:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714439658; cv=none; b=TrVSOVrBCzVItVDOnkAtognRPDm2B9uFU1dFxM7CFnwEbgB0DNKGJ8HzKIgT6Vk9Ktn4BPZhpJUng5lKlhkzeRG8JMRVL0Q5LZXWA4rUz1IS16T6EM3gtuJZcWDIJkBVyS4THwJ9MfQCvpmm6GQc+RPO2ui+m4EpI0UkQr0BUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714439658; c=relaxed/simple;
	bh=gkH+Lg8Ueli9zhejswM9/NtmbTgAa/XwjvqOds0mJm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZZOV7Q2DDbew2otx/JP95/Lby0CM6JUo+CeW1XpxYJDW6HtyCfagoLRgg0XmjzSG8sgiTJUCO3+G0PBn8h9AK2qY/NQbjgc0hXKrzhwkpHVPySJTIMzNMGmIUYAuO1zIL+L643hKP1SUkWjhEqrk0odU8vZgq57zj11ZcDLWS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MqZmaGWH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MqZmaGWH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5724736770cso3307a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 18:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714439655; x=1715044455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkH+Lg8Ueli9zhejswM9/NtmbTgAa/XwjvqOds0mJm4=;
        b=MqZmaGWHQoBBjcfOEueY4n6HSIzeFfqu4K3yyqylv8KouoieQ0eR5+SKBOoYHt5pxD
         siWxdVlMDwkcIR1cUlF76mU5wols0t3yg6NA7R5/zTOc3PBSU6FF0jSNGC1n4/svUy9b
         v3Yx9zNsf6qqP9T/JE57rEDqU8hXsfeCs83M2FiVwdcEtNAp2mndxQtKviJG1//z0k+0
         LYe+yzsKPgDyV5lY+CDVzUk410OgSOVn+NPf+h4C+MMcnFyI/9DavaQB5p2ZGH5Q/nU3
         p1RtDOU512BHgn5BDL858HN0TcRXxG3Q9YCu5RV2WoqzsgNoi9xThBlhSEocftcFM9HI
         kvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714439655; x=1715044455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkH+Lg8Ueli9zhejswM9/NtmbTgAa/XwjvqOds0mJm4=;
        b=nRv9w75ezwT/Yj7unE2zqh3Puyv5vXe/N/O4l3u6gRvmjs2saRvKqZmGj9Ia7kIuqV
         mo3bee/TYqc0VPRlgl+HuPI7bek53cfC7fk4TqRvvkt7UHG/6qGSXBC9lD7fZkyeGemf
         s9+hadWcvi23+drbH/VvYAMlbabnRdLZevLu/J5XPKYK8aZAMnPxYg2YvM8wrvaKVHYm
         kwcei7mxBxrAPEhfZR71DdU8Pu00A0+qFDE9zOyTw39z7SaBElLMrF7usSeom5NMdka7
         guY5dt7ai8a8pd1WqEfWgDN8r3+dkDs70kRwS1d0SfqHZLKPipmxnQRfv88VnIgX721j
         fqvg==
X-Forwarded-Encrypted: i=1; AJvYcCVV6nWOvlfWO9rFnvXgFyh7A2sVl3K5qaVF/3gzdb4uvqkV+DsysLYGIhA2oW9Nn1eRnHxFmZSw0THWi76ZVFkkTKrKciQ2EoxPT+cKHMkz
X-Gm-Message-State: AOJu0YztA7J2T/1FR1gRemDl0NGUpbHAajL5jA0S9o1H2spFEOd2UcLf
	KHXX6YRyO5wuQhSjXxABak6RXwZbdPHkkH3I++X4x3gKlPQPmLW9+aNEoS0CunZ33UlLv5GVLdE
	lCShd8vqPFlmGCKF4W9l8WrAn17FdsCF1b1yY
X-Google-Smtp-Source: AGHT+IHyQmlReHcBIE7/To8XokSbs9aewY+RCRFR5RjVi4TS7xgD3iv0/LCwfJxrj6IqLT4i8VMtNsdlnx1p7ThnTNc=
X-Received: by 2002:a50:d7d7:0:b0:570:49e3:60a8 with SMTP id
 m23-20020a50d7d7000000b0057049e360a8mr58726edj.7.1714439655031; Mon, 29 Apr
 2024 18:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-2-jthies@google.com> <6e028bfa-9063-42ac-b40f-cf17a81c2af2@web.de>
 <2024042547-shimmy-guileless-c7f2@gregkh> <CAMFSARfOYWy0a_iZyuh9e8++xHdAYXcs2pT1_yJaJ60tHR17xQ@mail.gmail.com>
 <bs4r3zdc52l7zfwphiycljucjb6hqcuadq3ecgipxjgs3wj6ch@7em7rhspi7j7>
In-Reply-To: <bs4r3zdc52l7zfwphiycljucjb6hqcuadq3ecgipxjgs3wj6ch@7em7rhspi7j7>
From: Jameson Thies <jthies@google.com>
Date: Mon, 29 Apr 2024 18:14:03 -0700
Message-ID: <CAMFSARfQ6XOV9QZRu0UNd3O6d68O719YfM5bgAk0eN=n=qFD-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, linux-usb@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Benson Leung <bleung@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Great! I'll post a v3 series applying this shortly.

Thanks,
Jameson
