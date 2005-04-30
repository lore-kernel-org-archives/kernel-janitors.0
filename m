From: "=?iso-8859-1?Q?david.chosrova@libertysurf.fr?="
Date: Sat, 30 Apr 2005 22:15:13 +0000
Subject: [KJ] PATCH: sti/cli removal ep7211.c
Message-Id: <IFS5TD$DBE87D0E3419864024C7CDB77EB5411A@tiscali.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="_=__=_XaM3_.1114899313.2A.750588.42.18789.52.42.007.22324"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--_=__=_XaM3_.1114899313.2A.750588.42.18789.52.42.007.22324
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

description: convert sti/cli... usage to accepted locking=0D=0Aprimitives=
.=0D=0A=0D=0Asigned-off-by : David chosrova <david.chosrova@libertysurf.f=
r>=0D=0A=0D=0ADavid.=0A************************ ADSL JUSQU'A 8 MEGA + 3 M=
OIS DE TELEPHONE GRATUIT ************************=0AL'ultra haut d=E9bit =
=E0 15EUR/mois seulement ! Et vous t=E9l=E9phonez gratuitement en France =
vers les postes fixes,=0Ahors num=E9ros sp=E9ciaux pendant 3 mois.=0APour=
 profiter de cette offre exceptionnelle, cliquez ici : http://register.ti=
scali.fr/adsl/  (voir conditions sur le site)=0A
--_=__=_XaM3_.1114899313.2A.750588.42.18789.52.42.007.22324
Content-Type: text/plain;
	name="patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="patch.txt"

