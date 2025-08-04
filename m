Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759B1482E8
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Aug 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754321006; cv=none; b=C8UbkhXe6M5/6MF8WwDKfJ4Kd1AcdtRY57dkkwwXOi4AKmow03ZrU93XsUhQ/yOoL1fsMv9jBHwmCjGw8jF6WYQnDmEGB+Sg3uWtV3vjro11RUvOzAb9RBHOb9u3bCIGJ9Z/DEP/mcEobzMNIpocmTWEthazdm1imTENfwckNBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754321006; c=relaxed/simple;
	bh=nFoSWOWXDMGmzTUxtwhpB70Bmfd3Anx6RywJYHcDP48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dD56y2CYX7PxPOaLNIkXXruqKLSAb/SmBuXlzGRbCMIp7ZNnlABOb3ZDS3eTsRb1+8G1nV896b6Sy4vihSnEyFo6JfGrj0Fv62MPZ81iJ+kyk3C8mmpCu/DxE+eM1tlYsfEVuxTlXewMrftya86u+eU40Fb7QjEEoTj0oMJHeXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Kntd5a7H; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Kntd5a7H"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso34282515ab.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Aug 2025 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1754321003; x=1754925803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqdX9vSM7eNyAqBUevvRqDXoCJdSwPaqgVdWOxEJdM8=;
        b=Kntd5a7HCZ60vQ6jKwe/HzSfHEUSH6Hqsgr/+yqEQeTb7GCwkCeEzLRUAFLFPswcXF
         NXrpcquIAMfFBASjwo0qpvrMO/6MTvUBpg3KtWEWTiEzgoc3PxhLAx57pcNfAVzVoLer
         8e3qTc76S3DOaeKyI8A/J9cEXvZP5BB+mMTgYMZuonBLsFdOgI2MCZ7kSOCvm6F2qrYU
         2x12QJSQvnP87XD+TiJVEbVo5EhvfMHxQMeXWGHvX6vHoEXlV3R5qmM4dGYVecJT/e2D
         4xx7zVCzAf0ijgboihfEAzlGJnYTO1ByygHksGrhjsWEF6ljT0+bOW/LRKG1X6rx4R8z
         q8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321003; x=1754925803;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqdX9vSM7eNyAqBUevvRqDXoCJdSwPaqgVdWOxEJdM8=;
        b=vG6zY1l7vIO+cTHjeWkGih/M+9OnsqVPZ9kXZ5ZGAOb4RFeibFAJ0gpNoPmAhuIVmo
         epvG3+RaCz9JklPBzyohNbFSVZBOFuuZdZ8heHRN95yiLKgHD/gHkKMNXzGpfxQamVgk
         MVC7e78AKBG4LmTlWpGrzAkRd7j/5yWcc1WMHVzQ/abPFviM5tjTEvX1lt9PoPP2tGbY
         x9A31bh//lhCDcacyBieebYPzOhTcuJRKa7hq9RnKeHFVQoS6Yfsp179U1uFZpocsyAz
         bYZaTe09bv6u56oJCOn8e8phJgrt2S5/5K/FxG77VA9fMleS7DkgA9I8WkwetyhnMlfd
         lyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEFBpiTELSU34Najc1wxiPoxPGi7rCSriLr8XrhVbiudXWpmQIBa45gYVaFBpL4P1YBmjEYfGBgRrjpkVFgQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44m7S4i4Hvv3an48fhFW1M4zJqsQ7DaWik5fK8JmC2Pr0JdAW
	oyLMSbTXEkBg+RzKGoX5K24MKZnKrSDF666A/vZxhZspDz1XRGG8Lfkcj1Lg3R858tCmu+RDl4H
	v1d2H
X-Gm-Gg: ASbGncu/8GAl3HEUlR8APnUeYXMIQ8WWtHc59CnjtmNI6ij87EBqXgEDoRLLYmXQ8w2
	tX+lMIr4y7rP/RWbLtc5KmHquBL+GO2PzHA2zcg5dSTZS2bvJWZMfdRfvkVosARrxRvlkXkHikv
	GJlOnyWnI8kUCdCxGc9Iq7NEuiljMSss7R7HrzB4q5BRCXoZbAVn0DT0DKlE7QryeGRJiwsCVfH
	NWa850WL18Xk4Rloj2iwKAM9oQgvEb3TdYxS4Jz9t6NdQi3ZJ1bu+GmGjtVv3TlR5x38NdskWhZ
	+n+cMsjVpcvgpbvazGdikHYTuL9IIHfWUGgz3kv2ibiybgvR7M+KIcfVZZybNjFsAQYIjvuNF16
	I7inQCCWqftEKhZ8XP9gZGzlb
X-Google-Smtp-Source: AGHT+IFO/lBsZcG6giK2HvXNUrdqdWnLNJxiI9UMe+z+3+FeG+OeKUvDv52bgS1CZJVtM4/52xm9Ww==
X-Received: by 2002:a05:6e02:184f:b0:3e3:e732:aef6 with SMTP id e9e14a558f8ab-3e4161c8834mr200857775ab.18.1754321001188;
        Mon, 04 Aug 2025 08:23:21 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e4029a1553sm43241475ab.14.2025.08.04.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:23:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Yu Kuai <yukuai3@huawei.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-block@vger.kernel.org
In-Reply-To: <79394db1befaa658e8066b8e3348073ce27d9d26.1754119538.git.christophe.jaillet@wanadoo.fr>
References: <79394db1befaa658e8066b8e3348073ce27d9d26.1754119538.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] block, bfq: Reorder struct bfq_iocq_bfqq_data
Message-Id: <175432100029.20578.5554580525847774271.b4-ty@kernel.dk>
Date: Mon, 04 Aug 2025 09:23:20 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Sat, 02 Aug 2025 09:25:59 +0200, Christophe JAILLET wrote:
> The size of struct bfq_iocq_bfqq_data can be reduced by moving a few fields
> around.
> 
> On a x86_64, with allmodconfig, this shrinks the size from 144 to 128
> bytes.
> The main benefit is to reduce the size of struct bfq_io_cq from 1360 to
> 1232.
> 
> [...]

Applied, thanks!

[1/1] block, bfq: Reorder struct bfq_iocq_bfqq_data
      commit: 407728da41cd6450cec6a4277027015a75744d56

Best regards,
-- 
Jens Axboe



