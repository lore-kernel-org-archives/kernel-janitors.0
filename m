From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:35 +0000
Subject: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Changes since v1:
 - use pr_{err,info} instead of custom macros for logs
 - fixed quickstart_buttons_show issue pointed out by Dan
 - Use scnprintf in quickstart_pressed_button_show

Thx for comments.

Szymon Janc (17):
  Staging: quickstart: Some style, whitespaces and typos fixes
  Staging: quickstart: Prefix remaining functions names with
    quickstart_
  Staging: quickstart: Move some code to avoid forward declarations
  Staging: quickstart: Make quickstart_input static
  Staging: quickstart: Cleanup quickstart_acpi_ghid
  Staging: quickstart: Cleanup quickstart_acpi_remove
  Staging: quickstart: Cleanup quickstart_acpi_add
  Staging: quickstart: Cleanup quickstart_acpi_config
  Staging: quickstart: Use switch-case in quickstart_acpi_notify
  Staging: quickstart: Remove unused defines
  Staging: quickstart: Get rid of quickstart_data struct
  Staging: quickstart: Use list.h API for buttons list
  Staging: quickstart: Use %u for printing button id
  Staging: quickstart: Rename quickstart_btn to quickstart_button
  Staging: quickstart: Use pr_err and pr_info for logs
  Staging: quickstart: Use scnprintf in quickstart_pressed_button_show
  Staging: quickstart: Bump driver version to 1.04

 drivers/staging/quickstart/quickstart.c |  369 +++++++++++++++----------------
 1 files changed, 177 insertions(+), 192 deletions(-)

-- 
1.7.8.3


