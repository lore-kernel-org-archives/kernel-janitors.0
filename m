Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2C4825B1
	for <kernel-janitors@vger.kernel.org>; Thu,  1 Oct 2026 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837103; cv=none; b=hDR2XAXPGgLS0qRmcayhIVn6Q3Y0MlgEQXDJvOBs30nh0y0qnB7PTxioRojczdFPJYPkY+WuINgkKNJPLLLhwvvr8w+x7cJFfFk4sA1gEKPtmqCxz7tbq7RRhDng6/z2gHusPSKfeP4CtXJatmGj/tBmkJIbHzc1wVic9F0OC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837103; c=relaxed/simple;
	bh=votCEGmz1dBqut4kLOHSiZQ1DnWpjQ6Ww8QiJ9avmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7DXQnRwqh3MCs3+HBjsf1TnZG0wEPuqeeeLHMQPG6bN3znoq7dF6XlaYbS4mA+EUEOd8L7MMrrM/uLWDteYfXfvQGgR+4vre/WG518v09rM/XR/0ktJcH6jzWBf8vnIJmo+Teu57f7oX1IytwCkF9J4ldmS77EOWZfxrqeZuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJmJel3W; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJmJel3W"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso15430125e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2026 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837100; x=1791441900; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/97GcaHqO60C3xOpYaJJL73vz2EyjukQ0UgEJCJAEY=;
        b=HJmJel3WoK5OchmHOkR2yPOuzl2NiK7u32P+PTnbyc2BHWZ5XpvTeyKlZY1U6aiJkl
         +ggLcU+TWlIyIHc3PHxIONXfG5wnGBUI9dABIZAus3+ivJX1S7Lw9Qyr1XTb3XZlyvgJ
         G5YYsADwey4VxLgTGVNtAwRxZygYNay7gD5Q7Q3vR2OBkSmqsvGDr30Rq4qjBppgARmh
         1Oc9vdEoMCPyvT8gmHOVzfY307OjsC/HImvdWdh1DtYev7qmr58UpkPAEoXAW4RkQ2Sa
         cTObtL3KghgU+Aj1HSz9m1eiOTQjUYklNIgOW+Fxxd+0ySxE6DJqe4H/fDD4+H85SWQL
         p+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837100; x=1791441900;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/97GcaHqO60C3xOpYaJJL73vz2EyjukQ0UgEJCJAEY=;
        b=gEHvvnF379SUH358lzbPNZdgid4WXqUMaoK92vtFMp8JA585aHjFVhXA+lAsjSGoL7
         vSG/QYD7pX/sFEurF1+C4/AD2V/bDMKKhqdWa2sIeOjCCl1QbX+CviX5SRMypEWsWuCT
         RgzeS/Xd0KIJ3SNsURWyK+ATJmbychl0tiIkD+cVG2Q1t/i9UqcFTxJp77q6xFxqolZO
         a/hmYM+/x0FH9Jtqr2zfYFAec1XQY/419GKO5mFabQWDT3r+XKfiQVtomYE0i7w2+Wrx
         QuauULsGkJuhhobunYjCte6J3CFjnb0+IKZ0lWtlosQXwJxn7hB7nSjqIA9JkdYCO97x
         JEBg==
X-Forwarded-Encrypted: i=1; AKwUvByziZYVH+oQW2bNpR6r6bXw/BSdb252LUibWgZRytxmLzPZfH0iK723gwr/Jxco9bl0CbX0CAa0RO0t0Nr8DjI=@vger.kernel.org
X-Gm-Message-State: AFuF++n/2+fHpInPEjDoaddbXQz+iOuV/I8redxMjLQfa90v34kRpFCA
	hvVKqKbUujxzAv/kU6XvlPRjNCaPdnrfp2BRCw/RhUuSy9G8rg9KQq0NRrmYJvZVkE2gSg==
X-Gm-Gg: AYBFou3BVeoU+g19T2Na1KUF/EMJ4HvxQDHBrh3ymJECoDU3nocrNqjxLa0EwVQ58l0
	w/D7rQXpJDw7LmUWbG8nj30qSYf62T269GCbpPr4fy1UnpqpXBG664/4rDFSNWEyQe/EUiF4Qr4
	zj20XoZRwmT7CsG0UkPhr2nxOKeus6/VHUVvBJ46rJvt/RS+anSKErgfui8++MzOPuGIFXKIrcL
	TLdj2qtt/3bCkqz0LbMqIL0f17uezOXKCjFVooodrkSZfIwa0V0FkEsLLOa0wJXNkDxMpUnF/Vi
	qqYsa9fHI+LIxWqemPvMpPbx1U8p4earIU6sc813QXJneIu9xTbUuVcyJTCwbpcvBx0/a45cRzc
	4KVIpfhrHoYYnIqP0Ujr+yDVk6rePFEdUgmREMjwSZC4ljJEHk83a3jtJXossaBBItLFaoOT0xx
	z//SB09GnPCsj5uH/54cZOepZ8s8gOyexTg7R91Ewi/FD8sgaverD5J8dXSmYVfeB2gor/
X-Received: by 2002:a05:600d:864a:20b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a01eaafdb4mr22604095e9.0.1790837099925;
        Wed, 30 Sep 2026 23:44:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99a332sm86476875e9.12.2026.09.30.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:44:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dlm: clean up a type in waiters_read()
Message-ID: <ar4BZ26gjQEjZgIa@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This doesn't affect runtime but "rv" stores error codes and so
declare it as ssize_t instead of size_t.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/dlm/debug_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 700a0cbb2f14..f52a51b1382a 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -596,7 +596,8 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 {
 	struct dlm_ls *ls = file->private_data;
 	struct dlm_lkb *lkb;
-	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret, rv;
+	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret;
+	ssize_t rv;
 
 	mutex_lock(&debug_buf_lock);
 	ret = dlm_lock_recovery_try(ls);
-- 
2.53.0

