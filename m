Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D1548EE
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 05:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761715818; cv=none; b=hopUXv9CKTrc2xI4tJ/MPDWKcEM21pEsZ4ARperNLsyL3nGiqeVnNPv1tQXeDHGxsdRLovd0ATAEsZmOqrFutpbr9YsVF1ao7bOyo9R5VhMg2YmwZjZ9uL46TCEKpz1ogjc20gUomUVVcqA9qqFn3UyasJ66KIe80UxCYJsms4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761715818; c=relaxed/simple;
	bh=KQDf+j6lWSbdmJagka2ZggVCUrfKneNyC6Ve+TcVxXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KxQ44WBhEsTtAkArTgl4kIovfuNGgpa1LfH4EsfpqWN/G6L8oVy1SuXLZccjKhm1XHDAyZx4cz6GQ9WzGX7cuNx71HlRTPCP4rD1ANBQC4qR5W77mVV2Q6H/gdeO1uZdqf36TRX7q4idISip5WayPlNh7N8rIQXBrPMtpbWY5Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCSzuSN6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCSzuSN6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711b95226dso85168515e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Oct 2025 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761715815; x=1762320615; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYokdTDrhX36UcN1b58PWjPF3nJOxVfqj7lGD2QXmPw=;
        b=yCSzuSN6iYfTHHsfXgxxbSE91faHCXzOqdq6F1IsZgXJTI6O72tklazw/1/gIR1W+h
         ELIkWIY1cLzGj1MUcaSmvJWnIaXUkM1jWIy0H8GkXrCz8rIWUp/wnVbZESo/jK29j3sI
         I4OI5MeutIsaFucBEOF6kDWw2H8wiVFNt0TK9mxFMeWVobBqhOP0OztIdpmybS+NKc+G
         KgiF0UQyTxh5zVb0EIt4AGNtkX0Ombf4QLlEdXlvh9LBnfg3njwooXdPJXsg9JcydqAA
         KrRs4VBAEIzoA/LNukxn4F4O9+5obvIuVh8K724G0aTZlFytYkgQbiBrQogxu7Jb6k+k
         7jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761715815; x=1762320615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYokdTDrhX36UcN1b58PWjPF3nJOxVfqj7lGD2QXmPw=;
        b=LsVMnuSCK4/bJJZGBU9FbSvf2zlSYiRs8BdkmoUudP+iENf9z9IKZPMhmPHBqlzQAk
         tdtGyXCoQC6ittgckx2v+Pj5cafg6dLB5rNxHXH23ToBndfOaSye388lY8uUQep3QVAq
         IucUd2oPMW4j+0DePeLtxiVOWFF3LPGd1Gif5EXiWNn46/iLPTRh4NiZCsxPLr5tkTFo
         nah6ZdiDsbiHdckFtmTPUObGlvryyzQddbqz3byzTGZgakUirNa9WpRV+Xj4VoKHGBmf
         WI7AcUiNM10e5lH97pMuvZWZDr0gHS7f+KlA5ZhK+cw19PrHNr5ikI2U6NPb1PerIrWV
         oqnw==
X-Forwarded-Encrypted: i=1; AJvYcCXszi85RUOQRgRCQgWCHJZH7Zq1tSzTf+G3OaeMwh+FVnaNJvCSiX3K5RY42appBbUIx232kpk2pK/xJGTh4bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMuCVr0HuQffYyagDqi2UUe8naZHefGr1xSqLrQ8dBYFNsjV+
	Izix2Y6sOyvzSnUcG6+ezzYgtS/q7NhlQf3RlaL3pjtF6hfAd8kbphLCCpS0qub6O+4=
X-Gm-Gg: ASbGncsk4prexfHJtPgJfy0pGfWUl/yj+i0Ei3HmlCLkF8ehygBGLDDKi2veChqlh8u
	za6fl/1QZZHUKRYtR8QujssW71kAEWrSOOoNAZhh602h826D3lFb2iuXJMmB85j4/X00cSPOrB4
	3Nxx0RsXZmYBEbSxQE43VwdU5WLpv3ll88F3a76qxKUlmWC5TIl/YSTLEVAq7C8+DocMyOFjPyr
	IUab0ysicRdtvt+UKrBHsBL2GITFzRVMv//LpCvMZfhq3VwlsaoiCAlf0q2cs+mL7ZhJt0KNuzS
	PcHHSt4isgedb2xH1tqYlRzmsrtVaZSpowFs/tZQV+dO/8DP5YrmBj+yR711kOsMDNHib0aZmPb
	V74YTaLBAV+I3g8h3sbUYMbaLpIdEI7IbGB2vwvkSuD/jXddk3ArNaYI/sBnKQnH8NqedUmyyFq
	1fwz25sA==
X-Google-Smtp-Source: AGHT+IHfC6E3lLu6ybmmfp1SQT7iGC+X39jKfB/plKPnN7tDBkq5CsrdtgMBZl4VfAAcWqEotczZdg==
X-Received: by 2002:a05:6000:2403:b0:429:978f:16ef with SMTP id ffacd0b85a97d-429aefb9b5amr853947f8f.30.1761715814562;
        Tue, 28 Oct 2025 22:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df5c9sm24207547f8f.41.2025.10.28.22.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:30:14 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Frank Li <Frank.Li@nxp.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] accel: ethosu: Fix shift overflow in cmd_to_addr()
Message-ID: <aQGmY64tWcwOGFP4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "((cmd[0] & 0xff0000) << 16)" shift is zero.  This was intended
to be (((u64)cmd[0] & 0xff0000) << 16).  Move the cast to the correct
location.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 473b5f5d7514..7b073116314b 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -154,7 +154,7 @@ static void cmd_state_init(struct cmd_state *st)
 
 static u64 cmd_to_addr(u32 *cmd)
 {
-	return ((u64)((cmd[0] & 0xff0000) << 16)) | cmd[1];
+	return (((u64)cmd[0] & 0xff0000) << 16) | cmd[1];
 }
 
 static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
-- 
2.51.0

