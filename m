Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB32FC020
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235726; cv=none; b=rsrxoKCPLTMK6iDjtEx/rLlwvMHaNBTncG4TCfWv9rtjV1T2sWKo3ZN+SU78TRohB5dMXJcKsg6hO17Km45awI+x7Lybcj00fCZImmIIub7bE88fTJ5iQCmMkTsr6TcqnaqujHlG7cY99qEsaaOiCSqSiOivb/eyk9Di6/8QlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235726; c=relaxed/simple;
	bh=yM6tDmlWt1WChkIFaTtxrLwmPUG8oTR6CTdlN35Dv4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OwKTlnbnixxVxrVAMxCjpRWgfXF/6jhxP/SJ2TV6X9HlrhaspYzrSAB49umnQVZLx0j+ahvlN583T9YrO5taGc8wm3W0P3TNJznkNEftYtTihyQdKHjFzZiHJTWV85FrYIomYjGpCxo0ijx2N0wsfmWWZhRHurm8NAetpXBXdvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjUTjdQT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjUTjdQT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso4522508f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235723; x=1759840523; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+weuOFR11RTE73x7k9JMqdyo0oGBleP6ZLjJS43ihs=;
        b=tjUTjdQTA4Ioh9a3kzYTjg0MIPt81iEf9pP5ONRdYWEXfeFrHKNmviNXrouOM2PoDC
         pUX0eBBhg5MYgAoqHZEGt5VcnHgNudKd3CEpNIcgL/1aZzh89H7rmf86dt27lQJ2jnXJ
         NK4eRiPkIIM3JQaxswtjjnqdkCMje3n8qai7ZURH4IAJm2v8nfV8NeVUxftG6sY5qVNY
         kECUvwaRRl8COZqCxtkPmoRDG/3WJJsAFob5CboGVD5RAAdCcXP+idujMCKhj4Vp9Mog
         WDv9M0hMwSAoWSXLgaEYL3BZ/PsIROhC7OFoDahhdyWYKocCXLuV7vU2uWGkNIuK3IWN
         JGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235723; x=1759840523;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+weuOFR11RTE73x7k9JMqdyo0oGBleP6ZLjJS43ihs=;
        b=Iy2vBBKmN9VvXlcxunYEd2Gwd1EPBo+FSQkH1BF8Y6IC5TaSguld6SbMpzVycNvhFO
         1g91ND4l1S33AIYNtuFnYk1dsJdqGWxaUW9hsqLbZQtFW+CuvJRY33aWLJaYGbWtgFZS
         hscivwGkYJ9GgTdewNEKNB7Q8RysMFG115/tvP+aJ8hgUfDNevOiuus1RRqQqnfJmgL9
         yf80+v4OkW2x/lqHrN2x/jgdYNyZWg+MpMGP8YDwpq0poGnONM+gvrf0oR7g8LATyr28
         MKExIqoIWgiA8kAthBkdjCUP68qmm1NICqhM92xWYWGY6dPUZsSs2fJG8/VrMeoQ1VP4
         VhUA==
X-Forwarded-Encrypted: i=1; AJvYcCUWMhbap51hAsLsmvShUiZCU8age2De/Pae6BU3gVJnN1tPf8ONruHsjceFo+jdVIC6qmXJrfDZsTzXOjAoHy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+you7RthmPzaSPf1y8/V4ETHSDorSu+JXBXpnNaoanCwdo5k
	DtZmcrCO1CN+43j9ns1HnDhIbEWdTr+C7jDCFWhxX4pFe6jd0bVfSPmTgaQ0zRZrQ+8=
X-Gm-Gg: ASbGncsV3ZUo4pNxbpMMKeRiCvfq5HSmoJcNlyuUeEpheTx+1mmPdZ8iESJ1avR9R6i
	5LKyNzO+4Jtr+sYFHAXQsW5zH37WhVkTuIuZ1J0/vTvWx36kyMtBC0DYFchCzIWK9mbV2pV9wn0
	tghLT6ifSq5LiOx0cLiuvRdXAznjLq3amkL7KyYUkLfKhFUfdbkwt8TgDgE0D/wDfwmOTbFUHJ0
	ifnf9nJ+OubhX/iQ4OTAn53mXcBK7m6/uX+T8UTOVA83nszNw9dTAdnwghq9RDlQrju7HKUDFN2
	UCxvgXEcbeassYfH1y4yRpVqGKl+CSgeprhNIYfh0ixuqfxmXPSMkU8EKknquIsih/xZPH617+u
	9I6SCv59tc1S7p0dcJeggIER7J51DgkqWMNmPewemYWsyp5PlNieH
X-Google-Smtp-Source: AGHT+IExzhhRL4g0b5oYQkaGb8IxC1lzH1rFGpLqAVr20/EVyM1DlA4fKgF6AkHr74LMf2fRuZuupA==
X-Received: by 2002:a05:6000:200f:b0:424:2275:63cd with SMTP id ffacd0b85a97d-42422756535mr2370130f8f.48.1759235722774;
        Tue, 30 Sep 2025 05:35:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-41f0c467ecasm9793567f8f.38.2025.09.30.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:35:22 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:35:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Brownell <david-b@pacbell.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Christian Heusel <christian@heusel.eu>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] rndis_host: Check for integer overflows in
 rndis_rx_fixup()
Message-ID: <aNvOh3f2B5g0eeRC@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "data_offset" and "data_len" values come from received skb->data so
we don't trust them.  They are u32 types. Check that the "data_offset +
data_len + 8" addition does not have an integer overflow.

Fixes: 64e049102d3d ("[PATCH] USB: usbnet (8/9) module for RNDIS devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/usb/rndis_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 7b3739b29c8f..913aca6ff434 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -513,8 +513,9 @@ int rndis_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		data_len = le32_to_cpu(hdr->data_len);
 
 		/* don't choke if we see oob, per-packet data, etc */
-		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len
-				|| (data_offset + data_len + 8) > msg_len)) {
+		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len ||
+				size_add(data_offset, data_len) > U32_MAX - 8 ||
+				(data_offset + data_len + 8) > msg_len)) {
 			dev->net->stats.rx_frame_errors++;
 			netdev_dbg(dev->net, "bad rndis message %d/%d/%d/%d, len %d\n",
 				   le32_to_cpu(hdr->msg_type),
-- 
2.51.0

