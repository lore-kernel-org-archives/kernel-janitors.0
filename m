Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB217A2F8
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324624; cv=none; b=R3xl/50y+exOLiX3DVKNVStHEXQysTgxGhCQeIky5gk041qe4b+TPtYDuVpdJPQurkKuwjR3tkaBprQ20//46T5/MpG3Q2w0edfTwpINh8UNljuttnmXqOtj5bohKW5S7VHR8f0wUemkc2j+xtryNymVqMrNfgNVENqhpCHTRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324624; c=relaxed/simple;
	bh=OURZMg8Ef8IXmiVjiF4H1Y+g5xJnfN2ZoAXJr2sOcMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUbHr8CiL6D2UvTLihLL5jMxwqvEFElZg5h6zXu7hkBzK/1EqIe/rcKqam8e7Zrm8gs/6Ly6q5Lz0BqO0ys6kiqdxB7e7eA5agsoIuomcot240vjCQ6hYf0clRH6CzaYxmO4ZfwoA59nPkVbdTsI4sToCpO/dGrH2Jwe/l8xazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dr4z9nrn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dr4z9nrn"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so2109468a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324620; x=1748929420; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLieAIh94J6gkKijZufmzKxSpC/oK+MIvZ8kzKh+soM=;
        b=dr4z9nrnFfW1YHAtSRwrr0JW2yRqbJuhTT1drF3mHpkrNsy5e06zIWP+yK0f9YYOpG
         u4U8Ukjqen3Xfq23ch10KLXaVEeFBE9haJ08NxswCqIAz8CchlFozxFAmKEr527ZGTfk
         OJBoZe4o8v2URYsAhSqwoSogsGNWu3QoNyx59vIuJmwzwXB88s+HhaDSX4VpopnngLO3
         31dB27sdU0jsmG6q5m7nOb3gmzKgZispgZtMNk98sbKVEyzRjgwodGi/Q7My/PRu899b
         wEH0p3W1qrKnv1id4XxNMBxDV+qWuNjE+HX2X51Hh/hWx8kiG8yuDWNa2xpivuDFZBks
         FJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324620; x=1748929420;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLieAIh94J6gkKijZufmzKxSpC/oK+MIvZ8kzKh+soM=;
        b=E6cg1iR6KkVHnUZUg672g301KjoZ7xb83zg3WxTjJ/Y8o1fheTvG2sBxdbcHbigkHf
         MusaBU3NLG1zKsZNSVGHq8GCHg4HTawWiAJ3gB21ktsgJ2jGF+OZ/7lx6Y8yvLSMUIFf
         jYAtkcm2vmVdLfCXE9RU+H5f3lTwURZXRhKacIP7+I3o7JhAs2zBzlaMTWErpcqMJtxX
         rJR4ATaqfQCxux9fFq/oV2Ou4m4YqfUYfohccGCiXTQvhByVu0JTrQRWgGPgy3m4Fmb8
         pg4bPUvyqKptTrXo22UP/0nIHNA65F4cBXDf63PIjYB6vwVE8hXIT7LIhhjhm+x0K0wJ
         A4/g==
X-Forwarded-Encrypted: i=1; AJvYcCVNh3yLAkOi5cu6sjVHI826INcoGEEDefJQDKcyDIsUtvPA2PeV6FsmIKm7UguCWkuuvRIGegD5Ny2KWfpeH00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTEMIHXpjy0yhKbA2wUI7dsO1dDeqL1PO2ojkGOXUZyu7Ghib
	df/UOtcVsWrckB5NkOjypJdY4u4JGsRBSgOpW0ydu/lG3TtiGok+424mKhpuTzhMxPk=
X-Gm-Gg: ASbGnctHfby18R7j5C4mx0u7XHdBGkk5Ilh4LVDxIk/KgYum+f8oXR9Q3YOtu/JOnJF
	bfhyrp34u9MZAZAeFRbXxDHuAktVrs8C0efVWtd91G0m/9fUOVlOebTw+LIFs9qQIx9Xt6os+9h
	4JI0sxowypaGY1m3m1PeUPii+wxcd3+vaHBUGt6PN/sA24AbY8i7BVYaIXTlFBXFU4Yot+pzclu
	lJKW2uMKacNUOIY/Nk8/ygTm3MS0QhRpaJdY1NfKZY4Y5XnwCedD/u5RAN3W6Im90wfZdjLh/U7
	+TVYP0zTwHE+sW3DtymkJz2zXOupA4aRCcUXUCL3JQWm6eV0gtUDIqg=
X-Google-Smtp-Source: AGHT+IFmKrrq1O4ANeu08c17wZM+Eb8aGpytrPGvsys0BX7ope/iR0SZAmtj4dLBdx62Ecb4ClacwA==
X-Received: by 2002:a17:907:608b:b0:ad8:91e4:a92b with SMTP id a640c23a62f3a-ad891e4ab65mr54007466b.30.1748324620384;
        Mon, 26 May 2025 22:43:40 -0700 (PDT)
Received: from localhost ([41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad88523a96bsm142443866b.73.2025.05.26.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:43:39 -0700 (PDT)
Date: Tue, 27 May 2025 08:43:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jon Hunter <jonathanh@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: APEI: EINJ: Clean up on error in einj_probe()
Message-ID: <aDVRBok33LZhXcId@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call acpi_put_table() before returning the error code.

Fixes: e54b1dc1c4f0 ("ACPI: APEI: EINJ: Remove redundant calls to einj_get_available_error_type()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/apei/einj-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index ca3484dac5c4..fea11a35eea3 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -766,7 +766,7 @@ static int __init einj_probe(struct faux_device *fdev)
 
 	rc = einj_get_available_error_type(&available_error_type);
 	if (rc)
-		return rc;
+		goto err_put_table;
 
 	rc = -ENOMEM;
 	einj_debug_dir = debugfs_create_dir("einj", apei_get_debugfs_dir());
-- 
2.47.2

