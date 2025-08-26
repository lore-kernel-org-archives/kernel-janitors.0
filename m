Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA742F49EF
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756195749; cv=none; b=HGk4ZNeN5/YFEvsE8qTuBylqHabiBlAEmTVEG3QMrhn+MsAuUzSE6J5UA68TR3680LnuA9N06Tvk1a7C9LoWrsz/OBcdTwVyrMBAAgsymMtuNRmOOleG2TX1vMrcm/RTLetvNLx8tGoPEqqALhJxJwTWngpqeUK5tLP4RhVWxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756195749; c=relaxed/simple;
	bh=tvNLfHVGlsbbg3pT/HohRoQTSl9f6rIWT2OewTMoyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0TXWUupkDh26/1R7G1MvyeT2dCCHJfmdGeR3qaG+XJ0NCw75cs4Idu+WXPyetKzVM2ByocvZ0wNOQ8+FxgkZvbPkIJWXlhARw0i6L9dOH1PTMaLjWs/lzLEdYMgMG8p06zQDK6YrQeULFWDo7gykFsWikxamnG0jsKXgQ3oS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXg1tFZd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXg1tFZd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso45222565e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 01:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756195746; x=1756800546; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZY7GmaBke0Ta2yE8wSDqDm437Gw2w4Z+kLYzjJhmO8=;
        b=AXg1tFZd41SFmkmkPAYkEVyqbCVDQT1BtUJNA3RrBR2wzqqWZCMCLLUgUR9UFA2D0M
         Y2FJ3gZ5rCZA7I8tkJSIybLqgSMI5T86/+JxvNBtH04iIUgevCOl4+kSeCWqCSz4RZjk
         v9K9hW/+e9uzwK0JiquPGzKPmUXDqaLYH76LExfTClIytTTQirdRevV1muJoz4J1FXOQ
         MxKZccKKUNqKeUbmND4PImvYbD5NwkoXerk1TWBDaDcxrz06rU4yRwE2Q9AXPkD9thO3
         YPPECplon027sgdDfunzGV2ahlkAJKaEkQGhYelGkxKaPTxw7Mlr3q6FlNN0aQ/xv2sM
         IHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756195746; x=1756800546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZY7GmaBke0Ta2yE8wSDqDm437Gw2w4Z+kLYzjJhmO8=;
        b=eNZA0YQoB2SEljEvtMi61pmq07rfzCaHevYH+RzEs6F/46FXLUeL15ZxHNpTTrRdrr
         PXmU5t03LedTcfKuk3tXXtfOqJitomprofLwLXvVqSZLmZHRs7Cl2wpyZybumyrXppXY
         Jv8gHNLLcQ3IzSEOvmzbTlHyqWDac4njkF4Io/fV7MNNjwTqzuLvGQxyf0d861itFsfA
         Tzf9HjZsoh/+qT8z1a/YmTD6+e80rn9G5wtDEQfWTn7t3M1a6DcVXX0tk9ODBQNf0R9I
         J1LGz4WkkeQDoMkD/zvleC078A7uehXIBfjDfmXjFiv8RAo38A/XWGO4rzk5QgzmYd0i
         nonA==
X-Gm-Message-State: AOJu0YxF/n5gNFqDJlitsIWqn5fGyqkrY/0EbaL2yOg1HzSRt23xK6UQ
	F8a4h6F/WXytANn50Lje9wDVQY7qSsTKXdJZp5E0QXIaubAo3f0NPgGjnR66m/JD3wmh/x55tNd
	dRgIH
X-Gm-Gg: ASbGncsh27rOxot6v3JaAAtAXihhiovfR1JkhYGUQdnoTSruJc7+mKkMAGPCMTIeJC4
	TgwRz30ovS9/Zn8dl32S+mc0rNgCQ+wPWIUIGtgQP5e1YmD2pl240wmmaJKFdScX8xwbKs3T6Qd
	dS8ir3LPDpcnUWmQsfAgKwJJ8q9e1tY4sSzCK+NCG2LrpPH0c5DGbTJrytqOWSJMfWtphNdlYc+
	nn9m3EuKJaTn17KqO1sjzsBrx8B5jsQfCFWxv1xTUpzY7e45iPDub3J+un4yFBqwybWPCORvnZW
	rW5NVboQ7OXZ8ilb99MeN7tRlRiboDQjtRNOuDQa9C9wdMmSQRcUkQGvAdcYH5LsLAVP7VQ3Qwa
	W+PVWarkXOdr/XUNaDP+r7D+D22o=
X-Google-Smtp-Source: AGHT+IH7f8RsHtevql+fGxeZaQaLWI8ntCb79uG6pLZOOCFi+L7Jg/R96jdyqpU+zKZ0OyMs8IiHng==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b5179e897mr114686575e9.10.1756195746285;
        Tue, 26 Aug 2025 01:09:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711211cdesm14898710f8f.37.2025.08.26.01.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 01:09:05 -0700 (PDT)
Date: Tue, 26 Aug 2025 11:09:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: phy: Add support for Aeonsemi AS21xxx PHYs
Message-ID: <aK1rnmRWrCAfB9Pa@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Christian Marangi,

Commit 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx
PHYs") from May 17, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/net/phy/as21xxx.c:561 aeon_ipc_sync_parity()
	error: uninitialized symbol 'ret_sts'.

drivers/net/phy/as21xxx.c
    538 static int aeon_ipc_sync_parity(struct phy_device *phydev,
    539                                 struct as21xxx_priv *priv)
    540 {
    541         u16 ret_sts;
    542         int ret;
    543 
    544         mutex_lock(&priv->ipc_lock);
    545 
    546         /* Send NOP with no parity */
    547         aeon_ipc_noop(phydev, priv, NULL);
    548 
    549         /* Reset packet parity */
    550         priv->parity_status = false;
    551 
    552         /* Send second NOP with no parity */
    553         ret = aeon_ipc_noop(phydev, priv, &ret_sts);
    554 
    555         mutex_unlock(&priv->ipc_lock);
    556 
    557         /* We expect to return -EINVAL */
    558         if (ret != -EINVAL)
    559                 return ret;

There are a bunch of other return -EINVAL situations before we get to
the one we're expecting...

    560 
--> 561         if ((ret_sts & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_READY) {
                     ^^^^^^^
So Smatch complains that if we hit one of those then ret_sts is
uninitialized.  I mean probably it's fine...  But I just always feel
returning -EINVAL as if it has special meaning is a mistake.  There
is a subsystem which make this a core assumption and it doesn't work
but it's too much work to fix at this point.  Probably two days worth of
re-writing probe functions and no one wants to do that.

    562                 phydev_err(phydev, "Invalid IPC status on sync parity: %x\n",
    563                            ret_sts);
    564                 return -EINVAL;
    565         }
    566 
    567         return 0;
    568 }

regards,
dan carpenter
