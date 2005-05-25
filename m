From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Wed, 25 May 2005 21:33:54 +0000
Subject: [KJ] [PATCH] net/sunrpc string * to [] fix
Message-Id: <20050525183354.2ba9953a.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10577253740735104=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10577253740735104==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__25_May_2005_18_33_54_-0300_ZeeR2U.dCtNt_710"

--Signature=_Wed__25_May_2005_18_33_54_-0300_ZeeR2U.dCtNt_710
Content-Type: multipart/mixed;
	boundary="Multipart=_Wed__25_May_2005_18_33_54_-0300_5i/e.UgCFyMbJ2+Q"


--Multipart=_Wed__25_May_2005_18_33_54_-0300_5i/e.UgCFyMbJ2+Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm new here, and would like to help with Kernel-Janitors.  If nobody else
is working on 'char *s =3D "string";', I'd like to continue fixing the
remaining strings (473 to go).


This patch "fixes" net/sunrpc/sched.c and svcauth_unix.c string
declarations from=20
	char *p =3D "string"
to
	char p[] =3D "string";
as pointed by Jeff Garzik on Kernel-Janitors' TODO.


Apologies for attaching the patch (and not inlining it), but it would be
mangled otherwise.  I'll try to fix this.

Best regards.

---

 sched.c        |    2 +-
 svcauth_unix.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Signed-off-by: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>

--=20
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which=20
    side of the bathroom door you're on.


--Multipart=_Wed__25_May_2005_18_33_54_-0300_5i/e.UgCFyMbJ2+Q
Content-Type: text/plain;
 name="sunrpc_string_fix.patch"
Content-Disposition: attachment;
 filename="sunrpc_string_fix.patch"
Content-Transfer-Encoding: quoted-printable

diff -urNp -X dontdiff linux-2.6.11.10/net/sunrpc/sched.c mod-linux-2.6.11.=
10/net/sunrpc/sched.c
--- linux-2.6.11.10/net/sunrpc/sched.c	2005-05-25 17:52:45.000000000 -0300
+++ mod-linux-2.6.11.10/net/sunrpc/sched.c	2005-05-25 17:54:39.000000000 -0=
300
@@ -1054,7 +1054,7 @@ void rpc_show_tasks(void)
 	printk("-pid- proc flgs status -client- -prog- --rqstp- -timeout "
 		"-rpcwait -action- --exit--\n");
 	alltask_for_each(t, le, &all_tasks) {
-		const char *rpc_waitq =3D "none";
+		const char rpc_waitq[] =3D "none";
=20
 		if (RPC_IS_QUEUED(t))
 			rpc_waitq =3D rpc_qname(t->u.tk_wait.rpc_waitq);
diff -urNp -X dontdiff linux-2.6.11.10/net/sunrpc/svcauth_unix.c mod-linux-=
2.6.11.10/net/sunrpc/svcauth_unix.c
--- linux-2.6.11.10/net/sunrpc/svcauth_unix.c	2005-05-25 17:52:57.000000000=
 -0300
+++ mod-linux-2.6.11.10/net/sunrpc/svcauth_unix.c	2005-05-25 17:54:54.00000=
0000 -0300
@@ -222,7 +222,7 @@ static int ip_map_show(struct seq_file *
 {
 	struct ip_map *im;
 	struct in_addr addr;
-	char *dom =3D "-no-domain-";
+	char dom[] =3D "-no-domain-";
=20
 	if (h =3D=3D NULL) {
 		seq_puts(m, "#class IP domain\n");

--Multipart=_Wed__25_May_2005_18_33_54_-0300_5i/e.UgCFyMbJ2+Q--

--Signature=_Wed__25_May_2005_18_33_54_-0300_ZeeR2U.dCtNt_710
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)

iD8DBQFClO9JQa1n8nJvmFQRAhheAJ9Kobga5HVir7QdJAln9gHG4j3lRwCgwt7c
LBxGfCrQ6FrF5S36jB4bwp0=
=8+GB
-----END PGP SIGNATURE-----

--Signature=_Wed__25_May_2005_18_33_54_-0300_ZeeR2U.dCtNt_710--

--===============10577253740735104==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10577253740735104==--
