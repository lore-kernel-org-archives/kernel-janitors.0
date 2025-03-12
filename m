Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD2578C9C
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768390; cv=none; b=UIEyAD7BsAZ6HpG6YYRLN0bXX+wzXZGIl4s0XI6hkeWIYiCLDI0fvtHMBpKd33dAO2zDyrFeSYI1EXWxsSncwhDfwGkJpETyQhcJ6EwP7IHk5OlJoqcc3QWzHFkMCw3SGC07dpROuSf/75BI6S429tXhpvNBSHakO7YW2H4oK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768390; c=relaxed/simple;
	bh=pSo5vTjN3OF9dYBlqCsRbrqAPdXDHi9h8WPbDq3JzfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBoeYMZVshbdwgy56RDtDGa0ZS2jlcgpXyr0X9ES5yfBA6HZemAIbpWVDJvy42UjAbK0Ydd1Gzh9p26o6rd6FeXf3eo+PiDFrF7T1E+MEyuTADPgbPJZIhIq88Ux3b2oHJ/2maZVD0y9o+EQ4e1dKWy2FG7x8sfsGl8jSpdpcq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6k4ASzB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6k4ASzB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390f5f48eafso3112029f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741768386; x=1742373186; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hk846ocqbbU4c/o0fjWpAAvlpyCOyvBrM2NRYSxeofk=;
        b=a6k4ASzBb1G7kE6ckaJCr6lLoeoPiYyROxlGsOl8CUvqp7eHaZ45lmCLQf8shcPcTM
         i1Fi7jrMRmDN1ItAIrsCkfn+IyKXAkCZBPQOnzzOnwj7ClR1GRVWPFSbrBMu2uC1u0f0
         yrNCyTm4P1AcHub7B2IxzTHLs3cuU0FunUXxNWJmXGOWCbfx8J5ofVeDwzErwy4eGTCV
         TpRurDmSoUfqGyb1yPnsKyumk5Jq1KZ+EWJCufk4rQOCOkn9ziqFxfjJMY53t992box7
         ih/dHcm3hVA5eClo+5rL45piJkFZwvJy7aJyl+oqkE9pJ6fwAfGT/6hfahAXEhN9OH6b
         nu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768386; x=1742373186;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk846ocqbbU4c/o0fjWpAAvlpyCOyvBrM2NRYSxeofk=;
        b=aYTxZ8k0XEDy0UWBDie5du9o0xBzSQi5Sil0ACowVtMZc15q7FbgQlJWFSMm42NLCU
         7E4MYrYrBUkfDx9RFrcofZMMDfUcPtCEhyCL1uLDVFDZ/pzO9azSC9UsNmSdrp5cQWa4
         BVOj1IHypqxJWtOb+i5ae52quPhyjTYkztwZY2BCSr1B2QNAr52usBbOGtDH+nOEypg8
         Ehu15WftfIZrLyBHKOFwcMGHFctEZ21vH7NryJIuTqNG6Z+h8yDR/60riDFo2MJA4u0b
         7kgVBJ4p7N6sp8TxIcQBoWVd2OT7DO3XNXtrMjNcyK49xmJhgYoq6fOjhs/z75kG/VFr
         0yCg==
X-Forwarded-Encrypted: i=1; AJvYcCUIklZND/Es0J/+uzJaRDkrHfckU64KnoXaD1MNWXcDVEG70PiU+ZMwbkvw6WlDzPHPo8AI2I+HWS5MxCUbLwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNQbB460ADo+PoW29wzESBmPEJYfSNKGblM4FAAlmZljuNpXa
	ptyarRcCNhsR9ljERXmxnPXh6aNHpRZvnehQaAcH916e7iG//qTJ8GpyLHvDUEs=
X-Gm-Gg: ASbGnct2+4FCFfRYhLmkwrkwjZR6/nvjT5N8TyRVOFLOBsOlnAUS+9Bclu/5fLhEDOz
	CPcQfL+4MTQcSGwUB8SmzndlWjkIQ3pWeQtpWJiheDM9ZqRSQPhEQFhG6vCmCIPo//OQ0Ad57o7
	qCoC59FzMwmmA4CTObho9UBgaX2ixy3e7rJRwK6nDQi0vC9+g685AQuLR0P7N3vH0HJNB0rwj6P
	xDsAv4KxMhehOEztzbpnEyPiBkhNMxg8zwdbcsIwX9TpNcEsFdej91PKl3R6HAZ9k2qemwlzJiR
	39WKFB53xt2bsq9d//JQUBUJHaP4xUSKIR+iQ0Y5inzbVocjMw==
X-Google-Smtp-Source: AGHT+IH+soUGCO6EN3L3810VPuOet5YZmw+fbN4JVDjX2iJDlZI1jlgA7rGnGm4yrtxgN9st0ie6UQ==
X-Received: by 2002:a05:6000:156e:b0:391:3d97:bd33 with SMTP id ffacd0b85a97d-3913d97be31mr13299968f8f.13.1741768386394;
        Wed, 12 Mar 2025 01:33:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfde7sm20820827f8f.32.2025.03.12.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:33:05 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:33:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gfs2: Fix a NULL vs IS_ERR() bug in gfs2_find_jhead()
Message-ID: <ed5089eb-fb83-4c69-9835-dd64735b8a73@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filemap_grab_folio() function doesn't return NULL, it returns error
pointers.  Fix the check to match.

Fixes: 40829760096d ("gfs2: Convert gfs2_find_jhead() to use a folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/gfs2/lops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3853c422040b..0fd3b5ec7d8c 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -530,8 +530,8 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
 			if (!folio) {
 				folio = filemap_grab_folio(mapping,
 						block >> shift);
-				if (!folio) {
-					ret = -ENOMEM;
+				if (IS_ERR(folio)) {
+					ret = PTR_ERR(folio);
 					done = true;
 					goto out;
 				}
-- 
2.47.2

