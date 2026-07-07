Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121393F1AB2;
	Tue,  7 Jul 2026 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783457055; cv=none; b=jRvIxRVRUC/YH3sCkHGerAREVHTjtYDeaVu7lKgrIOXz33x9QePCVOtqLPkJRG42bXYSByA5vmzp0yqnAFOJUm/LOLpkazQeePwXXCf1qFDLAP7Nxmgy/5UOu6ySVPLhJ52Pk4ASE9OMnUN/HAxgxm9GmRUvG+hV11aLf6WuL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783457055; c=relaxed/simple;
	bh=mCLsf/+oR8rhOxt3Kdbz1cZwwT0Jk+FCtel9STucBtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSZbYDFzcnUoJBfwpHGqRFn2Ii46ASrwEv+QhDYWJai7I/Q4PZqTm9O0FpxfbSzerSnyYA5hIr08c0o8gtR/CGNg2fljqVv0AZ90k6RvJUfFUwdhLxOvX/TcfWp2/HtQNSyhS6mUu4YPmq9A3G5vT7eGyVSGDYmAoMc+lNA9iQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hurranet.com; spf=pass smtp.mailfrom=hurranet.com; dkim=pass (2048-bit key) header.d=hurranet.com header.i=@hurranet.com header.b=nO855s2d; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hurranet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hurranet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hurranet.com header.i=@hurranet.com header.b="nO855s2d"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gvtVx1vw3z8v8m;
	Tue, 07 Jul 2026 22:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hurranet.com;
	s=MBO0001; t=1783457049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BV851b4wK72CvqTgDwoEzspgFeFOAlTOZ1Ip0MuqsBA=;
	b=nO855s2dVqYnuH07HQURSv7uCUKp28X/vUcN+8XYGpla/17oHnnjAHAe3bPKH47kVZBTDX
	pX7lDsy6cLlI6gvgsZo/azUzqlUcmOrLDLRRiUNPhtEu+Uunens8Z6AmcDC4OLWoA8Gj3+
	uCwLFRFwT1OIGexyGiIGSnLjHosnAGIT//A0EYHPDnnWrwSH9IeRZ1w/z9VjbnHJGk3duy
	7ij17VffBd5Ep6InGgK6GkgJ7qd22C9jOuE98LeIHRBjRw8OBavQ8Rx8gGGRPoZCv6OnSt
	i8pLshuTbp+65tLPOwTnW133JghTSMHLwOigZdCU6Cha0KQHGN6kSVS+iLN9hA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of aiman.najjar@hurranet.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=aiman.najjar@hurranet.com
From: Aiman Najjar <aiman.najjar@hurranet.com>
Date: Tue, 07 Jul 2026 16:43:40 -0400
Subject: [PATCH v2 2/2] staging: rtl8723bs: drop GEN_EVT_CODE macro and
 capitalize labels
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-rtl8723bs-code-style-v2-2-df50f0eead17@hurranet.com>
References: <20260707-rtl8723bs-code-style-v2-0-df50f0eead17@hurranet.com>
In-Reply-To: <20260707-rtl8723bs-code-style-v2-0-df50f0eead17@hurranet.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, Aiman Najjar <aiman.najjar@hurranet.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783457042; l=6059;
 i=aiman.najjar@hurranet.com; s=20260606; h=from:subject:message-id;
 bh=mCLsf/+oR8rhOxt3Kdbz1cZwwT0Jk+FCtel9STucBtk=;
 b=uTYS0t9YbrBzx7Z0aUPHB849DQFIjN5ekuR1hnwjhMdQ558r0YJ/EyJc+bnGLpSDGtDfvQoV3
 WEz84GC0KFBBnhNHp+qkwSaG4rCrSupxwQT5dNODv5ZgyW+Okk9mi6n
X-Developer-Key: i=aiman.najjar@hurranet.com; a=ed25519;
 pk=iKg5UkqF2CmKvQwe+Jp8Cf4JOcIHoyvApdVll0sJHu8=
X-Rspamd-Queue-Id: 4gvtVx1vw3z8v8m

The use of GEN_EVT_CODE macro to generate event enum label names is applied
inconsistently and is confusing, it also makes it harder to make use of
tools such as clangd when looking up symbols.

Replace them with writing the enum labels directly and adopting
new capitalized names instead of the current camel case ones.

Signed-off-by: Aiman Najjar <aiman.najjar@hurranet.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 12 +++---
 drivers/staging/rtl8723bs/include/rtw_event.h    |  4 --
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 54 ++++++++++++------------
 3 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 13ba38db75d4..128213c97a61 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4293,7 +4293,7 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct survey_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_Survey);
