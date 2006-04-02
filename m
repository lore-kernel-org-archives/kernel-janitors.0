From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 02 Apr 2006 21:31:26 +0000
Subject: [Fwd: Re: [KJ][Patch] fix kbuild warning in sisfb.o]
Message-Id: <1144013487.29888.11.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26690881923892007=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26690881923892007==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Randy,

I thought I would ask you, as you posted the warnings on KJ in the first
place.

How do you generate the kbuild warnings ?
I have spent a fair bit of time over the weekend trying to figure it
out, and even with git-20 which sams patch applies cleanly to, the
tree's I build don't generate these warnings. Make help shows that the
'make buildcheck' that these kbuild warnings replaces is gone, but no
help on how to get these warnings.

Anyway if you could point me in the direction of some info about how to
use, that would be great. :)

Darren J


-------- Forwarded Message --------
From: Sam Ravnborg <sam@ravnborg.org>
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>, Greg KH
<greg@kroah.com>
Subject: Re: [KJ][Patch] fix kbuild warning in sisfb.o
Date: Sat, 1 Apr 2006 09:38:29 +0200

On Sat, Apr 01, 2006 at 01:12:13PM +1100, Darren Jenkins" wrote:
> Sam
> 
> I don't know weather you are aware of this one yet, but we have just
> found an issue where 'struct pci_device_id' should be marked
> __devinitdata (see Documentation/pci.txt) as the pci code apparently
> only uses it in the driver initialisation, but the 'struct pci_driver'
> will still hold a pointer to it, giving a kbuild warning. See below.
> This definitely looks like a false positive that should be removed.

Hi Darren.
Following patch should fix it.
It recognize that the variable is named *_driver, and in that case
it will not warn about references to .init.data (+.init.text and
.exit.text).

This is only compiletine tested since I'm a bit busy atm.
Let me know if this solves it as expected and especially if it seems
to silence warnings that is not false positives.

	Sam

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0b92ddf..81448e5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -492,7 +492,7 @@ static int strrcmp(const char *s, const 
  *   These functions may often be marked __init and we do not want to
  *   warn here.
  *   the pattern is identified by:
- *   tosec   = .init.text | .exit.text
+ *   tosec   = .init.text | .exit.text | .init.data
  *   fromsec = .data
  *   atsym = *_driver, *_ops, *_probe, *probe_one
  **/
@@ -522,7 +522,8 @@ static int secref_whitelist(const char *
 
 	/* Check for pattern 2 */
 	if ((strcmp(tosec, ".init.text") != 0) &&
-	    (strcmp(tosec, ".exit.text") != 0))
+	    (strcmp(tosec, ".exit.text") != 0) &&
+	    (strcmp(tosec, ".init.data") != 0))
 		f2 = 0;
 	if (strcmp(fromsec, ".data") != 0)
 		f2 = 0;



--===============26690881923892007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26690881923892007==--
