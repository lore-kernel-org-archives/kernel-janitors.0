Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2326C39E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759483851; cv=none; b=oksHNrkBmZ90m8RS2QoIOAYSw9Zhooj488DUiS5SREYgqGCSjqGt4IbR2zu5Pj2ismj6vkFO3GEg7ltCd4N6ewzbECzXRQqINA+m4LDD51VJS8U98WLqQiShevWrW1mRXDwb0RfvDtkq6L2W3q+LuWAfCozV+S1fz1/8M/wYBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759483851; c=relaxed/simple;
	bh=DAoVlV27WWlmXjiBC9nMRy5Zf/pHsEoBLiOFORFTr2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzknwOB1QrT3p0ZxW5F5KeE6RjI16GFsK3XOuoppgSWlkf1YJ62Z0rTjMDjoDwCzOT6Mf1HELWXrzbUdaVX2GMKrn9O0/6qGJpTKlP7RLFIWwOJ3KKxXNVU13Bbk4Ln86xprg+Nj0HzEFEE2OZpaAp3IruxaGsI1/NZa/ri3I7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tl0AS49R; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tl0AS49R"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so1334223f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Oct 2025 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759483847; x=1760088647; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBt9sQ3D35nPjr/0RJe6RkWlXbYt10tG/bFkTZQxvEs=;
        b=Tl0AS49RuMil2112GCILDBTccy4PdAEkp0aIIlAcukl+8DcBeFEUOl2Pw3cb+7nyGg
         6iLtxAdBgOUhYe5ts8T4N7HKdU4wC7s1BP1snIPJULJ0oSEXlc2lK0VEgkx+fyxi+zLt
         6hauQZsAs2RMTT7zhaYyZvuA1O7mqzexAMgrjkcOtfV0qUJE8o6d5F3Su39VpD7s8P76
         qgU+Sl2aOL0q5OAFkixN/9BEwBbuygjcN6fZAEyy5Kr2uPu68NMch7dQhZtLE/w+EljE
         gpDE9v9cRBeZpHaBedBGLd/no5sxkYPLj2uactpgay74bvo83WA6gWXJIT3P7ZC0+xnU
         jxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759483847; x=1760088647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBt9sQ3D35nPjr/0RJe6RkWlXbYt10tG/bFkTZQxvEs=;
        b=VzQIsrRqukFzCfO/fz0LFvbIckB+aUV2JVraG4x3Y/g8BMrdXSlLN7gYIaXwf/oUqu
         iYcx0i6rBUN/N0rmpx/udbMWgZCLT+Hh2wFISopy/D7+qQbZl0SYHX84oosaTqt/HkKe
         IfmDBjoVAAuDFCA7jPaKC1aDdD5yeOksW/nmCzoSmuC9i4990axve7i7TLKsC291eQvK
         Gh7Wn0gARCi6y6oxXCeokEeNh6blVxapVQGInnJcgF0Ba1on6x42Oed8Du1mx5TivUqN
         e9S+D9UxU24YyGhVNf1auC5Q+/PX/2lJmd3PVv1rBGMHtjTu6+21aOleM1igQZmzFMm3
         gKpg==
X-Forwarded-Encrypted: i=1; AJvYcCVEseMu7JsH03+cOn9gkMXJ0xkmw6JruekMTWuL3AlLyot+Kz1K38/cdVM8pcv0+gn29b9cxG2tnSWHlceVRm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYinIOObVlgwp2O/zkymN9mRQwkwSMBI65iCFQ2HL5ZugBaK7x
	LkSkWcf38pWlR7hrBYYa0bqREwZ/CUPdOMJliU+P+9AP9HKO2a74+fkqQLyBF1UY+EA=
X-Gm-Gg: ASbGncs4DXF27bbK+i8F2dG/jv2/m5QRTbT8BFp/IpKF6SdJKnKiJs9wVYTJ+rqYG5X
	+RS3IuCXethMuKPk4H6xop3tjyX3G8ZLsgYhYwRuDBlPak+sWS8fMPWKWXdLmRr5C+4gvqN5+Hb
	Bl3yrIZxMB0kI9KVayiKgacLqiABQuGwYUloy20uBrmwatP9mSzAl4TbrN7pyAoZbcgZzw/bUv+
	9jrW9ekIWgp1FvaOB1tvCc1McaqijUDHL69lQatvdwAFh4Jkyi2izYGude0RuP3MlZoco7H3EqW
	gry2nyhK/QaKAo7175RnSPOE9O5pVxpP4h3UmWzFomKFViybPqOAaSQs+mdW71L6q3ErZ0rHQki
	QgEgzHMZE9I2CrDBBQHX0L/H21gIX7J+B5XIdZLyeuJgnV8O8weIaBp5e
X-Google-Smtp-Source: AGHT+IEiUMPA8MqxUGgCJF3dzR9jrj4sZakAlaFbxrDTR/05ZU6XCC1uwI5Zc+1AT4pSlne8f2foMg==
X-Received: by 2002:a05:6000:2012:b0:3ed:f690:a390 with SMTP id ffacd0b85a97d-4256719e3c4mr1507845f8f.40.1759483846850;
        Fri, 03 Oct 2025 02:30:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6b77sm7143523f8f.6.2025.10.03.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:30:46 -0700 (PDT)
Date: Fri, 3 Oct 2025 12:30:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hfs: fix potential use after free in
 hfs_correct_next_unused_CNID()
Message-ID: <aN-Xw8KnbSnuIcLk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code calls hfs_bnode_put(node) which drops the refcount and then
dreferences "node" on the next line.  It's only safe to use "node"
when we're holding a reference so flip these two lines around.

Fixes: a06ec283e125 ("hfs: add logic of correcting a next unused CNID")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/hfs/catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
index caebabb6642f..b80ba40e3877 100644
--- a/fs/hfs/catalog.c
+++ b/fs/hfs/catalog.c
@@ -322,9 +322,9 @@ int hfs_correct_next_unused_CNID(struct super_block *sb, u32 cnid)
 			}
 		}
 
+		node_id = node->prev;
 		hfs_bnode_put(node);
 
-		node_id = node->prev;
 	} while (node_id >= leaf_head);
 
 	return -ENOENT;
-- 
2.51.0

