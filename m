From: Duncan Palmer <dunk.palmer@gmail.com>
Date: Tue, 01 Feb 2005 01:00:00 +0000
Subject: Re: [KJ] Fwd: I noticed these
Message-Id: <72dff67005013117001692d749@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_1197_30235297.1107219600271"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

------=_Part_1197_30235297.1107219600271
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(sorry for not replying to the original post - I've just joined the list)

Randy Dunlap wrote:

> 1. Psmouse and input event drivers don't have module alias autoload 
> support. I think it should be possible to do this similar to how 
> misc_device works.

I've just been having a look at this, and have attached an example
patch (untested, and only partial) - does this look like the right
approach? The various input event drivers each use a range of minor
numbers, so if people think I'm doing the right thing so far, I'll
take these into account when I finish my changes.

2. /proc interface in /dev/rtc doesn't seem to have MODULE_OWNER ref 
counting.

No idea about this. SET_MODULE_OWNER is defined to a no-op, and I
can't find any info as to its purpose. Can anyone enlighten me?

Dunk

------=_Part_1197_30235297.1107219600271
Content-Type: application/octet-stream; name="diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="diff"

ZGlmZiAtdSBsaW51eC0yLjYuMTEtcmMyLW1tMS5vcmlnL2luY2x1ZGUvbGludXgvaW5wdXQuaCBs
aW51eC0yLjYuMTEtcmMyLW1tMS9pbmNsdWRlL2xpbnV4L2lucHV0LmgKLS0tIGxpbnV4LTIuNi4x
MS1yYzItbW0xLm9yaWcvaW5jbHVkZS9saW51eC9pbnB1dC5oCTIwMDUtMDEtMjggMTM6MDE6MDgu
MDAwMDAwMDAwICsxMTAwCisrKyBsaW51eC0yLjYuMTEtcmMyLW1tMS9pbmNsdWRlL2xpbnV4L2lu
cHV0LmgJMjAwNS0wMi0wMSAxMTozMjo0MC4wMDAwMDAwMDAgKzExMDAKQEAgLTEwMTIsNSArMTAx
Miw5IEBACiAKIGV4dGVybiBzdHJ1Y3QgY2xhc3Nfc2ltcGxlICppbnB1dF9jbGFzczsKIAorI2Rl
ZmluZSBNT0RVTEVfQUxJQVNfSU5QVVQobWlub3JiYXNlKSAgXAorCU1PRFVMRV9BTElBUygiY2hh
ci1tYWpvci0iIF9fc3RyaW5naWZ5KElOUFVUX01BSk9SKSAiLSIgXAorICAgICAgICAgICAgX19z
dHJpbmdpZnkobWlub3JiYXNlKSkKKwogI2VuZGlmCiAjZW5kaWYKZGlmZiAtdSBsaW51eC0yLjYu
MTEtcmMyLW1tMS5vcmlnL2RyaXZlcnMvaW5wdXQvaW5wdXQuYyBsaW51eC0yLjYuMTEtcmMyLW1t
MS9kcml2ZXJzL2lucHV0L2lucHV0LmMKLS0tIGxpbnV4LTIuNi4xMS1yYzItbW0xLm9yaWcvZHJp
dmVycy9pbnB1dC9pbnB1dC5jCTIwMDUtMDEtMjggMTM6MDA6MjkuMDAwMDAwMDAwICsxMTAwCisr
KyBsaW51eC0yLjYuMTEtcmMyLW1tMS9kcml2ZXJzL2lucHV0L2lucHV0LmMJMjAwNS0wMi0wMSAx
MTo0MDo0NC4wMDAwMDAwMDAgKzExMDAKQEAgLTUzNiw4ICs1MzYsMTMgQEAKIAlzdHJ1Y3QgZmls
ZV9vcGVyYXRpb25zICpvbGRfZm9wcywgKm5ld19mb3BzID0gTlVMTDsKIAlpbnQgZXJyOwogCi0J
LyogTm8gbG9hZC1vbi1kZW1hbmQgaGVyZT8gKi8KLQlpZiAoIWhhbmRsZXIgfHwgIShuZXdfZm9w
cyA9IGZvcHNfZ2V0KGhhbmRsZXItPmZvcHMpKSkKKwlpZiAoIWhhbmRsZXIpCisgICAgeworICAg
ICAgICByZXF1ZXN0X21vZHVsZSgiY2hhci1tYWpvci0lZC0lZCIsIElOUFVUX01BSk9SLCBpbWlu
b3IoaW5vZGUpKTsKKwkJLyogVGhlIG1vZHVsZSB3aWxsIHJlZ2lzdGVyIGl0c2VsZiB1cG9uIGxv
YWRpbmcgKi8KKwkJaGFuZGxlciA9IGlucHV0X3RhYmxlW2ltaW5vcihpbm9kZSkgPj4gNV07Cisg
ICAgfQorICAgIGlmICghaGFuZGxlciB8fCAhKG5ld19mb3BzID0gZm9wc19nZXQoaGFuZGxlci0+
Zm9wcykpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAogCS8qCmRpZmYgLXUgbGludXgtMi42LjExLXJj
Mi1tbTEub3JpZy9kcml2ZXJzL2lucHV0L21vdXNlZGV2LmMgbGludXgtMi42LjExLXJjMi1tbTEv
ZHJpdmVycy9pbnB1dC9tb3VzZWRldi5jCi0tLSBsaW51eC0yLjYuMTEtcmMyLW1tMS5vcmlnL2Ry
aXZlcnMvaW5wdXQvbW91c2VkZXYuYwkyMDA1LTAxLTI4IDEzOjAwOjMwLjAwMDAwMDAwMCArMTEw
MAorKysgbGludXgtMi42LjExLXJjMi1tbTEvZHJpdmVycy9pbnB1dC9tb3VzZWRldi5jCTIwMDUt
MDItMDEgMTE6MzI6NTMuMDAwMDAwMDAwICsxMTAwCkBAIC0zMiw2ICszMiw3IEBACiBNT0RVTEVf
QVVUSE9SKCJWb2p0ZWNoIFBhdmxpayA8dm9qdGVjaEB1Y3cuY3o+Iik7CiBNT0RVTEVfREVTQ1JJ
UFRJT04oIk1vdXNlIChFeHBsb3JlclBTLzIpIGRldmljZSBpbnRlcmZhY2VzIik7CiBNT0RVTEVf
TElDRU5TRSgiR1BMIik7CitNT0RVTEVfQUxJQVNfSU5QVVQoTU9VU0VERVZfTUlOT1JfQkFTRSk7
CiAKICNpZm5kZWYgQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9YCiAjZGVmaW5lIENPTkZJ
R19JTlBVVF9NT1VTRURFVl9TQ1JFRU5fWAkxMDI0Cg==
------=_Part_1197_30235297.1107219600271
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_Part_1197_30235297.1107219600271--
