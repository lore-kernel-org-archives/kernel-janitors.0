From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 01 Nov 2019 21:42:46 +0000
Subject: [PATCH 0/3] staging: axis-fifo: probe function cleanup
Message-Id: <20191101214232.16960-1-quentin.deslandes@itdev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cristian Sicilia <sicilia.cristian@gmail.com>

Avoid parsing unused device tree properties and add a note on ignored /
unsupported properties inside the joined documentation instead.

Also use managed functions to claim the device's resources and remove unused
resource pointer from the device's internal structure.

Quentin Deslandes (3):
  staging: axis-fifo: avoid parsing ignored device tree properties
  staging: axis-fifo: request resources using managed functions
  staging: axis-fifo: remove unused pointer to memory resource

 drivers/staging/axis-fifo/axis-fifo.c   | 301 +++++++-----------------
 drivers/staging/axis-fifo/axis-fifo.txt |  18 +-
 2 files changed, 90 insertions(+), 229 deletions(-)

-- 
2.23.0
