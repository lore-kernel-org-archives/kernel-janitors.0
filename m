Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435828C014
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Sep 2025 10:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068488; cv=none; b=Oc9udpCNYAo5h/uzlvBsGdpcWGurEzff7jxxOWHxjnnOMCRujUO4egqZZtiQmddNXYYp96SrbvIqOixUBqJzC+iPUlmx16cC9R13N8ZMgV8cKkgdRP0oU0ntm2gjBQvKBxM29eFvtZG8SyDzamTzsR7DbMEt8MnqP2V1G0xwIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068488; c=relaxed/simple;
	bh=u6RhB0tf0PDdBxV2rbvlgcsSK3l7osAwo6tTvY3V7jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIoe273HPAJa9YOoX2UyjhqPVzW3WW1mTdT9KswkQshzCt/2zfHG+B1jclp1DCWACqQb28YD5o2aCia/ji+yh5LJvcotspywsVGNMqSZQpFXYWqkAYyA/KSoYGHiWgwnQrtP+ghV+LRZZdVKv6/rmKtdqriA4fowjA3gdKaaAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDtm8cNd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDtm8cNd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b627ea685so15746845e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Sep 2025 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757068485; x=1757673285; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPtTBmTlI3N0NEb+IPUhn2li4g4XRE/ENCP82oW3Ymc=;
        b=DDtm8cNdvV2i0UbcZdJkKhttMeS8Ge1GZO6/2sOLoaBmV0Cy8YGY4P1pqt0cRU3ffB
         uZOxLjyl99lUMFuT2YPgdHBvXJ7UPamY1JRM9Jb4F5VTCCbWW1kPiZ4iPu0Qo7cax7Ty
         81Bs+zgXlE1A8f/wSNCP0t2WuKgoVKP4Cvw9dxJv6RMuz6C/8EtW8mkXuZG7oS4KHhKB
         SlQp6BiPWfZPhTXpm/VHVal7q2SHwIbu3zC517XH7LH83IgSzhaRak9TgHDZ7xYFiK8u
         f42EWOVh2KLenHMpUV/AvVqP7MV8A8ZFcsI1kX2B9BKczikqemGfreSq27b2cvUFw248
         rZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068485; x=1757673285;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPtTBmTlI3N0NEb+IPUhn2li4g4XRE/ENCP82oW3Ymc=;
        b=SmyZ9NKkKHS4DRDP0Wb6xznGIC6M0NLgkJIi0BEBITbWF1k7LrupYMY11MIpVI+AXe
         PYrM69hYAhlBgQW6FRUjk+yYnqMZ8Y2Kai+hFcdfq+Hc0je+qatQPsxxCUcpr7v0VV2K
         5xxotqRfhSVpKUrlU2Rjtmiu5Hog0hMkWFFTVF1hnedCrxCKM88EdCmMGC65pL1ErFz4
         hA9LfzPXyyMDeRDaxFDmlgY8UsFfFL8N6nthB56BYLzs1yOsIyziOeGevJnJpnIqN6Ht
         2EQt/uodcbhQYlnKabLhndFV5aBtIk6FL5Itm+cIha6ofFekpwRJX5mOgWE78R4mhW5+
         pe1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3CWqAgw1tPOpYf/vDcaq9wzggpoVb52gaXFFGNcil0B2omISwxxEH6TY3/O8JljhafnmJ07tkHfw543Gsp6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5evvyZVEMsnnfBQNK3JvrlMwIqEpS7lUtEaTNEJbg1xALf58m
	vTkP4f2HAA7Z1lGMWNDlqRkNZGyN8riRTe/hSu9NTm+BvGshn/mqVRo9JxDuu19Yw2rwx7FDQBH
	h13qx
X-Gm-Gg: ASbGncvLNo1E2wCFsSDZNHe7fZHl1FaUJD2316JnukUVRyU8yaS0AojFMxT+5EzU+L+
	2jLktCmf4i2/BVV/ecMeUXpCikXOnp2+vFODRnxf04hlHdgzlKi61OLXa8XrPgOrcckIfzaL0w3
	sWdN3RIVCW1HDFBZb9ujcAwpYLQzc9uWKvZhFDvxz/d5XAq+h+m2/eXLFdIXboX0PtkyuLViKPN
	ZqkozAdxWbOnXCaIQhZRqgIWqxXm+RQtH8curPAdFwBw0xj5VwYGl9pZfNSzpRj5QAosavacOAd
	jG7xRG4Nbti3iB0xY152tlqeuzOPn/SadE5ruG4/Q0ixNVOD+nYzbobQyDUe0opuho+IjMPleYj
	6bj9tJhT5jRO9PW7V+7Uz+oiVkaM=
X-Google-Smtp-Source: AGHT+IHMNZ5aQjypfVjJ8/LG9UBIbm3yubJahrqfypappgfPyW+RM4kefqenC/by5O/ylYVnmWRXlQ==
X-Received: by 2002:a05:600c:4454:b0:459:dfde:3324 with SMTP id 5b1f17b1804b1-45b855b34f8mr173869605e9.29.1757068485001;
        Fri, 05 Sep 2025 03:34:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b9c5c89f2sm137991255e9.14.2025.09.05.03.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:34:44 -0700 (PDT)
Date: Fri, 5 Sep 2025 13:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] kunit: print a message before triggering a NULL dereference
Message-ID: <aLq8wXJraE3SBPnP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Print a message so that people reading dmesg know that these NULL
dereferences are not a bug, but instead a deliberate part of
the testing.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/kunit/kunit-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
index 8c01eabd4eaf..a8b6e16f4465 100644
--- a/lib/kunit/kunit-test.c
+++ b/lib/kunit/kunit-test.c
@@ -119,6 +119,8 @@ static void kunit_test_null_dereference(void *data)
 	struct kunit *test = data;
 	int *null = NULL;
 
+	pr_info("Triggering deliberate NULL derefence.\n");
+
 	*null = 0;
 
 	KUNIT_FAIL(test, "This line should never be reached\n");
-- 
2.47.2

