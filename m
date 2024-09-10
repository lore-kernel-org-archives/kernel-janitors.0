Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75F17C9EB
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953255; cv=none; b=bcyzCGv9GwZTBI4lMkMnscZ4Orxo0YqV+sF/EzeMpUjgiED8ZEe1Ze98qKVcDWvnY19ebVuql8A4x3XalDjqXq6UTx5bJpK1kERG/Jdr06JuuMGK9itaZG6p6scYUij2rh2nef2QrbB64Nyh7jaLwHJkFXJkIvC93HxkhVQprnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953255; c=relaxed/simple;
	bh=xHp27Dl5rFoaVGhUHo6nRu+Kc8ifNyYXpBdJfUc/Yn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Un/wj87UYhMeTBTLYRwebhN7oCFLhM8P/JpV2GQB9N4B2dc2xu+4leLh1yee94+35WQLxq+pELjdwHLm9JacvXIZT+fHv9s3MnAz17edpYyM9c+8K79fBD0vLa2EIwGkowlpMUXB2Ruqu5ilYW6myRkmDNfYA1aLX1wt/nXLBv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVLO75QW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVLO75QW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ca573fd5aso34203285e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725953251; x=1726558051; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imHMW4srmvxlkZw05ahiPZKsauky+pygFs/tY2Ct9A8=;
        b=QVLO75QWp8YlQT+WrG7A0qWJSXfQ2G+9QsE8CaKan3SHnLqnDwuryXiQQ4LXfevEPe
         yYCPKvUB1HD7ELWrmGWQR0hqabC71SsfwIHTmIHNJOxq0zyVpt/6c+0qZnC25Z14z9Nz
         +IVjVV4+5ZzylscAXX14QJqwIjz0NWbybzNRXqQRdVM3l50L64Dn4GED/50hVquJTrNt
         Vwc9x7mnod+52WreiVCzrmjazsZnuPHkPvJNvnsP6MIrLYpkh5n1bXwZpd8WsxXZMWdE
         KPYR3bpzLL/ljHnMMtEiR9DSxlZZk87I14mdF/p3fEyKhfYSwD90j32a0NCIf2wc82FF
         Xgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725953251; x=1726558051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imHMW4srmvxlkZw05ahiPZKsauky+pygFs/tY2Ct9A8=;
        b=pbvOiesSlBYe8qsgvyldQ3MIQ+UEOqhxwC2DmI8T7TKizd9Cb1vnHABjwYXVcwpn6J
         gfX1KDT/h+W2B6PFR/cwnTF4TWEqWzEw8T4y2c/ITZXTAcCgXPtV0xA0Fov7DqybwqX5
         AoabhomzPG16omNSO3vMeMEQVQVYECjeOUvrY5m876x48m2IpaPglO5wT47IgLm1IgnJ
         t4IvZEIqrQ5z8tJERgckppYGSZnldKvqLXoDcLRK5nsiNN1brGowiyfyV9sRYW0fz3A0
         XnYWdorf4t+S6QeqftZZFVhdsZANAuRO8DIsfhd9yeXIjO2PWmUgWF3b65PE234yj0Rc
         ClyA==
X-Forwarded-Encrypted: i=1; AJvYcCWExmP+aRv1e24OV2zsbKhjeNB8uuhYbXsM2QXPmrdW3RXA3uTTCUf3c5cT3BVlqmE89CuinyA+s71VHFdTF08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHtVhg5puOziqyf0toCO3YU1j+gg/JDeXTtoFYmimTL92MGWw
	c4IJG+AYIngNOFk2y73AiAJvyNieYlBwSDnkL8ACDsg++PsrEqiDp+r85jU0qPw=
X-Google-Smtp-Source: AGHT+IGoJxhSFCZbyl7tqtAC8eWbUuCuNeiK6sk/bYCSGEBjaxZfva9+5Us1debP3cR6vVuVBeMXzw==
X-Received: by 2002:a05:600c:1f09:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-42cb8cc232emr37553905e9.32.1725953251538;
        Tue, 10 Sep 2024 00:27:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb1cf939asm86495265e9.19.2024.09.10.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:27:30 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:27:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	lei lu <llfamsec@gmail.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: remove duplicate check on "asize"
Message-ID: <15fc9478-cf00-42b6-820a-87a2d62f2766@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Commit 556bdf27c2dd ("ntfs3: Add bounds checking to mi_enum_attr()")
added a new check directly after "asize" is assigned so this check
is duplicative.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/record.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 427c71be0f08..0f400366231d 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -268,10 +268,6 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 	/* Check size of attribute. */
 	if (!attr->non_res) {
-		/* Check resident fields. */
-		if (asize < SIZEOF_RESIDENT)
-			return NULL;
-
 		t16 = le16_to_cpu(attr->res.data_off);
 		if (t16 > asize)
 			return NULL;
-- 
2.45.2

