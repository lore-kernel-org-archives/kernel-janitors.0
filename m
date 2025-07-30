Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0092D8DD0
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Jul 2025 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883619; cv=none; b=WzI0NUyNlq/tHxrjBQ0EzCOAY8v1hUnYKW77ZiWCfKc71EYnUo+1axYH5eKalhgfKIGaCjQqYqBcTMovdrIMS8gCCt4Rfnnfa5TdLuduKOYHRcfh6JCV95Tiq/aZBV/leomBxxT+5kydnSaESKSOqtSOZGTI1MeXjUFcQ13pMs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883619; c=relaxed/simple;
	bh=vtgksuO6hykHnoNmq1iFn0TxRbhqfR0C34eckzuDpoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQUVpWfoiToenyHfGQobzT83l4WTMuLnaBujE2VtG76rnybbxzXioMqlsqtFBz65rckzebsMzdUs6yxQLmZIiT1Z0LdTVxrgSUNBlLF29rR8Dn8uG5pXtF02CghJcFATP8Nu9PwHESmF+CR9laT1nqSAuHJqPu61Sl/FVm0GSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=PMI/fwtv; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="PMI/fwtv"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4abd3627e7eso96893901cf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Jul 2025 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1753883617; x=1754488417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtgksuO6hykHnoNmq1iFn0TxRbhqfR0C34eckzuDpoI=;
        b=PMI/fwtvbH3i7SLxnA4ngBh6XNLnluSAZfq1D/LptTnS+7grL63Dqnt8kuyzWpg04g
         AXhA8Z+3bgJA3Dg79hpPzK/lrkui9PbHOpa/gWqtgdMo+Je/j0Oh3KbL9oETJTj7ksn/
         /tEZ6evCFVLQT0T1yop30yplcR30qok5lPRUZhf7CDgZITdOP+BN4dBzh0nINlQnkF0X
         GstOfHR5HO2J1mX1hQ2PQXd7cJEbd95O2wO6Zg5TbiQNE8Lzw2biBA2UKU4afPq7j0tb
         F7fYbetzQVex8GgMpB7oLLk2tHLK0sm6AZ6AX7yYy/zbtCsea9MMq2jRoW0mL3DAPGk9
         gNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883617; x=1754488417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtgksuO6hykHnoNmq1iFn0TxRbhqfR0C34eckzuDpoI=;
        b=lxTDq3sm1KoSWilpH4/cN6epJjMlqFxDL118ZOdP/1zbcZhZjGsfiLnB5hAgt9FDk9
         +HT5tM8j0dJsUQrcVQvSt/VTcBCzDBNjkB7/doYZocLg/v+y46xDWz/+HK3YgQhKnTaR
         gmFbzL+I0Pb+kbG3ZJ6ZIm1cMzwV9mXznPH29TVfO8Fubu3aWL4WKpuJc/EH7lng4ZFX
         djPRvC1VCAjxln0m5QND5ZeMwzYK//jnQ4YXld18pKYloYnFY5GE+7nqgQvJ3CbWNY+p
         RUvLtZc995tI3BJsQrjje8gF68qR/iOJ6wRAYW9vteP3MuYAaKxBlhZFRCa2ehsmpLLL
         QjSg==
X-Forwarded-Encrypted: i=1; AJvYcCUHMD6j7vg2jcjHmvLfwhgYJRsVTqGKdtPxoQo4fTQ6ud07A14ynRZ6qXxxFXfquwDqD1PpkwkNrSL+65FP6g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvzPWR+n0H2PvXv/C1mJI9h+/yA6FHwshIgCNDTdwJxPOkkE2
	z2V0K2XwGSFE3WtlQnNcdnKMDCpkf6muBop4SBkz3JsT6+198FbJuPk+6ZBas3qSnGpiFKJesaY
	afHUNbHsCC8ft1ydQ4aDByDwJd5IoXE5hAJoL8ogJbw==
X-Gm-Gg: ASbGncuS5KKQSbr8p9EqrlqWcgjtATmPcBI2xMBlgClnWZ5elevExFjG/8pVN3oVthE
	Ai1ISavX4qFhmgYLysicbGoA0I4Z48dOOwbFY5V9cjb0+yvxcGo1SQZKjoZiOI9E9+O5wvuVsaL
	2IYcxBCOSw8QaB5Fod62k7dqOK04QD6vfVXNcMDTwWmRvvZuVPO8ia6aXhzotORqwcYDBIQ+ix7
	k9lhdfZzfhILZc=
X-Google-Smtp-Source: AGHT+IEIQhExdDr4IKQExvv0orhOVhkECA1aSs0d6odXMaL4dWzG19C7jkn8agUo/YEkRE1/ySb6/ndtjxxgYgLkvhg=
X-Received: by 2002:a05:622a:342:b0:4ab:3a21:c08f with SMTP id
 d75a77b69052e-4aedbc826b7mr51999961cf.47.1753883616833; Wed, 30 Jul 2025
 06:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730133457.2076784-1-colin.i.king@gmail.com>
In-Reply-To: <20250730133457.2076784-1-colin.i.king@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 30 Jul 2025 14:53:25 +0100
X-Gm-Features: Ac12FXx55sEzySCoos6kjkVRDMdpbePHcxwOGpuWags5QI6mVL28NlrpkS_nyF0
Message-ID: <CAPj87rMcb-m_-ek3JqFiY19Xfwwym8mbn3V0tLog434Uc-Wc7Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/kmb: Fix dereference of pointer plane before a
 null check
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 30 Jul 2025 at 14:35, Colin Ian King <colin.i.king@gmail.com> wrote:
> Currently pointer plane is being dereferenced on the calls to
> drm_atomic_get_old_plane_state and drm_atomic_get_new_plane_state
> when assigning old_plane_state and new_plane_state, this could
> lead to a null pointer dereference. Fix this by first performing
> a null pointer check on plane, then assigning old_plane_state and
> new_plance_state and then null pointer checking these.

plane cannot be NULL, so that check should just be deleted instead.

Cheers,
Daniel
