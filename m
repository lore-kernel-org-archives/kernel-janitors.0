Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BE1E260C
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768307; cv=none; b=oc4OeXdI/sR8SThlb+K67on5Ak4cc+yWeF685bSoWtpVkTHftK6h2m/rS9fcOA2MedynFATSUwo66DLbQ2noG5wRyNYogoeHkoeNPyShqCf3Pbb59f0OLMiKRSMTYuqfux8GVraR/bQ5PVDsKHtG9g9yeGsYmbpAevhqcnVh3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768307; c=relaxed/simple;
	bh=FT1oxj0Qgt13l0mXa+EPVobcY1J9Jerp6oe4CFShQJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKpWQKYCR2mZ0WksyuNbyzb5uYWZTIPVMmjtvLowZrx+X5maXBSiDfEyMJ721pm11d2T8Q4EO3a1kXvBJ6nCXdY/cMxG2vAWQpa/9rYglUfT1JNI4oNGeP3ixXnLOKFNzHLawUU7O+lj7+Cxt4i+q5lI6vr6CqNFpv8Ewo72nzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbWrMUD6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbWrMUD6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912c09be7dso3478559f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741768304; x=1742373104; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJss9g7O/dMXFJMt3GukmQPPAokmf3Hhu32HSuWCJ2w=;
        b=tbWrMUD6ZoqMKKOfJoldMDr7uzKzfGE9XlHAePg5Vn2uLXXztXqM18I6NsspXiZp7S
         W59oWEzgwvSveEethtWfFCFuYsdQ1K7uCyQPEA/QxfEZke7IosMW8TVbjADg4/MccFyF
         ih16ClDgljIjn/y7+rrpzOjdMkSDRUIuwIjViBon2RbMfRXZ2eliDB4pGjNUDkdayOkz
         k70Hf1ubIEI9XuTO2ijLYtJwzFVjJS0eIcDIXzgzHMMYZvT0M5X0o++VLYREi1q4rHH+
         GLFIQnrkaYeucerXZT6saquM1iGgQzuaIZyJsGE+ujUctgZUkjXHueHAdy/IT1NY1EWq
         5xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768304; x=1742373104;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJss9g7O/dMXFJMt3GukmQPPAokmf3Hhu32HSuWCJ2w=;
        b=Gsuqgz8m6jStBG2zUZ6DZlDPzV30a+5J3LoJOV4Pkt4BPRTbiJ5dQapei5dHe1y2mL
         hLaZqQfPWox9/AB+k/YG3ssS4jPO+Hd+5MlfGMEU5l3yPS7jAMv4D2gf4yfF29LU42K6
         5QhfmLTEZqPid+a/FMmcFV648SNl/cBT5jvQKx4k90xiTyZw1QON1m3qzs8jVkyuMTKP
         sh6CE95OYkrGls8Re75kt7SFI8HnyWQx4OK7eHPHdnrlTmRldi9e0LbEtMwjkoZmNd9t
         tBWwSqQ3CY7RueGwlVniSOFw5LcY5IaQrk0/UcKz3MXy9wzMCgok9kkPsz3C5GC3mJor
         4+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUG9W4gzvQ5srxLjWXLNNMMuZEr9t1LPBCF5/8Wpw5XXMKC9ocpJ4D+VBgyeA5Jk3v8U76Kv7G2fN76ey8fOb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vkUOoTfjvDiQOAzV1L41/CCTUeCvIC3SyMBVXEBbYVyAwH4Q
	EFmugJC8vsnwBmlyudW59nL/Ldw7e8qiiVNrvktzEtX3I8Zz6BKXkezXPF/kzSk=
X-Gm-Gg: ASbGncu28d7hOnGAB4bjVz8yFVuiah+/KRvDT/JYcQ7O05IAu3okIvHjRZccfiyWmnc
	8hRCDl+gJuJ8KIyUl1dvKjlZNdwh1kuKAoOfRZQvFyzWNFgThcXvZTRvo4cWMNZLJFNea9l3P01
	JQTpok2C5uUSt2mTU42V/luKkGrsUQFtmiJ8rbhJ98UjyLaUrMH320eqRHqNcaMMEBjfYLFM4fh
	GZ4piktS4ixbDo9GN3ZSON4xHZhnkvHXERdevdf3fJEj+UXaMMa2AOcM9CHdxXyF2/aDCl90Zk7
	QQPDcyYD3DlYT+XskTW1ArgbErr4Zc+Cp4+cJcxPQwZj69wmRA==
X-Google-Smtp-Source: AGHT+IGSSv9SOYrAJaJbwR1yeaga3JE6OR0syE92NYaNxFFvCniZMBgOzqpRGm8809U1/xszfdAp1g==
X-Received: by 2002:a5d:6d04:0:b0:390:f0ff:2bf8 with SMTP id ffacd0b85a97d-39132d05f78mr16351423f8f.10.1741768304183;
        Wed, 12 Mar 2025 01:31:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfba8b6sm20754870f8f.11.2025.03.12.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:31:43 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:31:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: iwlwifi: Fix uninitialized variable with __free()
Message-ID: <f7c17a7f-f173-43bf-bc39-316b8adde349@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Pointers declared with the __free(kfree) attribute need to be initialized
because they will be passed to kfree() on every return path.  There are
two return statement before the "cmd" pointer is initialized so this
leads to an uninitialized variable bug.

Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/mld/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
index c759c5c68dc0..1d4b2ad5d388 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
@@ -556,8 +556,8 @@ iwl_dbgfs_vif_twt_setup_write(struct iwl_mld *mld, char *buf, size_t count,
 	};
 	struct ieee80211_vif *vif = data;
 	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
+	struct iwl_dhc_cmd *cmd __free(kfree) = NULL;
 	struct iwl_dhc_twt_operation *dhc_twt_cmd;
-	struct iwl_dhc_cmd *cmd __free(kfree);
 	u64 target_wake_time;
 	u32 twt_operation, interval_exp, interval_mantissa, min_wake_duration;
 	u8 trigger, flow_type, flow_id, protection, tenth_param;
-- 
2.47.2

