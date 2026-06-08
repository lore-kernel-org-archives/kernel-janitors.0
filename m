Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59493DC878
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931147; cv=none; b=uTO0KIVpGBwKyAstzwstQswtU2fVdutLwZ0JtC75QasB/Cucs/qTIdhkDJ8dNch9kU4lMKhWlC62+N6TFVMWPL8mNYXzdAvC/ElAFgq7j0UL5HlbXSuktadJ7/ZKeIHm8gjc74kY2IHEGBn7p/jcK5zHNEW1xszgIelzJRIE2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931147; c=relaxed/simple;
	bh=HU3GmUYujVH6vNcbGatgyNFYZcWLy7MFFWgsgYdycKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lo8f9sMS3Mh+/kOFTYZKe7xw63B0evhM99d2YjksfzpO01S6XZmz6nd59S2duW5QuNkUrjwqm998fV3UNbARaZOcy3Dh/hHChxCFLEHbXjwYRtsBhQOP9DFyM1baCvH3edR57Y7S4YTSjf/7XrgE2WhY7AkhEC3ppijY9O2jADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOiJ/dIk; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOiJ/dIk"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso37166866d6.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780931144; x=1781535944; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSrv/WqedQ/svpxQS4o8+LnhZN2DNI+QJkuf2ID8DKc=;
        b=eOiJ/dIkZZDiBN1tbpHo82m5VZ3+ihtP898Gr2cFI33BpnXFx07wpwEy5eqxoAjF9e
         ISocTuvvA/54ndLV59MynBwvatPHvGZ3qfTsKaW2viBEqrlqRYqPyGAoP0TDt2ChOWYZ
         luPG8QuMoYlXk+Uzi0+vu2OaUOTYzazlA11UCDULt27FFynGGmQ9jIa825Zmd0dXxrdL
         hnEYPHT3d0JZjUOVVHiCttT7hTW4oHnntnP1pmoq6/zRzXVIQT5LV3F7/N208AxYxPCz
         gaKbNmsxYh7K8fm6MzI3ySfPWYcFngF6u1bjhNzHR6+89i4b4pguoTX8FVlIJJdbrKBc
         +Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931144; x=1781535944;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSrv/WqedQ/svpxQS4o8+LnhZN2DNI+QJkuf2ID8DKc=;
        b=leStv4HV+sTB2ZjlYh7Sk6ysmU4jYM/LID59Cdh8mTzKYJOCC2KVUGsOLEIAoCqxhu
         4eNJnxQfj93hrOLFUkPqXe1BUHTyy55iIK/fDgRU+1InUGM6a/vuttx56dVm/6NXTJ+k
         IzTivXXz0UOLrryTQZd5D8Kw4zf0ZQgQkzcXQ3L/c6KIwhG7QF2qNWqJFcgZVmmTwNV8
         dfICqCSClbCFHL2KX537Dl+5DMXsoicaKd/RdtJirYR4iq8lXkI5Huq9jIruUk3rlDy/
         /zEeLubn2YHtcXoLsGJvvbRcaAbaI3od0NxpQC+3ZgT4bCnKfefGR7JgJyezgDkckivO
         b2IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zFNlWXZydo1G9+7DqYwv5oZwftqEZZa9UHSR+7dT0g7ETk2w7SdGS/gUA3p4TTZGhovYoLuTO6hfE6kIU42Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkSQGk7qvDpVT/kIYaGkSNUYNp3tccAEAdsf88vireXFPmVfX
	jK6NGHHqU9qTh2+jgVXmyLoYkTpzHeo9RQVRj1PjdBiQC8t5p4rF59iZ
X-Gm-Gg: Acq92OGWI3oog8B2r/Lmzevmr1Ir5eSR6MajKTJeAhWe2HdBse21eC3Rj5suyiGjR24
	jsJzQu+UB7XQlkPBwa9mYcKsflZnL/IoEwSxXLLUfurGu4dBIuzFMC2VxexTV/q7nSw9JOPjUGY
	h74cWluquq8sx9/FPBCNyBS8nkPF0joRKPs2kyxI1X0/E1GFzJjNhkvIvlqzWST0Zy2PUG9JRzY
	pctZ0NUbKjz9mBzFd/QPvQdNrhiH70VbO6sDP9CghVfhTI2OxEgxdGJ9cRpJY0ApSvvVuYJVugB
	dcMvFb7kwvAzsaU5bwpzpKD+x7fS0oAdWSGVi2pqbEYz/nhEY8eH5C+OLFb05/+BMovXcYcDar/
	3KNBAyjWPAjmEhfkLOKgDTA0bsSLAxPsSJ8zEraWMTIhBYVUtDWUmshnn+c7pcaRsCMVs3C97X5
	HeyAw/JcJUynAopilGEoDJYK0lbvRLma1zZ//hgow=
X-Received: by 2002:a05:620a:414f:b0:915:776d:52f5 with SMTP id af79cd13be357-915a9c71fc7mr2606684485a.17.1780931143573;
        Mon, 08 Jun 2026 08:05:43 -0700 (PDT)
Received: from localhost ([43.225.189.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37cab6sm1757032185a.22.2026.06.08.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:05:42 -0700 (PDT)
Date: Mon, 8 Jun 2026 18:05:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] btrfs: tracepoints: fix error code in
 add_conflicting_inode()
Message-ID: <aibaQGK38EIgqJQA@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code had a second "ret" variable that shadowed the "real ret
variable" so when we set the error code it was just discarded and
we returned success.  Get rid of the shadow variable.

Fixes: 3e4489a270f2 ("btrfs: tracepoints: add trace event for add_conflicting_inode()")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/btrfs/tree-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index bcccddcc568c..f01a53e825b0 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -6174,7 +6174,7 @@ static int add_conflicting_inode(struct btrfs_trans_handle *trans,
 	 *    some inode from it to some other directory).
 	 */
 	if (IS_ERR(inode)) {
-		int ret = PTR_ERR(inode);
+		ret = PTR_ERR(inode);
 
 		if (ret != -ENOENT)
 			goto out;
-- 
2.53.0

