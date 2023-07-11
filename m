Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38218EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 07:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjGKHoq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 03:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjGKHop (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 03:44:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0775135
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 00:44:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so7963581e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689061482; x=1691653482;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQfE1ZZr+v1emGAH2Qulv7iQSM3kBJc1UJPVvLzwMCw=;
        b=vUbepeoe1uw7SJNzr8Cu/EYsqowD8uIxcqNpxLYznEu+9V8T/ZSKpfMwhNqbBWEkQs
         9meQ0S1a2/HYDIuVOikJgXWc+LvUH4CGETD+yqKgwTiAvzQ7boWZ9F7VRG2fAoKXizgg
         weSVBhmdaEBTP+0bSag6/MMBx0jpMaMhPS6VFq5pyZwnZ90ksXulxzt1rCGs2UAbL6Nv
         NhFvei2Hy/QlnLBRpK8yisM0lyD+XDK9Lutb0K/Opqucksei9bCVMnNs24iKZsWlN7Da
         TcDJuTV7F4iBbgsAig4mCxYBv+OrdpDYhZ6Wpj1Jnf0udmf2Yi4+9+H/o6qjn5ppQXd/
         GoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689061482; x=1691653482;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQfE1ZZr+v1emGAH2Qulv7iQSM3kBJc1UJPVvLzwMCw=;
        b=WxMBoDQryun0NH8tYz2emdmP6tQVeOcwlm3t0UzD97lgAmCbMFMUw1tAfjVQOnmTcC
         n49S+VHxRpxDwfMUH8naOfIS9yrx6YCLi5XcAzvOEjXXOVJx4U4ab4bXpVC7G/or2pYo
         VBBqGy0Y8M/JACgODfejwzplCgzzJPprGpMihjf2Bd9QKhnLQtuMbVLAAb14D/QnKs3x
         4LdEoHjHOx70PWrZdZ0T7V0x6jFrbhnBYF81ZuOBBOK+COS/iGc/cEZ3nV2ht8GMVFYb
         rz0qlGTYeAoPDLd7BgeAKnwHNkI/pCNnjUfC6wkg4XdOptAUDD0uzI0SRYhv6fB3BPiB
         vMgQ==
X-Gm-Message-State: ABy/qLaY/5zRRV5dOrCsaAx+4Fu8/sUeu7l+YQZ15k3a4qtYPWC3yHiP
        bKwtghtlTQ1G/mIY+Ba+XbxvqA==
X-Google-Smtp-Source: APBJJlHmoe44DeRnOYA3bkDLdQUZw+JBVE4iws72bwPIfP1yqRo6KYav1CAsny2DZdiHgNKNXw0g6g==
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id z16-20020a056512309000b004f84512c844mr14669521lfd.48.1689061481839;
        Tue, 11 Jul 2023 00:44:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k24-20020a05600c0b5800b003fc01189b0dsm1703609wmr.42.2023.07.11.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:44:39 -0700 (PDT)
Date:   Tue, 11 Jul 2023 10:44:35 +0300
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
Subject: [PATCH v3] checkpatch: check for missing Fixes tags
Message-ID: <756970eb-6204-415a-a997-d67a14ba6584@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

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
---
v3: Add UBSAN to the regex as Kees suggested.

v2: I fixed the formatting issues Joe pointed out.  I also silenced the
warning if the commit was a Revert because revert patches already
include the hash.

 scripts/checkpatch.pl | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 880fde13d9b8..4d4f2d12cd25 100755
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
+			$line =~ /(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/) {
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

