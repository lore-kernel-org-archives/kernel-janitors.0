Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46043382FE
	for <kernel-janitors@vger.kernel.org>; Sun, 11 Jan 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768131384; cv=none; b=srvOhAjzJ2LFHHJrf9ykVIvaKj1DDd8xevk1NlNgxyupPYR7wDHJgaUki+WcyELqKZ80/uzjyF8B53eFCxGo0z7SS1R4xw3UD4W6Ii37BgFAkkT4wi0zSyGgvWXnFGWNtc3FtfngvVCUo9bYxF4+uhG2r8qumIffTRPWZQA62ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768131384; c=relaxed/simple;
	bh=WA2+qR7GJIrlDkE/8m2agQnhKKxdGQn++j4tKhGUs6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQL7LlPm/HZZbOvnCoKmgvTX3/FzVF3n5IEuXyvmKMKDR8vXQSov0RuySTj1csGu+N5G/fUojd0z48j+k2qbiDuhkS27hI+iBxU1n21pAORckqi1tQiJU3MOTXgArURbISKpghzJpxr0nqk+ptdEhAJ+HTD0stCmFSo9aE1LqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kb/1a/1L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kb/1a/1L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so62495135e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Jan 2026 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768131381; x=1768736181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZI3ApSSp9u/jOiH3pWaGfMUo9z/yXLRfpgRERhRlFg=;
        b=Kb/1a/1LzI/qfxHuvCxYhsVr7yNpbkAfquqaGQlTnh+ZoIoD/51+M0yOcAgFuLNryR
         GAHajp4DHcwtHktMyoHPqyaVIBe8Kl6hZrVMgpgiVLMZ3LWQuOrbwuf7al80TrED9RNy
         dSX4BJ50Uf7hXJkz8uMMarjsSTt6qNdi18e7qebv8WT9uuUpxLqO6UhZ/9sbBWSdTkwm
         UCLLWrGUsb6f+oRFrKsu6brUOhLs3wndQTuIojwgtCZc+isR4RwxM1G5OqanvhGOyIzo
         yFkZDz/E1XShcvQalOodjqr91wOIT//4S+2FLC8I6OqJ8vndD85PA/60AcQMRuHV0bNu
         WwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768131381; x=1768736181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZI3ApSSp9u/jOiH3pWaGfMUo9z/yXLRfpgRERhRlFg=;
        b=Jwq5Z9L+ebHyC4L7CEDCa+odSfvDw6xTP9jP/M+8ByAgnaODJIyv8qNHIVCZVLWKip
         /1GN9Y6Ccc48OOBKsB0VhR7EkgUyOThjlfbl8wIO3ulFYynbn1hOo1oL8JJ5Lpy+YQD2
         DuqtCHzWR21qVvv1rWLnZunOXLOv0L4zYYLIXYOUK6cRGLNmnUhnRu+/MO1NJt5L7Rf1
         BgbXSlv0Mu4Tsay0kJzyvyTAnDri0LhnJLyVtS1PAKCMyqzQ7tRUjlX14gDLR0d4e2YL
         rHKTCLi8eJoiELXQMTP92i1hmYa/o+StnOtRVHJPaLEDx8dCDhUhn1fqO24HUMURLFWt
         u7Aw==
X-Gm-Message-State: AOJu0YxegR4NgOR2TL66GuwFcRUTUlPqNLwUAIh4dRgDUAoUq9Fc0VBt
	qmFUYZR0qaF0Syo2Zi5ddUyLA0IDRs9qZ/zBTGyrxlojzh175C9RN5es
X-Gm-Gg: AY/fxX6qe79SmeTkuI6Ymmwmga6zi9RtziZxUhBaC5/hoay6KDiVuouYV9hb3qJ+wLI
	LYQWge73Qp3JTKBE7h2bACiz4Aanm3RbLHVawEmba5FowSOo6Y/6uR6/uMPyrEGuQTyuy7L/3W1
	n3OadXDtMDhNbdSvPiVQxPXg9+ONK7BthmOLmRmbjYdNPSqAVNdKgYJbVNctd1dLbmXZp+vEtJ7
	YvpD7Apn1IUT5WHqNXIP9wtKurC5QT30N/ZtjspcD186zpLJJDhsz/Ge0rByPlithskhlxFRjV6
	twTVkIt54KE9D970qEmKxQl8cJ7IA7iZYyS0U1wCs2ARUk4H1Fy88SPcuIBtP26S1UfQBdu4NxT
	rW+sPwrMgjltrahC9Is1bLfKky2CRSITQzoFHBSbAo2eE5y1Nki1vV4utGUL3/98OZsMSk0FTEv
	uWQ5ertcQ=
X-Google-Smtp-Source: AGHT+IFSg1iNVQHqnhtkbEsO4YlvooAwoO0jT3KKmSnsT9EAf57O0ht0v/OFdFfQ+b23tsFmCK60EQ==
X-Received: by 2002:a05:600c:1e24:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d84b18ccfmr169969785e9.11.1768131380879;
        Sun, 11 Jan 2026 03:36:20 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0daa84sm32553508f8f.2.2026.01.11.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 03:36:20 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: macro@orcam.me.uk
Cc: kernel-janitors@vger.kernel.org,
	linmag7@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mattst88@gmail.com,
	patches@lists.linux.dev,
	richard.henderson@linaro.org
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
Date: Sun, 11 Jan 2026 14:35:05 +0300
Message-ID: <20260111113505.2146705-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Maciej W. Rozycki" <macro@orcam.me.uk>:
>  As a matter of interest, why would the presence of ^L characters cause 
> any issues?  That is just another instance of white space and it has been 

I have shell script, which allows me to remove given config (for example,
CONFIG_NET) from whole Linux source tree. To do this, this script parses
.c files, Kconfig files and makefiles. So, I want them to be as predictable
and easy-to-parse as possible.

P. S. I don't see your emails in my gmail inbox (not even in spam folder).

-- 
Askar Safin
