From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Thu, 09 Apr 2015 11:46:26 +0000
Subject: [PATCH 0/2] pci to dma
Message-Id: <1428579988-10167-1-git-send-email-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The first patch removes deprecated use of the pci api.

The second patch depends on the first, it replaces uses of GFP_ATOMIC
with GFP_KERNEL. I could not find evidence that the concerned functions
were called from a context were sleep is not allowed.


---
 cs5520.c    |    2 +-
 pmac.c      |    7 +++----
 setup-pci.c |    2 +-
 sgiioc4.c   |    6 +++---
 4 files changed, 8 insertions(+), 9 deletions(-)

