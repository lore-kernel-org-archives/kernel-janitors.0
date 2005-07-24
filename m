From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 24 Jul 2005 19:53:58 +0000
Subject: [KJ] [TRIVIAL PATCH] Spelling and whitespace fixes for
Message-Id: <20050724195357.GA1027@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76995442869462194=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76995442869462194==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch fixes some spelling errors in REPORTING-BUGS and also
removes all trailing whitespaces (I hope this OK with the trivial patch
monkey).

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 REPORTING-BUGS |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff -urpN -X dontdiff linux-2.6.13-rc3/REPORTING-BUGS linux-2.6.13-rc3~spelling/REPORTING-BUGS
--- linux-2.6.13-rc3/REPORTING-BUGS	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc3~spelling/REPORTING-BUGS	2005-07-24 21:42:52.000000000 +0200
@@ -9,7 +9,7 @@ screen please read "Documentation/oops-t
 bug report. This explains what you should do with the "Oops" information
 to make it useful to the recipient.
 
-      Send the output the maintainer of the kernel area that seems to
+      Send the output to the maintainer of the kernel area that seems to
 be involved with the problem. Don't worry too much about getting the
 wrong person. If you are unsure send it to the person responsible for the
 code relevant to what you were doing. If it occurs repeatably try and
@@ -18,15 +18,15 @@ The list of maintainers is in the MAINTA
 
       If it is a security bug, please copy the Security Contact listed
 in the MAINTAINERS file.  They can help coordinate bugfix and disclosure.
-See Documentation/SecurityBugs for more infomation.
+See Documentation/SecurityBugs for more information.
 
       If you are totally stumped as to whom to send the report, send it to
 linux-kernel@vger.kernel.org. (For more information on the linux-kernel
 mailing list see http://www.tux.org/lkml/).
 
-This is a suggested format for a bug report sent to the Linux kernel mailing 
-list. Having a standardized bug report form makes it easier  for you not to 
-overlook things, and easier for the developers to find the pieces of 
+This is a suggested format for a bug report sent to the Linux kernel mailing
+list. Having a standardized bug report form makes it easier for you not to
+overlook things, and easier for the developers to find the pieces of
 information they're really interested in. Don't feel you have to follow it.
 
       First run the ver_linux script included as scripts/ver_linux, which
@@ -35,13 +35,13 @@ the command "sh scripts/ver_linux".
 
 Use that information to fill in all fields of the bug report form, and
 post it to the mailing list with a subject of "PROBLEM: <one line
-summary from [1.]>" for easy identification by the developers    
+summary from [1.]>" for easy identification by the developers
 
-[1.] One line summary of the problem:    
+[1.] One line summary of the problem:
 [2.] Full description of the problem/report:
 [3.] Keywords (i.e., modules, networking, kernel):
 [4.] Kernel version (from /proc/version):
-[5.] Output of Oops.. message (if applicable) with symbolic information 
+[5.] Output of Oops.. message (if applicable) with symbolic information
      resolved (see Documentation/oops-tracing.txt)
 [6.] A small shell script or example program which triggers the
      problem (if possible)

--===============76995442869462194==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76995442869462194==--
