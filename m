Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700A399340
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279567; cv=none; b=WGHmVZmBYAomTOXcYhzzxFikxLEwK6rEGh6JSD4Zf1O/kqrJ1/OS2iavlRrC/+IyxKt2hZxJjecHK8hK5/pyY3CVHrYlr/dYhyujp+sNzwuybws4qbxMJWOgEZjw2DwgBEpzLtEyZ3IK1eYbFV+FhmwkHtsh+Ak/sjHcqKUS3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279567; c=relaxed/simple;
	bh=yIz4iQK5+XnSElbvxpVyKeCtm2aB0XPWq06WwcY0akc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZlxCYg88/QbEyxglSVJGSyvuurrAYcsBDmNJ6NnTst2VJQUn1qXYnks2UUe1CwRJ4GtXgEbL1N0obvorEsdc/ExtMtYEbN+gZpmVf92SjKneEPVAsSjUkFws7e3+Kitkwr8SkzPDE2ewK1sTc11Po7XgTTAd1xucWTbuq8EX5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCBrHF6L; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCBrHF6L"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6128bd9b3so3877443a34.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784279557; x=1784884357; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=sCBrHF6Ln2FGGcwIUwNvKoSdPmWfQnfbsE9ADXb+kbHjVTmVe3p0zZWW9IUFIUOMmd
         BIeSCFEFGImbBlV5vRcjg4o8X2XBGqTIPMJBdlVWVNWM/ARmBvHGihZhZyJO3O86ODHE
         UuG0O3yskfFcauwXbsjt18UZpUDkD8zPxni5LgRZnQhugHlx10+eZOx2OYPMWMFL85Nr
         qGi3nlAxQEOlvBIlYuhKoLU1dXx3rvfbp0LjC5leFYJYXJuIBIOooRbminn9Sjtdj3a1
         2xysxT9ca5ysGgk2A0dxLc2DtQxftPLDd+2hPAbW45zyRQgV4Mf5CGmuayrxw8l3F4wU
         gXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279557; x=1784884357;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=iaOTE2lrCjamwZzlCXNTnQC/zLmHY0GCWXeNDnugCWpj0qUk+6U+wyN7Mxn354AdbP
         jujC+yviGjL1l/Y1YIfPoOpzG//g2K8tx1e1pBR+9z68WD7ZYRGFw6W+YL6yji9lKWh9
         6gVpuO7j/S8FMrTm6pdgx6N6EJ/vbABqfkoJdXwfM2P09f7Nwje3QZYPmB3AGNSN3f7D
         AurS7d+qrZFED/mk5xU37f6Ms9QdcVzEf8KaIkcHTiA4lK4K6TPFmJourLvRR5e7Uydg
         Zmo+URz3vvAEn4sEJiYLv4iEznB8ZVEkJVHLuZ3kM537BHOaisyQyb6VcLIkBj8K/gH7
         DusA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Cxtt7CtquC0Aqv5S7r2DcQnt57Q+UQIv4vK87+PtbL0nQeknZyL1io08ffFwPnGKLeJ94JVzGK5YJWB8JN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyueVx9H8LHLE3UwGkwImlnVFyA0VogPM6a0flAFXs2ofHBbBWY
	mKm3QPLtSwESQsc+mLzA4RPIgLEGHvpqKofJpqWbIoySbUwZMO+8gcQA
X-Gm-Gg: AfdE7clCo6Q7FAfbH1Mly/1k9K1XSNFIFB2rOTeLT2WIu2HDyAKe++kABRsU867TRhL
	yDi6/fbo1tFCtXiPNBb2qh3MQcz8mqMPsd8Ut/QvkOaLbfAiiQNZCFWcymyUGKsRTA96GUlowoo
	Uhvl59oWPu++khFDoGIPXWGOAKMHl9FjHI6m89j2PzQscFlMP/bq+CDexDU30Lmzs5aBwlMV8dK
	OMrxEHJegrLKb6t4+HYjgsornkBR/9ybJanDHyPcWmDG2iWn1oeh3SEkFjkc4lcUuJ89u69Hs4a
	i5SPzcN2eg//wZMcf5jowSmaO9VirL95DySK5YrEJwsl6an/MYGktuTOEi1FFppWBySAIEqYsSD
	Fa2i0/nrYnk4dsGRQcrKeTeIr+E70Ezc1zUXUhDfcHtf5IbN8qCQHJt+Ctzzm6oHIW75gkw==
X-Received: by 2002:a05:6830:6f4a:b0:7e7:7fbc:8e51 with SMTP id 46e09a7af769-7eda153c745mr905058a34.24.1784279557354;
        Fri, 17 Jul 2026 02:12:37 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm899701a34.5.2026.07.17.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:12:35 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:12:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: stm32: dcmi: fix some error handling bugs in probe()
Message-ID: <alnx_dGHIBYpZuHo@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a few issues here:

1) After we assign:
        chan = dma_request_chan(&pdev->dev, "tx");
   Then the error paths need to clean up before returning.  The first
   error path does a direct return.
2) The error paths check "dcmi->mdma_chan" but that is not assigned
   until later so it results in memory leaks.  Test "mdma_chan"
   instead.
3) The error handling calls dma_release_channel(dcmi->dma_chan) before
   "dcmi->dma_chan" has been assigned which leads to a NULL pointer
   dereference.  Use the "chan" variable instead.

I also moved the call to dma_release_channel() after the call to
dma_release_channel() so it mirrors the allocation code better.

Fixes: bc901885fae0 ("media: stm32: dcmi: perform dmaengine_slave_config at probe")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Untested.

 drivers/media/platform/st/stm32/stm32-dcmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index eeb0199864dd..c9f08b2465be 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2024,8 +2024,10 @@ static int dcmi_probe(struct platform_device *pdev)
 	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
 	if (IS_ERR(mdma_chan)) {
 		ret = PTR_ERR(mdma_chan);
-		if (ret != -ENODEV)
-			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+		if (ret != -ENODEV) {
+			dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+			goto err_release_chan;
+		}
 		mdma_chan = NULL;
 	}
 
@@ -2206,12 +2208,13 @@ static int dcmi_probe(struct platform_device *pdev)
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
 err_mdma_slave_config:
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
 err_dma_slave_config:
-	dma_release_channel(dcmi->dma_chan);
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		dma_release_channel(mdma_chan);
+err_release_chan:
+	dma_release_channel(chan);
 
 	return ret;
 }
-- 
2.53.0

