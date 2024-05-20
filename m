Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886045026
	for <kernel-janitors@vger.kernel.org>; Mon, 20 May 2024 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214086; cv=none; b=o2tRLuFvfpEzPp46a6M9kZWgUcHYTa98qv7Ce+HCoMXZE0VvCt8/UHLFoVWWSmj+hLS/99W4dTSGYWLUIREW3wQsynEe8XF4Efcu2+KEwX6oKKeV4ljE/6u5N0sH86cDMZN5jto6yJFD6ny486MqF04VD3/kqUoZP+tfea5Phxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214086; c=relaxed/simple;
	bh=jejequIZLQUkXoRwRN38Pai8FJ1AhPODk6cIdwLFiZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UDH8SkIYr+vUotWq/zWX9A29eqNRoJRlrUHwHvX/HKJVZUzteXxkIBLhulliURCISEGqzfsxnC9FcKypjakXvRVzfnxHCuBbgY6e3zS4453SrjqZsDdLmghvgVorbbZlsufjgqg9WJtBbdwrzh4Coys+yaeUZWrfS66p+NPSDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=q1rmb1I3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="q1rmb1I3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ec8d265389so8862075ad.2
        for <kernel-janitors@vger.kernel.org>; Mon, 20 May 2024 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716214083; x=1716818883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUPDjNArKJ3mfUMSjW2yhq61IQlP1POL1CAjSweGz24=;
        b=q1rmb1I3UB2MCbhXDTl8HJk+JlONBra45FPlNABo4ewLHWHA8JXEGtzcm6JDV/G5Z3
         3fqtG9AJA1wtzwXgSg7u2uqyrKK0NcDIqs23OIcYXFnmAE8p1vzcyw/RRnq3R2w29PPf
         3gRxtUNYEzUCgmDLwK9Dm5f40o27bx+GDp7QOVSk4ctmu5imbWMJ98Vb70N4b5SySZ/L
         h3W+CCbHKMwFId+2iQrP/iPZQJDHdKAUjxlCkPdARia5DYqDHKH90faKzgEB/o87W62x
         NxUKgdIAYdU0+kgpLgykcF5eJSfRiF/i0nb5yrbYE1GprVK2ZKNwyT760abN44mcgYnK
         J5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214083; x=1716818883;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUPDjNArKJ3mfUMSjW2yhq61IQlP1POL1CAjSweGz24=;
        b=vuizoFPcaZvPLVdfNrwzpvflYtb1OFf5jKrrCgf16ARSfpku4z5KQMytFVwBH9hyi+
         lWTWF1EtmhfMw8zHU3wi1w6EBWvlj4FfpKogmO4wzx1Wb0DEQ8GBmac113haEDmUJSPO
         G6frpKKZkx+2H0Iu7w7iuZnbh+eHKK2/CEGW2hBQ4PvfLRupbPcTkclIhL0fllFNF1V+
         0qGZKIC/JkppvTtjlSW3buOSUWVf4eLcGKcet9uYlMcnbISa3SYK6Z8IE7tPTAj2oR+i
         Z0xw8SQFk9pY+Qhx9eAARhQPW5HJi3sOEc2URITFQphQ/XgyjU2xA51IrZmqF6PUaVzP
         BtWw==
X-Forwarded-Encrypted: i=1; AJvYcCWnCpopSgmXEOE4iGzqHe+iieyeSzmoR0wrsHrgtk9Rh4d8qUB0ZfBKwlwxZgdRdVqZ/ICjMzJlNtVuNqlqKjdBindfSZyJzwOXTzZwdpQa
X-Gm-Message-State: AOJu0YyvEe3aUvxPTFMfbsACEndQUnGjQ1MNYGrIinKBUu/rWI54EaeF
	g06zRLaBs1xT5Ja17/mFyd820xlTWDJ8M7OOWQcVT8R6kHXqtpCCbBahhkqUal4=
X-Google-Smtp-Source: AGHT+IFRAVhTX6eDNJiRwOPpKgGY/dBfWAVh7Azrv4tnNy307MGqgnnXihGSFJR0EEXwooshsV6e2g==
X-Received: by 2002:a17:902:d508:b0:1f3:358:cc30 with SMTP id d9443c01a7336-1f30358e620mr23191555ad.2.1716214083522;
        Mon, 20 May 2024 07:08:03 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada431sm203721085ad.100.2024.05.20.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:08:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240516-md-t10-pi-v1-1-44a3469374aa@quicinc.com>
References: <20240516-md-t10-pi-v1-1-44a3469374aa@quicinc.com>
Subject: Re: [PATCH] block: t10-pi: add MODULE_DESCRIPTION()
Message-Id: <171621408252.12318.1975684366197625365.b4-ty@kernel.dk>
Date: Mon, 20 May 2024 08:08:02 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Thu, 16 May 2024 17:15:06 -0700, Jeff Johnson wrote:
> Fix the allmodconfig 'make W=1' issue:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in block/t10-pi.o
> 
> 

Applied, thanks!

[1/1] block: t10-pi: add MODULE_DESCRIPTION()
      commit: f0eab3e8d1530b87f3523cee060004dd513a6d2b

Best regards,
-- 
Jens Axboe



