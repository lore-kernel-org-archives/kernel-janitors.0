Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15BEC433E4
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD1CB61A1E
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhC0ASX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhC0ASN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:13 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4FEC0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:12 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id z10so7054525qkz.13
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YUTuwNvqpqmKihhpt9cpMbBecFdzG1sjo9uedUx7/b4=;
        b=ZjV0qn4qd6Gp9rjljzJKtcq+m4bxdlGNonFKRqOEzWzygLT7qBi1pcAGo7WKQ44T8r
         Lbx/GKcB+VRcMXfPLf5lgNnuFlvhDe2MqRrj+QnyygNS0uj8ekzRYJ5Pqot6sTBOIYu/
         2vfbRfLofYCDP0YiECjnNNHEb7mXqMLZSgpDDR3vqMyHaRLoNlyvZQsbt+8CwBfeu6/T
         esKw2Urh21VjnfL/HTX9NNEbz8XoMsmQijv4a1o8ZP9uoZBAhvu8bdLyFkdmfkg3xFR7
         eGk5ycY/jPW+zfqf0CBY4D5fYcqLl8aBdBi2XcfKSslUeevwndpFfYdKxbndiQjk0CJb
         TFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUTuwNvqpqmKihhpt9cpMbBecFdzG1sjo9uedUx7/b4=;
        b=PLtykHGut26grGy5zBkdM/wgJl9rQL8cwPTkUncoGkfio+4nyRTRVsJispRURyLCjH
         NXYKr93MAHfze0UzUa3CbKjHYayHDdQ/FplOHKDcfb6jkmmkT18vajUhmOWlL5l8ty0C
         riNIwhr+fyNbQPdY6Lh09loGdL2bqW9bjLaEECRasnjSZP7guwMQ6IZQXdbAK8VKNYLP
         xexZyMHyM6koryBGJvaW/NRp2/1mjW+uqUsiQ9ALSF3+BW4VR0GI8PBHLsFFwaYXNsGw
         kv6yPvygueHjElECukAC4+hvCEpgV4RKmVRx8nNe7pbI3zvmL18Y1hLiUww7tBIUfjED
         1wag==
X-Gm-Message-State: AOAM530NOwEY3UIG94D3Sa5xaUuk3HaeWOheJSQeGMnkwqHS+RJwJGfl
        7FB6LO4lM3vI5OYDMmHkgGDKgDISobOxolEo
X-Google-Smtp-Source: ABdhPJwPp7aJjxhWNcTkB1W54U1IQEj4OzbK8gyrUSnlZf7ON38eXdL3NRJKkRR43C1GaiUCeOYvdw==
X-Received: by 2002:a05:620a:102f:: with SMTP id a15mr16208153qkk.87.1616804292135;
        Fri, 26 Mar 2021 17:18:12 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:11 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 2/6] staging: rtl8723bs: mlme: remove unused variables
Date:   Fri, 26 Mar 2021 18:17:32 -0600
Message-Id: <20210327001736.180881-2-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The variable *pframe in rtw_build_wmm_ie_ht() and rtw_restructure_ht_ie()
is set but never read. Both instances are getting removed.

Removing these warning:

drivers/staging/rtl8723bs/core/rtw_mlme.c:2560:6: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_mlme.c:2576:21: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 29d4b7493784..83fbd415d766 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2555,12 +2555,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
-	u8 *pframe;
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
-							_WMM_IE_Length_, WMM_IE, pout_len);
+		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
+			   _WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
 	}
@@ -2571,7 +2570,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
-	unsigned char *p, *pframe;
+	unsigned char *p;
 	struct ieee80211_ht_cap ht_capie;
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, rf_type = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -2696,8 +2695,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
 
-	pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_HT_CAPABILITY,
-						sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
+	rtw_set_ie(out_ie + out_len, WLAN_EID_HT_CAPABILITY,
+		   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
 
 	phtpriv->ht_option = true;
 
@@ -2705,7 +2704,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, WLAN_EID_HT_OPERATION,
+				   ielen, p + 2, pout_len);
 		}
 	}
 
-- 
2.30.2

