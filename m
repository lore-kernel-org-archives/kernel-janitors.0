Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197EC1FFC44
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Mar 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339736; cv=none; b=KMAO+SlaQvUimNP/bR7RkB12gguQOx9x0TvP5syYtjKnmQ08aO1mlym4bqUBRIjUx1vGlKJIl9UhbYN9DgofheMV33eNnA9Rpnr69tOGwUP9rSYlW3DJmCrEfsvMR2o40ojjmoNpRXTHZzIgxCblLNnyipAxAVELFbmrwKWAdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339736; c=relaxed/simple;
	bh=6YeoeqWkwCNXJnRk/T6zgTx0/hcyWZyOla3rDPddU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fu8ksugCAgd6/ELzAwSwWLT/Qs8qFdHYaW2KPuwIRtgOxF7zhHzsJDKhvKXv8SSnpkK9Y0e0mHhx0KLAoXZwasaJN98PoeuIhoDU5cWgNtyn6UiBrV12ZNZF8EbjtcRe8WT5DV2jynIAv3Z0hwgsisHFnL/j94hl7jgj55Ou6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jj5z5QL6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jj5z5QL6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so13494675e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Mar 2025 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339732; x=1741944532; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ju5ZbvhcNx9BRsCMH0Wbm+2RjeifjUfGKt0f6VkL5g=;
        b=Jj5z5QL6M2VRGpNNaTVDfm1XFMK0VFQyB29azUW9wibYIS75kkjC7xiPKi+kLHW/hB
         iEuUtILRLlr0NXptIw2uYX1p5zuPrRgjv2ApLSzpd1kUmdE6opw+gHQ2A4N2Y/yW8lNe
         wfboyZoRzrPGADWwb5fIurUPHz/eOJCQStW+riumANjjhJz+105AC64W/dYFdSIpyCxm
         UL4La3YFPcgHJOLVHb0ZV6Ba2uTJT4S3nvwoZoVHifPADB5XQ+dR01COnhrr0Xwvb1cd
         Rw/0xwzW2EjxGObnEJzw+8GqBSVWgpIJL15883x9N/IlGuoz5/9NReGvbiS6gXgIp2e0
         RTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339732; x=1741944532;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ju5ZbvhcNx9BRsCMH0Wbm+2RjeifjUfGKt0f6VkL5g=;
        b=lWC/BbifGi2T2nG+GxiJPshGyB4/atZWvI/LyYjB7Wg6Yy9QcJSmTnEg+Y47qo6GrK
         bGuxTQRjrL0uPppR2TIoRWOd0epXSkHczyKOgu9wr5UrCX5hnrXFY6/KkNv+OaUl/utZ
         JJhZwXhZZufNqajcZEDaNMeNn3ZB2FeHpyiODr6xHdbgsmW4N7N0MMZyJe1ZMg3IfBQ0
         YCQj22AmyqOMBPLBsymlImZ2nf9RGUhrqFX7OaH3r0G8VQv23o1hF3+ZEJe/m+ZXYRCU
         n7FfCUX9n/4MrebX5lwHpCac7N3l6MfDZMWm04aBZuYYIjOUKXjImRQEkGQ6Q/e+YIhb
         pZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1lHpytQmgKE3/jGF+WvFzf1NsyLPMn9WzLU5imYbbDjTtQMf6jfUyG8cQlwH7NadayV9nDhuzkOPsppf5UjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGP22KTjl7BTpPn7r0tSgs7dbT0D6RS6p//mI3VccdH3+953k
	hq4w1cNjfepolSQGzFUcIeZODLtrFjrQk/KlrDZbeF6CKUmu1THt1dXBsbF/SQo=
X-Gm-Gg: ASbGncvBaaGY2qStNJF1SeO6/ygn5vIHWP1fn8AH5QTxmRj0yNmPZedlbYNoz+tjwis
	xsQrCmdajqf1ghRYPr0na5C/OuWSLK3UiBqyLW5650YDMIXPolWB/e9wdXVosF2Be7DRQ2GXn3w
	1EW8+vwpZSLDT6adgLhTHaVb3aq41cW0ZSDwoy2IKUew4UAZL+Z1pWDQ/+wixViAgSF9BsIOEpw
	XUFxFCKJjG9N3s0Z+/PI1UG0kGxB5k/FjfgpIRVUI2pOPNEnkjx+NQpi+lJD9AsnQuzHH7lru7a
	0oY0syrVl6SOOGw6Q2TAqVKzpRUm3itrcM/TqMVpZm9M67pB5A==
X-Google-Smtp-Source: AGHT+IHy9+4P7rIHGn06Z9Wnp3OaLVatH22AMmyNL2OvUFsznE8mxvWG+6gIV29lYBEOGpcOgyg8oA==
X-Received: by 2002:a05:6000:1844:b0:391:3110:de46 with SMTP id ffacd0b85a97d-39132d98a83mr1919691f8f.38.1741339732054;
        Fri, 07 Mar 2025 01:28:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8b0461sm47647725e9.4.2025.03.07.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:28:51 -0800 (PST)
Date: Fri, 7 Mar 2025 12:28:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lee Trager <lee@trager.us>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] eth: fbnic: fix memory corruption in
 fbnic_tlv_attr_get_string()
Message-ID: <2791d4be-ade4-4e50-9b12-33307d8410f6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code is trying to ensure that the last byte of the buffer is a NUL
terminator.  However, the problem is that attr->value[] is an array of
__le32, not char, so it zeroes out 4 bytes way beyond the end of the
buffer.  Cast the buffer to char to address this.

Fixes: e5cf5107c9e4 ("eth: fbnic: Update fbnic_tlv_attr_get_string() to work like nla_strscpy()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
index d558d176e0df..517ed8b2f1cb 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.c
@@ -261,7 +261,7 @@ ssize_t fbnic_tlv_attr_get_string(struct fbnic_tlv_msg *attr, char *dst,
 		return -E2BIG;
 
 	srclen = le16_to_cpu(attr->hdr.len) - sizeof(*attr);
-	if (srclen > 0 && attr->value[srclen - 1] == '\0')
+	if (srclen > 0 && ((char *)attr->value)[srclen - 1] == '\0')
 		srclen--;
 
 	if (srclen >= dstsize) {
-- 
2.47.2

