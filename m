From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sat, 10 Aug 2013 00:32:43 +0000
Subject: [PATCH 0/3] staging: fix non-ANSI function prototypes.
Message-Id: <1376094766-9175-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add "void" to parameterless function prototypes.

Found using the following semantic patch:

<smpl>
@@
identifier f;
@@
-f()
+f(void)
{
...
}
</smpl>

Regards,
Cyril Roelandt.
---

Cyril Roelandt (3):
  staging: usbip: fix non-ANSI function prototypes.
  staging: ced1401: fix non-ANSI function prototype.
  staging: lustre: fix non-ANSI function prototypes.

 drivers/staging/ced1401/userspace/use1401.c                   | 2 +-
 drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c | 2 +-
 drivers/staging/lustre/lustre/libcfs/lwt.c                    | 4 ++--
 drivers/staging/usbip/userspace/libsrc/usbip_common.c         | 2 +-
 drivers/staging/usbip/userspace/libsrc/vhci_driver.c          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.3.1

