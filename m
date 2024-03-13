Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C684D108
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Mar 2024 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710361653; cv=none; b=pcTy61wbqCXZgDPkInH0cJB1e3ZvKgqoeHlAugZrGA8GMC1kBR3cwJ/babocf2NcO402KoXf/6uxdkRN5n2J7S88AJLnqXbzhRQ6HP16F4Qt2IpgHNZc4AfUUdOh0VKuMuMbAklY3Od+4apsUknZopvruOn2lqnoHE1BYb6OmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710361653; c=relaxed/simple;
	bh=6KYs3BQgjwZsV5TdSedJLoIrS+8iHieLsZx7y+UPnzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=seprU3IKAfocTC47v32jLKiqphLvkri8erF7o0aLG1PIsZJF3ke8XtXp9rFhpkMh3QK58auI9ueuYSmXlfjMe8Nh+1VESknATtQBEPbd3BVMiC23kINbKon3xn2He0+zI0Uh3qg/gi162l5bb94foZy+nPMOhxTMytb0jBVaCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=a9W3afKE; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="a9W3afKE"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3663a681015so479355ab.0
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Mar 2024 13:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1710361651; x=1710966451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF2DJ3K0vqdhNLJam1R2VnPzYiUW+uxIa0Tf2briAJ4=;
        b=a9W3afKEOxvSY4kRgWoH8PtJzVJNFleJdFpn9old5/tP8Smm2aSsM0K0/N/2Hghx1q
         uOR0RZpDk6mUtd2x4o63GtY6wSr2zWDtxIhmyEhkVaIV3re1VFSlu2+Sreuzaj0/Y0/x
         Xrd8yc9wGEhoSDkHQqmY8G2YZ+kSETC66vzlPvagvvTvK07HAOR/TqVFRNFykAnysI8G
         /a6ICiNZkNY6bTJfqeJ1Vn5SlkdqqkNDklV0tNPSl9GVS4LOEZVow3Pm65V1jO3qPcYi
         ivclXmBUHerME7l2uLTyALkGXpOlZ44+Z7bHSE70cozdlLy3D9y6tsmtZmFpge9lEO1E
         K+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710361651; x=1710966451;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eF2DJ3K0vqdhNLJam1R2VnPzYiUW+uxIa0Tf2briAJ4=;
        b=US58Du94bSbNjJHXFXwgY5lPQPp50D9P3r93TxTgpEJ8mcCk99lHpr6XIrZGnptTkA
         Md4x1EaNpsGs8zIEDItMZFF2OiIokzwbRRZ4CsmIz1RRn8XuXcEqFSdzIuEICDo72VKB
         PXrHd8EquAeUCg+DgY9PFW0iv0z5Msgn+NRr+D/Z5HBBPLLsoEWlLIwpqO8s8p0E3msv
         12LpVlNqP+JWWLGWtWSRl5t9pJSO14GGNw4eZ14jJnpx0H2GHRWXBsE0Ol0uH5E16Z1l
         VRLt+5btQrf5dBd2kCbfMhbn8mtQpCneLETOlT7GBvkdFeNXEjqEp9l98a0hEUNB8DPw
         DziQ==
X-Gm-Message-State: AOJu0YxxSZYw+5hBdG3Iqos4M3dNw1vHOWw0Cw15RX5B1a9rysnGwvfO
	hhkTtuU539Uk4Ey7w+Isim0qIsPnmPJFUHT3z8BiW1R5D4L3gBeE/IlT94uPSl0=
X-Google-Smtp-Source: AGHT+IHrpTG3IyrY66fdBdCSOtK8R6pRDlYafTxhW5d810MFfjPxeOohqUqtft8HGNclAFoVpU5ASg==
X-Received: by 2002:a6b:e914:0:b0:7c8:bb03:a7a with SMTP id u20-20020a6be914000000b007c8bb030a7amr23560iof.2.1710361651366;
        Wed, 13 Mar 2024 13:27:31 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a42-20020a02942d000000b00476cca7d5b9sm3081057jai.166.2024.03.13.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 13:27:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240308133921.2058227-1-colin.i.king@gmail.com>
References: <20240308133921.2058227-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] block: partitions: only define function
 mac_fix_string for CONFIG_PPC_PMAC
Message-Id: <171036165065.297831.13967283119583163229.b4-ty@kernel.dk>
Date: Wed, 13 Mar 2024 14:27:30 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Fri, 08 Mar 2024 13:39:21 +0000, Colin Ian King wrote:
> The helper function mac_fix_string is only required with CONFIG_PPC_PMAC,
> add #if CONFIG_PPC_PMAC and #endif around the function.
> 
> Cleans up clang scan build warning:
> block/partitions/mac.c:23:20: warning: unused function 'mac_fix_string' [-Wunused-function]
> 
> 
> [...]

Applied, thanks!

[1/1] block: partitions: only define function mac_fix_string for CONFIG_PPC_PMAC
      commit: 5205a4aa8fc9454853b705b69611c80e9c644283

Best regards,
-- 
Jens Axboe



