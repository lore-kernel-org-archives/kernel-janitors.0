From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 22 Sep 2016 05:20:24 +0000
Subject: [PATCH 00/11] staging: dgnc: cleanup the function on dgnc driver
Message-Id: <20160922052024.GA26647@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This series of patches will cleanup the functions in dgnc driver.
Rename it and introduce new functions to split big function into
smaller one. Please take a look at my patches to update the dgnc
driver and provide some comments if there are something wrong.

This series of patches maybe have dependency with each other.
If one of these patches cannot be merged, some other patches maybe
cannot be merged properly, I think.

Daeseok Youn (11):
  staging: dgnc: remove redundant initialization for channel_t
  staging: dgnc: remove useless message buffer
  staging: dgnc: missing NULL check for ioremap in dgnc_do_remap()
  staging: dgnc: kfree for board structure in dgnc_found_board()
  staging: dgnc: move functions unrelated with dgnc_found_board()
  staging: dgnc: introduce the dgnc_tty_unregister()
  staging: dgnc: rename dgnc_finalize_board_init() to dgnc_request_irq()
  staging: dgnc: introduce the dgnc_free_irq()
  staging: dgnc: rename dgnc_tty_uninit() to dgnc_cleanup_tty()
  staging: dgnc: remove useless variables
  staging: dgnc: introduce find_board_by_major()

 drivers/staging/dgnc/dgnc_driver.c | 170 ++++++++++++++++++-------------------
 drivers/staging/dgnc/dgnc_driver.h |   9 --
 drivers/staging/dgnc/dgnc_tty.c    |  97 +++++++++++----------
 drivers/staging/dgnc/dgnc_tty.h    |   3 +-
 4 files changed, 138 insertions(+), 141 deletions(-)

-- 
1.9.1

