From: Jiri Olsa <jolsa@redhat.com>
Date: Thu, 06 May 2010 17:36:17 +0000
Subject: [PATCH 13/13] drivers/ata: removing redundant ifdef
Message-Id: <1273167377-14270-14-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
In-Reply-To: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ysato@users.sourceforge.jp, tony.luck@intel.com, dhowells@redhat.com, kyle@mcmartin.ca, benh@kernel.crashing.org, schwidefsky@de.ibm.com, jgarzik@pobox.com, hare@suse.de, felipe.balbi@nokia.com, Jiri Olsa <jolsa@redhat.com>

wbr,
jirka


Signed-off-by: Jiri Olsa <jolsa@redhat.com>
---
 drivers/ata/ahci.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 8b502f4..5326af2 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -3179,7 +3179,6 @@ static bool ahci_broken_online(struct pci_dev *pdev)
 #ifdef CONFIG_ATA_ACPI
 static void ahci_gtf_filter_workaround(struct ata_host *host)
 {
-#ifdef CONFIG_ATA_ACPI
 	static const struct dmi_system_id sysids[] = {
 		/*
 		 * Aspire 3810T issues a bunch of SATA enable commands
@@ -3220,7 +3219,6 @@ static void ahci_gtf_filter_workaround(struct ata_host *host)
 			ata_for_each_dev(dev, link, ALL)
 				dev->gtf_filter |= filter;
 	}
-#endif
 }
 #else
 static inline void ahci_gtf_filter_workaround(struct ata_host *host)
-- 
1.6.6.1

