Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E856FEB64D8
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Jun 2023 11:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbjFTLp2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjFTLpZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 07:45:25 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356721718
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 04:45:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f9b258f3d8so16390125e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687261518; x=1689853518;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7Veyn7bHZIc7TorEJ71+JnPGoCZU4BjMXACeWHsZJw=;
        b=XSZA8onI7yQ2t2Zh0wp5rmgmYEpnYCEcsC8N1wOLRvApXKHT4dgzmWdxiaMIoGiDgq
         rcgDRAbDLZu2c8cMP3Y9EySweyWgwVPybpO11dFKk6z9yhs2tVebn/mBVKO46fG4wkqs
         117zbXui1O9TdXHvf1vU2fJdtCCiUH8+rrZEZVWNPiwTBjgXavmFwjTvdrKGTZVFpNpB
         E9Cg3ftsnf873PueIfko4iry4CJgApFY9zthO17GujBcTU4eZjm05stCccdxJeqff/lR
         xB63C1OrQgIcOm6w18uBB7ah6Fee1wvQao9UOq3zUQ3rvk1Zy6aBEB3xFiy48Bp+R2hK
         zPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687261518; x=1689853518;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Veyn7bHZIc7TorEJ71+JnPGoCZU4BjMXACeWHsZJw=;
        b=hHoYOwB+2aMyWMY6XCqmRpGhd+GLfWFdxGIQumSbBVjt8DyQr/31WRdNs0o3rvv5mI
         IRd+NJSf+gY3/A3xSE3/hqNkJEvJ/D/9j2ZuMyzacSICZVv/hiQcPqFZQoqb5TtWOK9d
         uYFNzKmDxm5nrMxKG26hXQeXE43fhBQVrhllVfcG/eu/AIfNgbTSyLXGehcuR1WQQufp
         HRctVMf+DQIa8CQ7KYJobzlpdzP38kepdZfeQYeokkfOkQBGoWLvbaSMWQHM92dSrp2Y
         c253iSY+Sfa94nOyMZmH+WaL2PYWU+Ma8gp/Km8Qjb1T4wqjc8ki+kOXJfRDuEaKAFYh
         26mw==
X-Gm-Message-State: AC+VfDy6UJGzEUZcOw7nYJMV/2Th9/sWEz6df9l/KnkwMuJXkFb0jwi6
        LiiLKqngAmmK4uS5CRKoVGL1Lw==
X-Google-Smtp-Source: ACHHUZ6NYDtqz2yBB903nkiTivamo6xZRwkr3WFywYd8OFhAHSJQgGxmZENm8F1plpUjDz5C5k+mig==
X-Received: by 2002:a1c:7203:0:b0:3f6:774:fdc with SMTP id n3-20020a1c7203000000b003f607740fdcmr11087298wmc.18.1687261518608;
        Tue, 20 Jun 2023 04:45:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020adfce87000000b0030af54c5f33sm1789675wrn.113.2023.06.20.04.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:45:16 -0700 (PDT)
Date:   Tue, 20 Jun 2023 14:45:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Sasha Levin <sashal@kernel.org>,
        Tom Gall <tom.gall@linaro.org>, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] checkpatch: check for missing Fixes tags
Message-ID: <ce2d9aa7-b1e6-402e-8471-ad52a321c008@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This check looks for common words that probably indicate a patch
is a fix.  For now the regex is:

	(?:BUG: KASAN|Call Trace:|stable\@|syzkaller)

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
---
v2: I fixed the formatting issues Joe pointed out.  I also silenced the
warning if the commit was a Revert because revert patches already
include the hash.

I tested adding Closes: and regression to the regexp, but in the end I
left them out.  They both find some missing tags but they end up adding
false positives.  The problem with "regression" is that people say "this
doesn't cause a regression".  Closes: finds a lot of harmless static
checker warnings.

We're, no doubt, going to fine tune the regex in the future.  I ran this
on the most recent 2000 patches and the results are good.  I'm also
thinking about how to create a Fixes-tag-bot which searches lore for
missing tags.

 scripts/checkpatch.pl | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7bfa4d39d17f..e059df623dea 100755
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
@@ -86,6 +87,7 @@ Options:
   -v, --verbose              verbose mode
   --no-tree                  run without a kernel tree
   --no-signoff               do not check for 'Signed-off-by' line
+  --no-fixes-tag             do not check for 'Fixes:' tag
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
@@ -293,6 +295,7 @@ GetOptions(
 	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
+	'fixes-tag!'	=> \$chk_fixes_tag,
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
@@ -1254,6 +1257,7 @@ sub git_commit_info {
 }
 
 $chk_signoff = 0 if ($file);
+$chk_fixes_tag = 0 if ($file);
 
 my @rawlines = ();
 my @lines = ();
@@ -2633,6 +2637,9 @@ sub process {
 
 	our $clean = 1;
 	my $signoff = 0;
+	my $fixes_tag = 0;
+	my $is_revert = 0;
+	my $needs_fixes_tag = 0;
 	my $author = '';
 	my $authorsignoff = 0;
 	my $author_sob = '';
@@ -3186,6 +3193,16 @@ sub process {
 			}
 		}
 
+# These indicate a bug fix
+		if (!$in_header_lines && !$is_patch &&
+			$line =~ /^This reverts commit/) {
+			$is_revert = 1;
+		}
+
+		if (!$in_header_lines && !$is_patch &&
+			$line =~ /\b(?:BUG: KASAN|Call Trace:|stable\@|syzkaller)/) {
+			$needs_fixes_tag = 1;
+		}
 
 # Check Fixes: styles is correct
 		if (!$in_header_lines &&
@@ -3198,6 +3215,7 @@ sub process {
 			my $id_length = 1;
 			my $id_case = 1;
 			my $title_has_quotes = 0;
+			$fixes_tag = 1;
 
 			if ($line =~ /(\s*fixes:?)\s+([0-9a-f]{5,})\s+($balanced_parens)/i) {
 				my $tag = $1;
@@ -7636,6 +7654,12 @@ sub process {
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
-- 
2.39.2

