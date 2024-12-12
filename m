Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969392147E5
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004489; cv=none; b=PAsnoYEJOIQtT3PRqkuqsG+FfAwpxDoAMPJh11e1Sy9tDpwHQmfy20W7AOxiQMhQyFS0+CzIf6RH9/QDk+aQYlmTWxYRNzosSKcig0YQncaaL99etpaCxzgB4wtsrcCXfGiFJes+PXgDlhYPNfYMuJE3an446L9pIBHxQdttZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004489; c=relaxed/simple;
	bh=1XJH+j4IJIIke0IBSeywdnhf4g+AbrpLY8ypOEZSdxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGIt8SmODA0KkCEN4eXMLO7doKWeHND6kvlJ9qenhq1cMRRnTo10FppyqYWETJFHtCdeX9NZiCGYFkksyRkhm+OREAkQxxf/psEYc1ZYNE+eY4rBHjrDrc6lfrmmxr7KIEy63Vm2Twcw7gVbKGleb4+UYHOVpreMxcS8J49HgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZNOtM1KG; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZNOtM1KG"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so364491276.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734004486; x=1734609286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QO/kWUsb4uL9LlTqLCCAldTNWq3Gj6otKLX1s/PNWac=;
        b=ZNOtM1KGpBHNIPErn/tHjPmkZsfFRyDJ7xvTzo65/X6rGUk1zqk9Th9/DMLZNCrNZ2
         LNoXXqcy/kgMgsSxE8MDRlGr2IiwQwcggjaMKeOPg5lQiNQYLtYe/uOIxAp6v7q+rlZB
         +9e3oHtghPq7OFgsofw7XH8cFUpsBv7EjmKWLIK9MAGu1E68EoalPfRrsIp2afADs0eD
         rcUtd0q2n+AtUIel0OBKmm76Bb3bZSIwURFkXIVNcbkaCK13qJvZEGPC/pdLgX73cCQf
         11PvPfwmCsqzvdu8fkE4R7lXckYgsjTBZdKMU7ONh7D3tO6vWbkaKHuJchous+uLbar5
         +VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734004486; x=1734609286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QO/kWUsb4uL9LlTqLCCAldTNWq3Gj6otKLX1s/PNWac=;
        b=rJFVgIypf8l0qP7hiOj4e1S0/FdxYSY4JeUkrHkaZkBoKVJei7AWeUeUgwDSHBoYSE
         or7I0Xh880dfNMkTVIim9VHxRMoshYp26uhZR5M58idkNMAI+vqS4Ct1kjk91U4YUdpB
         azdvtBFMmQKL3pJbMkRUn/ef+4+3qagUFtrauXBk0Dm1BKypnyrl8lxLiC+DDpaif+ba
         5sAnAtEg1fUK5qs9ih3W0QM5ffZpQiHWoVxEaj+wryl2MQAWOaAC1dG+04RggDiKtNbO
         9xFkqxp1UNFImO7Rw+RFNdJhQ8qF//5/JeTARWuwwn5QOV090xGEFlDNXZl65t3I2KxE
         QHag==
X-Forwarded-Encrypted: i=1; AJvYcCXo0I+Puig1fvAYtgEnxXSeWRyaPFRaEhOSxqvVoHrY00OWFU40YXsIu0b/YI2VBkxFqdq7w0pHFEqoDEn9MA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMRu85wAvEzry8HFY0Il2RlzYtYavpbOUb4nmgO5BgiBpXx2q
	9cWUQ4INIc4Dn5+dtwFU+YL9fBW1NaUuqeytY0LIx8KBVLAtO99KR4jWqIOXhUVbnXNnT5qYbhS
	AE3t9jz7Ck+kSlupWdKByklgV5egRpQbAwuFE9Q==
X-Gm-Gg: ASbGncvaxQ3dtSxaz2MPVuOgHFO8OyL1mpT75fKEl796eiJ6x9IVK2Gg2Pq30ud8ex+
	PDO7kSa/WDefrI4BZ6dZAN9zw1DYsPFd1hym8hQ==
X-Google-Smtp-Source: AGHT+IEZF99x3Z73R94L+ljBCygUUX+Knk3vSPh2S8Sa4SUHrFwCAM7NZhFFUD6/0ncFI/p+axz2uwCX+vrS2ZOL06w=
X-Received: by 2002:a05:6902:2701:b0:e38:87bf:8e65 with SMTP id
 3f1490d57ef6-e41b8dd9f38mr127426276.0.1734004486531; Thu, 12 Dec 2024
 03:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
In-Reply-To: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 11:54:28 +0000
Message-ID: <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>
Subject: Re: [PATCH next] drm/vc4: unlock on error in vc4_hvs_get_fifo_frame_count()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for the patch.

On Thu, 12 Dec 2024 at 11:31, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Presumably the default path is never used.  However, if it were used for
> some reason then call drm_dev_exit() before returning.

Correct - the default path would mean something badly wrong.
Without it though, if you add an extra enum value it throws a compiler
warning of an unhandled case.

> Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index b42027636c71..4f524ec126e7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
>                 break;
>         default:
>                 drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
> -               return 0;
> +               field = 0;

field is initialised to 0 anyway to handle the cases where fifo is out of range.

Personally I'd like to see a break in there to ensure we don't
accidentally end up with a fall-through situation if another case got
added at the end. I don't know how others feel.

  Dave

>         }
>
>         drm_dev_exit(idx);
> --
> 2.45.2
>
