Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0C236FA8
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908906; cv=none; b=g2MSTAsJNWsfurtqGtNzHbEdRpJ1cLhyKYcOL8R8G1jYeGR+hXvJdAIcoSUb+JMieFfW3tJo1+7G29jl7CyL4IRxtYVl9RIDnh+b1PLBPR8+ahRNsQGMDBIESei1O3cvPQ9zxhubuxzS8vHsR3hmCeO8BAOg/4ZJNpOpQwTGY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908906; c=relaxed/simple;
	bh=8s9qU3NpcFIH9Ro8KpQpyXvRMnrSRjRKQsDDyH7NfpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXIn58OWzpb1UvIpmdk2/TS24tJ92X8roZGVcfNolqS9zP5kjVfDXK+/vIGQLi7b6+ZfZ0ZrnWU6OqBxwb1w1OmThcrxu33erQ0uXpx9XKybSHon6iDR2nRpRyMMt5bq6OHQeeQgiFBH48t/O2v1Oe3RHFlbNysoWn9yVdd9b78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5tOqLQ8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5tOqLQ8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434f3d934fcso21868375e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908903; x=1734513703; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DLsS1CyBK/Moo7ZlFFxPYN1OuvOVl2Ay8BHF7WI398=;
        b=w5tOqLQ8gwo1ial/8x5zs3Ko239KwgcdYt2Y8xrAixNNRQ8Z9a+Mfk0EDhmHGOxIU3
         B3MUmKWLB0JUIZnWuF4F1lxnZK0SbmduZYNEgbtJPgrOyvetMtCm3wJaYE63rWGUd73a
         m3+xXHnEKEd4jnRqiWxgKv9riDgJqe7XCr4y0ov8JoogtX8JTAeAGQHstWfgLbKtqk9R
         Jkrd8xHOFlEjVxWg/tdR7Ri0ZNsTKatpxG4X9qgzyafM63aPAw4LnHkQHdMNdGipqlmS
         58sxhf5SUvnKkQS9C2fgAbGfBqBmWmI8iPm5cv4S1umnPBMpbU5qNOuBKk8J3gO6J3jx
         doig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908903; x=1734513703;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DLsS1CyBK/Moo7ZlFFxPYN1OuvOVl2Ay8BHF7WI398=;
        b=iSkw59CoqG3odpHqJTaJFDzASlkax9Bh3nuhp6GasyFShL9BJAvAkz75ji5joSnch+
         rNiqp8GLfcezcWyoYquKlMFDtoJyzPutD/FdGq4XB3b1GN36KipFD6xlUxOZ3h+9d3BA
         H13NnUy73MZPqxtiSgSaUHpaBz/MC6aFZeZdipXO6HS1rWXgyGXNFdFxWNP/d9LNZKTQ
         vA1P60+IQr2U4xlvIbySzLrlWj4QVB8GJwxRBpwgiFDqx1IzLyR9/mPwwLMsyF5rvxeL
         maAqbCUGfHi40e5/zXmwpVeQDX1FtHZTOBx9sgESjgXJGT0CpAv69FhQi38A6yEPDnLk
         us3A==
X-Forwarded-Encrypted: i=1; AJvYcCWLNziBMjfC1yfsnMmNNpv/Ofk+r80R9ST32GGaPKljwxxqcoo2ChaZx2lItv5a7DAo3juvloaIPBkwE9vRH08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYIJlFuQrekJvE4CdzpvwmZIkkj7xyHHVvGHZZgq0vKtp5Ur/
	eHraA5NqH3Ke3zG/8B4nif2WAOmaXXjy74FMw/+dBhQsMw7iM84hB7YIbGqa0v4=
X-Gm-Gg: ASbGncvtojBHi6iET5Jh1HSce31LDlQc6+RUYuJmihTVeILykGB3tehFnVgwkcSSegK
	s7nhn12dinW26Qk84G+M+klTU4Gdo98K1mOJOVpCSDvHkS5XEBZYzPCu6YLy8n125H6wj/Gcqgg
	4wEUVvZCyRDRNZs5z7pnuSVDM9s2ixD0u1MZXEZCbip8aVwkI6yB1BmH7NlGXJL78b5tZuBn6w6
	Gpmw3GOXp6Qb7IKy/M6VXI9KrfvF3S+Rvm2rmuAFuO0ZEZEzticEhoDjuI=
X-Google-Smtp-Source: AGHT+IGPYeRitgpKtJOXyRZn4COfRNxYFbNQZ+CVZoA5uGWAMNXxGSSG6fybBnG6Xshn8ee/kKy9Ig==
X-Received: by 2002:a05:600c:1907:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-4361c3b9d1bmr13850245e9.12.1733908903351;
        Wed, 11 Dec 2024 01:21:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361e54ef20sm12271745e9.5.2024.12.11.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:21:42 -0800 (PST)
Date: Wed, 11 Dec 2024 12:21:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] binfmt_elf: Fix potential Oops in load_elf_binary()
Message-ID: <5952b626-ef08-4293-8a73-f1496af4e987@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function call was changed from allow_write_access() which has a NULL
check to exe_file_allow_write_access() which doesn't.  Check for NULL
before calling it.

Fixes: 871387b27c20 ("fs: don't block write during exec on pre-content watched files")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/binfmt_elf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 8054f44d39cf..db9cb4c20125 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1354,9 +1354,10 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	kfree(interp_elf_ex);
 	kfree(interp_elf_phdata);
 out_free_file:
-	exe_file_allow_write_access(interpreter);
-	if (interpreter)
+	if (interpreter) {
+		exe_file_allow_write_access(interpreter);
 		fput(interpreter);
+	}
 out_free_ph:
 	kfree(elf_phdata);
 	goto out;
-- 
2.45.2

