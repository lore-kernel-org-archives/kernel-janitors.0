Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED81B7910
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2026 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698354; cv=none; b=fMvo/Jm0OmEgjTYq+Rr8HhT0OfoLF8KFJ2YhmgtKIOKPsVs5lesGwtxV93E6JwpbBAhY5bCMEohGXow//kcAeDhiCj7/Up4vG2X4avnu0OWSoV3GJQqtS6znOz3se1oK90CIXxhvgIAC2XPUqqt1PKsxl5s4m4u6OnRm2nptsO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698354; c=relaxed/simple;
	bh=1RIbNCwAwPZ+tO6yRtl9kZg4OcH4KIufSEgKwjXtJas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0jxt46SDtMpMXET86EdZZNREVs9yA18Z68m9D9vh+SzPVPfnzxADEjzz8rqxFr3B+2qb+Hgsfcr+/ztT4m6rcPtnMnkmKFK+lh4d62GcrajUkya21jGm+Evx6kLui4lRt2mS1Fz1l4eqNHrIkg/Lqcf6F2rkEVSdvXw83A4WLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4GI57oQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4GI57oQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43eada6d900so3197532f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2026 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776698351; x=1777303151; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3FD/s7AW/AHmwjCwKG79GXRWosFi6qB1cnUUHCz7DA=;
        b=N4GI57oQ04uNRA3ZJs9n1vawtacpjFGw7guLW337vUk7gecjBFmMJhZk2i6WzrsWh9
         Wz5q/VQb8C/xoJStA4dXFPHVbMdrQ18FkSbCpOuGapNbk4v6aXQWlABmlkeNziS2NK3S
         eSsnf0hSp1rGVLUgrwOCbN4V9SyepGekBScHUAeOdKRpgatz+QIt82DHHiPhYTL6rw2o
         QAy0Q96UtjHUtl01oJ3ttWVJK5ckn+njLs1xsnd4xMhwEMD5tLJvYpUP6ZODJ/b9gJEi
         UsAynPizdQXeAFerf18/qb9I3P/g8LuLs2tyIgD6Bm2WiuivcqN2RNQBjKKX/PyxOomg
         j/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698351; x=1777303151;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3FD/s7AW/AHmwjCwKG79GXRWosFi6qB1cnUUHCz7DA=;
        b=ICvE/4M5+qq7NE2Je6qXqyU/PfWCa2ptBRpx/hO7sK/rxbGoDhmcnyeWEZoq7JAv+7
         NzM5H0osrodW0wuguv4aE7Crn5gUqwMicR85owBPNpdWgE1SvP9u/khVr19N0v6C0L4y
         uCXHTAN0FGVCwvrd1iLvAN/E7JJRWjT5y2FuclXkcMC7GmmrEFIYMFX8MT+UsKGXD2v9
         qWkfizT7vr4xGquFM4jBV8JNTvaCoFizb4PUA37vVYat0aIaBZs2SVEcqJqvSAKWDCCC
         +M75hDgqYNCzWPyeh537IRRoGUqE8M7jiV0EyVBPWFzVjCCwgtMzyxpSbEcG3WvlD80k
         NVzw==
X-Forwarded-Encrypted: i=1; AFNElJ+XORYvYS8haS1HNSTpTp7Sq+0K4h+mlPbOdn+9TVKe8hiotNXclfPL2YpPRvNiXyFYbODeAm9dIOUkqXoyhqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2F2Gpy3e9HOAUxnoACOwgcJc4VKSv04IXYkyd2ohP7XwTvZQF
	HcMy2zFRoa2f+snShH+/6pTq8kRki9y8yKOctQpCATitjr2+whwMoW/v
X-Gm-Gg: AeBDievaK24xL49f1vJkUVMD9EovyMqs0saLWbiYyV+rdmUy2MUDvF2I7YA7apFxTVv
	PZLGifkzkRDVXBj2KwjXhu8qyuXiY/qoOG9/qW2S0Va9mkJNhuoIvy3ajYRQ3p1XnQV627MJ/1m
	06GYIEdf/VksxLaFFyBh650bjnFW/np1Lz3pWH0IbK4Gbxo55icyhaDUdiflx8jpRDRLFJ8t08q
	r4e3JjfwoJoO41gJzruUUUTUfJV7+QBtsQAzlQEpGfghs1h95EQHCU+xNJWMLvQ33Eu4Htw6rni
	LhNH3axZMhTit9QLAyWC0RCxprkQ22bemDpvjupNmrS3aE90KGVI6JdjwyrImFmNmhTgWu2oe1+
	1wmtjtlUoxR+VBT5FcergsIG+841UXQuyA4Lc3mCZRjQs42QabiMykOheerklIGwIGDrDqqjItZ
	mAshvznadBVuph5csczm0YPVbiWdJmxQ==
X-Received: by 2002:a5d:64e6:0:b0:43d:26a2:f8c3 with SMTP id ffacd0b85a97d-43fe3e14047mr22847771f8f.35.1776698351391;
        Mon, 20 Apr 2026 08:19:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm33822216f8f.18.2026.04.20.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:19:05 -0700 (PDT)
Date: Mon, 20 Apr 2026 18:18:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ahmad Masri <quic_amasri@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>, Maya Erez <quic_merez@quicinc.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: wil6210: wmi: prevent underflow in
 wmi_evt_auth_status()
Message-ID: <aeZD4hGhsrsSJczJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is this condition:

	if (ie_len < auth_ie_offset) {

The test is supposed to ensure that "d" is large enough to hold a struct
wmi_ft_auth_status_event and 3 additional u16 values.  The "ie_len"
variable can be negative but, because "auth_ie_offset" is type size_t,
then negatives are type promoted to high positive values and treated as
success.  The effect of this bug is that when we do:

	d_len = le16_to_cpu(data->ie_len);

then we may be beyond the end of the "d" / "data" buffer.  Fortunately,
on the next line:

	if (d_len != ie_len) {

the contition will be false so the negative effects of this bug are
quite limited.

Fix this bug by changing the type of "auth_ie_offset" to int.

Fixes: b9010f105f21 ("wil6210: add FT roam support for AP and station")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/wireless/ath/wil6210/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/wmi.c b/drivers/net/wireless/ath/wil6210/wmi.c
index 479b2418ca34..57e6a43a04cf 100644
--- a/drivers/net/wireless/ath/wil6210/wmi.c
+++ b/drivers/net/wireless/ath/wil6210/wmi.c
@@ -1629,7 +1629,7 @@ wmi_evt_auth_status(struct wil6210_vif *vif, int id, void *d, int len)
 	struct cfg80211_ft_event_params ft;
 	u16 d_len;
 	/* auth_alg(u16) + auth_transaction(u16) + status_code(u16) */
-	const size_t auth_ie_offset = sizeof(u16) * 3;
+	const int auth_ie_offset = sizeof(u16) * 3;
 	struct auth_no_hdr *auth = (struct auth_no_hdr *)data->ie_info;
 
 	/* check the status */
-- 
2.53.0

