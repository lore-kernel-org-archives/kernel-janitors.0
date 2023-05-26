Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B611C77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 12:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjEZMBp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 08:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjEZMBn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 08:01:43 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637A8116
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 05:01:39 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d58b3efbso401520f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102498; x=1687694498;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yND35ais/ukG+uTh3KH7a9De2YZqNP7mXDsC69SJnlM=;
        b=zndeBKmy7vQdUTShwT7eFAF2WU52kDQMUlI0H12GCJW6/ahrt9Il9Hh+H+SrXRFzHj
         XrLC0QNjJcyxx8a72Ot+6CHWW7I1Dgeyl1zIi5z9zeIGyChZBJouAnD4Fi2R6nJEwAGI
         HrZ8UVsuxNUjSwLLB66hGTKSYOnum68DamLumhQbIxpWuWi67/be+NBFqfslwKkYFlWQ
         F1P2EGpD4GumkJVXl9TPChj97/Ymunj9GEqDPKaP7x4fuSZLytOrUTMMk89XsxeHG5wN
         WsEeBwX9dEFV3m9jO64u3e1FaJjm867hwl+D3FNMFVWyNMwvzhN1PXuVxu+r2JrS5CXU
         /qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102498; x=1687694498;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yND35ais/ukG+uTh3KH7a9De2YZqNP7mXDsC69SJnlM=;
        b=fo5TiiyCn6afldxTIdqZ8QNrXckmeHDiBMVEhisoDIjm4sGOfnLX51gW2h93kAb3/I
         bdHzEYK7CYEWrZ5l1dbX9VUwFQkqSYqV4/zXKl1FIcFlYfAFGJIP8h3LrHOlK6zUbEqe
         lwRDMWjVoeQUTD1uMHzUmD8GS3Qe/ZRMTxEuO1jXbjFTFy6/2S1xXYLTMfaP2HplvsNa
         GqZ6bVv0llr4Tnw6E+Ly90ZmdidGYRa0OkMre/dYKx0uLUOZKHmmdtusDKDgdTtnf4lb
         qHHVmuDEBCcww35V9bSBpnw8FZHLn7+YGf+B0huBs9+llOvZ2W1l51jqhzg1ljp4YVqH
         Ku+g==
X-Gm-Message-State: AC+VfDyzXigbeWQaBo2noZh9CgrBm1Qh/aWwioRBtkmMtS9SnLGSObvH
        W0V1f8px2jYJXcO3EHOtADf0ibU6+pod0H8R29Y=
X-Google-Smtp-Source: ACHHUZ47+6xfUhFicStwKDOze5EQJV3MIf1AL/SQeZmtUnb4T3OshVkP4bhO87fqG4B9/SaKC8feCQ==
X-Received: by 2002:a5d:404b:0:b0:306:2c16:8359 with SMTP id w11-20020a5d404b000000b003062c168359mr1339056wrp.39.1685102497818;
        Fri, 26 May 2023 05:01:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f604ca479esm8609669wme.3.2023.05.26.05.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 05:01:36 -0700 (PDT)
Date:   Fri, 26 May 2023 15:01:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Steve French <sfrench@samba.org>
Cc:     Paulo Alcantara <pc@manguebit.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Shyam Prasad N <sprasad@microsoft.com>,
        Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] smb: delete an unnecessary statement
Message-ID: <077d93ae-adbf-4425-9cc4-eea5163b050c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We don't need to set the list iterators to NULL before a
list_for_each_entry() loop because they are assigned inside the
macro.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/smb2ops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 5065398665f1..6e3be58cfe49 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -618,7 +618,6 @@ parse_server_interfaces(struct network_interface_info_ioctl_rsp *buf,
 		 * Add a new one instead
 		 */
 		spin_lock(&ses->iface_lock);
-		iface = niface = NULL;
 		list_for_each_entry_safe(iface, niface, &ses->iface_list,
 					 iface_head) {
 			ret = iface_cmp(iface, &tmp_iface);
-- 
2.39.2

