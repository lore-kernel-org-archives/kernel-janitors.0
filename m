From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Apr 2014 09:36:13 +0000
Subject: [patch 1/2] staging: unisys: use after free in error messages
Message-Id: <20140410093613.GA5839@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "bus" when we report the error so we have to move the
kfree() down a couple lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/unisys/uislib/uislib.c b/drivers/staging/unisys/uislib/uislib.c
index 8ea9c46..3152a21 100644
--- a/drivers/staging/unisys/uislib/uislib.c
+++ b/drivers/staging/unisys/uislib/uislib.c
@@ -381,17 +381,17 @@ create_bus(CONTROLVM_MESSAGE *msg, char *buf)
 		cmd.add_vbus.busTypeGuid = msg->cmd.createBus.busDataTypeGuid;
 		cmd.add_vbus.busInstGuid = msg->cmd.createBus.busInstGuid;
 		if (!VirtControlChanFunc) {
-			kfree(bus);
 			LOGERR("CONTROLVM_BUS_CREATE Failed: virtpci callback not registered.");
 			POSTCODE_LINUX_3(BUS_CREATE_FAILURE_PC, bus->busNo,
 					 POSTCODE_SEVERITY_ERR);
+			kfree(bus);
 			return CONTROLVM_RESP_ERROR_VIRTPCI_DRIVER_FAILURE;
 		}
 		if (!VirtControlChanFunc(&cmd)) {
-			kfree(bus);
 			LOGERR("CONTROLVM_BUS_CREATE Failed: virtpci GUEST_ADD_VBUS returned error.");
 			POSTCODE_LINUX_3(BUS_CREATE_FAILURE_PC, bus->busNo,
 					 POSTCODE_SEVERITY_ERR);
+			kfree(bus);
 			return
 			    CONTROLVM_RESP_ERROR_VIRTPCI_DRIVER_CALLBACK_ERROR;
 		}
