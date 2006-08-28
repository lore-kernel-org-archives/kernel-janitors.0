From: "Shakthi Kannan" <shakthimaan@gmail.com>
Date: Mon, 28 Aug 2006 19:39:29 +0000
Subject: [KJ] string concatenation with __FUNCTION__
Message-Id: <d16b1c80608281227k6aad7416u10a626d6a0b9cf18@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

TODO entry:
- remove string concatenation with __FUNCTION__ (get rid of
  warnings, and get ready for __func__):
  - printk(KERN_INFO "blabla " __FUNCTION__ "\n");
  + printk(KERN_INFO "blabla %s\n", __FUNCTION__);

What does it mean by "get ready for __func__ "?

I have checked with 2.6.18-rc4 and all references of __FUNCTION__
don't have any "string concatenation".

SK

-- 
Shakthi Kannan
http://www.shakthimaan.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
