From: "Carlo Perassi" <carlo@linux.it>
Date: Mon, 07 Mar 2005 16:26:57 +0000
Subject: [KJ] [PATCH] hcd.c
Message-Id: <54791.158.102.162.5.1110212817.squirrel@picard.linux.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20050307172657_28483"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

------=_20050307172657_28483
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi.

I know this patch is not a clean solution but without it I got the
following error

drivers/usb/core/hcd.c:131: error: parse error before '>>' token
drivers/usb/core/hcd.c:131: error: initializer element is not constant
drivers/usb/core/hcd.c:131: error: (near initialization for
`usb2_rh_dev_descrip
tor[12]')
drivers/usb/core/hcd.c:131: error: parse error before '>>' token
drivers/usb/core/hcd.c:131: error: initializer element is not constant
drivers/usb/core/hcd.c:131: error: (near initialization for
`usb2_rh_dev_descrip
tor[13]')
drivers/usb/core/hcd.c:154: error: parse error before '>>' token
drivers/usb/core/hcd.c:154: error: initializer element is not constant
drivers/usb/core/hcd.c:154: error: (near initialization for
`usb11_rh_dev_descri
ptor[12]')
drivers/usb/core/hcd.c:154: error: parse error before '>>' token
drivers/usb/core/hcd.c:154: error: initializer element is not constant
drivers/usb/core/hcd.c:154: error: (near initialization for
`usb11_rh_dev_descri
ptor[13]')

-- 
Carlo Perassi - http://www.linux.it/~carlo/
------=_20050307172657_28483
Content-Type: application/octet-stream; name="hcd.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="hcd.patch"

U2lnbmVkLW9mZi1ieTogQ2FybG8gUGVyYXNzaSA8Y2FybG9AbGludXguaXQ+CgotLS0KCi0tLSBs
aW51eC0yLjYuMTEvZHJpdmVycy91c2IvY29yZS9oY2QuYwkyMDA1LTAzLTA3IDE2OjE4OjA2LjAw
MDAwMDAwMCArMDEwMAorKysgbGludXgtMi42LjExLW1vZC9kcml2ZXJzL3VzYi9jb3JlL2hjZC5j
CTIwMDUtMDMtMDcgMTY6MTg6NTYuMDAwMDAwMDAwICswMTAwCkBAIC0xMTIsOSArMTEyLDYgQEAg
REVDTEFSRV9XQUlUX1FVRVVFX0hFQUQodXNiX2tpbGxfdXJiX3F1ZQogCiAvKi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0qLwogCi0jZGVmaW5lIEtFUk5FTF9SRUwJKChMSU5VWF9WRVJTSU9OX0NPREUgPj4gMTYp
ICYgMHgwZmYpCi0jZGVmaW5lIEtFUk5FTF9WRVIJKChMSU5VWF9WRVJTSU9OX0NPREUgPj4gOCkg
JiAweDBmZikKLQogLyogdXNiIDIuMCByb290IGh1YiBkZXZpY2UgZGVzY3JpcHRvciAqLwogc3Rh
dGljIGNvbnN0IHU4IHVzYjJfcmhfZGV2X2Rlc2NyaXB0b3IgWzE4XSA9IHsKIAkweDEyLCAgICAg
ICAvKiAgX191OCAgYkxlbmd0aDsgKi8KQEAgLTEyOCw3ICsxMjUsNyBAQCBzdGF0aWMgY29uc3Qg
dTggdXNiMl9yaF9kZXZfZGVzY3JpcHRvciBbCiAKIAkweDAwLCAweDAwLCAvKiAgX19sZTE2IGlk
VmVuZG9yOyAqLwogIAkweDAwLCAweDAwLCAvKiAgX19sZTE2IGlkUHJvZHVjdDsgKi8KLQlLRVJO
RUxfVkVSLCBLRVJORUxfUkVMLCAvKiAgX19sZTE2IGJjZERldmljZSAqLworCTB4MDIsIDB4MDYs
IC8qICBfX2xlMTYgYmNkRGV2aWNlICovCiAKIAkweDAzLCAgICAgICAvKiAgX191OCAgaU1hbnVm
YWN0dXJlcjsgKi8KIAkweDAyLCAgICAgICAvKiAgX191OCAgaVByb2R1Y3Q7ICovCkBAIC0xNTEs
NyArMTQ4LDcgQEAgc3RhdGljIGNvbnN0IHU4IHVzYjExX3JoX2Rldl9kZXNjcmlwdG9yIAogCiAJ
MHgwMCwgMHgwMCwgLyogIF9fbGUxNiBpZFZlbmRvcjsgKi8KICAJMHgwMCwgMHgwMCwgLyogIF9f
bGUxNiBpZFByb2R1Y3Q7ICovCi0JS0VSTkVMX1ZFUiwgS0VSTkVMX1JFTCwgLyogIF9fbGUxNiBi
Y2REZXZpY2UgKi8KKwkweDAyLCAweDA2LCAvKiAgX19sZTE2IGJjZERldmljZSAqLwogCiAJMHgw
MywgICAgICAgLyogIF9fdTggIGlNYW51ZmFjdHVyZXI7ICovCiAJMHgwMiwgICAgICAgLyogIF9f
dTggIGlQcm9kdWN0OyAqLwo=
------=_20050307172657_28483
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_20050307172657_28483--
