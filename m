From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Fri, 31 May 2013 15:42:42 +0000
Subject: [Patch 1/2] Staging: winbond: Check for unsuccessful allocation immediately
Message-Id: <51A8C222.20806@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check to see if allocation by kzalloc() or usb_alloc_urb() was unsuccessful 
immediately after the allocation. Exit from the function can be right at that 
point in case of allocation failure.
This avoids unnecessary use of usb_alloc_urb() & usb_free_urb() if kzalloc() 
returns NULL.
Also, makes the code better structured & easier to understand.

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35reg.c |  265 +++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 136 insertions(+), 129 deletions(-)

diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
--- a/drivers/staging/winbond/wb35reg.c	2013-05-31 19:47:16.824056618 +0530
+++ b/drivers/staging/winbond/wb35reg.c	2013-05-31 20:03:17.560035177 +0530
@@ -30,45 +30,46 @@ unsigned char Wb35Reg_BurstWrite(struct
 	/* Trying to use burst write function if use new hardware */
 	UrbSize = sizeof(struct wb35_reg_queue) + DataSize + sizeof(struct usb_ctrlrequest);
 	reg_queue = kzalloc(UrbSize, GFP_ATOMIC);
+	if (reg_queue = NULL)
+		return false;
+
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (urb && reg_queue) {
-		reg_queue->DIRECT = 2; /* burst write register */
-		reg_queue->INDEX = RegisterNo;
-		reg_queue->pBuffer = (u32 *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
-		memcpy(reg_queue->pBuffer, pRegisterData, DataSize);
-		/* the function for reversing register data from little endian to big endian */
-		for (i = 0; i < NumberOfData ; i++)
-			reg_queue->pBuffer[i] = cpu_to_le32(reg_queue->pBuffer[i]);
-
-		dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue) + DataSize);
-		dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
-		dr->bRequest = 0x04; /* USB or vendor-defined request code, burst mode */
-		dr->wValue = cpu_to_le16(Flag); /* 0: Register number auto-increment, 1: No auto increment */
-		dr->wIndex = cpu_to_le16(RegisterNo);
-		dr->wLength = cpu_to_le16(DataSize);
-		reg_queue->Next = NULL;
-		reg_queue->pUsbReq = dr;
-		reg_queue->urb = urb;
-
-		spin_lock_irq(&reg->EP0VM_spin_lock);
-		if (reg->reg_first = NULL)
-			reg->reg_first = reg_queue;
-		else
-			reg->reg_last->Next = reg_queue;
-		reg->reg_last = reg_queue;
-
-		spin_unlock_irq(&reg->EP0VM_spin_lock);
-
-		/* Start EP0VM */
-		Wb35Reg_EP0VM_start(pHwData);
-
-		return true;
-	} else {
-		usb_free_urb(urb);
+	if (urb = NULL) {
 		kfree(reg_queue);
 		return false;
 	}
-	return false;
+
+	reg_queue->DIRECT = 2; /* burst write register */
+	reg_queue->INDEX = RegisterNo;
+	reg_queue->pBuffer = (u32 *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
+	memcpy(reg_queue->pBuffer, pRegisterData, DataSize);
+	/* the function for reversing register data from little endian to big endian */
+	for (i = 0; i < NumberOfData ; i++)
+		reg_queue->pBuffer[i] = cpu_to_le32(reg_queue->pBuffer[i]);
+
+	dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue) + DataSize);
+	dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
+	dr->bRequest = 0x04; /* USB or vendor-defined request code, burst mode */
+	dr->wValue = cpu_to_le16(Flag); /* 0: Register number auto-increment, 1: No auto increment */
+	dr->wIndex = cpu_to_le16(RegisterNo);
+	dr->wLength = cpu_to_le16(DataSize);
+	reg_queue->Next = NULL;
+	reg_queue->pUsbReq = dr;
+	reg_queue->urb = urb;
+
+	spin_lock_irq(&reg->EP0VM_spin_lock);
+	if (reg->reg_first = NULL)
+		reg->reg_first = reg_queue;
+	else
+		reg->reg_last->Next = reg_queue;
+	reg->reg_last = reg_queue;
+
+	spin_unlock_irq(&reg->EP0VM_spin_lock);
+
+	/* Start EP0VM */
+	Wb35Reg_EP0VM_start(pHwData);
+
+	return true;
 }
 
 void Wb35Reg_Update(struct hw_data *pHwData,  u16 RegisterNo,  u32 RegisterValue)
