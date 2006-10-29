From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Sun, 29 Oct 2006 19:14:59 +0000
Subject: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-954840626-1162149299=:92440"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--0-954840626-1162149299=:92440
Content-Type: multipart/alternative;
    boundary="----------=_1162149399-25357-570"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1162149399-25357-570
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This little patch cleans the definition of HANDLE_STACK in arch/x86_64/kern=
el/traps.c because it's syntax is misleading.







------------=_1162149399-25357-570
Content-Type: text/html; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><DEFANGED_style_0 <!-- DIV {margin:0px;} --></DEFANGED_style></=
head><body><div DEFANGED_style=3D"font-family:times new roman, new york, ti=
mes, serif;font-size:12pt"><div>This little patch cleans the definition of =
HANDLE_STACK in arch/x86_64/kernel/traps.c because it's syntax is misleadin=
g.<br><br><br><br></div></div><br></body></html>
------------=_1162149399-25357-570--

--0-954840626-1162149299=:92440
Content-Type: text/plain;
	name="=?utf-8?q?0001-cleaning-of-HANDLE=5FSTACK-definition.txt?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="=?utf-8?q?0001-cleaning-of-HANDLE=5FSTACK-definition.txt?="

RnJvbSAyZWU5MTdjNTg2MzQzOWVkMDgyMzY4NTUzMDAzODY1MTFlNzM4MGFl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHaWFuZ2lhY29tbyBN
YXJpb3R0aSA8Z2lhbmdpYWNvbW9fbWFyaW90dGlAeWFob28uY29tPgpEYXRl
OiBTdW4sIDI5IE9jdCAyMDA2IDEyOjU2OjI4ICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gY2xlYW5pbmcgb2YgSEFORExFX1NUQUNLIGRlZmluaXRpb24KCi0t
LQogYXJjaC94ODZfNjQva2VybmVsL3RyYXBzLmMgfCAgIDMwICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Nl82NC9rZXJuZWwvdHJhcHMuYyBiL2FyY2gveDg2XzY0L2tlcm5l
bC90cmFwcy5jCmluZGV4IDc4MTkwMjIuLmEwYjFlMWYgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2XzY0L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gveDg2XzY0
L2tlcm5lbC90cmFwcy5jCkBAIC0yOTcsMjAgKzI5NywyMiBAQCB2b2lkIGR1
bXBfdHJhY2Uoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssCiAJICogaXRlcmF0
aW9uIHdpbGwgZXZlbnR1YWxseSB0cmlnZ2VyLgogCSAqLwogI2RlZmluZSBI
QU5ETEVfU1RBQ0soY29uZCkgXAotCWRvIHdoaWxlIChjb25kKSB7IFwKLQkJ
dW5zaWduZWQgbG9uZyBhZGRyID0gKnN0YWNrKys7IFwKLQkJaWYgKG9vcHNf
aW5fcHJvZ3Jlc3MgPyAJCVwKLQkJCV9fa2VybmVsX3RleHRfYWRkcmVzcyhh
ZGRyKSA6IFwKLQkJCWtlcm5lbF90ZXh0X2FkZHJlc3MoYWRkcikpIHsgXAot
CQkJLyogXAotCQkJICogSWYgdGhlIGFkZHJlc3MgaXMgZWl0aGVyIGluIHRo
ZSB0ZXh0IHNlZ21lbnQgb2YgdGhlIFwKLQkJCSAqIGtlcm5lbCwgb3IgaW4g
dGhlIHJlZ2lvbiB3aGljaCBjb250YWlucyB2bWFsbG9jJ2VkIFwKLQkJCSAq
IG1lbW9yeSwgaXQgKm1heSogYmUgdGhlIGFkZHJlc3Mgb2YgYSBjYWxsaW5n
IFwKLQkJCSAqIHJvdXRpbmU7IGlmIHNvLCBwcmludCBpdCBzbyB0aGF0IHNv
bWVvbmUgdHJhY2luZyBcCi0JCQkgKiBkb3duIHRoZSBjYXVzZSBvZiB0aGUg
Y3Jhc2ggd2lsbCBiZSBhYmxlIHRvIGZpZ3VyZSBcCi0JCQkgKiBvdXQgdGhl
IGNhbGwgcGF0aCB0aGF0IHdhcyB0YWtlbi4gXAotCQkJICovIFwKLQkJCW9w
cy0+YWRkcmVzcyhkYXRhLCBhZGRyKTsgICBcCisJZG8geyBcCisJCXdoaWxl
IChjb25kKSB7IFwKKwkJCXVuc2lnbmVkIGxvbmcgYWRkciA9ICpzdGFjaysr
OyBcCisJCQlpZiAob29wc19pbl9wcm9ncmVzcyA/IAkJXAorCQkJCV9fa2Vy
bmVsX3RleHRfYWRkcmVzcyhhZGRyKSA6IFwKKwkJCQlrZXJuZWxfdGV4dF9h
ZGRyZXNzKGFkZHIpKSB7IFwKKwkJCQkvKiBcCisJCQkgCSogSWYgdGhlIGFk
ZHJlc3MgaXMgZWl0aGVyIGluIHRoZSB0ZXh0IHNlZ21lbnQgb2YgdGhlIFwK
KwkJCSAJKiBrZXJuZWwsIG9yIGluIHRoZSByZWdpb24gd2hpY2ggY29udGFp
bnMgdm1hbGxvYydlZCBcCisJCQkgCSogbWVtb3J5LCBpdCAqbWF5KiBiZSB0
aGUgYWRkcmVzcyBvZiBhIGNhbGxpbmcgXAorCQkJIAkqIHJvdXRpbmU7IGlm
IHNvLCBwcmludCBpdCBzbyB0aGF0IHNvbWVvbmUgdHJhY2luZyBcCisJCQkg
CSogZG93biB0aGUgY2F1c2Ugb2YgdGhlIGNyYXNoIHdpbGwgYmUgYWJsZSB0
byBmaWd1cmUgXAorCQkJIAkqIG91dCB0aGUgY2FsbCBwYXRoIHRoYXQgd2Fz
IHRha2VuLiBcCisJCQkgCSovIFwKKwkJCQlvcHMtPmFkZHJlc3MoZGF0YSwg
YWRkcik7ICAgXAorCQkJfSBcCiAJCX0gXAogCX0gd2hpbGUgKDApCiAKLS0g
CjEuNC4zLjIKCg==

--0-954840626-1162149299=:92440
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-954840626-1162149299=:92440--
