Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D32D594A
	for <kernel-janitors@vger.kernel.org>; Thu,  1 Jan 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767283085; cv=none; b=pTFx4MPxsynYZ23b8bBMKB8RSzrqtK6RfIQGtvau9AFNmEOpMK3TVP26NyQq2iegciR891pCAH2M9QCVkkAG752fsgXVrE2AUSZOj3VRgsvUoY0Nh32Jzjqh/2SAcp4ScEQl3TGVxgPHUqW2Yt5x+WsVRt9/cEdf43fnVLBszKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767283085; c=relaxed/simple;
	bh=Th3fJ1MQIwKOtdSeQbGdqWL9zs8Sbkw2DIL9tRp36As=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CMFokx5jYgnZg2klEtJiSbM3rhPAqzIY3abLD+Tiuy2EqcxpQlbA/5QhJ+6adS2CVRNFvqMDbYOrK2JB3WZA7kmhU2Xc/2QcJ7CiIQTehq9lA+4K6RSUWGfq4L2IDjFqL7QUWwflbc4SoL8HE/pwDAOxLE4k12r+smVROOZRQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=BTglT2sy; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="BTglT2sy"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c6cc366884so5535870a34.1
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jan 2026 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767283082; x=1767887882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWxZMPDfz6VibqcQ4C4tU4AllLssToyo/WIL80GfDDo=;
        b=BTglT2syHlu6wQD6rA0vMgMj98sd6jvZNpgSQZAUydl7KlTA5FCS2yp6T+ViX5qkEv
         a45g3bMfYeZLalCoOgAxlOtvstfjNJ3Y4wFOJIB9LIJpCQXytTtAAWQwigkWOT72t6bt
         f+Aqy4R40O+POiuiU9St0MbGaDwlbkBtm7hfPIGsAmo50F0x1ZFYo4VgCvYbdZpFoYAD
         tYhkV1EKc9arbam+vEFDlcCMFa5kJuMENHz/UlME450Ar74IRVR7veI3JbbPm5jZ1/fs
         DjaXqsBTMZVzbbmlyRK1/d8qydALTZMZ7Yu+mXSaALZfaSQb86hQRd+NEdK80sml93cg
         nfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767283082; x=1767887882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWxZMPDfz6VibqcQ4C4tU4AllLssToyo/WIL80GfDDo=;
        b=byM0Sc7lRJs722Cf3EiYN885XcCBhF+HSrDEJU9BmqgaaoaYqAeCvJu9m0ZVt2uYo6
         0d7AZtr+DuPdlqGK6HXCgh3rtTUghmNiUzryIyg27E1tti5fbdFXnVu9Vw1jpxAXNvWw
         bVcWjD2q0HG4JMBmbL5p9DTJ5x5mH5/A1KjfaeamMU5KgqKLQlCHzZ+ZmXA4IrXkIhFh
         JFcNAkQaXyXD43fDVDRU55gWjuVYwhvWnFMuGfQkV8cVza/MoZvRm6YS8fzFihAi0U7S
         98tpA2O6TmlGE5QuPpC8YfF/ZUVkj6an8xf2AtstiPHKPP+BzWReJSZbZzN547bX84rN
         Ly+A==
X-Gm-Message-State: AOJu0YxVpeP3nsP+7kBAqmfXClJ0z/jJXWiMxnoQgkSYz/8Ag9xe1QaA
	Rv8BTZoxOIV44oXLajjOigvqplBF9u8cKqlLjq4AbTQwGfvZdNGiCIn9cVnxCctmYqI=
X-Gm-Gg: AY/fxX5fjvBnizzmJewDVr/xFuYs7MfETli49Uq72/xCUV3TT5IK0h0xnreXMrM1svz
	L5CfQBFyu1DgwxiV1zg7joW0bf9XN85bMNQFFpQ6RhL91LqtnrZrRuhp2W+KTmSbrrJy83yGuJF
	91I/E/Mdtj2xndg+3IC9QsnQGfbBaqKFt5ZHi9n/3cl3rk8M4XSUn4LiDDK/SeilUFaaEvN7HEm
	JUwySbdeJmKeUKbE7de2eNPdRLkoG9h4hFghSCcTj313eJGhvby0/VtpeuYGcNGyKPva5h4R6m+
	bz8pTeLIj4q1nK8/ccGa1PreQQardOuHps/ReNCGLTEvM4do3FMOSJVzv33mcXsFEko0CMKsT2b
	+fsnYFj5PfHcrxVJbE1mfSzJPvVMp1TjFEYqIWawFIQQhFOCkPX0LDeUuqrTBJwokVt66N+tYHO
	XLC9I=
X-Google-Smtp-Source: AGHT+IGHCkf/1xNPXPk0nyG8mmvveOUau82FYECqKBzaPoATKt456TDZITRLK3PauRkPrRFIrTXqiA==
X-Received: by 2002:a05:6830:254c:b0:7c7:55e3:9117 with SMTP id 46e09a7af769-7cc6690c751mr20713295a34.22.1767283081859;
        Thu, 01 Jan 2026 07:58:01 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673bdabsm26303693a34.10.2026.01.01.07.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 07:58:01 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Yu Kuai <yukuai@fnnas.com>, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251231172207.143911-1-Julia.Lawall@inria.fr>
References: <20251231172207.143911-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH v2] bfq: update outdated comment
Message-Id: <176728308066.509736.9424691237994816881.b4-ty@kernel.dk>
Date: Thu, 01 Jan 2026 08:58:00 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 31 Dec 2025 18:22:07 +0100, Julia Lawall wrote:
> The function bfq_bfqq_may_idle() was renamed as bfq_better_to_idle()
> in commit 277a4a9b56cd ("block, bfq: give a better name to
> bfq_bfqq_may_idle").  Update the comment accordingly.
> 
> 

Applied, thanks!

[1/1] bfq: update outdated comment
      (no commit info)

Best regards,
-- 
Jens Axboe



