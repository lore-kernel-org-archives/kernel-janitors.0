From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 22 Jun 2020 18:45:12 +0000
Subject: Re: [PATCH] objtool: Fix memory leak in special_get_alts()
Message-Id: <87bf795e-a640-4aea-ff30-129905b61fc6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gaurav Singh <gaurav1086@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>

I propose to avoid a typo in the previous patch subject.


> Free alt before returning to avoid memory leak.

Would you like to add the tag “Fixes” to the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=625d3449788f85569096780592549d0340e9c0c7#n183

Regards,
Markus
