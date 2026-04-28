Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B3DA7F6
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372681; cv=none; b=hg5zWnHnG4+Fh3EM0ro3Ladt5dPAoAUu3fbLf3U0B3Qjyf1bawO1q1jPpePnWbD3AxcHM+W3Vr6rCIbkTttrEHSel86Qs/dhkX97SDEPecw//E21J0HdU7K2dpph+kvHryzFicFjo2fzSg5ug7i/+YD6cBpOP7C77yGPyObJ5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372681; c=relaxed/simple;
	bh=/63CjcqVSdyZmQH13MfUszBXEiGLPGaCeHqH2QDaF+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=fztnKBtMF4qVSd5/8Yb8VYAOs3o4XbSTZFh+Sd763ZezalBJmsBZRRpjbofhMvNcO7dVbi2Qazkw/D4G+SU3D5Gc7YcXarA8i/nMdNKlLaSvM7bxxxGErtZZvxxMecQOhvuB2Fvvj52/Ga13z49cdR8CVcPTi3ClA66lQIYYn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tS7TzDA1; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tS7TzDA1"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260428103757euoutp01242b1707d002c7d994fc5dbe5f6ecafe~qfwiaHQ6J1426414264euoutp01b
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 10:37:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260428103757euoutp01242b1707d002c7d994fc5dbe5f6ecafe~qfwiaHQ6J1426414264euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1777372677;
	bh=azDwVA7NGgGiKAxFELCpnqhJ6m/gaXxvTMSXNbYXqpE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=tS7TzDA1xuhGqvVvFdQ/Hx/vPy70Eye+JRZjIhAHDYdSzAG8VGA5YC35sjwXG8W5W
	 ZhcisOFnVCjz3hKRukWPv8LGKBvbSrj1NJ63mLebxTxbm57/x27kZNBP2rwbg7enGz
	 ovz3luMqjLP2/5JXJ3bU9uX89oV6Drf8e1FrZkuM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931~qfwiMVCoa2962529625eucas1p13;
	Tue, 28 Apr 2026 10:37:57 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260428103757eusmtip1dd792289d478dfaae8220c7be02bee03~qfwhxcoZF0486404864eusmtip1M;
	Tue, 28 Apr 2026 10:37:57 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, przemyslaw.kitszel@intel.com,
	error27@gmail.com, Jakub Raczynski <j.raczynski@samsung.com>
Subject: [PATCH v3 net-next] net/intel: Replace manual array size
 calculation with ARRAY_SIZE
Date: Tue, 28 Apr 2026 12:36:54 +0200
Message-Id: <20260428103653.3539239-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931
X-EPHeader: CA
X-CMS-RootMailID: 20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931
References: <CGME20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931@eucas1p1.samsung.com>

There are still places in the code where manual calculation of array size
exist, but it is good to enforce usage of single macro through the whole
code as it makes code bit more readable.
While at it, beautify condition surrounding it by reversing check and remove
unnecessary casting.

Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
Link to v1/v2:
https://lore.kernel.org/kernel-janitors/20260421114029.2689961-1-j.raczynski@samsung.com/

Changes in v3:
- Add 'Reviewed-by' from previous thread
Changes in v2:
- Beautify code by removing excessive parentheses
- Reverse if condition to remove negation of whole check

 drivers/net/ethernet/intel/i40e/i40e_adminq.h | 2 +-
 drivers/net/ethernet/intel/iavf/iavf_adminq.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_adminq.h b/drivers/net/ethernet/intel/i40e/i40e_adminq.h
index 1be97a3a86ce..dcf3baec7b73 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_adminq.h
+++ b/drivers/net/ethernet/intel/i40e/i40e_adminq.h
@@ -109,7 +109,7 @@ static inline int i40e_aq_rc_to_posix(int aq_ret, int aq_rc)
 		-EFBIG,      /* I40E_AQ_RC_EFBIG */
 	};
 
-	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
+	if (aq_rc >= ARRAY_SIZE(aq_to_posix))
 		return -ERANGE;
 
 	return aq_to_posix[aq_rc];
diff --git a/drivers/net/ethernet/intel/iavf/iavf_adminq.h b/drivers/net/ethernet/intel/iavf/iavf_adminq.h
index bbf5c4b3a2ae..dd2f61172157 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_adminq.h
+++ b/drivers/net/ethernet/intel/iavf/iavf_adminq.h
@@ -113,7 +113,7 @@ static inline int iavf_aq_rc_to_posix(int aq_ret, int aq_rc)
 	if (aq_ret == IAVF_ERR_ADMIN_QUEUE_TIMEOUT)
 		return -EAGAIN;
 
-	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
+	if (aq_rc >= ARRAY_SIZE(aq_to_posix))
 		return -ERANGE;
 
 	return aq_to_posix[aq_rc];
-- 
2.34.1

