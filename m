From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 11 Nov 2012 20:49:28 +0000
Subject: [PATCH 0/3] Use dput() after d_find_alias().
Message-Id: <1352666971-13551-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Hello,

A call to d_find_alias() needs a corresponding call to dput() in order to avoid
resource leaks.

The first patch is a Coccinelle scripts that looks for missing calls to dput().
The other two patches add calls to dput() where needed.

WBR,
Cyril Roelandt.
