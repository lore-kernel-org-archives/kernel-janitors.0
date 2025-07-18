Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C021D3D9
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873855; cv=none; b=ftOkstUkH2RkrdNQ6/fLyPXYHdFSjCncw32WIkgTqimgXB1TWyprwwefERT8lBnrERpeTWZ9PbfhGdMflu9pxSSWuSUHkhxhgDSoTCiA1IcaDQpGVItz0IBy9noTk60jXQgvbD66hEImn1+avoLgbp0cntEjmAI9OLaiMx9O1Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873855; c=relaxed/simple;
	bh=oIUJkdIPsltITYmnYkXF0c8cUazSTGDIqJj+KFFWPfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHLx+sIuo+OWTZrXx5CEyCGnfFPRzR4d2ritjY/nlvRJY8iLqfrCwvuBIEywKidQozXYGoTcoQ3gDc6KBlcsweO3qXvDuUgR9qnYtLmwsipgDX9rhSqxfb8PsRTbrgLjOPZJ1hQNijOkTxlRf4d0W1otsgxXQNH8ZLdDz16NUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsofT7/6; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsofT7/6"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-61593d5f92bso1435556eaf.1
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873853; x=1753478653; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNxBOflrGholZZGn6ETa6dtvAbfBYl8YJ2Uz1dv0uO8=;
        b=JsofT7/6KmbnknXZmksJZxR0tfEYEhXIMjBMh4XWRHWW/3/0xcUVWPd4RjE2xy6Dq+
         mA0a8Zj+lhSxJ55v5Y/aUeM9yaqyWtfsArK7Ua6o+FVRJYdDTOwcYJJTrA/Teo9iS82B
         +R7b/F+KX4A4GiwfuuRhSBh5LXHC3ydwWMDgQ0S+x+K2udE61Co2QaDCFSt7v0L86Rt5
         bExkDrlBeibSfd+9EwxQaiDdA0j0xu87weETvMwUg5CunjBgXzJIm2G6/+JLbuvdJxMe
         TVNnSVWWIorLCjbrGmx0SuQel0elildilkRJcCLDRd8yDXRGOF4ETEBzk4YU3NTL7Cpg
         Bv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873853; x=1753478653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNxBOflrGholZZGn6ETa6dtvAbfBYl8YJ2Uz1dv0uO8=;
        b=ZcK1ITXZq3/SB62j9I3Enxt1JW32FByNRJ/5Q9tcGaQK1w62m5wAwSxLl9/VxP+PLu
         nZKiiV+T4kFAgh48mFiN8ng5Ik6ed1w+tr0mEL6oQ8z+AVFQLlCpLOFqcWFa8gsqX5tw
         iHUkCAxJANEVdkuwI4BajqM6J22sli8efs5x4Xzc4JOmCTUcCik7bzw9Vo7VWH2SfYyq
         mUMz6cZz55KQBC6gYEyXklOz9O2B0SbjW5ZVdNl19Sju0IYPExtOMHf6MIZ2zSCEHm4+
         +7VEWzsiXn3XqjIhYArCHLWadtg2cdZLZw4clhgZOltQISlVAm/AOtbh+AOzXxHpsWiy
         x8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB3A2rdL8QKJKOnyJnySha43wwMrEQ87XuQduCBM8/2SzTKmfnMWtHckhpPyjNBzqYChC0bAAPQ4pm5eGkyW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCq46T+sZ8143qeE693P6MPcG6wuLufjuZMF6a7iN8/Ov67Lx
	ibUKY9B+2Lr48qBQHog0PIgdzzBTLLXhfAk83KMGesS35yAECgoaTrtnwwLKOKjYaWU=
X-Gm-Gg: ASbGncs7IpfOz9kinkiuhVHfRbKEyN65jNOYfN/NvX0+nsnDpvQ+3y3T9rGa0MNQ4/w
	mYoqA3BKw1U7pLlxKcxsFuzJu/U0/3aRTFay/5oX9nvgow+H8uYIvMLB9EC+uex28PaZfCLVclD
	ZyzM/k+aCRXzXVE27po7snQYtBDwKfhqSWlW41UOnTKYrsFaqQKMC3KkqxBh9dFD2Ng4L32/6NU
	xE/9dNkIfurafk2wTGhh8dsTEf9cZRRFg0NmK7H3GfUJW13Zv4v2+4FxkLc0CNHlj1lamwh6rL/
	K1NwaRF26+1mxeLqnSjkZCP751HQCKvqi6Rz+KLdkfeguNDCHDxLif3PzFQX2U5wGGb3IgHpjK4
	j0/PNdevjpdY=
X-Google-Smtp-Source: AGHT+IEL3dk12rWlHef82D3RUYaodYoVvVhdwT5IY/zd+GI8cwXb6B+5Pe8H3kNTEx7MGpyhUioiyg==
X-Received: by 2002:a05:6820:2e84:b0:611:5a9e:51c4 with SMTP id 006d021491bc7-615b81d8a6emr2878681eaf.4.1752873852935;
        Fri, 18 Jul 2025 14:24:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-615bcda4dc6sm519931eaf.27.2025.07.18.14.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:24:12 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:24:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Cc: Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] fs/orangefs: Use scnprintf() instead of snprintf()
Message-ID: <7c4eef67-7bbc-4a4d-ba10-ccf30c6afcdb@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently changed this code from using sprintf() to using snprintf()
as a kernel hardening measure.  However, that's still not ideal.  The
snprintf() function returns the number of bytes which *would* have been
copied if we had enough space while the snprintf() function returns the
number of bytes which are *actually* copied.

So if there were an overflow, the conversion to snprintf() would prevent
memory corruption but it would still leave an information leak where we
would read beyond the end of "buf".  Use scnprintf() to fix both the
write overflow and the read overflow.

Fixes: fc08e0b8f099 ("fs/orangefs: use snprintf() instead of sprintf()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/orangefs/orangefs-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index a5fad515815e..e463d3c73533 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -396,7 +396,7 @@ static ssize_t orangefs_debug_read(struct file *file,
 		goto out;
 
 	mutex_lock(&orangefs_debug_lock);
-	sprintf_ret = snprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s", (char *)file->private_data);
+	sprintf_ret = scnprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s", (char *)file->private_data);
 	mutex_unlock(&orangefs_debug_lock);
 
 	read_ret = simple_read_from_buffer(ubuf, count, ppos, buf, sprintf_ret);
-- 
2.47.2

