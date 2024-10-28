Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743451EF934
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142426; cv=none; b=GI/YiI6vXseGLEBSJD3omJ8y4H/mN2wTyt7mh7HlPQWWCR4Z7taKx1gvbFyuAUCF5ksd7IamTZD0qC6JaR1Wm+uvUMHyQF5V7AkDz/I9gjIXGKlFmW7Nysaq1TctqSUanB1/cbmuB5si3+PPvj41CiIKy/G6QWwiGD3Mn/q57No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142426; c=relaxed/simple;
	bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km8Zw0/nJDg5qemDde3r+CezLZkVWg6OH6AnrRL5NbFf2UmiQUcjMuh/9z1Km9nVRP5vmSjxd5wx37nxOOqjv5MeGXSW58k8sPAwL/Q2vMvcrIEHKVBD7OBI//nFctgDhwCGk3fVpTCyIqrVDZBD6NhXWO7CEugCYK4b0zAVmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozx9gN64; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozx9gN64"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3a97a6010so51958747b3.1
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730142423; x=1730747223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
        b=ozx9gN640695WWtDYCSZjqgLXgKNbNCkz6q+zCS1mms1zN5fkBCEbUnWxh8rENts0k
         Rz2pQRjy5b6u+vnWClovv6Ax/DnTEde3zw72CL+Fn7LtOcRJo1P4Xe0041ap3K1kK5xp
         SVdk5LWM6nXVxbTQtM/srbpsT7YeyhIkupUtyv/we7s3CepFQlTbS1Adb6T9oiurXRXh
         GEZBkzm3O9IuIqYwrDVb6iEW53L9uzrg99vFcJVRPISCVTKfghA7RS41vyuEwG6gF5yO
         t/NjXqeK3Jqdjs9UOOkceDAcGP/w41oLFtx+QxT1Vhg7lazGtzM61rkwMLzOcKuzu3K2
         49yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142423; x=1730747223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
        b=jXnJS9K39jQWrvrXo37ssL+hKSCcLi+FUGAYWWD82f3KCqgi4Tnyy9YkU/UUOYKQpX
         KgtZBRLedcJFjPy2s1a5ov0iK/KPOAe39j3rP8yt8xWDxWvRnPyrtcDv14Rw8aFzMDBp
         zXUrbsrCMiL4A3PUNr2idM9vbjH1jrlHXIHujyeqhYczIpWiOqaiDeVn3+dyzLH+MmDZ
         gXheLsIuhJ3K2OaTWtaZR1WKcgSVeHI1SMf2Wx8ejPtlOw1UBHk9LyGzCS3/8wT10M36
         MDezL0OlvfQ9nAolKacXJAirXkshdMCiCctoCUhNv0Dk5DCPkD31Ra/faFdPP56Sd0tN
         De9w==
X-Forwarded-Encrypted: i=1; AJvYcCXzvBTL8LnUFXZh6lai4tNw2cIaC8OsImgKwCdijAjzOwakOOmGRz2rB+/6WMgr8o1rtjjF0y+H7zkVprGeb+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hssPGtX0YL8KTTI/nhjwCyn4GVF/UnwLbg8v5kqnM/JPC0lL
	mXScvNeTAnJrrO7IMtc52yqPfZZZDMOX0Z8hRV7tZOCq9Z3KhfsCEZKAJh6cU8Ei4816nQN+emk
	34SFK9pq6Nl1N7oLAfeEwDBATxx8B5Gt0NVMJ0Q==
X-Google-Smtp-Source: AGHT+IHyHPH/y2spfAtTOPC7T4/oktX0c7cDb2FO73u0b8ET9iUIHaq8J4lMT8osQnwjZSJWs+VfpVu7MgFNNvKiMpE=
X-Received: by 2002:a05:690c:d81:b0:6e2:636:d9ba with SMTP id
 00721157ae682-6e9d88e827fmr76513207b3.3.1730142423400; Mon, 28 Oct 2024
 12:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028083030.26351-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20241028083030.26351-1-lukas.bulwahn@redhat.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 28 Oct 2024 20:06:52 +0100
Message-ID: <CACMJSeu32-cnn01WoLbv4ffbMt3CfF0MTqbkxZHvu+4HQio=Mw@mail.gmail.com>
Subject: Re: [PATCH] media: remove dead TI wl128x FM radio driver
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 09:30, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 78fe66360ed6 ("misc: ti-st: st_kim: remove the driver") deletes the
> ti-st driver and its corresponding config option TI_ST.
>
> With that deletion, the Texas Instruments WL128x FM Radio driver is now
> dead as well. Delete this obsolete driver.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Amen!

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
