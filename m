Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1B18B491
	for <kernel-janitors@vger.kernel.org>; Sun,  3 Nov 2024 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730674395; cv=none; b=k4Ouunc/VtttiOdFnnKEH0qrkskqgGVSwQtjDn9KHkwmWEVT7E31cVvjUt5KkTx/1qPfljJME+bPnmmIWoY4F8sXO6+sU2jYRWm4VSsGidmBf18XxUTOCEzNI3ay/+zcErnyHNxbSGFX/4MtHYBz/O6KFpl2XUg4JWhnoV1q+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730674395; c=relaxed/simple;
	bh=h0N9JSxmh1chs4NvO7r3yn1fpf7R04K7m4MXQCWx5Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1TEp2AhIsbHG1aSb3c4fgaWbXKdFuaSxHLlfgh9bogQl4h+74Gu0kfQiac1xtLC4aLDSuD9WlwVPoJDT2+lkZmcq7Xi+I+NoJXycDQoUsQvFGU579YX9vJPIT6S4EEBJPaKxT/R9/3a35kos2uYUKqF/5bE21WBj2w9niTCg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netflix.com; spf=pass smtp.mailfrom=netflix.com; dkim=pass (1024-bit key) header.d=netflix.com header.i=@netflix.com header.b=nmMNBHbG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netflix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netflix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netflix.com header.i=@netflix.com header.b="nmMNBHbG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99ebb390a5so851871966b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Nov 2024 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netflix.com; s=google; t=1730674391; x=1731279191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/o07MZV6TjINQ+zDnpBISVrIcwIjg5m7Y/v0tWWBlU=;
        b=nmMNBHbG7YxxK/QqGj6a+dPbafeTNMqt3paykLErXBrPx1TwmU6amIGCa63jzEqHrG
         aMk4TEOfUY9zlDPtBvkHyBv3b6wk6Xt1JqLEQFvwY6AR7IrC9B8i3G2HaEhaTvxVLFCA
         SvJ7GUOwoUJokGB1gAaSuP2L3wLl2F49RNsgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730674391; x=1731279191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/o07MZV6TjINQ+zDnpBISVrIcwIjg5m7Y/v0tWWBlU=;
        b=gLpgMGSuqndpIFMle1co14c7p7rsDQoqSuCqFAMxsLjxMymzuXG/ZWiD0KS/iNpe3m
         rnElfNUkQDqiwmgQEud+kUHYHJkPi4oAIt+nutrXJOVemj/y9rfyCdBvSSCvQFmKt7un
         uJucBgywtAsf/oZI1wSDKxFINe1wwhLKKRx8G1OkJCCRUJMSsjDqdEgJgo1UOGp3UObz
         iXHY1XcMfsbOxezqXjVU8EaD709IugO6YjJXe3azoosl0r4Cxbj++YGEbGSnhGhcf96T
         gdJqN63qpw4SOxHY8O18fAkRX2FLB5k11zaZnZt4/4aMLd8BD0B62AUd02qPG5+f6Psw
         h15Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSYgJwwyWaXCNkkkhVNe4BLNux7qoKB44+z5Rlu9W7tBg0QlnzTDfISu9PLxB1NJwN7FjF4LQ5MzJ9bDCWdo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKFHFMdEe0isMvY0CVaIkd8W4zeNSc/g+HWtVjBnJ0LyqfgAF
	/ilBIMVjgfgi1emHprp5k6kQMFHTflfnDz8Mc3jbH+AUzDBPMkizEXbmeBxE85/gC56bCsNiSpb
	yfF2ADJMovG520E8PoWIlvYyJq4V6iRS80ar77Q==
X-Google-Smtp-Source: AGHT+IFy4o46TYKoQTbVYKAMB2on6bfie/1kLl5cIFqDUnN/9UDRY5lszF0hFgsjo2kqN5eCFId2gUMEqsXUF4IgBZM=
X-Received: by 2002:a17:907:3e9f:b0:a9d:e1db:de8b with SMTP id
 a640c23a62f3a-a9e55a80e56mr1303129166b.16.1730674391087; Sun, 03 Nov 2024
 14:53:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <18f60cb9-f0f7-484c-8828-77bd5e6aac59@stanley.mountain>
In-Reply-To: <18f60cb9-f0f7-484c-8828-77bd5e6aac59@stanley.mountain>
From: Tycho Andersen <tandersen@netflix.com>
Date: Sun, 3 Nov 2024 15:52:59 -0700
Message-ID: <CABp92JB9GGbxWO0Q0QhkiQyZoYoAGmz7agaEp8VyH4ciXoELDw@mail.gmail.com>
Subject: Re: [PATCH next] exec: Fix a NULL vs IS_ERR() test in bprm_add_fixup_comm()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 3:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The strndup_user() function doesn't return NULL, it returns error
> pointers.  Fix the check to match.
>
> Fixes: 7bdc6fc85c9a ("exec: fix up /proc/pid/comm in the execveat(AT_EMPT=
Y_PATH) case")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Oof, thanks.

Reviewed-by: Tycho Andersen <tandersen@netflix.com>
