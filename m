From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:19 +0000
Subject: [PATCH 00/16] Some work on quickstart driver in staging
Message-Id: <1326147815-11451-1-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

While investigating an issue (for which I'll send a separate email) with
quickstart on my laptop I tried to make driver a little bit closer to
migration from staging to mainline. So, patches below fix some small issues
with whitespace, memleak, use of standard kernel API etc.

I know that some of those patches are probably a matter of taste so please
comment.

BR

Szymon Janc (16):
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
  Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
  Staging: quickstart: Bump driver version to 1.04

 drivers/staging/quickstart/quickstart.c |  366 +++++++++++++++----------------
 1 files changed, 175 insertions(+), 191 deletions(-)

-- 
1.7.8.2


