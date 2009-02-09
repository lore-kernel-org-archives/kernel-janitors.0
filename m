From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 22:07:35 +0000
Subject: [PATCH] wusb: Storage class should be before const qualifier
Message-Id: <20090209220735.GA8082@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 include/linux/usb/wusb.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb/wusb.h b/include/linux/usb/wusb.h
index 5f401b6..429c631 100644
--- a/include/linux/usb/wusb.h
+++ b/include/linux/usb/wusb.h
@@ -80,8 +80,7 @@ struct wusb_ckhdid {
 	u8 data[16];
 } __attribute__((packed));
 
-const static
-struct wusb_ckhdid wusb_ckhdid_zero = { .data = { 0 } };
+static const struct wusb_ckhdid wusb_ckhdid_zero = { .data = { 0 } };
 
 #define WUSB_CKHDID_STRSIZE (3 * sizeof(struct wusb_ckhdid) + 1)
 
-- 
1.5.6.5

