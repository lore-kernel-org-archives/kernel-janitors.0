Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73940D579
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055799; cv=none; b=JxaoDvtdTGQsYdbe6CAYXW6mFnIAbvrXrYAVaXlCw6z2vty6daJ1FOlsm/NUmOosH4MnWKfmNA01QQbPqGgA7IOJCi0Uem7rx2O9QeP7HfgRhbCoEfNd5uq1uToWbLXpELeGv+M/RWuvsw6LpvEG7J625tVQ2SotcjZpbF/+BEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055799; c=relaxed/simple;
	bh=gBjtOY7lKVNmTlrhArEPxxvqjpn2aT0p9xFCWvNXJH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqu+4uIacrR8/H5LvkZZT4/CWis5LyHKtuk/Eque3bZ4SIxplrC+VTybpumPzry3T55HdtUqnNDXEGV9ckFAprU3XGVQt0O5E1UlIV/MiQF2pThze2Iu7crsOKOdLJAsMsBTc1sbfbTDucRR9uV3xm5jytfcYS3GHapJNn2BdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=linux.aimannajjar.com; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.aimannajjar.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aiman Najjar <aiman@linux.com>
Date: Tue, 09 Jun 2026 21:42:56 -0400
Subject: [PATCH 2/2] staging: rtl8723bs: drop GEN_EVT_CODE macro and
 capitalize labels
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-rtl8723bs-code-style-v1-2-daa0e85359a6@linux.com>
References: <20260609-rtl8723bs-code-style-v1-0-daa0e85359a6@linux.com>
In-Reply-To: <20260609-rtl8723bs-code-style-v1-0-daa0e85359a6@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Aiman Najjar <aiman@linux.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781055789; l=6061;
 i=aiman@linux.com; s=20260606; h=from:subject:message-id;
 bh=gBjtOY7lKVNmTlrhArEPxxvqjpn2aT0p9xFCWvNXJH8=;
 b=8VxHQb/LQZqUBdtvvODowqWdnACtoBflbQdsZ+BqM6mXOMXUlQ/iIon8a5nL314WDqMKQQZHj
 uFf6fVs3AYKDW1cZm3CFYMVjDBnd/ofXIIPfmhap8slJwP4Qt2qxyem
X-Developer-Key: i=aiman@linux.com; a=ed25519;
 pk=iKg5UkqF2CmKvQwe+Jp8Cf4JOcIHoyvApdVll0sJHu8=
X-Migadu-Flow: FLOW_OUT

The use of GEN_EVT_CODE macro to generate event enum label name is applied
inconsistently and is confusing, it also makes it harder to make use of
tools such as clangd when looking up symbols.

Replace them with writing the enum labels directly and adopting
new capitalized names instead of the current camel case ones.

Signed-off-by: Aiman Najjar <aiman@linux.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 12 +++---
 drivers/staging/rtl8723bs/include/rtw_event.h    |  4 --
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 54 ++++++++++++------------
 3 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index abcc666d5dbe..833f802ffe62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4400,7 +4400,7 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct survey_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_Survey);
+	pc2h_evt_hdr->ID = SURVEY_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurvey_evt = (struct survey_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4453,7 +4453,7 @@ void report_surveydone_event(struct adapter *padapter)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct surveydone_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_SurveyDone);
+	pc2h_evt_hdr->ID = SURVEY_DONE_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurveydone_evt = (struct surveydone_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4498,7 +4498,7 @@ void report_join_res(struct adapter *padapter, int res)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct joinbss_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_JoinBss);
+	pc2h_evt_hdr->ID = JOIN_BSS_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4547,7 +4547,7 @@ void report_wmm_edca_update(struct adapter *padapter)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct wmm_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_WMM);
+	pc2h_evt_hdr->ID = WMM_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pwmm_event = (struct wmm_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4593,7 +4593,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stadel_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_DelSTA);
+	pc2h_evt_hdr->ID = DEL_STA_EVENT;
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pdel_sta_evt = (struct stadel_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4644,7 +4644,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 
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
index 95769f90d196..5adcff9a734b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -679,33 +679,33 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
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
+	C2HFEEDBACK_EVENT,               /*20*/
+	ADDBA_EVENT,
+	C2HBCN_EVENT,
+	REPORT_PWR_STATE_EVENT,		/* filen: only for PCIE, USB */
+	CLOSE_RF_EVENT,			/* filen: only for PCIE, work around ASPM */
+	WMM_EVENT,			/*25*/
 	MAX_C2HEVT
 };
 

-- 
2.54.0

