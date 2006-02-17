From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 12:13:55 +0000
Subject: [KJ][Patch] make storage class first in nfs4proc.c
Message-Id: <1140178435.7789.31.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92827210115685022=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============92827210115685022==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

from http://linuxicc.sourceforge.net/

ICC complains about : Storage Class is not First

@ line 2961 of nfs4proc.c

The patch below just re-orders the modifiers so static is first.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/fs/nfs/nfs4proc.c.orig	2006-02-17 23:03:04.000000000 +1100
+++ linux-2.6.16-rc3/fs/nfs/nfs4proc.c	2006-02-17 23:03:51.000000000 +1100
@@ -2958,7 +2958,7 @@ static void nfs4_delegreturn_release(voi
 	kfree(calldata);
 }
 
-const static struct rpc_call_ops nfs4_delegreturn_ops = {
+static const struct rpc_call_ops nfs4_delegreturn_ops = {
 	.rpc_call_prepare = nfs4_delegreturn_prepare,
 	.rpc_call_done = nfs4_delegreturn_done,
 	.rpc_release = nfs4_delegreturn_release,



--===============92827210115685022==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92827210115685022==--
