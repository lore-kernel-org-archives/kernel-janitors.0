Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98702D6E61
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314284; cv=none; b=TETo0ffcqCOqPfuQjt6I1mDY3mJJ8vf7TfjU+YzI1g5sATCVfspNybg1HJDGrnQ4JLzgILtiQ+IRs60RaZWmFO2IXRCPR9mRPPSRY2xHvlbIKNd10dPzflgMGTbewgWYGnBxOgxPrNHTjD/NA2INZXq+JUFfyZ4dJKXlG6W1kzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314284; c=relaxed/simple;
	bh=fGe+nHBgqjnuXX4Zgz4nOkEHxwuFtR0ZX4+FNRv7TYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c86jpa8dYYMgKWAnSSTrdS98078WoDVluj48sPB+idX0GywWf2vNOzXdPQ6cVoAxam/CxMvb+mHdblr8x0TzLp4VQweFn3/WC6c7C7BDe+yXZIhq8Oj0jmEKfO+xKiUuM4hG8q2/cb0tmLikrDB03VIW3nOhSU0snOhiuKVnuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sv2G0ORk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sv2G0ORk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b38693c4dso570051f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314281; x=1764919081; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1lnMlPJCV6DA11oj/bOj969pPM/KGvJxcxKxlFLMzs=;
        b=sv2G0ORkjoAaPN4k99IlCMKzvBZfe5MSHit0yF2hstCccycV6PFKrElmXfrT04aXRx
         avY5k1ovgWXpxq9X0ebm4PPS6Iwpn2tIvqZWhLlBGNRuzEBquJ5hPKinM8+j6urMl3l3
         Hzm34hgyddUSI8NH2N5txqXkdEhtfMyZr0sgTiSlFCP1MpA8ylbB57YMWetJVtB52Ics
         HMvS42o4A8GH/CDSlqyzITjlNrBrhCzi6N2OyLFAvVr5CyNCYVbuJc33F+VlaPRBOvwK
         XtNvcO3eXcuaWqpTGV0ogq1EXA4tmH5e7dw6GHwRkrr99HPjE3EQ7lakXggy9PJ/EyDF
         CcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314281; x=1764919081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1lnMlPJCV6DA11oj/bOj969pPM/KGvJxcxKxlFLMzs=;
        b=E/BBXvv7839MxmKT322id7lmMJ9Z3kA+DCWOCl1w5L4GXd7fxgvu/3IEqhQ3mLzTbM
         wSEXH+pTlBPFGZybAI8KMf8HxRaTU227UVrMEfMYzXwpUKLtBlM0tXmPp2L8KjiIwMJs
         TwBIxJ+vIJ8m/JkpU8OQn32nI9iCNYz1sAjD+VwOC4nOB/IxY5pKc4vJjBTGcdgCkSLl
         RVW7BNUhNiuP9/c7qATKOEULdbRHrmKqYD0VhIAYbnRTe3DQXCHf+3/EN9OJKhgY7xKz
         nDgKQXBGvHePb5WGXYZQvfQFU1BhsIUe+4mVTFQ/Vvmezwcam7O/OrJ2NNbdujfvuloC
         H0qg==
X-Forwarded-Encrypted: i=1; AJvYcCUe0vZWE3r+DJWaa5CHmd0r8RqNuhF12jmpuE2s+FLj5c7SKPZDiHWWKX+HKiyIst/WAuD0xLa2keIRyNpzQnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzREb9QDBVuNDweRbU8XIwdVbNB/s2p0b47hzZ30zowU6kiBiCI
	DmvnEh7u0epGUzRNM3dopZOe6svbVnsg4EocQAvk13sF6/Yvxtm3jE6JD/PEXSpCELs=
X-Gm-Gg: ASbGncvqGPxUPFEnGok+FWtmLCurB29MoyHaHguVgTDbnZ4r8n2jDtshVunwHsDz3G3
	ce96CInemdUfE+IO3RLT1d/hnnRNy7RflQZ4fzaavAUpyTQ5QIAhO15lYEvCJnr/lv8GhrY73Mx
	TwUpV1Swq5WzKSvzgPNWFsQafKyJ9D6a61izB6ZUoBr0FUWFDoW6D7UPej28jIkrR03aQC1GgTy
	wpqmWLw2AYHgt4p9Zde90g72T1VKADQvwwK+d4+t02j1VJTHjjW+BpSINbrQa3Xtgxg6Dz2Fxgw
	00wq/p375xFX+fzqDsZABssZ/Ql9ae2fruQcYW4MPwxlRj0RKWvbzjyxj+qJoeJBpGG8TFMyK5+
	m5zztbDqHkkJy7Exfw9wOBdJHaaagpWxsedcb7GW0qXySOhH2UlIKAPMfYJKrY6NnCbUtdLCNtU
	DXIfIIhyDF7Fp1gMJJ
X-Google-Smtp-Source: AGHT+IE/vF207ynThbqS/gDZLvJNkmiYWvWDCH+AiSXpAgbbcaT5jU5/c/AmtDqFX8SL4gsnjq1wgQ==
X-Received: by 2002:a05:6000:1862:b0:42b:3ee9:4771 with SMTP id ffacd0b85a97d-42e0f22a21dmr14964083f8f.23.1764314281092;
        Thu, 27 Nov 2025 23:18:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1cab9af3sm7899692f8f.41.2025.11.27.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:18:00 -0800 (PST)
Date: Fri, 28 Nov 2025 10:17:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpib: Fix error code in ni_usb_write_registers()
Message-ID: <aSlMpbE4IrQuBGFS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If ni_usb_receive_bulk_msg() succeeds but without reading 16 bytes, then
the error code needs to be set.  The current code returns success.

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/ni_usb/ni_usb_gpib.c b/drivers/gpib/ni_usb/ni_usb_gpib.c
index 1f8412de9fa3..fdcaa6c00bfe 100644
--- a/drivers/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/gpib/ni_usb/ni_usb_gpib.c
@@ -566,7 +566,7 @@ static int ni_usb_write_registers(struct ni_usb_priv *ni_priv,
 			retval, bytes_read);
 		ni_usb_dump_raw_block(in_data, bytes_read);
 		kfree(in_data);
-		return retval;
+		return retval ?: -EINVAL;
 	}
 
 	mutex_unlock(&ni_priv->addressed_transfer_lock);
-- 
2.51.0

