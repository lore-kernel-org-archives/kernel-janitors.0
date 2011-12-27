From: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 14:01:25 +0000
Subject: [PATCH 0/6] use devm_request_and_ioremap
Message-Id: <1324994491-21828-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Commit 72f8c0bfa0de64c68ee59f40eb9b2683bffffbb0 added the function
devm_request_and_ioremap that combines devm_request_mem_region and
devm_ioremap or devm_ioremap_nocache.  Even if devm_request_and_ioremap
does not add functionality, except for the implicit choice between
devm_ioremap and devm_ioremap_nocache, it is much more concise than the
code it replaces.

There are a few more obvious opportunities for using
devm_request_and_ioremap if one is not picky about the name argument.

