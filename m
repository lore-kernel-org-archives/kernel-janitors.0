From: Joe Perches <joe@perches.com>
Date: Mon, 14 Mar 2016 18:54:30 +0000
Subject: coccinelle: generalized removal of unnecessary pointer casts?
Message-Id: <1457981670.11972.114.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

I wrote a little cocci script to remove unnecessary
casts for memset and memcpy (below) and tested it on
linux kernel's drivers/staging/ directory.

For instance, when dst and src are already pointers:

-	memcpy((u8 *)dst, (u8 *)src, r8712_get_wlan_bssid_ex_sz(src));
+	memcpy(dst, src, r8712_get_wlan_bssid_ex_sz(src));

It works ok, (it doesn't remove unnecessary parentheses
around the pointers) but it makes me wonder if there's a
generalized spatch mechanism to remove casts when an
arbitrary function takes a void * in any argument
position and a call to that function uses a cast of a
pointer to any pointer type for that argument.

$ cat remove_mem_casts.cocci=A0
@@
type t;
t *p;
type v;
expression e1;
expression e2;
@@

-	memset((v*)p, e1, e2)
+	memset(p, e1, e2)

@@
type t;
t *p;
type v;
expression e1;
expression e2;
@@

-	memcpy((v*)p, e1, e2)
+	memcpy(p, e1, e2)

@@
type t;
t *p;
type v;
expression e1;
expression e2;
@@

-	memcpy(e1, (v*)p, e2)
+	memcpy(e1, p, e2)

@@
type t1;
type t2;
t1 *p1;
t2 *p2;
type v1;
type v2;
expression e1;
@@

-	memcpy((v1*)p1, (v2*)p2, e1)
+	memcpy(p1, p2, e1)


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
