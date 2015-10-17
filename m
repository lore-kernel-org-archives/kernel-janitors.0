From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 17 Oct 2015 09:32:18 +0000
Subject: [PATCH 0/2] delete null dereference
Message-Id: <1445074340-21955-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

These patches delete NULL dereferences, as detected by
scripts/coccinelle/null/deref_null.cocci.

---

 drivers/media/pci/netup_unidvb/netup_unidvb_spi.c |    6 ++----
 net/nfc/netlink.c                                 |    6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)
