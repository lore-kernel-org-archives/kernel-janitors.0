Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282A1CBEB9
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741635986; cv=none; b=rTu5VHkaBEMZm6/YSf8wKCBcN2jw5qOk690bBdTzR1K/cPF1hIQMCFqFOaS4hCeVe6zqxNUqzUnHJ0iDZD/pN60LqKAyJTGl0O1619iFL/wcj29xWOI931oUAENymoZ48BJ+lLoi2oChl97RXpd6ZGcJXB1RvFlVsEfXlpEZJBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741635986; c=relaxed/simple;
	bh=yPtT1URqHYreEI5ndrCPZSwQGTTEBPuFfvMnUG3ZU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dS0QyaMLCS/AKBJLjbyB7D49A7cudHZ+1Spoz5X4Y/0TtB8wK9AMPgz5PTR/6SLeWroAMwFuF4ox7TGzYjYqBr6i4vVZCaN86uhex/TNKAXAxV7yZTRs8RkVewgIVJdIstBtdzi7/jEcWY1/Qklhii9+5LO4Lebd4HbmMJp5hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOXb2S3S; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOXb2S3S"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913fdd003bso1007129f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741635983; x=1742240783; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvLfn3qhWG0LPJSKPMLdwGHyzm3ZQnbWN9kL2fMh4Mw=;
        b=bOXb2S3SDxRCZR5epXmTDOriYQ2VjsOfjNJGx984+FMp6W8h5nh+TKDpS5g7SAO6+M
         RByqwmm0F4r95T2ajtEt+9v4TRmDxHRtGxlpZln9Opg+J8FdDqIeN7bmDCFD50fnD6ZW
         rVzpx9OJrWarbGRpE9j9GwucNMgMnSWSzalz5WIC+41iIXo4V/ksDO14GZL+RW44crk+
         atYJi3nKRXDmD90yW6UqNLv3q6EI/ovdrPcf2pJcIliABn1dWr4hbHl4S5SmKacwAbON
         VtDeTzqxAcC2CqGxSJyoo7sWoAltCy63r9iD6neef3L7SwlQ+OcqBkSdzcK98ZXGKLaG
         RBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741635983; x=1742240783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvLfn3qhWG0LPJSKPMLdwGHyzm3ZQnbWN9kL2fMh4Mw=;
        b=RAinH3MeVvvhLnWap5GHcVv2rw8sGq6lskWLpJdn/dqNgTnSsU/wxQNTPdrDv58Wfd
         aX+IONPzOt+Zino7o/Pk9BakE8ScDHCEd32RZ27JGTXE0l8+GODBRh4M5TNPXmgbgTW2
         +OOgwRk8nsgosSi77KZ7a13ThN8aAcTPtdM2aOkzo5xu4U8r9nNs1yYk8zq381iNBhk/
         iH7UeF7XCqdHmJDYYSKG31Xsh5xyhHUG0GwTvvjs0wy4Qk9p7C0msaMcZ5jeFFHMYoBd
         SMFIvOZQ8OgWk3PRa/m7UcB6B8sZTI0Bx2qcmS4mpxrUT7zq58ZXcI0F/Kacf7ICfDbQ
         AR3w==
X-Forwarded-Encrypted: i=1; AJvYcCViHsJ+08bsVkUz3uESOqVHXyJXDEtKIfMU6OOMMzboaejpq8MyVdoPelkg28+dhPwJIeh49fIcM33bwsil7bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVUwCrDqq97xTqRaYduGv4oTzx4hHfWFLpAVP8uUn3jwkcvhp
	zEv+s5C2P/L8c5gL0BYP1r2c7dghaiVvX7BEY8B8UEikAtcTi1Vm5ozrzPnbJXQ=
X-Gm-Gg: ASbGncuPxq6ydeqX0Fn3bnenbePT/mwy706kUS6UJUW/Z2wPCDFTHnxKLYuw4dhBFKj
	1B6Nfy3y1P+bAR8LFEfxgIJ17Hwdj0Rg7vVeCMbo9UXVntSgScN3ozhdaWkBblscKM/IkTeLM4i
	GV3Kf7Cp2mRKHFNLIziJZtr4J8AmeSluWJSn8yx53McaChvtt60NW4oQTYziXVVCyqthja6o4e4
	XZk3ze1snwE0maesEh54lRVBtSK950lj0hSLvKUlgWQ8LS9K6dosU/9Qkh5I2EVOuX3FzgXTRde
	gDae8E6xGP+E/jBsvDNc3OoSAGSSF2lffrEBETMjr/Rj0HHSNg==
X-Google-Smtp-Source: AGHT+IEd/pl739SBNrD6h1Towv44982Wiak2l2/J5QTRayAEyqBes8blAzLgBmUO87jKdAG+98SPfw==
X-Received: by 2002:a5d:64e4:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-3926d123ba9mr995249f8f.22.1741635983490;
        Mon, 10 Mar 2025 12:46:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e3250sm15993154f8f.61.2025.03.10.12.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:46:23 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:46:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Harrison <John.C.Harrison@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gsc: delete a stray tab in
 intel_gsc_fw_get_binary_info()
Message-ID: <6152e1ac-745d-4b38-ba49-f013e6760936@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This line is indented on tab too far.  Delete the extra tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 5dc0ccd07636..d550eb6edfb8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -230,7 +230,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		gt_info(gt, "Invalid GSC firmware for MTL/ARL, got %d.%d.%d.%d but need 102.x.x.x",
 			gsc->release.major, gsc->release.minor,
 			gsc->release.patch, gsc->release.build);
-			return -EINVAL;
+		return -EINVAL;
 	}
 
 	if (min_ver.major) {
-- 
2.47.2

