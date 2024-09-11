Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869F149E03
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726092358; cv=none; b=PAjePko7H9rF0qSewlgGJfiaoqQiT2m4iUmMySmruah0njJ0mXL1GCIDxpmNgfPKSpel433Bi3CK2SHUIYb2PIN8iU8ofmS7VRaXUcqb2gQuUhw0waudXmEIJLxw48E++oD6HgvNPWSRpHgPRr2vbrVyKth3BWShe3C479kf6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726092358; c=relaxed/simple;
	bh=4eWae7FOAKdBlxcxq2mEpg0H5cK66+VncijT1wT9M+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c7SzXV+5Zzqjo8q7mAUY031U7GWzgF3J4TodHWViB5i4DsKQ2egLhAIy7LjzZVGQfr3hIcZZKLLgHa6E7uXMx3uGYeoB28NkV7ZZ5zUQT89iHALb8JCXogKPqcBW5HFvJMqT6FKcgRb/JQQpxrNfhrohKDOBUjlq1RoHRKSeZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iRsCyLuu; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iRsCyLuu"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso272950a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726092355; x=1726697155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT6C3xXVFHramxKhQNyUko7uCMTmKteekD3PIenNBQQ=;
        b=iRsCyLuuQwGkgQdp1qapRKosAt5CPYIxqpf7pfpQI1tMkPOwWlBJ3uy1gTcpSo5tE2
         COq/4lqUZ/nVJ1qZjaxpt8Aym+3ZpUn5ccwOw8eA1SGzsfyff0VSsbyd4SEgUVkMPYsa
         7/Cp0gaprGFPnJDYRf8OG+l3xyTtn3oLgbte3C1oNDaJiIVDBjeA41JqHDvL4/BPpnnN
         Le1KREJjl1beqFUoeA1/JTsL2UbdaFepwR+/6ESdEK+t6F6/sOzqS6trRr/WDVQHsd1D
         IEcuRhIDghbqi38cuO00f709Chaa+NJesSj/cAAi6gMQWPXr9MQPLHo1FBf7Sx49soPZ
         hrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726092355; x=1726697155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT6C3xXVFHramxKhQNyUko7uCMTmKteekD3PIenNBQQ=;
        b=vx0KeE1g6IPIJgzzC1J6m6KeHK+z5mI7H89usaZe3P+urvEYvLuXUdYVPd1Z05uMcV
         CvLlbD0B/o8oXleGR3KkJ78t4KF4pv+ls3lRBh0f7jLDYFWAI9p4FsyXapGh2LKeES0e
         lpv1MJJ512mDcZQkh0C3VpBHOhlfE0OLmT05pDGxRFE4Y3t7dCWSxU0SeqWxCe0eKYQp
         J/fXI8mgYCYCEc2pV3lqs1ke9IA17U4LKoIeJrvu474vKJtg5LOeYSuURQOdbt+7cWcn
         5YmJ5Cz0YRDLmMAo8jd8Z8iAzn6C68jxUOF7wadGm89zaJCTZFHKFVAR0oUdaVcDK400
         xPVA==
X-Gm-Message-State: AOJu0Yyt9a774/6q+I0Q6mRdXjcEYN9/qN8PH3ZlqlWZS1YJ/5lKe1Ii
	8CDSJ8Ybw0byK2x7TU9zZFC8Y+Xq4t7+EEgUmrMpTwuKikPLK7T3OqlVUc2/GyY=
X-Google-Smtp-Source: AGHT+IEuqFEGAfJiOaQ4nh1MTrdynUjOWncE9qCeCiHOZ6JbwtAJ7RttrGToWUO/kBAcYF3XVN+a+w==
X-Received: by 2002:a17:902:f68f:b0:206:88fa:54a6 with SMTP id d9443c01a7336-2076e361a14mr10671435ad.21.1726092355362;
        Wed, 11 Sep 2024 15:05:55 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd4easm3908905ad.148.2024.09.11.15.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 15:05:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
 cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240911214124.197403-1-colin.i.king@gmail.com>
References: <20240911214124.197403-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] blk_iocost: make read-only static array
 vrate_adj_pct const
Message-Id: <172609235387.422440.3089154405009965533.b4-ty@kernel.dk>
Date: Wed, 11 Sep 2024 16:05:53 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Wed, 11 Sep 2024 22:41:24 +0100, Colin Ian King wrote:
> The static array vrate_adj_pct is read-only, so make it const as
> well.
> 
> 

Applied, thanks!

[1/1] blk_iocost: make read-only static array vrate_adj_pct const
      commit: cc089684664ebd379f1451aab65eb50f4008b381

Best regards,
-- 
Jens Axboe



