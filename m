Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7637823DD
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313836; cv=none; b=s+Ce2Ynb/OYQVqfb8/vKmHnIWHeZwH76yb49dz4R2GFO3xhYwZCYD4drzyaDy5DEj8YIwa3MymIt1ywN0/Qveopblvq2NatvSaOdxFihHEjnxtMLqu8pewZeOMFNY1+QxQ6gpwgm8uQblXOOVUNMcEmqeVExJiyh4zbQPc9CVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313836; c=relaxed/simple;
	bh=L6LYz9Jn8PDdj+dJG8ZvdKGHSxU+HjVeYFAeWLa82l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcbCz69ks0mwwBO/ukk3akeq9yw4hQi+4P2hcZdWsBET0H42NIO0CzEgBpvYv3OduBEVBLly7nfCfkC6ehcV7/ZP8/wD9e/Qx9dQf7NDeKvh8pzwpbvX0fy0fgarhnuZfiCBcvLnFWQ1phZBrk2zS886rP0mu9u8iVGt+vrslI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xx0B/rXR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xx0B/rXR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so8699355e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764313833; x=1764918633; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8NSKlZbPghzeN+bAT3oEpsNENFoIWLn2rchJFa4uzY=;
        b=xx0B/rXRr10jlzVPk93EzvRvkC+tQmLTUs+J5630PZMBkQWcfQPjlKNXQAI6DdJGrp
         ZaZU9wYSyN/luNubwLwL7sBVUTTVEKvLzOhs9BqQdKNpiGkHETo4dvZPiV7ETkzZoFHi
         1DpcdujAeyEL/zKc3LDHaxbjrrmz00/MA4rcMwhxCxUm34BmG/GgsMqIb1wvLTaHLiPM
         DbcU8ypCtoHNV7RXahSp4tvKUxYMqFC/MH0dxAvQR3RKvyeohAephoxuXCRD6K0DPUEw
         mw4rqdYztVHlpt0oMKBuyI14B3UmQWXul4dCRwIetQWWeSZkEMLj5BEiA3YHpEXzo2uQ
         wHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764313833; x=1764918633;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8NSKlZbPghzeN+bAT3oEpsNENFoIWLn2rchJFa4uzY=;
        b=XwcQSVKC3Pr8CZn2AZQaNb4iBhSsU9Ek+xY7+c8QyZ87qR7HVzWFMWDgv8+sC6p5Zw
         UWeJ9ng/3Ap5lpq5QDYMriSqA3PUivJ2VLVuX/dnwuIAYl5ADOlGgC2jEmNwJK9cYjLX
         iP1rk1B4ggN8/i6/ReFPRKhzA8kbDwc5xMkebUBBf3l/W9lHESZG0dBQWvh0ZpY/dcxf
         YzBsuZVaSuEaMOuMV0npRCEiOR7y5IN12VLcDA685/9HsoWNTecq8cQ4SV9toR7hQGgH
         pb2/tlXwnAkletiOK9LeV/A7DX0YiHPSWmlrmxsueM+8CZAFBO+oO4RXOyrASsVfwap9
         Jk5w==
X-Gm-Message-State: AOJu0YxtzqDluc7AKAGXc5qaGDQXR72xOz2OSa5GD6JSbcCLazOrGMYQ
	7v0PF362ooxXR0iUHcwC/qkY6yAuFOHO+Z++q/tWyATwJe86Kgl7E4cWhzdGnZmF/dI=
X-Gm-Gg: ASbGncuGG/NYvrynb7hDT+EHgDQvzq9sbxiaLSH9Qmq6czTtTHGySEPdzPovLlxeC3N
	sJEyTWpRxJqQj5Ph78kt2pNez33ZssvKlhtMRYBFJc2JJPwYbjbOB5fuDBLdgcmWDn28Q/ysPDN
	DIuon7yIT3IHr+64tMRWLGAk/lYDZJHYh0P3iLWGLJD2i9FSUhb2Jmz0XyqfH56a/V5AZiDOpbS
	KIt0gw67Vk95+hL0M3G8RoyJme/vA8knhBs5SP3kFhBeKGVcsYlMEpOdUGzhZ1euM9lpjrU7WqW
	/7F8hMASNRV5eORZB9V9q5hCspp3F7ssLpjHLUtaH9SiB9eq9p7myIJG8NLagzV87A9XwsIxiHB
	srSThyTzrddV3NVdLNC3+gFqcSDOXde7uAXHsCG+Jl2GcdeDgtFM28FqtP0m/mDyDKVET2MD7r0
	5euwL0wc1D3rUAGf5xiz6Ib3aGDzc=
X-Google-Smtp-Source: AGHT+IHbTF9i67gFcSPTM6kdaKafCUf/mlMCv7aC1uEgNq68uI7djZ2HjrLdvQVGH5Av762LZSSIWg==
X-Received: by 2002:a05:600c:8b37:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47904b1ad25mr124977115e9.21.1764313832645;
        Thu, 27 Nov 2025 23:10:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0cc186sm129118155e9.13.2025.11.27.23.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:10:32 -0800 (PST)
Date: Fri, 28 Nov 2025 10:10:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] ipc: preserve original file opening pattern
Message-ID: <aSlK5JTolU2UsHLp@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Christian Brauner,

Commit ea2f85c54e81 ("ipc: preserve original file opening pattern")
from Nov 26, 2025 (linux-next), leads to the following Smatch static
checker warning:

	ipc/mqueue.c:907 mqueue_file_open()
	warn: passing positive error code '1' to 'ERR_PTR'

ipc/mqueue.c
    889 static struct file *mqueue_file_open(struct filename *name,
    890                                      struct vfsmount *mnt, int oflag, bool ro,
    891                                      umode_t mode, struct mq_attr *attr)
    892 {
    893         struct path path __free(path_put) = {};
    894         struct dentry *dentry;
    895         struct file *file;
    896         int ret;
    897 
    898         dentry = start_creating_noperm(mnt->mnt_root, &QSTR(name->name));
    899         if (IS_ERR(dentry))
    900                 return ERR_CAST(dentry);
    901 
    902         path.dentry = dentry;
    903         path.mnt = mntget(mnt);
    904 
    905         ret = prepare_open(path.dentry, oflag, ro, mode, name, attr);
    906         if (ret)
--> 907                 return ERR_PTR(ret);

prepare_open() can return 1 if the ro (read only) variable is true and
Smatch complains if we pass a positive to ERR_PTR().

    908 
    909         file = dentry_open(&path, oflag, current_cred());
    910         end_creating(dentry);
    911         return file;
    912 }

regards,
dan carpenter
