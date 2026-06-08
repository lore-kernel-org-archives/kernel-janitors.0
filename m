Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6381A08A3
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922096; cv=none; b=LKgJ2F0f4Fwzn7EWSz6Mggem6iV8feL4D/eQLOJsFuQ354Ap8H4n+OhJUvD3ANOwt8LoPGy90/nDFdnLSx+oHv3NEHECQi/ODn15YgZwF7GfmWfC8P/HyWWb6IwmjIyydCLw8TbeErCp1e6EraMIPG14EzlOHgIVW4au2wtWTec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922096; c=relaxed/simple;
	bh=DlPYUgHKFlKkxwKG/MJLNLlN2G2FcsJYjaMptCVzgjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bz9WyoosHwey7Zvk9uS/lVCb4BKD9tmkAoYbIKzmtL92H+RBbN36320zndu8aBCjD5W4hXQZYJeCnUArDjCukjJNTXU+2zW6plZf4iMnvxt/nYPj+EfY2rOoWKEeodtIXMW7eaLUXxNgq4LIfTU1uKAHo2P6AcQCpXsTf2pt7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqqaUyRL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqqaUyRL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec49f7e35eso570261166b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780922094; x=1781526894; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51QOmcfHJGG9xTSzJNyI3kOBUAZjF52SeLGAO8MU7Gw=;
        b=UqqaUyRL2FfjTlL3FQFTV6QdsRSw3BoEk8sx+3JRlYzMZ2wfLF3zn4gaQaRDRSUq4S
         q38xgBJk1ZqWAncuvsdniWs22+qL5SH9OIaFuKPfKbSiV9dS/oMIhG4ILqhJfhaF88Hg
         NUyIetiI1Ua8/xMbiTaj8g6gWAd5/lTllHLo3Ul1dl+Ay4hwrxdahsr0is2DjG8V+bc2
         qmqAlKcozgXPmsWHILkAn3VsKwyqj36gxvxccv+cCUnKO5cpLU/s1SxzKUtPIxpqyxRT
         I6FWwyQqev4HsrXEMQUbtkGiSEhxdPrSSHiNPuDKVG1NL5EydThcPY6M7lzBsF1utOLJ
         aPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922094; x=1781526894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51QOmcfHJGG9xTSzJNyI3kOBUAZjF52SeLGAO8MU7Gw=;
        b=dt00jG7EvCKVr6vtMaKDUlNaL8VJ9G2gG1bj9YEadqND84sDJqeNHXe1mNvezlc0/c
         vTiY090hnjuuEFFrL0ZErO3AxqO6LHjnScbJaOlsSww7TrknrJLQ6WAHpPePE4KQEX9L
         L0xUhxxbZPzRxHhL1tWvZlBY+MuBMAlPyijX2VbeUuF/uKDzM+fHXy59/TBFkWw5ogWN
         O5Gci/K9wCmST4+uVaOs+xmQYLu/jD4wbcORx2zSF4MA13HV18fXRE3fBnWz+vAHTjib
         hbwvC7YouPJudfjIm97q/0rqWe/DqaiwVRuFDiZTTEqGLUNw9kT4/Cb3uQ/GuoqPLRXo
         uYlw==
X-Forwarded-Encrypted: i=1; AFNElJ+cIFL4c9NeCtXH4GACvMSev4n8zvqJ3xZ2hIurSdCtQPbTxi5p7uUBf9zJrsIxk4VmSdpwNvn2zm5ivpTXKzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMm+ymmk3Tn7ER5aUAMfHp31mUc+ZHApqvau1TUTNbPhg0YNR
	8rY/ioBilP1AvYen8jzIKCDp6vGRUeXjZ8elp4OXTJSp2Lq9/MXX0BXK
X-Gm-Gg: Acq92OG2Ur7uWRFkLxhHzMbc68sh5ldXZ5pIVf8OXY3Xj/1RgkKxfWZsl19uHMCDPEm
	DrnhUWAPpa/YzwYWSICMB8L6zz/x08HABCp+OczEvEXspwXt5GxG8sJwl6JtGMFiZr4LhC0yFIE
	wK3aq/qeOb8MtqQBvo85O+nmrYhc0Zm3TetsB2r+mCbUtcQhTk7uT8bN9+F9UjSzcRv6cvF9OJn
	3X9nJSpOhaQq+qWNIHBiA8HUTxqWRV+N0f5xdxrpQkKVoayca0aGZD3zz/zsYZFQCJ3a8UGdTGd
	07jPuEdAD0n4jdzmvdNAuO5MQyuCgpyQAnXySF9w1OT0CxE5VYFJoNA1gzsY69nFl8tf8F/WIHR
	I5ymupRkcKGeNML1yjAMfiGuNIcq5rciJ5LNvmMT172jNINl5+HMt11cb+OxuGvwGKxzmr2gz+Y
	OXBWD9SOM9i+uar1A9wZ0oTWd2G3AS
X-Received: by 2002:a17:906:8a76:b0:bee:280b:8bed with SMTP id a640c23a62f3a-bf370e6217fmr535751166b.22.1780922093816;
        Mon, 08 Jun 2026 05:34:53 -0700 (PDT)
Received: from localhost ([43.225.189.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm877557266b.42.2026.06.08.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:34:53 -0700 (PDT)
Date: Mon, 8 Jun 2026 15:34:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kuan-Chung Chen <damon.chen@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: rtw89: debug: fix off by on in rtw89_ppdu_str()
Message-ID: <aia25i0ds3B6QF6c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This > comparison should be >= to avoid an out of bounds access.

Fixes: 419ed7f4a053 ("wifi: rtw89: debug: extend bb_info with TX status and PER")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index 8f5af873e09f..5786120602ab 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
@@ -4348,7 +4348,7 @@ static const char *rtw89_ppdu_str(struct rtw89_dev *rtwdev, u8 type, u8 subtype)
 	const struct rtw89_chip_info *chip = rtwdev->chip;
 	const struct rtw89_ppdu_info *ppdu_info;
 
-	if (type > ARRAY_SIZE(rtw89_ppdu_infos))
+	if (type >= ARRAY_SIZE(rtw89_ppdu_infos))
 		return "RSVD";
 
 	ppdu_info = &rtw89_ppdu_infos[type];
-- 
2.53.0

