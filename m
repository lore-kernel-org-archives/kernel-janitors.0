From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 27 Jan 2005 22:35:05 +0000
Subject: [KJ] Fwd: I noticed these
Message-Id: <41F96C99.8080405@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

anyone interested?

-------- Original Message --------

Could you look into, or forward to Kernel Janitor list.

1. Psmouse and input event drivers don't have module alias autoload 
support.
    I think it should be possible to do this similar to how 
misc_device works.

2. /proc interface in /dev/rtc doesn't seem to have MODULE_OWNER ref 
counting.

---
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