+	pc2h_evt_hdr->ID = SURVEY_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurvey_evt = (struct survey_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4343,7 +4343,7 @@ void report_surveydone_event(struct adapter *padapter)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct surveydone_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_SurveyDone);
+	pc2h_evt_hdr->ID = SURVEY_DONE_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurveydone_evt = (struct surveydone_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4385,7 +4385,7 @@ void report_join_res(struct adapter *padapter, int res)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct joinbss_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_JoinBss);
+	pc2h_evt_hdr->ID = JOIN_BSS_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4429,7 +4429,7 @@ void report_wmm_edca_update(struct adapter *padapter)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct wmm_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_WMM);
+	pc2h_evt_hdr->ID = WMM_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pwmm_event = (struct wmm_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4472,7 +4472,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stadel_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_DelSTA);
+	pc2h_evt_hdr->ID = DEL_STA_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pdel_sta_evt = (struct stadel_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4522,7 +4522,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stassoc_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_AddSTA);
+	pc2h_evt_hdr->ID = ADD_STA_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	padd_sta_evt = (struct stassoc_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
diff --git a/drivers/staging/rtl8723bs/include/rtw_event.h b/drivers/staging/rtl8723bs/include/rtw_event.h
index 62e0dec249ad..e5cb46c2a731 100644
--- a/drivers/staging/rtl8723bs/include/rtw_event.h
+++ b/drivers/staging/rtl8723bs/include/rtw_event.h
@@ -64,10 +64,6 @@ struct wmm_event {
 	unsigned char wmm;
 };
 
-#define GEN_EVT_CODE(event)	event ## _EVT_
-
-
-
 struct fwevent {
 	u32 parmsize;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 786dc805516e..bf5a7e9dbe0e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -675,33 +675,33 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
-	GEN_EVT_CODE(_Read_BBREG),
-	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
-	GEN_EVT_CODE(_Read_EFUSE),
-	GEN_EVT_CODE(_Read_CAM),			/*5*/
-	GEN_EVT_CODE(_Get_BasicRate),
-	GEN_EVT_CODE(_Get_DataRate),
-	GEN_EVT_CODE(_Survey),	 /*8*/
-	GEN_EVT_CODE(_SurveyDone),	 /*9*/
-
-	GEN_EVT_CODE(_JoinBss), /*10*/
-	GEN_EVT_CODE(_AddSTA),
-	GEN_EVT_CODE(_DelSTA),
-	GEN_EVT_CODE(_AtimDone),
-	GEN_EVT_CODE(_TX_Report),
-	GEN_EVT_CODE(_CCX_Report),			/*15*/
-	GEN_EVT_CODE(_DTM_Report),
-	GEN_EVT_CODE(_TX_Rate_Statistics),
-	GEN_EVT_CODE(_C2HLBK),
-	GEN_EVT_CODE(_FWDBG),
-	GEN_EVT_CODE(_C2HFEEDBACK),               /*20*/
-	GEN_EVT_CODE(_ADDBA),
-	GEN_EVT_CODE(_C2HBCN),
-	GEN_EVT_CODE(_ReportPwrState),		/* filen: only for PCIE, USB */
-	GEN_EVT_CODE(_CloseRF),				/* filen: only for PCIE, work around ASPM */
-	GEN_EVT_CODE(_WMM),					/*25*/
+	READ_MACREG_EVENT = 0,		/*0*/
+	READ_BBREG_EVENT,
+	READ_RFREG_EVENT,
+	READ_EEPROM_EVENT,
+	READ_EFUSE_EVENT,
+	READ_CAM_EVENT,			/*5*/
+	GET_BASICRATE_EVENT,
+	GET_DATARATE_EVENT,
+	SURVEY_EVENT,			/*8*/
+	SURVEY_DONE_EVENT,		/*9*/
+
+	JOIN_BSS_EVENT,			/*10*/
+	ADD_STA_EVENT,
+	DEL_STA_EVENT,
+	ATIM_DONE_EVENT,
+	TX_REPORT_EVENT,
+	CCX_REPORT_EVENT,		/*15*/
+	DTM_REPORT_EVENT,
+	TX_RATE_STATISTICS_EVENT,
+	C2HLBK_EVENT,
+	FWDBG_EVENT,
+	C2HFEEDBACK_EVENT,		/*20*/
+	ADDBA_EVENT,
+	C2HBCN_EVENT,
+	REPORT_PWR_STATE_EVENT,		/* filen: only for PCIE, USB */
+	CLOSE_RF_EVENT,			/* filen: only for PCIE, work around ASPM */
+	WMM_EVENT,			/*25*/
 	MAX_C2HEVT
 };
 

-- 
2.54.0

