Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C57AC433C1
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 10:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C25361A0D
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 10:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhCYKIg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 06:08:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:48190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhCYKI0 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 06:08:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5370161A28;
        Thu, 25 Mar 2021 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616666906;
        bh=qBh9X3Ibv4fOJ4Pd4E80u6UTOYvNfnLHnBNTdIn7CGE=;
        h=From:To:Cc:Subject:Date:From;
        b=GgpAzCC29LtjBRbRo0SPkb5kO8fsvhRQa+qxx3cyUJwRCiMIygdXpwjcUec8l00gv
         O4TNPpjmQfR8msA9U8CvNOgrbxKRcVOws8WLtHMAn6lbTKBPzhZXZOItxKhtoJldVL
         nOi7CWn4yhGdr/UgHPvWLlipCnV9LZkeHgce3QZrf1pCaKDLXAAWBzLY/+jxis6fMx
         OtlNoohp2uqNgtT1TMXVQeRu3D0xCaNi4uWSs1JaovJV2hnFKvFIq2RoxvF69Cba/f
         1r36k1cCGJzY9fFUfk1wFZgfK7ygLtWkHcn+TNFdsW4WV6V7mZF/IozIztLhhQuP5t
         MpKRc3kDHi4YQ==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        dan.carpenter@oracle.com,
        Muhammad Usama Anjum <musamaanjum@gmail.com>
Subject: [PATCH -tip 0/2] x86/kprobes: Fix and cleanup can_boost()
Date:   Thu, 25 Mar 2021 19:08:20 +0900
Message-Id: <161666690060.1120877.4569379871114610764.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Here are 2 bugfixes for the x86/kprobes, [1/2] fixes an old bug which tries to find
instruction prefixes in insn->opcode (which should be never found) and misusing
insn->attr. [2/2] fixes a new bug found by Coverity in the recent commit 6256e668b7
("x86/kprobes: Use int3 instead of debug trap for single-step").
To fix the 2nd one, [2/2] also cleanup the switch-case with range cases, because
that is much more clear what is not boostable.

Thank you,

---

Masami Hiramatsu (2):
      x86/kprobes: Fix to check non boostable prefixes correctly
      x86/kprobes: Fix to identify indirect jmp and others using range case


 arch/x86/kernel/kprobes/core.c |   57 +++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
