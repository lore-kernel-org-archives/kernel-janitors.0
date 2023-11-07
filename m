Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2030D0B
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raAX/ATH"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970604C33
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 07:19:05 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so9667764a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Nov 2023 07:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699370344; x=1699975144; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kvnw+5Z8XzZfEDMyj6XCH8/UXST3dZPPSlZR9k5HkhQ=;
        b=raAX/ATHrx7PI0yXrC51k/ZQKE3TUYtBIyKFoMZXS33fNCNlZAo5HVqepcr5dQeKJW
         OKr2jiv6oGnE+Pv/6K12R9xM+SN4RE3Ko4MVjFAJbSepwtTRWIh1BaenWIX4SigHoHkT
         cjYLbEPwDP8XiDLBBryKw+aAJi47nHQhxT1/KsWaiFGvBIwMpi8Iy4I8CsAmbqZw1/Wr
         mTS/+rNIvaifZFM/mX7YIiJes4F6lDeCQdI3+AtV7a4ItrXqUXn+mw5EbsQBnzbHb1xh
         zPGt62aoBg3+YokpRrLMbyRG1ZDqdktZ1ZB9y7v42G/AdBMnHyDyInKjvBt5ZFFTMJwp
         ewew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370344; x=1699975144;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvnw+5Z8XzZfEDMyj6XCH8/UXST3dZPPSlZR9k5HkhQ=;
        b=gm2e7m+HNQRanZthhktyz5LJgwSF8kkM3OzjmO11lHBsuPfz2nP2+Jo5rRPIz3iSLG
         mEhj//ps5hzis+hVLq4owNPpkNtUluXl6ajZtfHUnh2IwlZfYlawp9bt1c9BC71x7gKM
         A4A64nOR6AiqplbjS4j5Od49coWkI1KW9Hy+G7hipNxxh5KprvXNvLgCfbgdRcIZ0BMz
         4/dhW0HAOPEPwHZUqUcCH/u+NkGcj0opIPzFVHl3WKRLr8GsoW9M4b0QDiDK9Nm00pHs
         Qg4chVxBtk3NORfq/p0YPYCOoJs86eFyGhKOhOUPO5Pn2sNcnVnqtfOez1J3RuJmcBBc
         Gx0Q==
X-Gm-Message-State: AOJu0YwcVcojHkM3h7kIWNuRP7pNouNzfF24Jd84Wm2XrnekHi3nVH1P
	Ixgn2knGFZ1+6X2ub8qUDymR8Q==
X-Google-Smtp-Source: AGHT+IEeMhBfKgqh/2BJW46RBs4h2HR2f2v7fHd9CiMgcJpnEdlMsofIr2+F8rRfEzWHQMpEF4WEBw==
X-Received: by 2002:a17:907:724e:b0:9be:5ab2:73c0 with SMTP id ds14-20020a170907724e00b009be5ab273c0mr17345503ejc.8.1699370344200;
        Tue, 07 Nov 2023 07:19:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ko18-20020a170907987200b0099ce025f8ccsm1135484ejc.186.2023.11.07.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:19:04 -0800 (PST)
Date: Tue, 7 Nov 2023 18:19:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] bcachefs: Fix NULL dereference in bch2_backpointer_get_node()
Message-ID: <5fc3c28b-c232-4ec7-b0ac-4ef220ddf976@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The bch2_btree_iter_peek_node() function returns both error pointers
and NULL.  Check for NULL before dereferencing "b".

Fixes: 853960d00b4b ("bcachefs: Simplify, fix bch2_backpointer_get_key()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/backpointers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/backpointers.c b/fs/bcachefs/backpointers.c
index ef02c9bb0354..3f9c5c366708 100644
--- a/fs/bcachefs/backpointers.c
+++ b/fs/bcachefs/backpointers.c
@@ -316,7 +316,7 @@ struct btree *bch2_backpointer_get_node(struct btree_trans *trans,
 	if (IS_ERR(b))
 		goto err;
 
-	BUG_ON(b->c.level != bp.level - 1);
+	BUG_ON(b && b->c.level != bp.level - 1);
 
 	if (b && extent_matches_bp(c, bp.btree_id, bp.level,
 				   bkey_i_to_s_c(&b->key),
-- 
2.42.0