@@ -173,42 +174,44 @@ unsigned char Wb35Reg_Write(struct hw_da
 	/* update the register by send urb request */
 	UrbSize = sizeof(struct wb35_reg_queue) + sizeof(struct usb_ctrlrequest);
 	reg_queue = kzalloc(UrbSize, GFP_ATOMIC);
+	if (reg_queue = NULL)
+		return false;
+
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (urb && reg_queue) {
-		reg_queue->DIRECT = 1; /* burst write register */
-		reg_queue->INDEX = RegisterNo;
-		reg_queue->VALUE = cpu_to_le32(RegisterValue);
-		reg_queue->RESERVED_VALID = false;
-		dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
-		dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
-		dr->bRequest = 0x03; /* USB or vendor-defined request code, burst mode */
-		dr->wValue = cpu_to_le16(0x0);
-		dr->wIndex = cpu_to_le16(RegisterNo);
-		dr->wLength = cpu_to_le16(4);
-
-		/* Enter the sending queue */
-		reg_queue->Next = NULL;
-		reg_queue->pUsbReq = dr;
-		reg_queue->urb = urb;
-
-		spin_lock_irq(&reg->EP0VM_spin_lock);
-		if (reg->reg_first = NULL)
-			reg->reg_first = reg_queue;
-		else
-			reg->reg_last->Next = reg_queue;
-		reg->reg_last = reg_queue;
-
-		spin_unlock_irq(&reg->EP0VM_spin_lock);
-
-		/* Start EP0VM */
-		Wb35Reg_EP0VM_start(pHwData);
-
-		return true;
-	} else {
-		usb_free_urb(urb);
+	if (urb = NULL) {
 		kfree(reg_queue);
 		return false;
 	}
+
+	reg_queue->DIRECT = 1; /* burst write register */
+	reg_queue->INDEX = RegisterNo;
+	reg_queue->VALUE = cpu_to_le32(RegisterValue);
+	reg_queue->RESERVED_VALID = false;
+	dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
+	dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
+	dr->bRequest = 0x03; /* USB or vendor-defined request code, burst mode */
+	dr->wValue = cpu_to_le16(0x0);
+	dr->wIndex = cpu_to_le16(RegisterNo);
+	dr->wLength = cpu_to_le16(4);
+
+	/* Enter the sending queue */
+	reg_queue->Next = NULL;
+	reg_queue->pUsbReq = dr;
+	reg_queue->urb = urb;
+
+	spin_lock_irq(&reg->EP0VM_spin_lock);
+	if (reg->reg_first = NULL)
+		reg->reg_first = reg_queue;
+	else
+		reg->reg_last->Next = reg_queue;
+	reg->reg_last = reg_queue;
+
+	spin_unlock_irq(&reg->EP0VM_spin_lock);
+
+	/* Start EP0VM */
+	Wb35Reg_EP0VM_start(pHwData);
+
+	return true;
 }
 
 /*
@@ -236,42 +239,45 @@ unsigned char Wb35Reg_WriteWithCallbackV
 	/* update the register by send urb request */
 	UrbSize = sizeof(struct wb35_reg_queue) + sizeof(struct usb_ctrlrequest);
 	reg_queue = kzalloc(UrbSize, GFP_ATOMIC);
+	if (reg_queue = NULL)
+		return false;
+
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (urb && reg_queue) {
-		reg_queue->DIRECT = 1; /* burst write register */
-		reg_queue->INDEX = RegisterNo;
-		reg_queue->VALUE = cpu_to_le32(RegisterValue);
-		/* NOTE : Users must guarantee the size of value will not exceed the buffer size. */
-		memcpy(reg_queue->RESERVED, pValue, Len);
-		reg_queue->RESERVED_VALID = true;
-		dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
-		dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
-		dr->bRequest = 0x03; /* USB or vendor-defined request code, burst mode */
-		dr->wValue = cpu_to_le16(0x0);
-		dr->wIndex = cpu_to_le16(RegisterNo);
-		dr->wLength = cpu_to_le16(4);
-
-		/* Enter the sending queue */
-		reg_queue->Next = NULL;
-		reg_queue->pUsbReq = dr;
-		reg_queue->urb = urb;
-		spin_lock_irq(&reg->EP0VM_spin_lock);
-		if (reg->reg_first = NULL)
-			reg->reg_first = reg_queue;
-		else
-			reg->reg_last->Next = reg_queue;
-		reg->reg_last = reg_queue;
-
-		spin_unlock_irq(&reg->EP0VM_spin_lock);
-
-		/* Start EP0VM */
-		Wb35Reg_EP0VM_start(pHwData);
-		return true;
-	} else {
-		usb_free_urb(urb);
+	if (urb = NULL) {
 		kfree(reg_queue);
 		return false;
 	}
+
+	reg_queue->DIRECT = 1; /* burst write register */
+	reg_queue->INDEX = RegisterNo;
+	reg_queue->VALUE = cpu_to_le32(RegisterValue);
+	/* NOTE : Users must guarantee the size of value will not exceed the buffer size. */
+	memcpy(reg_queue->RESERVED, pValue, Len);
+	reg_queue->RESERVED_VALID = true;
+	dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
+	dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE;
+	dr->bRequest = 0x03; /* USB or vendor-defined request code, burst mode */
+	dr->wValue = cpu_to_le16(0x0);
+	dr->wIndex = cpu_to_le16(RegisterNo);
+	dr->wLength = cpu_to_le16(4);
+
+	/* Enter the sending queue */
+	reg_queue->Next = NULL;
+	reg_queue->pUsbReq = dr;
+	reg_queue->urb = urb;
+	spin_lock_irq(&reg->EP0VM_spin_lock);
+	if (reg->reg_first = NULL)
+		reg->reg_first = reg_queue;
+	else
+		reg->reg_last->Next = reg_queue;
+	reg->reg_last = reg_queue;
+
+	spin_unlock_irq(&reg->EP0VM_spin_lock);
+
+	/* Start EP0VM */
+	Wb35Reg_EP0VM_start(pHwData);
+
+	return true;
 }
 
 /*
@@ -341,40 +347,41 @@ unsigned char Wb35Reg_Read(struct hw_dat
 	/* update the variable by send Urb to read register */
 	UrbSize = sizeof(struct wb35_reg_queue) + sizeof(struct usb_ctrlrequest);
 	reg_queue = kzalloc(UrbSize, GFP_ATOMIC);
+	if (reg_queue = NULL)
+		return false;
+
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (urb && reg_queue) {
-		reg_queue->DIRECT = 0; /* read register */
-		reg_queue->INDEX = RegisterNo;
-		reg_queue->pBuffer = pRegisterValue;
-		dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
-		dr->bRequestType = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN;
-		dr->bRequest = 0x01; /* USB or vendor-defined request code, burst mode */
-		dr->wValue = cpu_to_le16(0x0);
-		dr->wIndex = cpu_to_le16(RegisterNo);
-		dr->wLength = cpu_to_le16(4);
-
-		/* Enter the sending queue */
-		reg_queue->Next = NULL;
-		reg_queue->pUsbReq = dr;
-		reg_queue->urb = urb;
-		spin_lock_irq(&reg->EP0VM_spin_lock);
-		if (reg->reg_first = NULL)
-			reg->reg_first = reg_queue;
-		else
-			reg->reg_last->Next = reg_queue;
-		reg->reg_last = reg_queue;
-
-		spin_unlock_irq(&reg->EP0VM_spin_lock);
-
-		/* Start EP0VM */
-		Wb35Reg_EP0VM_start(pHwData);
-
-		return true;
-	} else {
-		usb_free_urb(urb);
+	if (urb = NULL) {
 		kfree(reg_queue);
 		return false;
 	}
+	reg_queue->DIRECT = 0; /* read register */
+	reg_queue->INDEX = RegisterNo;
+	reg_queue->pBuffer = pRegisterValue;
+	dr = (struct usb_ctrlrequest *)((u8 *)reg_queue + sizeof(struct wb35_reg_queue));
+	dr->bRequestType = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN;
+	dr->bRequest = 0x01; /* USB or vendor-defined request code, burst mode */
+	dr->wValue = cpu_to_le16(0x0);
+	dr->wIndex = cpu_to_le16(RegisterNo);
+	dr->wLength = cpu_to_le16(4);
+
+	/* Enter the sending queue */
+	reg_queue->Next = NULL;
+	reg_queue->pUsbReq = dr;
+	reg_queue->urb = urb;
+	spin_lock_irq(&reg->EP0VM_spin_lock);
+	if (reg->reg_first = NULL)
+		reg->reg_first = reg_queue;
+	else
+		reg->reg_last->Next = reg_queue;
+	reg->reg_last = reg_queue;
+
+	spin_unlock_irq(&reg->EP0VM_spin_lock);
+
+	/* Start EP0VM */
+	Wb35Reg_EP0VM_start(pHwData);
+
+	return true;
 }
 
 
