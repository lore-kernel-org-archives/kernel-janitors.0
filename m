Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4216361978
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604969; cv=none; b=EIyLZCOejh3WqE7meWg1P568bm7clgzloGavX7XvUJemitVH/WSEx6c4qf8V8yvBkOhVHalV6IiTSRhnJOO42qYf65McJ/F0E/+JskmPn+72VllGo1TRcct2XX1UaY/qaTBMu6gOjQ+W1L5zilvd654BmcIX3H1Lb8fpXB2tN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604969; c=relaxed/simple;
	bh=g4Oc/MET58u7bnkBeWdGiQn7AbTG1XWXh7hiIo63e1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7Us7ifO86Rj30xfVtiEMB12huaDL+x7Fg6vdyuys6qaEBXM7TpaNKleT7z8dOTKSaqSaiYrlWe7VLnhpDnXDfXAYmawdBY5Y7HRWAaXBoahzp0nVW6MTqeKaxUYkw7IHK/9779jn+al9gAu25gjZdis4UFhfJdf7Uhug9k5MuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtKlC/ID; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtKlC/ID"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8efb708b1a0so11691326d6.3
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604967; x=1787209767; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZroItyF8XgwHC+4+NtzUTIlcTQFjRyMSooUeMz2hX0=;
        b=qtKlC/IDW2Vm0X6SNutWuWLKBLqoDtbOmdepgsFpHOCQ7HqfAXQHn5EjJl01JGnEYp
         voQaMq7wgGzP09y9qM9IpiWFkjei+hjU6a6PRGkmivA61JMsS9SOKBli1ueIDxPEbUNz
         oZIk2AmlTTRtVDUt/MamSLrjNb/IOtXQ41WPbfWGQ/0wxF9IeiJN5M6aiD+uh63rzRiq
         KbEN4jIPbVsjUEzc7bX23+KJlwiSZh6zcOT62Naz/q1aaCETO118mRpim7Z9W/cwTefp
         Gyo2CVGioVQ4GkmHhHgQZlNVAoK6EoBvmN1QZAPsGgVHLcrZDh4XMXfZv6zuOeoawL/U
         eVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604967; x=1787209767;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZroItyF8XgwHC+4+NtzUTIlcTQFjRyMSooUeMz2hX0=;
        b=fRyq9tLrLTAQOT7KhF/HvjmHZR1I+ys7W3UA2DSM0A2zUqmdJVJNILR+wOyVr8xmqa
         wy7v7VM5orQ58tB9HuW0MqyFohhVwb1IoaqNXCX90+JJhAwEKkhk8Qs48Lyy87u9PwdC
         Ucxw2JWto1bSpBmuzH2vd52I9/A44Ne5xHpWbsezQhv9EaGNtDUmuWf5/h0zuOJDDiNs
         3JyEWvtGvq9lRSnZvuNZkbmQ+NYObzZy1oRUkm0C1TqBJCfGmThRQ5Q7OXtbX2+vL8fq
         UJy27zFGf4ZGPZ6V+vX2DZTguP9ljTuEohBKYWHmZpk5bEeMBbyoFmnVu9sFLF4ER4Lo
         LRKQ==
X-Forwarded-Encrypted: i=1; AHgh+RppLoqBcGBH53/yEDTDAifzEdqXh5DW9sxPHkcErEHh6cWiabzF+2wFddmlVESHm9O1zqYGFK9VXLpMfHsTJO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzimJ2cy4YY8vbltwxyRVB4DBV3Hkn/7lSTIP+f0o2Lq73USQ1i
	YdlXg7BVzT+MEsMX5bUGAPtdE6l6dPKeCiJG4wPpMDcNgp/l9xwjServ
X-Gm-Gg: AR+sD106O1M2hXB8DkxMTCWf2fbobJxL4rUWE6Ii4ySNtIY3yo3NKp+1whfHL0lTTDH
	F/CWGlM2QU+KokDRuzAYw0Kj7y5bblDOJGk628LpcOVkWCdSphm6lWkzBtqyEiEVRliYyvG9GEA
	9nXD+Q1XHM0BDNpgRJdmQ40zVqu6HTIJDAT7Y5nkyHVv1jLF3JweGASI43Gia5wYXYecxiNgRkd
	Q2qhG3UD0mu3tF695ecgZ4Bw+X4Tjr9nrWx1/LDZjiMj4o7ZGniwRHFJiaDMQKc4JR46gG0I4RT
	X5D0rVTBbPcBJ2X+UH+mHsWGx02b58438ev8b1UHTMU2qyAZZp1W6j1PqAfPEhCeGPjRN/HyQ3i
	5R/3xzmzFGofvvMeswmE4deSwUPFdzEfZ3GnWn9z3nQn6IoOEFnGdzMBrOCaUPdpRhRCsGtCRKW
	LF/4IEecdguvK/XmTJxumnAR1AHuPAca4jl+tsoynHltGw+I8CGoYi
X-Received: by 2002:ad4:4ee8:0:b0:907:bf98:c8fe with SMTP id 6a1803df08f44-90a80c5013fmr27517096d6.23.1786604966749;
        Thu, 13 Aug 2026 00:09:26 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a817bb1a6sm9190316d6.12.2026.08.13.00.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:09:26 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:09:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] soc: qcom: smem: Fix signedness bug in smem_dram_parse()
Message-ID: <an1toQ-acGR0kOWj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ver" variable is type "enum ddr_info_version".  Enum types are
dependent on the compiler but in practical terms here, "ver" is
basically an unsigned int.  It needs to be signed for the -EINVAL
to be handled correctly.

Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/soc/qcom/smem_dramc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db59..6283e9317f19 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -382,7 +382,7 @@ struct dentry *smem_dram_parse(struct qcom_smem *smem, struct device *dev)
 		return ERR_PTR(-ENODATA);
 
 	ver = smem_dram_infer_struct_version(actual_size);
-	if (ver < 0) {
+	if ((int)ver < 0) {
 		/* Some SoCs don't provide data that's useful for us */
 		return ERR_PTR(-ENODATA);
 	} else if (ver == INFO_UNKNOWN) {
-- 
2.53.0

