From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Aug 2013 16:51:41 +0000
Subject: [PATCH 0/16] Avoid using ARRAY_AND_SIZE(e) as a function argument
Message-Id: <1376239917-15594-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches replace uses of ARRAY_AND_SIZE(e) in a function argument
position by its expansion.  ARRAY_AND_SIZE(e) expands to a pair of
expressions separated by commas and thus hides the actual arity of the
called function.

I was not able to compile any of the modified code.

