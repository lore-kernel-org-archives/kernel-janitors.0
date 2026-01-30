Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D935CBB9
	for <kernel-janitors@vger.kernel.org>; Fri, 30 Jan 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794000; cv=none; b=c/Ob1DeykRQ1Bj2meL4lGwVeINuD3wjmnwJ13PuNJiEoa2XmfojQlsIDA0HrqTRSIPCZ9IAWI39IVOyALqxoFIlbvzmGWXjkNx3nfOuw/jwSqjyuO8aPIZlcXanZnTIjp3b3EMMlBkx8JR76JyXrzQSdzkFkQnTnQ75D9IXdneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794000; c=relaxed/simple;
	bh=AquEAXT+C+5JpRHmCkvrPolWBh5PP+PFQtO7aSkaXnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBqRlldy3GNus2GAIshZRXV+SOAnPOXeVjTD4Czhd9dKa6sb6WBv0lc2Vv0IwVU9APjU5snvUjzrA2/16Y9eldyK+otuJP69KMrGJmIuqC4o94xzU4qe/hkT43B/dXnVx7SkV6UcD8kqNGJ1PicYQnlxMvLTIVbSuIIpuQ4Ek3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4I+77K7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4I+77K7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8230f2140beso1899681b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jan 2026 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769793999; x=1770398799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd6QkPLzD+VnXxMDV1WB+xh9ioLPxpSE8CTC7dEP/9w=;
        b=S4I+77K7TY2T+cXpET8Ro6K2vUmxOv4QcLH42nJpMFEUri7jnBo1w4nFq96q7KyLqE
         DfzOAIal7uCVs7B34IaBxgHfpW2HhTAI0G8Fti2NkHiZkGilWDeJMk8fQlYpfMzqq2Bo
         YihkIvYCdMmWbx77gwtK3vXmEnExLrvxwzMLo20lgG9gvMvmXnsta6jVKDjFfNdB60w1
         CPrYMBrt0zpcKfjE7HGkQ1o5APP9q34eXt3SUG23ByEy4wpze52wwwEv9gSlSF/qYH0o
         m7LFaM7bUzf8K6SJ68ZJgH05LBJCuxucEi2hvbbthW3ug87T0SXrgJZt8GZJnsXh6bnY
         QQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769793999; x=1770398799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd6QkPLzD+VnXxMDV1WB+xh9ioLPxpSE8CTC7dEP/9w=;
        b=BvIIC2+FrpzE8Q0btzX/W1eXJCWgp4CN9gVImO/60g4JA+Zqg69bahJmIOIY6drBva
         ewYPGWGxcyln20ZyADNNcybTA+xsVUhmHqm5N8pk8TAXLaCbc+/8NbWv4sF1E0PAyJVR
         kFLt9TsCkjV4RmivOFQqzf6bU+pfWNBGHZ/R0Yz2N9qoqPJD5lq1novmDTu2C5D3po+k
         kqQlGhDrAYdgLgUJTdUrdg+kRbHZNFp1bmKrK7HMb0ihbhcFGvGVoJOnvhhA8ZcgYkWr
         hS93+3OXdJ2chDl1QFFDQg7hLmANRvM03myWT5hJ6d1GH34mhfTSJb4SBKXMjLuAZXpc
         40CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhmDPe+2WUzZdfZhnIyxW5GL8cC4HTF8OHfczmA4Y2AfGSaxZChoTH2vYydtU8huEA1jOcoplWgCF2PztW6DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaVDlYcDCnXGzsWX2TS9f6hBZB5IxdFIatoao78BMFFCaOnD09
	2M8pFxq8ACDzsL9PhO0q2q6Sej/kdf2vGUqRZUo+ejZQN17eUJ1c3b9Q
X-Gm-Gg: AZuq6aJpnJvh7vt6O1Wcs207smOPgoPSK0UxqXqsXHkjeAYFZtgQ6myPTvmIIr/j2CE
	R8ipcFKSdRus9veW7v48Yk8oCKWxS4Zci6AE78mIhfMs82VxvuTHCCVPymL1lzwtQUABinvYQCp
	z4LOoEyNvUx7hcNjLSTjMlQfU3MrvmraP5/rM1k9TIHyaEWSPfG0v6RFPKe5su0RGPigSE+1Ijb
	TsCHgo8oCWT9kN+LDUMN82bGFnJwhWHTM/erOpces5O+olGXOFjVGWPyYCMUKcka44xr+QPiu+d
	kucNA1yn2DG6LTEColxmCyKBjcX6XxA7VT1OgrCjRwHVeufL12BA4lf8EB7vrBoKvG/cmt+CwTX
	E+bqe3EPK56nzsUwBNsSkPbw06R3G9sAupwuMQAqyGwGjcqifcoZoCMGRgJ9vuXqUF5xZYqNEUk
	4LGGzSdO2blzHotDU6Sw==
X-Received: by 2002:a05:6a21:e083:b0:38e:9e19:6c6f with SMTP id adf61e73a8af0-392dfc12dddmr3454783637.35.1769793998648;
        Fri, 30 Jan 2026 09:26:38 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb2:d02b:4761:c62a:859e:e20e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413c1asm72715405ad.28.2026.01.30.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:26:38 -0800 (PST)
From: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	kernel-janitors@vger.kernel.org,
	SAJJA EASWAR SAI <eshwarsajja20@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: rtl8723bs: remove hardcoded dead debug code
Date: Fri, 30 Jan 2026 22:56:32 +0530
Message-ID: <20260130172632.130898-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug code is guarded by a constant false condition and is never
executed. Remove it to simplify the code. This also removes the now
unused variable 'pattrib'.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601302336.Jt5bRreu-lkp@intel.com/
Signed-off-by: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa..ae16f045b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,15 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
-
 	return _SUCCESS;
 }
 
-- 
2.52.0

