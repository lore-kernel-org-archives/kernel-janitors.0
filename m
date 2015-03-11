From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 11 Mar 2015 14:02:47 +0000
Subject: [PATCH 0/3] Introducing goto for error and lock handling
Message-Id: <20150311140247.GA17012@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>, Mark Hounschell <markh@compro.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The first patch fix a missing call to dgnc_tty_uninit.

The other two patches focus on the TODO item:
use goto statements for error handling when appropriate

The second patch resolves cases where the improvement seems
clear.

The third patch deals with cases where the added value did
not seem as important or the changes felt more complex.

Quentin Lambert (3):
  Staging: dgnc: dgnc_driver: Add a missing call to dgnc_tty_uninit
  Staging: dgnc: Use goto for error handling
  Staging: dgnc: Use goto for spinlock release before return

 drivers/staging/dgnc/dgnc_cls.c    | 19 ++++++---------
 drivers/staging/dgnc/dgnc_driver.c | 13 +++--------
 drivers/staging/dgnc/dgnc_neo.c    | 30 ++++++++++--------------
 drivers/staging/dgnc/dgnc_tty.c    | 48 ++++++++++++++++++--------------------
 4 files changed, 45 insertions(+), 65 deletions(-)

-- 
1.9.1

