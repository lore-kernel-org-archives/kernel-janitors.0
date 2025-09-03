Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E9256C9B
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Sep 2025 05:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756878751; cv=none; b=pwOxxil/dDBFmyNbQe+P0TKzZD/N+EcjeA2IfblxHlxfCnkn6ophRtHLQnVL1ozoFdxX7RjPYNDCfZSyUbizeoYvJIc5BUd8TdHHZ9D0ZZ4MvpZzMpJBKHTb9VCBdN2O/lcnFOJcjTXPzBR0nbhnVHVlZwpMTC2jZUDwD0r7zPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756878751; c=relaxed/simple;
	bh=pUTayYOusLzNmrYT5IbElVRwDbAaKIqMxWTMYYd647Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN4UM8NVgzgfRa7APfKZsNNJxvSeuu+mZpn+D1MHxXnPUSf6q0b5UnN8nq+8NRsSFUObfVaFYPpa690vHCZuSuI7tlXQnqKMBntvwRQZZOYkGCEWnJJ2TbPccZ8MK5fAhel0Q3awoPy9/yBdcgbRaUqnBZEVQlcGCPU0VFYQ86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcRYAlDw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcRYAlDw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3cf991e8c82so3376604f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756878748; x=1757483548; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2SHfXlAMbQlOhrChDAPutEQWuy8htWNPwTHbTwvBXo=;
        b=WcRYAlDwjCIYGQptIX3cWB80pmoGrDl5OUHWHQmjayWvBe21c7yPXtZgV6fB7DAgzs
         ySuGp/8HqUggs/nJNVLmg1MH4oEvDWABZc803qw+/sIAUNuOBMiVPxo/a9rNEI6tja9y
         XsVCVtNK0bzMFBR45TdlhOUUuFMVXKrlc5h5PrZfg29idx6MeeZVSuku3dByPWgHiOoP
         lbgFA+bfst1tZ3ArYbFom120c+mlDn420O4qjqJFckA22zu/GX1/M0SiEiXx1miQvCG8
         u924iYTrX0LQqPGRxLDe5z9wFP2CF36kD0skqjLMD0FEMDK5GLy1d3VbUs6+S4TZArnC
         nwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756878748; x=1757483548;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2SHfXlAMbQlOhrChDAPutEQWuy8htWNPwTHbTwvBXo=;
        b=gCp8KKSlk60LEdPfuTFK8QNrWhOKMH3xQe5m4L4yom9EGTvxAbbNT0gzAoofTgVTFE
         VHeXi76OlqRMe9EpSVBSeuEGHfw+NxIfuN68L8BJuvK+ycJa2rsCaUlIFflQSxtA1Pfh
         hj36oWAAf0p8BANuO8HTLYuZ01z8FNph5bxpOXaL2XMXY27TwQISCfjG3QikAfl0lRvU
         S7vjaaWF7/ZnyS1rIt8Ue8TuCxDWDGszrLGknpnI6016yUwGxRA1NX/rQl7fCOntag+R
         N3WrZLfzmVSewZ7vchupCbL32pvdyilTZfL68RvdIJPEDmduWSJJRwJ1moLnKb+QHhqD
         6SSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXws4UgsNi5Ty0Eg2FKYv6oGjVWBlBFXkwAXf/zGRc7VDp7lxn0WvZdtVKPa1JKbTh8WLhGzmotAXB8Bw6zLlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xQkjYS2dioobcNncO/SGw8qWBaTGMlzvTmFjBN6DBzYfyeI4
	0+Vfn3H5gvxcPH0ooSdwvyrAEXzH58HgtwHZ0zMdVdtmg4K5JeltOEdPK0q8Ou57J+w=
X-Gm-Gg: ASbGncuS6pIw4j1TltwLIWKyx8+7lycYj7P8+/k1fyq1pRx4T5/twRlpIyWlabWZ9+b
	uhAlTEacEvfFPR/bdQggdn4VIEPONqmRtWpYAFjEM0PFuXg2t+UvEbtYBRWb0s0cFjA8J3yHi4I
	EwByiC0SztaStMxGvyw0u/95nWInYtTZYA8AaojTIm5acr4qcTi7BP+EneIwD3S0yJi4omLZqYc
	fm8T6SyZrhKd7vRHuTRxVhM0/9kIsqbtwR+OzCtDnr3ha9GbQqk8qDUNk0BRqwhhqpfgCAfW60c
	EZKHMrgUQC+T3YCa65+2fEKKsukhY17LichsrV9vNouVHAd9pbmXmpgPNBOyR/U8vazvJUP8v74
	d0qIMN1jMRc/sz/vwmDDG6vZtU4GDAtz/zmH2IQ==
X-Google-Smtp-Source: AGHT+IHmTYpS8pExI03NdGUx6gu4VM382Zj6xNSSMkKqIjXWiMXf3gSWFiBd4pm21+i3C4X/vRakRg==
X-Received: by 2002:a05:6000:3110:b0:3cd:6cd:8c2 with SMTP id ffacd0b85a97d-3d1df72effemr10191588f8f.60.1756878747702;
        Tue, 02 Sep 2025 22:52:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d21a32dbc5sm18690066f8f.11.2025.09.02.22.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 22:52:27 -0700 (PDT)
Date: Wed, 3 Sep 2025 08:52:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ALSA: rme32: Fix serialization in
 snd_rme32_capture_adat_open()
Message-ID: <aLfXmIQRFTXr5h8O@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We accidentally deleted the wrong line of code when we did the
conversion to guard() locks.  If the rme32->capture_substream has
already been set we should return -EBUSY.

Fixes: 8bb75ae244c5 ("ALSA: rme32: Use guard() for spin locks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 123dddcb6972..ca9bbf554650 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -936,7 +936,7 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
         
 	scoped_guard(spinlock_irq, &rme32->lock) {
 		if (rme32->capture_substream != NULL)
-			spin_unlock_irq(&rme32->lock);
+			return -EBUSY;
 		rme32->capture_substream = substream;
 	}
 
-- 
2.47.2

