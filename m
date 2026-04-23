Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2403DDDCB
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928178; cv=none; b=gxnkeX5H9EEGIfOdn3kOEMivfSeYtwYb8nrGD/VlsYVY7iixqSBAYuYHu+KTvuuFP1mX+LXpENQhjDzlukgaAPXxhKE68lpf98ML/w9+54iNDcXY28rv8mFI1k8H3SlqstqkgIp+Q7tjM3tbZ8SFeL+pHIg/nUtZFRNwDUXF/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928178; c=relaxed/simple;
	bh=1lNCZRFETIhBr1Vkk6epqTXfzI/kKQkmv6oP4itdNbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UK9Nxby5n64XepuolIfgwb6sOZ7gfpMB7E/GA0kmjpSdlRqoQ3sRY4dfZlHL/92tihhGRM/H5zMqbB+Ol+iROTEEcJtU+tkmrLjdolKOkDq3yoqIfQGsNBI9lpPTS92YEJ4nTWGeTOcMmxu06mpRg64A4O0C9Hfs//aTyefmtFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqeBcHNV; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqeBcHNV"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7a43424f861so62007367b3.1
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928176; x=1777532976; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGKmSTNGemBMrvy+mTM+W1vFimf9R3yJOHV4XTerUnE=;
        b=GqeBcHNVirJ71j/7/RpNsZ5jQgTtus1ZcGTmOsBbqDvfw5g35Wc/rPxRGh3iHDKVRy
         V5bZDl4r4Lengb5ac3n3KAlbqCwsGk667clFAYBYPOIV0vESNlcpTMLt02qjCXEhenWP
         c8/DyAtSVEvUKOoMnmYCfJpMUB259jbkZXiWNDL8lZqtzD7C/l2XTfO7xnjZuQkB4mge
         l6ZAqaLVOO/DrNnoiP43WOyE2+v7qIqYD5G7atiIOyHibSI3yDSU48xi6Hc8OByo7Vw1
         evv/enJUrPiT8z5VwoDt9ASCUERRwTg4tVY6b497waBiSUHoDPekrPOGVYpS6dT5DqDv
         zPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928176; x=1777532976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGKmSTNGemBMrvy+mTM+W1vFimf9R3yJOHV4XTerUnE=;
        b=bS24gEiZJEI0pDrimxqKuCAySMg85o5hazVaJvj1BqWccoUTYlOmus9mi1ftVM9v1g
         mod3Q+EsIT6tyedVtMFMcahMU9puMzKg7cFiNNpqY8IxHXvYtREWJHLmH64ZkbFAkCcz
         2SA17dkIqro+raRnc/byxe9Jv8YWZpzWYxd/3Kq8KR3WNupW39nEhaiwWn79/Mfj7na+
         OVfjijgvyAKqlAIRx9R0GlOY1k6G/WWCDkSb9UyggD3TK7h1qmLN7PdfrDQTkH2yb8Gu
         7tIANZ3t+JL79lRFriBkb1mvqfIuM4SQJ28jiEsOapXNwFF5GE0TPhwIZzI6u5OMRLbF
         FYvw==
X-Forwarded-Encrypted: i=1; AFNElJ9SM72JyDsVhdlssUS0vhkVTsY1/br6qOt3UITV0yDZm2hGfl/T2ix4ES5BTOq5qnXU9dIcnNk0o/zRAtmZtPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSybKCulxm3sPpG2qQZNK8lbVxF0rzL1XSZ45umTBmx1TwUAr
	3aNLcbJo4U336DSON1fGxCIuFM5KVc2gzztmORmWulm7+1nbspyZGAXn
X-Gm-Gg: AeBDietH7OQUvxqqqURROqJfXsKTA4H3YIAkY2zz5BDWFl1GgY/MhyoAHAjhXFf6APt
	PTJknjKVUQr2IRp+Wxxbgs2a9zARVZjQ0jfB3KQbVdK6VvjHs0pV5ozU5O3zQdhG/h1ds+1YAe7
	4OGlHYbbdw7VWvie9VHouRRXocrvoAgUlxmmRiqCBOEwCOa1Ng6pmIecN0umlkQn8gYPmGDMqhc
	MCQoGTQq3BW4iGuZt081bf0q28PwczNp8N0PCOE7vHxrpi4qr701R10IMT7R/CqEYY/sVpKEZwe
	bVzxrudUekzGi8igTwiI/ILM9qC4GmdUJgrES+Bh9UkJK2sVugPI0DB/Dtm7kTJGhLlHfHmoVh5
	fVz6K1/fIrZxNsTVBgwFQb9xaiPly6YFcEvrJUPVu4ZEl9+IB/0fjU2ykh+iccVo6MAZJdbgGY9
	0JXk0qu/VwxHPOsnXiDnqlPN59KEqn
X-Received: by 2002:a05:690c:7283:b0:7b3:edc7:9bb8 with SMTP id 00721157ae682-7b9eccb73a9mr270364097b3.0.1776928176434;
        Thu, 23 Apr 2026 00:09:36 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bafee18982sm32189457b3.46.2026.04.23.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:09:35 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:09:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
Message-ID: <aenFqUC8X2CucQwb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
NULL, it returns error pointers.  Update the checking to match.

Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 636d0f3198b8..bb0cfd9d5db2 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -2360,7 +2360,7 @@ static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
 				   cs_amp_lib_test_get_efi_vendor_sysid);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
@@ -2376,7 +2376,7 @@ static void cs_amp_lib_test_ssidexv2_not_dell(struct kunit *test)
 
 	/* Not returned if SSID vendor is not Dell */
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_CIRRUS, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
@@ -2391,11 +2391,11 @@ static void cs_amp_lib_test_vendor_variant_id_not_found(struct kunit *test)
 				   cs_amp_lib_test_get_efi_variable_none);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, -1, -1);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
-- 
2.53.0

