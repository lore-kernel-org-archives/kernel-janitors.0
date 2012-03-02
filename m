From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 19:01:28 +0000
Subject: [patch] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <20120302190128.GC3951@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"filename" is a efi_char16_t string so this check for reaching the end
of the array doesn't work.  We need to cast it to char pointer before
doing the math.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/boot/compressed/eboot.c b/arch/x86/boot/compressed/eboot.c
index fec216f..cf4cdb7 100644
--- a/arch/x86/boot/compressed/eboot.c
+++ b/arch/x86/boot/compressed/eboot.c
@@ -559,7 +559,7 @@ static efi_status_t handle_ramdisks(efi_loaded_image_t *image,
 			str++;
 
 		while (*str && *str != ' ' && *str != '\n') {
-			if (p >= filename + sizeof(filename))
+			if ((char *)p >= (char *)filename + sizeof(filename))
 				break;
 
 			*p++ = *str++;
