Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BB17BCB
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Mar 2024 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709703053; cv=none; b=obhQXrT1EVG5ro2WYKktMaCFSyvDL7nM0z697KwkGr6QrCoDY9Mqo4uyy/mrE6YNITN5AXcynWjFg2MfNTbWFiOrgST2wJy5gPapHR83tB9FWOjuufVuks9RJ/UlgMrli5MykI3dWjn446H2RUSsro74jZYWwrMKn1MOYc9HQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709703053; c=relaxed/simple;
	bh=OY98z60/QzvLbbjJJOeTrYBjG7cId8nlzWYX3q2YOzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=koguKun9DZ/iWdqUyu5eZfyZy5pFS63TSg7W11em24m2BWj/krdBe9zj2Lx4zYnDOtWcn3KvgkRgbzA6CYwJ378jnKxUPeyp7Qfdte0R3yj4GLhNoUHMi9oTpEuMq6N0lDBovdUWK7ivC+aDGvwvfuJtdDqFkj5etu46VttFUTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ss2OTsBW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ss2OTsBW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412eeb018ffso10225115e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Mar 2024 21:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709703050; x=1710307850; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNOl498zVyqa8QNphWPOEGcqb03+QO3BzSaHzQ2kTRc=;
        b=Ss2OTsBWOLOVZ8wXUd8p0cgQFMprlBmnOgJAK49pv3Ptjf9za4+uY0go53tpB6zJwI
         7QlHLjxiPk+on6xs5WcS2z66voO/sidx06UxJ/bBhsvOXMfxr5Vw+7WimQKz6JsGcKML
         7QvN9JU5sIWtC+Wk8aj7yATii+8AyfaV/t90009ddIWqhUBsKfdXJhtV2Jkrj2W9nOBG
         fgqg22Ja1kDD8eFQTi+YSBRnPes0In5rfcDXShCUlktmKCQEj0URIBoBK1wAuSpOGGd+
         QF5QhLIdKgCBeD4bfDuGtEyOTELmiXt6YXuXPeqk7YOgQDn3aaRluUaEFruvBkAdug9F
         7xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709703050; x=1710307850;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNOl498zVyqa8QNphWPOEGcqb03+QO3BzSaHzQ2kTRc=;
        b=fttLA3hoikbxhyoZpUbtbFCPfvBavNVjJPaTDQnDhdai62TMiFNiJ9QvaV78Soh4JX
         hEkGps/TThxOtG0CI9EZAhJ2dzucdwLCZ43CRfnTMOiuqx2BexU7yRBql36IKBGBSZDN
         AoG6jIeqCd2d3D0QclI7L9yOPRhdbxthP0fBdmOOeyNM4Yt8Ax5ciQiJ+TFq0pb+8/6i
         gv7RgI6HA4VOjNNYYisuITQDazCECZkJOmwhBUWwAEuB33EG9TYFgD8ZrxILDywjPMUN
         AV2qM7zcxy3q5VNFnvJIt0L9VaIXqkB2730ayrTlatX6b28A7P1GtJWDUNWkXqXOmwbg
         eWYg==
X-Forwarded-Encrypted: i=1; AJvYcCVhIdBRThHfklXXHMq9afdq/1z9hJVkpjy9M7DgIUtNbSZzkOo1qitYgX+3nr6goKPNUCAUrPoL3udxasZ94yAzrJlb0sTQEwjUpjcb8zYD
X-Gm-Message-State: AOJu0YwwquWJV2IcSlp6XRr7aXq8uyhmMSwbi/qt9Uq9lPAqWFdrTEXv
	2nFkz3+r6gFGezE+n5CYoVDfhXOCNYYgvJH0ZwUWzCmsDJm7Acd6zbsa9n7CXNs=
X-Google-Smtp-Source: AGHT+IHUD3k4wXBn/nqincbWXBgb7lYot4qWLOwu90kC6NiIRRaWqliTeBdnFMWQzdTP8Ja5lYSwZQ==
X-Received: by 2002:a05:600c:3596:b0:411:a94a:1ee with SMTP id p22-20020a05600c359600b00411a94a01eemr12189693wmq.21.1709703049710;
        Tue, 05 Mar 2024 21:30:49 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id be15-20020a05600c1e8f00b00412f6c695d1sm421000wmb.43.2024.03.05.21.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 21:30:49 -0800 (PST)
Date: Wed, 6 Mar 2024 08:30:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, naveenkrishna.chatradhi@amd.com,
	muralidhara.mk@amd.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] RAS/AMD/FMPM: Fix off by one in error handling
Message-ID: <6fdec71a-846b-4cd0-af69-e5f6cd12f4f6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Decrement "i" before the first iteration.  Depending on where this fails
it could free something from one element beyond the end of the
fru_records[] array.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ras/amd/fmpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 0963c9e7b853..2f4ac9591c8f 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -817,7 +817,7 @@ static int allocate_records(void)
 	return ret;
 
 out_free:
-	for (; i >= 0; i--)
+	while (--i >= 0)
 		kfree(fru_records[i]);
 
 	kfree(fru_records);
-- 
2.43.0

