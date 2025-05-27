Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28457483
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325400; cv=none; b=l7Z99R0nfbIeebPuFRozxb+QlRSNxclKGzAANQDBIFfs6/DANUqUzzuV2bv3cR7HDV5xNv28Vu6cniZh5hwWNUc3hFyDMfsBRsw23sp2L/cERwC7PF30x8xG/FvdxYWYxYpcvBrgnCZ5ZD0rjZnCUL6JePBqYLC9+QAWHD/mr0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325400; c=relaxed/simple;
	bh=S6lrD0Op5pKlWL71e8qgzke0xa2+KfIHREDTWYi7JZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpbaS2BgF44W/avfFSinBfykmqAFWZ01f0IsjLbP+hFlk2ca63xWn2fYfwde+YN95hweEZLM40Ht5hZVJgCGp9VX10ZYh0XJmEGcv7SOKmHEp3aB+A4vZzwdIcxrw8PG92UuSIdIHZ3O7/ltRWjMMlNWe4zcsJQayp4+5MoFu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooMo/78Q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooMo/78Q"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad5740dd20eso447869266b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325396; x=1748930196; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1sqY5GIDGTtXFbbXu39XJwDlCZ5xKeuav8V3AHR7Qzo=;
        b=ooMo/78QLU2KQR5tjALqxSXjmfUPnGjeDyTRyMlydIWW18ESCT2AuXgG12tTr5aDKy
         t39E3RiMPYphlhlBqdbaoWjAL2bAt64Txuj6YxNGT0gzrFVgG5+dX7hff9qpJ5aOoYUm
         qV5A5Jag9FalQUl5I6hJlH2o02Kh3ceLNz3RLD5cRhO9Inux8yW9QTgGCIhIFFaE9Kcg
         eJa+6R+LHRmgIFYy6scyzS8euox7NrSamuoHF0hXg1P5FidjMAiynSp4yhUPavzXRNGu
         gQGmXsZKrphloC4IL9uhKUHrIzTjl+1kY6SR4tSLuM0RyYYSEH4yGoM1jboK6GtHNDSM
         fMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325396; x=1748930196;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sqY5GIDGTtXFbbXu39XJwDlCZ5xKeuav8V3AHR7Qzo=;
        b=nK+va6DYNSquAAPmOmjgw2E/hrNlt273IvVujxmXRVWyPnG8RANlWuvEP+yH0mNIwi
         FsIwdIk9DnnGAD90lBlyWdcH8cvwK64B05Hz1O+LKuCmIOMiuCmXC8y6kD/fLgDWKvhO
         /XcxKPY0QNXXz2vMWCPgjfaYfPlqofDMpKrjJaXUaPrM3I4X+nDLgiFgjMVCgUmZzQa+
         upraIeXBQ1vWxa16gQgpvM8QnSNAECgLzeeBV/kZISGX/npfHIgydOVqPoi6j2rG939j
         bwEeFtm1hlpW3McR4FmQKDa2RMbOHMFVaKmQ1vf5dxls9/mxPnuETh1H+Memh9V5L9wc
         iugg==
X-Forwarded-Encrypted: i=1; AJvYcCWmY5r9I69Bw8NtvgQ/IlSbBnEzVEFovxCaTCJsRCfjrpYiNTuqzIANEqSzHHY4/bKFELmnm0Us6N3ZlImnWjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ZARDCojNKNWVhGGweEkQwjmJB6Wf3lyxhFZSJdhJXAa2QCT2
	Kbd0MyJfLMod6nXNsGAwogHC4SiRh+4SXHtB8vYgKtp5AcgvOPKhBuMVhs5joeRV1jM=
X-Gm-Gg: ASbGncvWgjDxfcf9ZIC64JXpZumBAmLKlRukygHHgCxuBFT4gaokbjZ50DoUxD+f1hG
	iN8IYZsTHcqJb9CUzuQwwsoLKWKC+2uhFtBTwv2UZCz7fKEVzYSNgdeapo8Wj8VhfrD/YOlW+x0
	C/BJEM6Swokh9Y/M68ii1Ypf8P1pdvuwLDiAHkbnemix6xfjSQpdXSrQM/S/45xp7A9CDkIlrxr
	OgVYs9PMkLYJLpjIJxaRAPXlbk6QNiO4LDKE4/9G3s5mjr+HdKMNa1zg/FTUVUI+YgFixf+2Pf/
	e1EIn+oU1460JA7ugkMNN4kZK6zfbW2yA/b92CzHT0cPp6bv20x0Ta2uLic2NMve0P03h9AKJYZ
	4DXr8xxf8Dg==
X-Google-Smtp-Source: AGHT+IFTol4OTI7mtKP7rV/Mh6vlzvg43m7yooyV7FvKtcQVu98SoqAju8dLAhQhxa1PD6WLeSmTZg==
X-Received: by 2002:a17:907:8dcb:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-ad85b0d2777mr1008212766b.18.1748325396080;
        Mon, 26 May 2025 22:56:36 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad88973815asm94306066b.129.2025.05.26.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:56:35 -0700 (PDT)
Date: Tue, 27 May 2025 08:56:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: rtw89: mcc: prevent shift wrapping in
 rtw89_core_mlsr_switch()
Message-ID: <aDVUEHfa9q2zBD6i@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "link_id" value comes from the user via debugfs.  If it's larger
than BITS_PER_LONG then that would result in shift wrapping and
potentially an out of bounds access later.  Fortunately, only root can
write to debugfs files so the security impact is minimal.

Fixes: 9dd85e739ce0 ("wifi: rtw89: debug: add mlo_mode dbgfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 drivers/net/wireless/realtek/rtw89/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 49447668cbf3..7e5f87700941 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5239,6 +5239,9 @@ int rtw89_core_mlsr_switch(struct rtw89_dev *rtwdev, struct rtw89_vif *rtwvif,
 	if (unlikely(!ieee80211_vif_is_mld(vif)))
 		return -EOPNOTSUPP;
 
+	if (unlikely(link_id >= BITS_PER_LONG))
+		return -EINVAL;
+
 	if (unlikely(!(usable_links & BIT(link_id)))) {
 		rtw89_warn(rtwdev, "%s: link id %u is not usable\n", __func__,
 			   link_id);
-- 
2.47.2

