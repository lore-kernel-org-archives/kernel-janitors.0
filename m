From: Martin Kelly <martin@martingkelly.com>
Date: Sat, 23 Dec 2017 21:06:40 +0000
Subject: [PATCH 0/1] tools: fix cross-compile var export
Message-Id: <20171223210641.24588-1-martin@martingkelly.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Martin Kelly <martin@martingkelly.com>

This patch touches multiple subsystems, and there doesn't appear to be a global
tools maintainer, so I sent this to kernel janitors. Please let me know if there
is a better place for it.

Martin Kelly (1):
  tools: fix cross-compile var export

 tools/cgroup/Makefile            |  1 -
 tools/gpio/Makefile              |  2 --
 tools/hv/Makefile                |  1 -
 tools/iio/Makefile               |  2 --
 tools/laptop/freefall/Makefile   |  1 -
 tools/leds/Makefile              |  1 -
 tools/perf/Makefile.perf         |  6 ------
 tools/power/acpi/Makefile.config |  3 ---
 tools/scripts/Makefile.include   | 18 ++++++++++++++++++
 tools/spi/Makefile               |  2 --
 tools/usb/Makefile               |  1 -
 tools/vm/Makefile                |  1 -
 tools/wmi/Makefile               |  1 -
 13 files changed, 18 insertions(+), 22 deletions(-)

-- 
2.11.0

