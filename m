Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B2302CC2
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Aug 2025 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141982; cv=none; b=KXPlubBZN/6flG94OA2E1h4ti0tNNXKrsDiClNYBJUggyg1oUFADCtBxJMPnu+YrVrGy2TBf3u7GXowSeWprw2RcLBOZsepaOsl3PE/Td4Y4EJpeoUme/QNEgWzep5LdTgTeCbidaCOLEaVreiSmxA9fOeKiUAVmokmjl1yFRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141982; c=relaxed/simple;
	bh=hanUCkPuMxovxHm2S6pFpv9hGnC1yWqateRLvQpTuKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=I6gEaQ1zFI5WVF7oEoKn22M1/25X0GN+pjomD5iZrQYeDeWhAV52yyJJAPebK9yus1hooQC2ZXgRYhXRMrbkbZyFoG6Il8KWtKWs57droJcBvobS5WUc67VCgmu5hf1985eGSJmGo+DjZt2IIGYTF4scsUrVjeQLvGn3tPtYs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=CuEm3kAe; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="CuEm3kAe"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7704799d798so1365994b3a.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1756141980; x=1756746780; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JIy/ikd0BLnHtzJtlevyIk9/jwbmefHUhOitr8lfoE=;
        b=CuEm3kAeom/Zc0mPKPE5sPi4WEYbclhvnbZvHDH+zm2b2sJM+x2BrD4lE6MLhWqY8b
         H1m9poQ2b922Mhu9LxZS1IoG56V/sS6vRQzRh88CysKeBuxI9s6acTqHMPZNKeoiqudJ
         1wc7Q9NYtusFP0mjZ2yHkIwQZ8Nwmn4LMU9QLGzHPaSwubTmfSjqoMOfESJtZh4pv+kN
         O5cwE273GY4NTUHLAi0ykEQF5LQP9CUC/l45dXQTlSVtu84vTCO/2XRfuQvcaA+pQJDT
         RXeZZsi7oc/aJgZw8nIzQ6HuCCexiEqhFOaqJygx3Qi/V4c+DlIeDLdwRhcG5UTjQN7+
         +MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141980; x=1756746780;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5JIy/ikd0BLnHtzJtlevyIk9/jwbmefHUhOitr8lfoE=;
        b=oas6euqME3cd6dMuenPYhKhJrdp+eTbi73Km0WObNAVBC1XDFVu1yiqjlpYMPVnNjh
         FEXtCxdf5UNnj6bhUTPaH2vYrPw9kqoakI53VXeyXIn9dGi46yagWv3aJLT2xrQRHdgT
         OOU1srrqkjZs4YkgI7sdcVOVfMcJ7c5W1HHtC/b8xQrv4VZ5OxnCiXM2zNqmxn0j5EVE
         8j8ahvLGbXkwnKI066GTeBg9w/OBEz3s+mEBQMsl68u/oSheBHjL1xjCFGVX3D2V+duz
         4qC9CPwZ+ghorBxTMGb/MLaYzteoN3xjbyNnGyg5Lb9bRr1BB7Ybt6r+sMjPVG1/R3nK
         EdGA==
X-Forwarded-Encrypted: i=1; AJvYcCVHoNm/Js+Mt00d8FHHp4Fns4UPAPibkoA/3z1fEF7Od2VsFebVP8X9srw686heJDG7hX7Q6Yj1wJx4GzNmeMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0dwne7BU89qGXrnVIlMamczgUT6+5fc63hj1sAMbJiFxcpDn
	NjXtrtbACoBo67t+qm4Zvly1jggh4zhJ8CKQFXiOKc7FAZ51PfMQ1pPodHw1U3Hdqoc=
X-Gm-Gg: ASbGncu6mX9rhuop4+cyJGZlV+ZOWI2UirreFaET8WfrKQhhJRkueKVQwR/mXKpOxWp
	kk2geHJrMZAnVQGQF9iX8w0le/x9Xj/Osw30NGKYtNFQi6luBZZ6zMEIm8cnw9B7zmI0C3RjR3w
	TC3g/vusM1dCCQbYrhjkFAyGSdD7TinR04cnkORrCzPnMPLXVJrRUi2oMwIzeiFxZSNI8tUXUcH
	BgRafalU61mNLwYA/iCUp0jhWlCz49iGS7L+hCPmZvT7p51PquQdhwI6TPy1otDnRCnrLOJRYQS
	YYxpn143GpZEtJrm7di78zsxLi77y4XwXdTfXd2WMTFSEQRDcD0mf1d6aBiafeTtTRu5icXQP+s
	E5OFmUQMcN+A/YIekrnU=
X-Google-Smtp-Source: AGHT+IGeInbCP5zEJV/VOWe6y9YTaEHSH8v+IWrNO4j77bL4LJuoltCMmSx3sMyg2xrRhCTkabtopA==
X-Received: by 2002:a05:6a20:a110:b0:240:763:797e with SMTP id adf61e73a8af0-24340b8a6a0mr18926571637.25.1756141980050;
        Mon, 25 Aug 2025 10:13:00 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f3c94c05sm5317223a91.3.2025.08.25.10.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 10:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 11:12:57 -0600
Message-Id: <DCBODJ411OLN.1IGN033564525@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Douglas Anderson"
 <dianders@chromium.org>, "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
 <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
 <aKv5tkJghj6DZQIB@stanley.mountain>
In-Reply-To: <aKv5tkJghj6DZQIB@stanley.mountain>

On Sun Aug 24, 2025 at 11:50 PM MDT, Dan Carpenter wrote:
> On Sun, Aug 24, 2025 at 12:54:41PM -0600, Brigham Campbell wrote:
>> Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
>> kind of logic error in the future. Please let me know if you have other
>> suggestions.
>
> Heh.  This is just static checker stuff.  https://github.com/error27/smat=
ch
> Humans are expected to have mechanical attention to detail at the
> same level as a computer.  I just try to write the commit message out to
> prove that I've looked at the code as well.

Good to know! I'll consider integrating smatch and other static checking
into my preflight checks.

By the way, I'm interested in contributing more to drm as a hobbyist.
I've been working on todo items in drm documentation and I plan to
continue doing that. If there's anything you'd like help with or you
know of any work to be done which I may not find in the todo list,
please let me know. I can be contacted here on the public mailing lists,
via direct email, or via #dri-devel on OFTC (my nick is xeyler).

Cheers,
Brigham
