From: Sifram Rajas <sifram.rajas@gmail.com>
Date: Wed, 31 Aug 2011 15:54:15 +0000
Subject: [PATCH 1/1] drivers/acpi/acpi_ipmi.c: Set state to TASK_INTERRUPTIBLE in ipmi_flush_tx_msg
Message-Id: <1314806007-8181-1-git-send-email-sifram.rajas@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Sifram Rajas <Sifram Rajas sifram.rajas@gmail.com>

The intent of the loop in ipmi_flush_tx_msg seems to be to wait
for 1 milllisecond for a count of 100. However, if we do not set the
current task's state to TASK_INTERRUPTIBLE, then this will amount
to a normal schedule which might not wait for 1 millisecond.

Signed-off-by: Sifram Rajas <Sifram Rajas sifram.rajas@gmail.com>
---
 drivers/acpi/acpi_ipmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/acpi_ipmi.c b/drivers/acpi/acpi_ipmi.c
index f40acef..74eed35 100644
--- a/drivers/acpi/acpi_ipmi.c
+++ b/drivers/acpi/acpi_ipmi.c
@@ -230,6 +230,7 @@ static void ipmi_flush_tx_msg(struct acpi_ipmi_device *ipmi)
 	while (count--) {
 		if (list_empty(&ipmi->tx_msg_list))
 			break;
+		__set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	if (!list_empty(&ipmi->tx_msg_list))
-- 
1.7.4.1

