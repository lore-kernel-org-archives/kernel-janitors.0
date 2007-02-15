From: "Douglas Landgraf" <dougsland@gmail.com>
Date: Thu, 15 Feb 2007 19:51:33 +0000
Subject: [KJ] [PATCH] lp486e.c: cleanup not needed casts
Message-Id: <68cac7520702151151n759f0c1am8d7666f02545b054@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_67067_29639994.1171569093510"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

------=_Part_67067_29639994.1171569093510
Content-Type: multipart/alternative;
    boundary="----------=_1171569113-17164-107"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1171569113-17164-107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

    Removed all unnecessary casts.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

------------=_1171569113-17164-107
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span class="gmail_quote"></span>&nbsp;&nbsp;&nbsp; Removed all unnecessary casts.<br><br><span><span>Signed-off-by: Douglas Schilling Landgraf &lt;<a href="mailto:dougsland@gmail.com">dougsland@gmail.com</a>&gt;</span></span><br clear="all">


------------=_1171569113-17164-107--

------=_Part_67067_29639994.1171569093510
Content-Type: text/x-patch; name=patch-linux-2.6.20-lp486e.diff; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ey7l202f
Content-Disposition: attachment; filename="patch-linux-2.6.20-lp486e.diff"

LS0tIGxpbnV4LTIuNi4yMC12YW5pbGxhL2RyaXZlcnMvbmV0L2xwNDg2ZS5j
CTIwMDctMDItMDQgMTY6NDQ6NTQuMDAwMDAwMDAwIC0wMjAwCisrKyBsaW51
eC0yLjYuMjAvZHJpdmVycy9uZXQvbHA0ODZlLmMJMjAwNy0wMi0xNSAxNjo1
OTozOC4wMDAwMDAwMDAgLTAyMDAKQEAgLTM5Miw3ICszOTIsNyBAQAogCXN0
cnVjdCBpNTk2X3ByaXZhdGUgKmxwOwogCWludCBib2d1c2NudCA9IGN0Owog
Ci0JbHAgPSAoc3RydWN0IGk1OTZfcHJpdmF0ZSAqKSBkZXYtPnByaXY7CisJ
bHAgPSBkZXYtPnByaXY7CiAJd2hpbGUgKGxwLT5zY2IuY29tbWFuZCkgewog
CQlpZiAoLS1ib2d1c2NudCA9PSAwKSB7CiAJCQlwcmludGsoIiVzOiAlcyB0
aW1lZCBvdXQgLSBzdGF0ICU0LjR4LCBjbWQgJTQuNHhcbiIsCkBAIC00MTMs
NyArNDEzLDcgQEAKIAlpbnQgaTsKIAkvLyBzdHJ1Y3QgaTU5Nl9yYmQgKnJi
ZDsKIAotCWxwID0gKHN0cnVjdCBpNTk2X3ByaXZhdGUgKikgZGV2LT5wcml2
OworCWxwID0gZGV2LT5wcml2OwogCWxwLT5zY2IucGFfcmZkID0gSTU5Nl9O
VUxMOwogCiAJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7CkBAIC00NzAs
NyArNDcwLDcgQEAKIAlzdHJ1Y3QgaTU5Nl9wcml2YXRlICpscDsKIAlzdHJ1
Y3QgaTU5Nl9yZmQgKnJmZDsKIAotCWxwID0gKHN0cnVjdCBpNTk2X3ByaXZh
dGUgKikgZGV2LT5wcml2OworCWxwID0gZGV2LT5wcml2OwogCWxwLT5yeF90
YWlsLT5wYV9uZXh0ID0gSTU5Nl9OVUxMOwogCiAJZG8gewpAQCAtNjI2LDcg
KzYyNiw3IEBACiAJaWYgKGk1OTZfc2NwX3NldHVwKGRldikpCiAJCXJldHVy
biAxOwogCi0JbHAgPSAoc3RydWN0IGk1OTZfcHJpdmF0ZSAqKSBkZXYtPnBy
aXY7CisJbHAgPSBkZXYtPnByaXY7CiAJbHAtPnNjYi5jb21tYW5kID0gMDsK
IAogCW1lbWNweSAoKHZvaWQgKilscC0+aTU5Nl9jb25maWcsIGluaXRfc2V0
dXAsIDE0KTsKQEAgLTc0Myw5ICs3NDMsOSBAQAogCXN0cnVjdCBpNTk2X3By
aXZhdGUgKmxwOwogCXN0cnVjdCBpNTk2X2NtZCAqY21kOwogCi0JbHAgPSAo
c3RydWN0IGk1OTZfcHJpdmF0ZSAqKSBkZXYtPnByaXY7CisJbHAgPSBkZXYt
PnByaXY7CiAJd2hpbGUgKGxwLT5jbWRfaGVhZCkgewotCQljbWQgPSAoc3Ry
dWN0IGk1OTZfY21kICopbHAtPmNtZF9oZWFkOworCQljbWQgPSBscC0+Y21k
X2hlYWQ7CiAKIAkJbHAtPmNtZF9oZWFkID0gcGFfdG9fdmEobHAtPmNtZF9o
ZWFkLT5wYV9uZXh0KTsKIAkJbHAtPmNtZF9iYWNrbG9nLS07CkBAIC05NzYs
NyArOTc2LDcgQEAKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKLQlscCA9IChz
dHJ1Y3QgaTU5Nl9wcml2YXRlICopIGRldi0+cHJpdjsKKwlscCA9IGRldi0+
cHJpdjsKIAlzcGluX2xvY2tfaW5pdCgmbHAtPmNtZF9sb2NrKTsKIAogCS8q
CkBAIC0xMDczLDcgKzEwNzMsNyBAQAogCQkJc3RydWN0IHR4X2NtZCAqdHhf
Y21kOwogCQkJc3RydWN0IGk1OTZfdGJkICp0eF9jbWRfdGJkOwogCi0JCQl0
eF9jbWQgPSAoc3RydWN0IHR4X2NtZCAqKSBjbWQ7CisJCQl0eF9jbWQgPSBj
bWQ7CiAJCQl0eF9jbWRfdGJkID0gcGFfdG9fdmEodHhfY21kLT5wYV90YmQp
OwogCiAJCQlmcmFtZXNfb3V0Kys7CkBAIC0xMTU3LDcgKzExNTcsNyBAQAog
CXVuc2lnbmVkIHNob3J0IHN0YXR1cywgYWNrX2NtZCA9IDA7CiAJaW50IGZy
YW1lc19pbiA9IDA7CiAKLQlscCA9IChzdHJ1Y3QgaTU5Nl9wcml2YXRlICop
IGRldi0+cHJpdjsKKwlscCA9IGRldi0+cHJpdjsKIAogCS8qCiAJICogVGhl
IDgyNTk2IGV4YW1pbmVzIHRoZSBjb21tYW5kLCBwZXJmb3JtcyB0aGUgcmVx
dWlyZWQgYWN0aW9uLAo=

------=_Part_67067_29639994.1171569093510
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_Part_67067_29639994.1171569093510--
