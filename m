Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF41C694
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714822704; cv=none; b=a6X9pHYdD0utBV2PO6C9MK5P6pPGN8g4u5FgsA7I8tb9wsbM80eNi8qHNAqeCtvkZBF9UPJ/NFy337VLex3wiolW/hbvY+igsV+9KpmtzmmaCEq6b09IedfvQhPTP5coAQbVEzG/g/xV8Rdmd36ltDUzJamwia6oM5Kf4jWLMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714822704; c=relaxed/simple;
	bh=kQRzXgnB7nFNXcwztKf99J2NPeU2NxZM1fbn2TWKujU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chM3AsBjpC1+BnF45G6IGnsdAD2uDz8SRYcENpB15VpeEhIU7ViOAVZZbcIjjwGaN23X7fGBW78ZjTZrR9aGCtwhLIC49qZ2Fm4wyDgnK+cYeLRRg73cAo9IfmyME1nUQcTIUwwKxZMIct4V3iVwVrEBOicjyyhaXhmEgYqnuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpFSXYHN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpFSXYHN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41bab13ca81so5071655e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714822700; x=1715427500; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivduYjnKooIvCzo+9PZ0p3l6JwzFtME3Zf755c6CflY=;
        b=VpFSXYHN3A60TgHQfmXEfKVfl4bbK5kYUndShF+1+1CGI1ahElfCnGCVRF/nlpUpJJ
         wGGQurTHHjyNzbadprmzALIkBCXiftvG2kQzUUiYnNvfD56LjD7FXIiYHisDge8FD0g2
         +Kw3pEzOavdaOnN1Q5/6o77lnokVc8sy8sq8IkHr5VxOI/7bnhpOZVVF5DWqEDFhxt4G
         DLE/Hv27hcJy0BqD1eR5m0BRFLWEC/kNqFBeVfRaan2ouwxAZEjvZCP/9UR8g9e99sz1
         Mq/W4Gm0FV/Bsp4PSen5R7fop+O+hDmOv48cjhI34AdRAHWazftz6/Cemkm1ozLSPsCQ
         UKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714822700; x=1715427500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivduYjnKooIvCzo+9PZ0p3l6JwzFtME3Zf755c6CflY=;
        b=XPgF+9NZgnYTbj9MJkFg8muHJFfih9nO8Qq68ofJpqWrf2Ub0uCWKUsFqm6QV/yZmg
         YeJhwABAjNgjAFI6VR/NWjRtTJAJScd0ipAQGgGW6ICRvb2bLEzQzNwNc3nr9cAryTpb
         IC/Ib0NANRSPzwcGZQBDjYW1G24GoA59l5ByzepR1xmprDAuLr+sZ9AAUMdMzN3aOGp8
         ZdVgXD+iC6p/LB1biRLpN2vosbVE6pmUCUus8s/mRveen+ozA31QRSmfM0mZsuXSDan4
         11LJ1tC1eLkggXxKh8rZ5V+HmzHW0zHNnM3KTbxClAtb/vkQ7iKkBN+0S3MYcCA5X3Xm
         ZrGA==
X-Forwarded-Encrypted: i=1; AJvYcCWthKyO3tRODpkRdGqNPU/5xn0xpV3xZOBOi+4iJeNgPhaXe8miJlCWbU+dBSW+aFI81sJS76TEDDExqWP4PpXNZr4EpHD+4RnNEsT4UTCh
X-Gm-Message-State: AOJu0Yy7NphWwR+DwkeBEkickVolNdSnRWePX4bGvgBABeca0XfUg9fx
	mvA0T5Oy6famURRDnphF/hSwfPr3jBtp2jqlgrgZuPXhKP89vlfxIWtqJEPjX8g=
X-Google-Smtp-Source: AGHT+IE13i5FF6LnYXs7eFaL7mzVkOv7OzEOwr6FKhKkVK2hUqH4xy9GclUEwgwRzPcAf1rwPx53GA==
X-Received: by 2002:a05:600c:46ce:b0:41c:2313:da8d with SMTP id q14-20020a05600c46ce00b0041c2313da8dmr5347169wmo.0.1714822699606;
        Sat, 04 May 2024 04:38:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c450900b0041bd920d41csm8938326wmo.1.2024.05.04.04.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:38:19 -0700 (PDT)
Date: Sat, 4 May 2024 14:38:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mwl8k: initialize cmd->addr[] properly
Message-ID: <b788be9a-15f5-4cca-a3fe-79df4c8ce7b2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This loop is supposed to copy the mac address to cmd->addr but the
i++ increment is missing so it copies everything to cmd->addr[0] and
only the last address is recorded.

Fixes: 22bedad3ce11 ("net: convert multicast list to list_head")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Untested.

 drivers/net/wireless/marvell/mwl8k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwl8k.c b/drivers/net/wireless/marvell/mwl8k.c
index 9e534e0a324a..d3d07bb26335 100644
--- a/drivers/net/wireless/marvell/mwl8k.c
+++ b/drivers/net/wireless/marvell/mwl8k.c
@@ -2720,7 +2720,7 @@ __mwl8k_cmd_mac_multicast_adr(struct ieee80211_hw *hw, int allmulti,
 		cmd->action |= cpu_to_le16(MWL8K_ENABLE_RX_MULTICAST);
 		cmd->numaddr = cpu_to_le16(mc_count);
 		netdev_hw_addr_list_for_each(ha, mc_list) {
-			memcpy(cmd->addr[i], ha->addr, ETH_ALEN);
+			memcpy(cmd->addr[i++], ha->addr, ETH_ALEN);
 		}
 	}
 
-- 
2.43.0

