From: Travis Spencer <travislspencer@gmail.com>
Date: Thu, 19 May 2005 15:15:57 +0000
Subject: [KJ] [PATCH] Update for the KJ FAQ
Message-Id: <e3b7bac05051908155489a230@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I just sent in my first patch.  As you probably all noticed, I used
the wrong patch level and my tabs were swallowed up when I copied and
pasted from my terminal.  domen suggested on irc that I send my
patched to patch-tester@coderock.org first because it will find little
mistakes like this.  I added a blurb about this to the FAQ found at
http://janitor.kernelnewbies.org/faq and attached the patch.

--

Regards,

Travis Spencer
Portland, OR USA

--- old/faq~        2005-04-22 05:54:50.000000000 -0700
+++ new/faq 2005-05-19 08:08:22.387524000 -0700
@@ -38,7 +38,10 @@
 A: Disable line wrap, and see upper FAQ.

  Q: How do I test my settings are ok?
-A: Send patch to yourself, save it, try applying it. If it works it's ok.
+A: Send patch to yourself, save it, try applying it. If it works it's
+   ok. Also, you can send the patch to patch-tester@coderock.org; it
+   will find little mistakes like incorrect patch level, the use of
+   spaces instead of tabs, etc.


 Some tips

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
