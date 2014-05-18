From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 18 May 2014 20:50:58 +0000
Subject: [PATCH 0/2] ARM: imx: bug fix and convertion to platform_device_register_full()
Message-Id: <1400446261-27085-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

This small series fixes a potential NULL pointer dereference bug and
also converts the imx camera allocation and initialization functions
to use platform_device_register_full().

The change the first patch makes is removed by the second patch, so the
purpose of the first one is purely for easy backporting and git history.

Emil Goode (2):
  ARM: imx: fix error handling in ipu device registration
  ARM: imx: convert camera init to use platform_device_register_full()

 arch/arm/mach-imx/devices/platform-ipu-core.c |   43 +++++++++----------------
 arch/arm/mach-imx/mach-mx31_3ds.c             |    5 ++-
 arch/arm/mach-imx/mach-mx31moboard.c          |    6 ++--
 arch/arm/mach-imx/mach-mx35_3ds.c             |    5 ++-
 arch/arm/mach-imx/mach-pcm037.c               |    5 ++-
 5 files changed, 23 insertions(+), 41 deletions(-)

-- 
1.7.10.4

