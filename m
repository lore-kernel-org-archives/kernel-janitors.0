From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 02 May 2004 14:45:07 +0000
Subject: [Kernel-janitors] [PATCH] h8.c (maybe)
Message-Id: <Pine.LNX.4.58.0405020843210.1663@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2072015680-1164598-1083509099=:1663"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--2072015680-1164598-1083509099=:1663
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Added code in case kernel_thread fails. I also can't test this. I
can't seem to locate the uCLinux files necessary to compile the kernel and
include these. If it's already in the 2.6.5 kernel, can someone tell me
where or how to trick menuconfig to add these in? :)

--MJK
--2072015680-1164598-1083509099=:1663
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="h8.c.diff"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0405020844590.1663@mustang.cs.nmsu.edu>
Content-Description: 
Content-Disposition: attachment; filename="h8.c.diff"

LS0tIG9sZC5saW51eC0yLjYuNS9kcml2ZXJzL2NoYXIvaDguYwkyMDA0LTA0
LTAzIDIwOjM2OjU1LjAwMDAwMDAwMCAtMDcwMA0KKysrIGxpbnV4LTIuNi41
L2RyaXZlcnMvY2hhci9oOC5jCTIwMDQtMDUtMDIgMDc6NDY6NTUuMDAwMDAw
MDAwIC0wNjAwDQpAQCAtMjg5LDYgKzI4OSw4IEBADQogDQogc3RhdGljIGlu
dCBfX2luaXQgaDhfaW5pdCh2b2lkKQ0KIHsNCisJaW50IHJldDsNCisNCiAg
ICAgICAgIGlmKHJlcXVlc3RfaXJxKGg4X2lycSwgaDhfaW50ciwgU0FfSU5U
RVJSVVBULCAiaDgiLCBOVUxMKSkNCiAgICAgICAgIHsNCiAgICAgICAgICAg
ICAgICAgcHJpbnRrKEtFUk5fRVJSICJIODogZXJyb3I6IElSUSAlZCBpcyBu
b3QgZnJlZVxuIiwgaDhfaXJxKTsNCkBAIC0zMDgsNyArMzEwLDE0IEBADQog
DQogCWg4X2h3X2luaXQoKTsNCiANCi0Ja2VybmVsX3RocmVhZChoOF9tb25p
dG9yX3RocmVhZCwgTlVMTCwgMCk7DQorCXJldCA9IGtlcm5lbF90aHJlYWQo
aDhfbW9uaXRvcl90aHJlYWQsIE5VTEwsIDApIDwgMCk7DQorCWlmKHJldCA8
IDApIHsNCisJCXByaW50ayhLRVJOX0VSUiAiSDg6IGVycm9yOiBjYW5ub3Qg
Y3JlYXRlIG1vbml0b3IgdGhyZWFkXG4iKTsNCisJCXJlbW92ZV9wcm9jX2Vu
dHJ5KCJkcml2ZXIvaDgiLCBOVUxMKTsNCisJICAgICAgICByZWxlYXNlX3Jl
Z2lvbihoOF9iYXNlLCA4KTsJDQorCQlmcmVlX2lycShoOF9pcnEsIE5VTEwp
Ow0KKwkJcmV0dXJuIHJldDsNCisJfQ0KIA0KICAgICAgICAgcmV0dXJuIDA7
DQogfQ0K

--2072015680-1164598-1083509099=:1663
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--2072015680-1164598-1083509099=:1663--
