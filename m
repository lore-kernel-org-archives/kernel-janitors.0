Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA422A1E5
	for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223087; cv=none; b=h1Nd1zmHMUQI5xSHTje8aiPSsp1KTrAanrWkd36s6Lc9ZJAMeSK25Cu9hV2Og81rXyvZLzd4kahUIfIvLa+zBZ6uDXqlZr9ptKdgl508CToWqx7GtcDoetEf83znMbiDTTxf8b4eqkDzz37TGtsHak4K7pMes757uAN6klS0g6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223087; c=relaxed/simple;
	bh=CtIPS/hKLdU/F6w3T5VT9pOXUurgZ+Di58tMkLUT3ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p0P2A9uWDbhwHMO5AZTrskXVttMiy2luz6SOGB7U2aT23ObWz0cpdvu55QUn6W7yATiSsOnFr/3mJKjZvUhjYSGgot0NZBsjlxAdAVjlIhzKSHLdkvbNkzA4paAZ9K/74cbaEkx5VaXedK5o8A8JVzOSOFv044sPt1FEoyhC45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hWBzoaGe; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hWBzoaGe"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86135af1045so797628239f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747223085; x=1747827885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NfGL5UGYpWD1+PtheuzgaQ9BfAKYj3Frz5hjYBHz0M=;
        b=hWBzoaGeM09NFZPa2Z9KE0y9noPgfLA1HHW5AObmqr8WndH3F6x4pV4KbS5CYSDAqX
         sVaEseYogGT7bzEodTlR3iOMveMQsaN/juxlmbwxylAz7jH+l9BUNwkCk0B9JFkm155s
         mA0G/CeubVJ6SY/6kXWt4maShj0lt0i1O2IH5PRgJOxPbkau71+W0mNJ/eEFyW2/zSlw
         sAaG9wjRukaIGja5hVrcED1s4Nby+m0ZF3p6vxVdwL396AFTsfdfF75rqEpsqo4WHKG6
         jg1d+ZfLZZn/c5sk7/7fJYGMdwEXE6VuSWY3ARk3hX3J7xlliJ/urpHDgbVJiMHHByuY
         LmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747223085; x=1747827885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NfGL5UGYpWD1+PtheuzgaQ9BfAKYj3Frz5hjYBHz0M=;
        b=esdrCI2kZnqakSCVQUeukn6mZm52WiCvZQkR00jwhXUgGyGfQpaSR7aUl0R9bNlU9P
         FD+APboG9p3PtL97/Tx+bSXdW08a9KvE7oVyXjiZk3VI/3Aqk4v3YZG9ODLykZrockH9
         VexpIfyVUp0Y97sp6Hh+odwiyHm+MVIjqj1Ni2om6MQW+1uR6YVoLyyC9rBWyK5rwwG/
         eU4oUHLLo2QMKBZMv1DW6JVJkByDbTtJCietjfVqSI7OHsB+bnhydcoZYGAzo+1Z/4AD
         GXFysRZPfap/n9lvaH3v0YMV/3mYz2t4+j5jvQDsdFXCYwZwUObD5Ad0xp7a1cybglpF
         kEpA==
X-Gm-Message-State: AOJu0Yzzbvo/Y/0Yw79aHQ9epRyR44EuKH+d3KeVbbP+unqFvaha3ylk
	CYIKyX5pX7y0PguPmpDawOyKrHIdJS66CPE3DiuihzCQurDkXLgGaOVL8PGOToo=
X-Gm-Gg: ASbGncvRmp2+1j9zMtJ3JMdsHTl7doUE5vfa5yUvsopE7UJDKrS5ANzIUt8m/H4HO/J
	ZYnxh/WGU6AlYwHTvXL+T0SgKOMZyCN41CrNvt/Qa1VaYmaLma+vFFV+Vm51+UYbIhyU5Ebzv+9
	et8IpiqbHrLqV20F5SwF79UaCOXqofz2EA4ViNVHBmHXQMFmxngyTZNeQuaO98YnoY72+iSHj6d
	1G4xqM/Dkm9sEtV5lkxNyusRgOUC5+1KS03u3FgLyUqZ+iCyJDyBASCFmLYYzDBDQxxCZwupS0u
	vZAvj81OKDMyg0SiDOfxwsCEuldilVW49Ax1H0681XY=
X-Google-Smtp-Source: AGHT+IFj/J89/IEtP0qvOubE/HRqWUhe1V/jh3bBm19Nx9qKHrI0X4MPceNHXOrbKARdcImnJ+G7mQ==
X-Received: by 2002:a05:6e02:2606:b0:3d8:1cba:1854 with SMTP id e9e14a558f8ab-3db6f79a452mr34387775ab.1.1747223085022;
        Wed, 14 May 2025 04:44:45 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e161d47sm33988065ab.62.2025.05.14.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:44:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>, 
 John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250514065513.463941-1-lukas.bulwahn@redhat.com>
References: <20250514065513.463941-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
Message-Id: <174722308378.101960.14079135866679670041.b4-ty@kernel.dk>
Date: Wed, 14 May 2025 05:44:43 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Wed, 14 May 2025 08:55:13 +0200, Lukas Bulwahn wrote:
> Commit 9bc1e897a821 ("blk-mq: remove unused queue mapping helpers") makes
> the two config options, BLK_MQ_PCI and BLK_MQ_VIRTIO, have no remaining
> effect.
> 
> Remove the two obsolete config options.
> 
> 
> [...]

Applied, thanks!

[1/1] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
      commit: 1e332795d00655305cf0ae40be4e2eaa9a399d79

Best regards,
-- 
Jens Axboe



