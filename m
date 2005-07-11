From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 11 Jul 2005 05:36:18 +0000
Subject: Re: [KJ] [faq patch] mail per subsystem
Message-Id: <20050711053618.GA14070@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97551595369768473=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707093332.GA21414@nd47.coderock.org>
In-Reply-To: <20050707093332.GA21414@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============97551595369768473==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07.07.2005 [11:33:32 +0200], Domen Puncer wrote:
> Hi!
> 
> nacc noted on irc, that this is not in faq, but probably should be.
> Here's a compact version I came up with:
> 
> Comments? Better wordings?

Patch makes sense; here's one with one grammatical fix & a link to the
conversation with David Miller on LKML.

Thanks,
Nish

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- faq	2005-07-10 22:34:38.000000000 -0700
+++ faq.dev	2005-07-10 22:34:30.000000000 -0700
@@ -24,6 +24,13 @@ Q: Where should I send patches to?
 A: Mailing list: kernel-janitors@lists.osdl.org
    If you feel confident enough, you can CC: someone from MAINTAINERS too.
 
+Q: I have lots of patches that do the same thing. Can I just send them in
+   one mail?
+A: No, but don't send them in lots of small mails either. Try splitting
+   them up per subsystem (drivers/net/, fs/ext3/...). See here:
+   http://marc.theaimsgroup.com/?l=linux-kernel&m=112105809816217&w=2
+   for details.
+
 Q: Where can I find janitors?
 A: On our mailing list and #kerneljanitor at irc.oftc.net
 

--===============97551595369768473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97551595369768473==--
