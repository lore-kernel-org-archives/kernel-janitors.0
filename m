From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:23:24 +0000
Subject: [PATCH 0/5] UBI: Coverity-inspired fixes
Message-Id: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Except for the last one, these were inspired by Coverity Scan results.

These fixes have barely been tested, but they are pretty straightforward
logically. As they've been sitting in my dust pile too long, I thought I'd at
least get them out there.

Brian Norris (5):
  UBI: account for bitflips in both the VID header and data
  UBI: fix out of bounds write
  UBI: initialize LEB number variable
  UBI: fix check for "too many bytes"
  UBI: align comment for readability

 drivers/mtd/ubi/attach.c | 2 +-
 drivers/mtd/ubi/cdev.c   | 2 +-
 drivers/mtd/ubi/eba.c    | 3 ++-
 drivers/mtd/ubi/ubi.h    | 2 +-
 drivers/mtd/ubi/wl.c     | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.1.0

