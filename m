From: Andre Haupt <andre@bitwigglers.org>
Date: Fri, 20 Jun 2008 12:51:43 +0000
Subject: [PATCH 0/2] parport sparse fixes
Message-Id: <cover.1213965527.git.andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andre Haupt <andre@bitwigglers.org>

The following patches fix some warnings sparse gave me, when running
over drivers/parport.

Andre Haupt (2):
  parport: remove superfluous local variable.
  parport: make parport_cs_release static.

 drivers/parport/ieee1284.c   |    2 --
 drivers/parport/parport_cs.c |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

