From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 30 Aug 2007 15:29:12 +0000
Subject: [patch 0/3] fs/cramfs/inode.c: code cleanup
Message-Id: <200708301729.13256.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patchset does some cleanup in fs/cramfs/inode.c:

Patch 1/3 removes an unused variable
Patch 2/3 replaces a hardcoded value with a preprocessor constant
Patch 3/3 deletes some lines of code and removes a variable that is just used once

Diffed against 2.6.23-rc3-mm1