LS0tIGxpbnV4LTIuNi4xMS43L2RyaXZlcnMvbmV0L2lyZGEvZXA3MjExX2lyLmMub3JpZwky
MDA1LTA0LTI3IDE3OjQxOjM2LjAwMDAwMDAwMCArMDEwMAorKysgbGludXgtMi42LjExLjcv
ZHJpdmVycy9uZXQvaXJkYS9lcDcyMTFfaXIuYwkyMDA1LTA0LTMwIDEzOjQ0OjAzLjAwMDAw
MDAwMCArMDEwMApAQCAtOCwxMiArOCwxNCBAQAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
CiAjaW5jbHVkZSA8bGludXgvdHR5Lmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAKICNpbmNsdWRlIDxuZXQvaXJkYS9pcmRhLmg+
CiAjaW5jbHVkZSA8bmV0L2lyZGEvaXJkYV9kZXZpY2UuaD4KIAogI2luY2x1ZGUgPGFzbS9p
by5oPgogI2luY2x1ZGUgPGFzbS9oYXJkd2FyZS5oPgorIAogCiAjZGVmaW5lIE1JTl9ERUxB
WSAyNSAgICAgIC8qIDE1IHVzLCBidXQgd2FpdCBhIGxpdHRsZSBtb3JlIHRvIGJlIHN1cmUg
Ki8KICNkZWZpbmUgTUFYX0RFTEFZIDEwMDAwICAgLyogMSBtcyAqLwpAQCAtMjIsNyArMjQs
NyBAQCBzdGF0aWMgdm9pZCBlcDcyMTFfaXJfb3Blbihkb25nbGVfdCAqc2VsCiBzdGF0aWMg
dm9pZCBlcDcyMTFfaXJfY2xvc2UoZG9uZ2xlX3QgKnNlbGYpOwogc3RhdGljIGludCAgZXA3
MjExX2lyX2NoYW5nZV9zcGVlZChzdHJ1Y3QgaXJkYV90YXNrICp0YXNrKTsKIHN0YXRpYyBp
bnQgIGVwNzIxMV9pcl9yZXNldChzdHJ1Y3QgaXJkYV90YXNrICp0YXNrKTsKLQorc3RhdGlj
IHNwaW5sb2NrX3QgZHJpdmVyX2xvY2s7CiBzdGF0aWMgc3RydWN0IGRvbmdsZV9yZWcgZG9u
Z2xlID0gewogCS50eXBlID0gSVJEQV9FUDcyMTFfSVIsCiAJLm9wZW4gPSBlcDcyMTFfaXJf
b3BlbiwKQEAgLTM2LDcgKzM4LDggQEAgc3RhdGljIHZvaWQgZXA3MjExX2lyX29wZW4oZG9u
Z2xlX3QgKnNlbAogewogCXVuc2lnbmVkIGludCBzeXNjb24xLCBmbGFnczsKIAotCXNhdmVf
ZmxhZ3MoZmxhZ3MpOyBjbGkoKTsKKwkKKwlzcGluX2xvY2tfaXJxc2F2ZSgmZHJpdmVyX2xv
Y2ssIGZsYWdzKTsKIAogCS8qIFR1cm4gb24gdGhlIFNJUiBlbmNvZGVyLiAqLwogCXN5c2Nv
bjEgPSBjbHBzX3JlYWRsKFNZU0NPTjEpOwpAQCAtNDYsMTQgKzQ5LDE0IEBAIHN0YXRpYyB2
b2lkIGVwNzIxMV9pcl9vcGVuKGRvbmdsZV90ICpzZWwKIAkvKiBYWFg6IFdlIHNob3VsZCBk
aXNhYmxlIG1vZGVtIHN0YXR1cyBpbnRlcnJ1cHRzIG9uIHRoZSBmaXJzdAogCQlVQVJUIChp
bnRlcnJ1cHQgIzE0KS4gKi8KIAotCXJlc3RvcmVfZmxhZ3MoZmxhZ3MpOworCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmRyaXZlcl9sb2NrLCBmbGFncyk7CiB9CiAKIHN0YXRpYyB2b2lk
IGVwNzIxMV9pcl9jbG9zZShkb25nbGVfdCAqc2VsZikKIHsKIAl1bnNpZ25lZCBpbnQgc3lz
Y29uMSwgZmxhZ3M7CiAKLQlzYXZlX2ZsYWdzKGZsYWdzKTsgY2xpKCk7CisJc3Bpbl9sb2Nr
X2lycXNhdmUoJmRyaXZlcl9sb2NrLCBmbGFncyk7CiAKIAkvKiBUdXJuIG9mZiB0aGUgU0lS
IGVuY29kZXIuICovCiAJc3lzY29uMSA9IGNscHNfcmVhZGwoU1lTQ09OMSk7CkBAIC02Myw3
ICs2Niw3IEBAIHN0YXRpYyB2b2lkIGVwNzIxMV9pcl9jbG9zZShkb25nbGVfdCAqc2UKIAkv
KiBYWFg6IElmIHdlJ3ZlIGRpc2FibGVkIHRoZSBtb2RlbSBzdGF0dXMgaW50ZXJydXB0cywg
d2Ugc2hvdWxkCiAJCXJlc2V0IHRoZW0gYmFjayB0byB0aGVpciBvcmlnaW5hbCBzdGF0ZS4g
Ki8KIAotCXJlc3RvcmVfZmxhZ3MoZmxhZ3MpOworCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmRyaXZlcl9sb2NrLCBmbGFncyk7CiB9CiAKIC8qCkBAIC05OSw2ICsxMDIsNyBAQCBzdGF0
aWMgaW50IGVwNzIxMV9pcl9yZXNldChzdHJ1Y3QgaXJkYV90CiAgKi8KIHN0YXRpYyBpbnQg
X19pbml0IGVwNzIxMV9pcl9pbml0KHZvaWQpCiB7CisJc3Bpbl9sb2NrX2luaXQoJmRyaXZl
cl9sb2NrKTsKIAlyZXR1cm4gaXJkYV9kZXZpY2VfcmVnaXN0ZXJfZG9uZ2xlKCZkb25nbGUp
OwogfQogCg==

--_=__=_XaM3_.1114899313.2A.750588.42.18789.52.42.007.22324
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--_=__=_XaM3_.1114899313.2A.750588.42.18789.52.42.007.22324--
