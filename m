Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7497A702
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018020; cv=none; b=hccor4l/mtj6zEO2QSIpfFv2gpTr+5d6hM8rUHccSKtnWP61ZHO1hKbW61Tc0Nic92dcVGTL6vQtJ5iS716B86zs9tSdZGFiMQDUBj6rnwRjQDElbsPqDfsDY8T3RCOgOv0qyVSN+d0Uvl+eA4KZFUVz8MnmgrewT5Doo5VtTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018020; c=relaxed/simple;
	bh=0HChkZvz805SH5/Bg7lXO98xztusnvz1xVbHCjRt5pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncxi8DLogT5Jm0ZcTBGd0M4PEAIL3AfM1cyU6RyMp4zNMACPij95xczxgV+YmDnm/lep8GmOwTNzpic8iOi1C1Iqj9hIXCd2MHOdK5+m142Yn+irpMuuoGM9Mx28a87QSegZi+7hvdJx2PoQdcCNh3pi2l5P+0q364wNRvHgNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KaWP9RU9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KaWP9RU9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f188e09a8so1273269f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718018017; x=1718622817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INisaP6CUvjsAcivq0xT0C5QbxOKvQv1XCRhugFU0Vk=;
        b=KaWP9RU962MzJLYiH50fAbY1+QLTQdYU7ArLB+rNrRn9y7K26i9n5SGyAy4klyeD55
         RUoFbXWHiGVRyQYOlyQXoJevPyg6K5z7IVtcXF9hwe8sDEPjYLzo+/p5tYfn17PrIhHN
         WME+2QipA2ZAjzQOpzRe/ERWah5SsFGrHjaVXh7AHqlvyoi2k3Dk0XUlrxKl8RChU02O
         sf9+vIwmQEp+pLYs4z5CtDBdy9yB9hnzsA36k7oj2GGjQk3GS6CFHoT5YuEN5TlO2tp4
         OPeSQjl9ZOz/e/eUOj+EtulwuLfznws9reb4b7FvOo9+Co4SljwylO+ZM0237DXEZxxc
         BVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718018017; x=1718622817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INisaP6CUvjsAcivq0xT0C5QbxOKvQv1XCRhugFU0Vk=;
        b=AQop1VvJmVkTzzj76o+WVrRgtMFVfu0Jp/lf5OIGLIrWQ3vN7YcSDcorCcOM5SgUJB
         WRom+eR+yJAn4Evbpa99ZEdfVCNZNM+s3Hx/sfJfem09RE+UFu/wU7cB2qUejtOON+KR
         pH6BuAzdceM45rlES76NgKroD1070mTW9isXTdG7LvdGPik036gsbEu5m8Usj1dAQtN5
         ueNV6pxCJ66v73A4o5Gch7O3uSrIKbyzJNri/yDXxMebTiKjgvaUxuhb7qJyqeAClakW
         REdwV6tmQBGsJzgBUXBx+vXEdjcNt+M7Mgu5gUfEQhjab1ICwzUOga1l0gCfRRBodg5S
         LKIg==
X-Forwarded-Encrypted: i=1; AJvYcCWfvZr7+d+1DJm8EY4s9bVjEQ4mjNOEvsglF9/q/NkaQx9D0Myuk51l6+c1imQ7uWoxM7dzHGvDuaqzFwcRy7kWK45f4TodT1czzIVng4fB
X-Gm-Message-State: AOJu0YzcrMm+s9EbpX8Ypp7G4YD0FodeZ1oU3NCiigQuFUDqEWHuIHTh
	FJuiKDUIdkmFvaOLJVsb7ngH3WUI0IPO/r7P1ZAR1ELG/mjksySp+I1VNMrAwUA=
X-Google-Smtp-Source: AGHT+IEiUbebzNCiwNlfFUscoRy7um+VkuObADRH9MEb5SQ+QehcyXcSKNXlTdx6Mi+rmevfhzvPGA==
X-Received: by 2002:adf:ef50:0:b0:35f:2169:e844 with SMTP id ffacd0b85a97d-35f2169e8bamr2150676f8f.7.1718018017153;
        Mon, 10 Jun 2024 04:13:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1aed74cesm5380793f8f.112.2024.06.10.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 04:13:36 -0700 (PDT)
Date: Mon, 10 Jun 2024 14:13:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
	Sasha Levin <sashal@kernel.org>, Tom Gall <tom.gall@linaro.org>,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v4 RESEND] checkpatch: check for missing Fixes tags
