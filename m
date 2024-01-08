Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7BE45BE2
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jan 2024 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtfHFxws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704723348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YxB4hJGUskiSNKv+s1TrmZMXKolMvHe6Ob3/kfn7C0U=;
	b=JtfHFxwsBorPL1DuTmZoZ05J9ZJ7Wxmhk75bYECW4cT0PGBiWw8z+UbKhTgILm2XlU39Hn
	8oQSyR4YhXBITbZpLZxhP6pL4Rc0BlDZMJX74n+s2KBRSozAmjMK7+WzBg8S2AdxW82HYl
	VagwU1kbc3qVPKzSL1uN/fseQftGbl8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-4iCNfb6IPMKRUY9vyRnEag-1; Mon, 08 Jan 2024 09:15:46 -0500
X-MC-Unique: 4iCNfb6IPMKRUY9vyRnEag-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e41740b6eso16879475e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jan 2024 06:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723345; x=1705328145;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxB4hJGUskiSNKv+s1TrmZMXKolMvHe6Ob3/kfn7C0U=;
        b=ZyGG3a2j6HP1Uk9EQf2QgRJc0mGvOpNbzvOXQmQfd8nspLdpFxZnj5lyI+0H0JfTU1
         Tarpa1GXRc0gqso0f6kduuBxz+c0pcqG2CwlthfDv5fLG7tj7l1tUB09JpPFts0f8D5W
         dqR3IOJzIaIMyDLL1SteP7Wi7CSMmaWvFFQ/E+MekffByrV3CFi6dQSm3zIoJchuG15D
         OOFxNUyybx5G1jrNWKIK2/AbMzOBFH4+59XmYfFk6zTAuAPw0EzQQ5Vs1ZUFBDSphkpu
         nTulFgTCceedME+Vf+Xz8KpIdUZ9FvxgsLGi8EHOTIzo+8Lv47/ThZM1gsrIbm+CNAdG
         EsrA==
X-Gm-Message-State: AOJu0Yx2NEn1OqFNWDNjfeusXMiNxVkrDTEPaNG5HsqJQucEr2Kfe0eV
	WWkyPsWrqEzKbxAETZqERlOennirASCOuHPOL+xWldf8fIo46TNrpHsSu25r6z2E8tCBkAFoEIW
	bVclhRU5mcXz4LzXPVttwUknuPDcVrXM2QQDs
X-Received: by 2002:a1c:4b10:0:b0:40e:48b5:3349 with SMTP id y16-20020a1c4b10000000b0040e48b53349mr432188wma.25.1704723345540;
        Mon, 08 Jan 2024 06:15:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6B2nGNQDVdFDm3USpj0QhZ27T8ggPZi0nN4hlsNXsc4GJ1RmAnYI10aMq5+7l7vGing5psw==
X-Received: by 2002:a1c:4b10:0:b0:40e:48b5:3349 with SMTP id y16-20020a1c4b10000000b0040e48b53349mr432170wma.25.1704723344860;
        Mon, 08 Jan 2024 06:15:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b0040d5c58c41dsm11210711wmo.24.2024.01.08.06.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:15:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-input@vger.kernel.org, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
Date: Mon, 08 Jan 2024 15:15:43 +0100
Message-ID: <87y1czdi7k.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

Hello Lukas,

> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
>
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

