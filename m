From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:34 +0000
Subject: [PATCH 01/12] dac960: drop unneeded newline
Message-Id: <1514386305-7402-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

DAC960_Failure prints a newline at the end of the message string, so
the message string does not need to include a newline explicitly.
Done using Coccinelle.

In the first case, the preceding spaces were also converted to a tab.
In the second case, doing so would upset the indentation, so it was
left as is.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/DAC960.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/DAC960.c b/drivers/block/DAC960.c
index 442e777..89cd83a 100644
--- a/drivers/block/DAC960.c
+++ b/drivers/block/DAC960.c
@@ -1344,7 +1344,7 @@ static bool DAC960_V1_EnableMemoryMailboxInterface(DAC960_Controller_T
 	CommandMailbox.TypeX.CommandOpcode2 = 0x10;
 	break;
       default:
-        DAC960_Failure(Controller, "Unknown Controller Type\n");
+	DAC960_Failure(Controller, "Unknown Controller Type");
 	break;
       }
   return false;
@@ -1527,7 +1527,7 @@ static bool DAC960_V2_EnableMemoryMailboxInterface(DAC960_Controller_T
       DAC960_LP_AcknowledgeHardwareMailboxStatus(ControllerBaseAddress);
       break;
     default:
-      DAC960_Failure(Controller, "Unknown Controller Type\n");
+      DAC960_Failure(Controller, "Unknown Controller Type");
       CommandStatus = DAC960_V2_AbormalCompletion;
       break;
     }

