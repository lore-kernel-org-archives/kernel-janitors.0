Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA230CB49
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Sep 2025 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114667; cv=none; b=K7DXLDbBpICVO0izgU4SwwGLtHkz2cLXHhDXb7QGWEMl7hPMTMpsB34Lh77ST/nqjQPr82BZMnuefwey4tSN0wBizGNuieSch8dk1dZ2X/ygx9pq2DucMKlQc2THn1TPbubCVHL8UjmuPIc57Z8M+4ELirpcLpVAf/odfYsLdqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114667; c=relaxed/simple;
	bh=gWZGfNC7pX5QddCjdXKm7e7z3+Ak4TjPyOiVnFbUjyQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=RiadEWd/s+1f9IijwbM5BLxIPb0xTEohAILclk11g03dzC+75zhm7fdTO4FBnF3MmTR1BkOuovy9SOaVf0I4qLTIuJ4JGPPdEKmAN7xf146o/870zcUtC0H17IYdkkrQAY8VhQhtM056cmgy4oto57M9E8eVTamPRKdGqgggvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9yKNAho; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9yKNAho"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so24996505e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Sep 2025 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758114664; x=1758719464; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u5armhQOM8jH/c09cO6Ee7h/dPMKBYiYTW1VQzfn19g=;
        b=F9yKNAhoBpOU7bScxOyh2nz4P+R5RynBv4AIbS2gFTSftdyCsTsfNob3h4C7CS/kBQ
         Ox7MflZmvprZaMSh9pN/t+9TnO6LrBys2CrbKw02GE3tnetdDfvN3fnZZRppfUkuBI8s
         7yBCDA0K5d8HApJ0pJRCxaK07kAPpher3KWAGUDRyeq1vJ8kC9UP49WAZRSkiIxGRj88
         WQr3A3I7Y+NiLo1k6cPmedvufK0rk5HkPha8YjU1K9cm9WXdzhg/h2NyM2JdtAvFdtF8
         5rR68MXdA+8uKNb8+eOHKEQ71fN35+CokyF56n60YkzoJhMnKUCm632NYbdDqihhI3Uo
         pLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758114664; x=1758719464;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5armhQOM8jH/c09cO6Ee7h/dPMKBYiYTW1VQzfn19g=;
        b=vQ1HskT0CJkzVd91+N7pNMuBl33ra7Y/ybwHjhmIH1g33EQIx8DqGvfyHoSWem/IIK
         JHmGn8R93l3Ve7oUYv3zBtM+TAswCIlI5aKka53Vjpw9/rcFWMQjFrBxH75mlugmaNij
         sgDHWYgHR4ZNdBN1W5OMlqqA74wbe+ukcyAb+hoNr4vqCDF7jGejOzIfW2UAeOxCJzzw
         rzNBF18C3R00uT+FV1SihVHKdq1YU1H+FvLhEoCMMBltC+OP2qN8i4hpnz9cMtoM4hz7
         RKds4JWW17HJUmpUJuPp9s94gxuawJNzZI9ia/oCJmVCDn8HfQdC6ahBhGNdil1vu7ER
         gyMA==
X-Forwarded-Encrypted: i=1; AJvYcCV6l8cFefXgzO9GEAnb7EOHWrZbgtrS+8BBLTL0evMvLEiy3HpinkY5KqCi/d5VeWUKYOQjnh+yq8sAbC/Syys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz68lpiica+EP4RcBX5sN7oGjH+YUwDEmO/hILYBpUr459Ks3pp
	iOp+8fF6bjy6jA7uA9ytzSFoU57ZaUUL9j1y1/wMTZ9oyogBE6t6M2/ifepwF/17
X-Gm-Gg: ASbGncuvC5up8RWDkRh7qb2kdnAi3ctB3lLjCzOy3rvBFpLngT1D0I67jy5QSEhUAMX
	/xksv9YzCq1ytBVDqP588jtt41Ou5Ghpod8FHgyxgYkvydFwG1kSrSI+AO4sLvNlQWiNpPdIpBH
	rhdPxaR4sD+IJ17zOaCvFiC+xDGlf/8PudlW0211MgvyVzm0j+fACmfqFTsWHTF5UgC6VgiSSI2
	ImpyT75cG6oeZSso9MuB7WZREAjlp6bNgc0dZkMoErtj4qwtRpbo7ZSCqVfAojskL6zqZdMcn+h
	RMFI4fqnXjyqInAGKhpAWDJXahkdKGJ4yyxvBLaMFoS5AFf+Z6JgRHa4OMKQnzkNPU2h7bNhAd3
	hwuOS+vv9m2itdlFeIEAyWxA2fxnJXpyEwf8=
X-Google-Smtp-Source: AGHT+IE2Oe9hCBiEfQpkUIK4eSUt8A/CvmlobRbAPyQJj+DI06B43ga/vzp7iPXdW0MZfGPBFYElew==
X-Received: by 2002:a05:600c:4692:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-46206f04fa0mr18436655e9.32.1758114663850;
        Wed, 17 Sep 2025 06:11:03 -0700 (PDT)
Received: from [192.168.100.3] ([105.163.156.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ec486e6193sm7647218f8f.25.2025.09.17.06.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:11:02 -0700 (PDT)
Message-ID: <64c3889e132a96853a361791c44fcea1a0aaac8c.camel@gmail.com>
Subject: [RFC] coccinelle script: scope-based resource cleanup
From: Erick Karanja <karanja99erick@gmail.com>
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 17 Sep 2025 16:10:49 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,
With the guidance of my mentor Julia Lawall, I have developed a
Coccinelle script that assists with scope-based cleanup in the Linux
kernel. The script aims to convert lock/unlock pattern to use guard
cleanup macro.
Link: https://github.com/Erickkaranja/scope_based_cleanup.git

When developing the rule some key consideration was taken to ensure the
correctness of the transformation. This involved enforcing some strict
rules and not transforming some patterns at all.
For instance though, some transformation were correct to use guard,
CLANG raises some warning and thus required a strict use of
scoped_guard in this scenario. Refer to this commit

https://gbmc.googlesource.com/linux/+/97f4b999e0c894d3e48e318aa113013203181=
5b3
=20
In cases where no transformation is applied, it is because performing
one automatically could risk introducing errors or unintentionally
changing the function=E2=80=99s intended behavior, so such instances have b=
een
deliberately left unchanged.
Examples
case 1:
In cases of inversed lock  pattern i.e where unlock happens before the
lock.

case 2:
Scoped_guard implementation uses a for loop, transforming code sections
that braces a break statement within the scoped_guard could lead to
unintended changed use of the break statement.

case 3:
In scenarios of conditional jump, if there is some function call before
the unlock, there is the danger of moving the function call to the
critical section and if the function sleeps could lead to deadlocks.

Below, Is a link to blog posts that explains in depth above cases and
provide examples of functions which are not suitable for transformation
using our script.
https://erickkaranja1.wordpress.com/2025/08/07/from-lock-unlock-to-scoped_g=
uard-conditional-jump/
https://erickkaranja1.wordpress.com/2025/07/02/from-mutex_lock-mutex_unlock=
-to-scoped_guard-part-2/
https://erickkaranja1.wordpress.com/2025/06/19/from-mutex_lock-mutex_unlock=
-to-scoped_guard/
Regards,
Erick
