From: Domen Puncer <domen@coderock.org>
Date: Thu, 07 Jul 2005 09:33:32 +0000
Subject: [KJ] [faq patch] mail per subsystem
Message-Id: <20050707093332.GA21414@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============020992599887838637=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============020992599887838637==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

nacc noted on irc, that this is not in faq, but probably should be.
Here's a compact version I came up with:

Comments? Better wordings?

--- faq-old	2005-06-29 14:22:28.000000000 +0200
+++ faq-new	2005-07-07 11:29:43.000000000 +0200
@@ -24,6 +24,11 @@
 A: Mailing list: kernel-janitors@lists.osdl.org
    If you feel confident enough, you can CC: someone from MAINTAINERS too.
 
+Q: I have lots of patches that do the same thing. Can I just send them in
+   one mail?
+A: No, but neither send them in lots of small mails. Try splitting them per
+   subsystem (drivers/net/, fs/ext3/...).
+
 Q: Where can I find janitors?
 A: On our mailing list and #kerneljanitor at irc.oftc.net
 

--===============020992599887838637==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============020992599887838637==--
