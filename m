Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A375D732
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Mar 2024 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710356706; cv=none; b=R5WjKf2anCc6AwuCDnDnDr7jEuwQi6mVqcXPApguJvCqIa/hsWYrQHOpMGjD+yrj0Y9xbGG4bIsQQtxzXE+9Tf0Mzo/HU3ldpjUDQyBe4Qy9C+TBlcMMv+jzHOzbnonyhehAbJ9BIcM5b/kgN+3ie0qdYi4nLwgN9utWAqPgJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710356706; c=relaxed/simple;
	bh=JjFDLPWpxqjU2QEEdDwkP2gB3hpAsOJy37rkMIzHD88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxieFSx2FhbBgph2JE1jnpOHVDHiGzhQC8OQUZGLxkrli/yROtlc3im/I5TW45Prj0FkpfLs+EY5quArgY/OQAKE7a2203J9viS8fRGGzyM9Zs8wOHH6/9MKuubv/+AZ4BWQ4RPPaGprVys3/Nzg7+EygmyjUAOTDd2qPoS01c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SJxpdiHv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SJxpdiHv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd8dd198d0so1044635ad.3
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Mar 2024 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710356704; x=1710961504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4huMKqPxqzLf5OCIAsTKzbUWeR7Lg0yQNTBgZN7mj/M=;
        b=SJxpdiHvik7/dbI8Kno7TotkgL1dUs9r4Kwbf9voAgvl3TS/l4f+bGh0boDT+cESI7
         T9HmL690hjqmh5ohtCymKEglD+zbu3uUBIkMmqU1SKPDDZZ2HPlnHTzrxCvZvlGHTigG
         aZR+XJYTRQ2ezxEow8QTNislqP9g89lQUlI+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710356704; x=1710961504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4huMKqPxqzLf5OCIAsTKzbUWeR7Lg0yQNTBgZN7mj/M=;
        b=i2xseVnR08vxLgvC8gH/GjW5JR/86RkTRKsIeUHukZX6Ek5ZVCoY9Fe2vAOYe6bS/J
         P56oHsvwdrKhm6+ztI9Lrr0m9hIv7/TatiodLcQ8oKrejUCdvqWRKtuEKsYF//AbDLNm
         opYe7if18L53wGyjtjx0etdBPutem5NFC89k5WzIeE5VJIhhWIENS+gONNcxoyUbTaVX
         FguwYnPS+eiKUtl24Ahn/X+vGPLHv2+6T1spf6U0KqWzqYAlQgbS/doqYFx6nMcZ47jF
         EXLuk4HZ2CMgb+90WkxqogVV+vnYC3MwyIbvCnhCgqRLfrEpzbAcHTQ5eWKC98eN8JAd
         PtNA==
X-Forwarded-Encrypted: i=1; AJvYcCUgmpkR3JdZD7jVUOmLruv9Iok4tKeTQWPNGf/IXwRBmDKxshvDODo5dbrifHj8KgJkzZ8e5Pp726I+PCAbqhMuzW1RBKc3TEOTRHiQcRIN
X-Gm-Message-State: AOJu0YxXlhb8/LIX6umzxXfRQfKweeLwz79Pwx9oN5Ib4FqJnC/yMB26
	mWFc6OriQ4MzCycw+LLwdP3xBdDE4trJOiDPhsCgVQvlTFkGcFZultEZvV/20g==
X-Google-Smtp-Source: AGHT+IHO7jXGQDKaRXkUme504UD6kNd5mIw4KUxjBzwWwgkI0TfIS5EUk+wbR2Pl9l0sLSRI4YfEug==
X-Received: by 2002:a17:902:e741:b0:1dd:a120:7761 with SMTP id p1-20020a170902e74100b001dda1207761mr12028570plf.14.1710356704001;
        Wed, 13 Mar 2024 12:05:04 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u3-20020a170902e5c300b001dda32430b3sm5998581plf.89.2024.03.13.12.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 12:05:03 -0700 (PDT)
Date: Wed, 13 Mar 2024 12:05:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/exec: Add the overall result line
 accourding to TAP
Message-ID: <202403131204.FF098416C6@keescook>
References: <20240304155928.1818928-1-usama.anjum@collabora.com>
 <f877ce53-a5ee-4447-a57c-339a1e9701f4@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f877ce53-a5ee-4447-a57c-339a1e9701f4@collabora.com>

On Mon, Mar 11, 2024 at 10:10:21PM +0500, Muhammad Usama Anjum wrote:
> Soft reminder!

Ah yes! Thanks for the reminder on these. I will get them into -next
shortly.

-- 
Kees Cook