Message-ID: <Zmbf3AaZh4sbPhYB@moroto>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This check looks for common words that probably indicate a patch
is a fix.  For now the regex is:

	(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/)

Why are stable patches encouraged to have a fixes tag?  Some people mark
their stable patches as "# 5.10" etc.  This is useful but a Fixes tag is
still a good idea.  For example, the Fixes tag helps in review.  It
helps people to not cherry-pick buggy patches without also
cherry-picking the fix.

Also if a bug affects the 5.7 kernel some people will round it up to
5.10+ because 5.7 is not supported on kernel.org.  It's possible the Bad
Binder bug was caused by this sort of gap where companies outside of
kernel.org are supporting different kernels from kernel.org.

Should it be counted as a Fix when a patch just silences harmless
WARN_ON() stack trace.  Yes.  Definitely.

Is silencing compiler warnings a fix?  It seems unfair to the original
authors, but we use -Werror now, and warnings break the build so let's
just add Fixes tags.  I tell people that silencing static checker
warnings is not a fix but the rules on this vary by subsystem.

Is fixing a minor LTP issue (Linux Test Project) a fix?  Probably?  It's
hard to know what to do if the LTP test has technically always been
broken.

One clear false positive from this check is when someone updated their
debug output and included before and after Call Traces.  Or when crashes
are introduced deliberately for testing.  In those cases, you should
just ignore checkpatch.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
Hi, Andrew, I sent this patch last year.  It's a pretty good patch.  I
probably erred on the side of avoiding false positives.

v4: Fix another formatting issue.
v3: Add UBSAN to the regex as Kees suggested.
v2: I fixed the formatting issues Joe pointed out.  I also silenced the
    warning if the commit was a Revert because revert patches already
    include the hash.

 scripts/checkpatch.pl | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b812210b412..13763164eb6c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -28,6 +28,7 @@ my %verbose_messages = ();
 my %verbose_emitted = ();
 my $tree = 1;
 my $chk_signoff = 1;
+my $chk_fixes_tag = 1;
 my $chk_patch = 1;
 my $tst_only;
 my $emacs = 0;
@@ -88,6 +89,7 @@ Options:
   -v, --verbose              verbose mode
   --no-tree                  run without a kernel tree
   --no-signoff               do not check for 'Signed-off-by' line
+  --no-fixes-tag             do not check for 'Fixes:' tag
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
@@ -295,6 +297,7 @@ GetOptions(
 	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
+	'fixes-tag!'	=> \$chk_fixes_tag,
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
@@ -1257,6 +1260,7 @@ sub git_commit_info {
 }
 
 $chk_signoff = 0 if ($file);
+$chk_fixes_tag = 0 if ($file);
 
 my @rawlines = ();
 my @lines = ();
@@ -2636,6 +2640,9 @@ sub process {
 
 	our $clean = 1;
 	my $signoff = 0;
+	my $fixes_tag = 0;
+	my $is_revert = 0;
+	my $needs_fixes_tag = 0;
 	my $author = '';
 	my $authorsignoff = 0;
 	my $author_sob = '';
@@ -3189,6 +3196,16 @@ sub process {
 			}
 		}
 
+# These indicate a bug fix
+		if (!$in_header_lines && !$is_patch &&
+			$line =~ /^This reverts commit/) {
+			$is_revert = 1;
+		}
+
+		if (!$in_header_lines && !$is_patch &&
+		    $line =~ /(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/) {
+			$needs_fixes_tag = 1;
+		}
 
 # Check Fixes: styles is correct
 		if (!$in_header_lines &&
@@ -3201,6 +3218,7 @@ sub process {
 			my $id_length = 1;
 			my $id_case = 1;
 			my $title_has_quotes = 0;
+			$fixes_tag = 1;
 
 			if ($line =~ /(\s*fixes:?)\s+([0-9a-f]{5,})\s+($balanced_parens)/i) {
 				my $tag = $1;
@@ -7697,6 +7715,12 @@ sub process {
 		ERROR("NOT_UNIFIED_DIFF",
 		      "Does not appear to be a unified-diff format patch\n");
 	}
+	if ($is_patch && $has_commit_log && $chk_fixes_tag) {
+		if ($needs_fixes_tag && !$is_revert && !$fixes_tag) {
+			WARN("MISSING_FIXES_TAG",
+			     "This looks like a fix but there is no Fixes: tag\n");
+		}
+	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
 			ERROR("MISSING_SIGN_OFF",
