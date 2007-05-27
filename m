From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 13:12:02 +0000
Subject: Re: [KJ] TODO: Moduleparam.h
Message-Id: <Pine.LNX.4.64.0705270907440.26407@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-289024650-1180271522=:26407"
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705250205o47fac2b5s10cf924d392954f6@mail.gmail.com>
In-Reply-To: <d701b6e30705250205o47fac2b5s10cf924d392954f6@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-289024650-1180271522=:26407
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 25 May 2007, Annamalai Prakash wrote:

> Hi Robert,
>
>     Thanks for your mail. I will wait for your response on this
> task. I took a look on this task today.  As we are removing the
> moduleparam.h from module.h, we have to add #include
> <linux/moduleparam.h> explicitly in all driver moduels where
> module_param_* macros used. Am I understood correctly ?

it's not clear what's going to be happening.  the problem with trying
to "clean up" module.h and moduleparam.h is that there are numerous
source files that would break if you did this properly.  in other
words, you can *almost* clean them up but you still have to leave them
in such a state that everything in the tree continues to build until
the entire source tree is cleaned properly.

recently, i submitted the attached patch that i thought would be a
good start, and it built fine, but andrew morton claims that it caused
a kernel crash with the new kernel.

if anyone is bored, feel free to apply the attached patch, rebuild
your kernel and see if it still works properly.  i can't see how such
an innocuous patch could cause problems, so i'm certainly interested
in hearing from anyone else who wants to check it out and let me know
if i did something stupid.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
--8323328-289024650-1180271522=:26407
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=mod4.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0705270912020.26407@localhost.localdomain>
Content-Description: 
Content-Disposition: attachment; filename=mod4.patch

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW9kdWxlLmggYi9pbmNsdWRl
L2xpbnV4L21vZHVsZS5oDQppbmRleCBlNmUwZjg2Li40NDJkM2JmIDEwMDY0
NA0KLS0tIGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaA0KKysrIGIvaW5jbHVk
ZS9saW51eC9tb2R1bGUuaA0KQEAgLTE1LDcgKzE1LDcgQEANCiAjaW5jbHVk
ZSA8bGludXgvZWxmLmg+DQogI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5o
Pg0KICNpbmNsdWRlIDxsaW51eC9rb2JqZWN0Lmg+DQotI2luY2x1ZGUgPGxp
bnV4L21vZHVsZXBhcmFtLmg+DQorI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBh
cmFtLmg+CS8qIEluIGEgcGVyZmVjdCB3b3JsZCwgdGhpcyB3b3VsZG4ndCBi
ZSBoZXJlLiAqLw0KICNpbmNsdWRlIDxhc20vbG9jYWwuaD4NCiANCiAjaW5j
bHVkZSA8YXNtL21vZHVsZS5oPg0KQEAgLTg4LDYgKzg4LDE3IEBAIGV4dGVy
biBzdHJ1Y3QgbW9kdWxlIF9fdGhpc19tb2R1bGU7DQogI2RlZmluZSBUSElT
X01PRFVMRSAoKHN0cnVjdCBtb2R1bGUgKikwKQ0KICNlbmRpZg0KIA0KKyNp
ZmRlZiBNT0RVTEUNCisjZGVmaW5lIF9fX21vZHVsZV9jYXQoYSxiKSBfX21v
ZF8gIyMgYSAjIyBiDQorI2RlZmluZSBfX21vZHVsZV9jYXQoYSxiKSBfX19t
b2R1bGVfY2F0KGEsYikNCisjZGVmaW5lIF9fTU9EVUxFX0lORk8odGFnLCBu
YW1lLCBpbmZvKQkJCQkJXA0KK3N0YXRpYyBjb25zdCBjaGFyIF9fbW9kdWxl
X2NhdChuYW1lLF9fTElORV9fKVtdCQkJCVwNCisgIF9fbWF5YmVfdW51c2Vk
CQkJCQkJCVwNCisgIF9fYXR0cmlidXRlX18oKHNlY3Rpb24oIi5tb2RpbmZv
IikpKSA9IF9fc3RyaW5naWZ5KHRhZykgIj0iIGluZm8NCisjZWxzZSAgLyog
IU1PRFVMRSAqLw0KKyNkZWZpbmUgX19NT0RVTEVfSU5GTyh0YWcsIG5hbWUs
IGluZm8pDQorI2VuZGlmDQorDQogLyogR2VuZXJpYyBpbmZvIG9mIGZvcm0g
dGFnID0gImluZm8iICovDQogI2RlZmluZSBNT0RVTEVfSU5GTyh0YWcsIGlu
Zm8pIF9fTU9EVUxFX0lORk8odGFnLCB0YWcsIGluZm8pDQogDQpAQCAtMTMw
LDExICsxNDEsNiBAQCBleHRlcm4gc3RydWN0IG1vZHVsZSBfX3RoaXNfbW9k
dWxlOw0KIC8qIFdoYXQgeW91ciBtb2R1bGUgZG9lcy4gKi8NCiAjZGVmaW5l
IE1PRFVMRV9ERVNDUklQVElPTihfZGVzY3JpcHRpb24pIE1PRFVMRV9JTkZP
KGRlc2NyaXB0aW9uLCBfZGVzY3JpcHRpb24pDQogDQotLyogT25lIGZvciBl
YWNoIHBhcmFtZXRlciwgZGVzY3JpYmluZyBob3cgdG8gdXNlIGl0LiAgU29t
ZSBmaWxlcyBkbw0KLSAgIG11bHRpcGxlIG9mIHRoZXNlIHBlciBsaW5lLCBz
byBjYW4ndCBqdXN0IHVzZSBNT0RVTEVfSU5GTy4gKi8NCi0jZGVmaW5lIE1P
RFVMRV9QQVJNX0RFU0MoX3Bhcm0sIGRlc2MpIFwNCi0JX19NT0RVTEVfSU5G
TyhwYXJtLCBfcGFybSwgI19wYXJtICI6IiBkZXNjKQ0KLQ0KICNkZWZpbmUg
TU9EVUxFX0RFVklDRV9UQUJMRSh0eXBlLG5hbWUpCQlcDQogICBNT0RVTEVf
R0VORVJJQ19UQUJMRSh0eXBlIyNfZGV2aWNlLG5hbWUpDQogDQpAQCAtNTc2
LDYgKzU4Miw3IEBAIHN0cnVjdCBkZXZpY2VfZHJpdmVyOw0KIHN0cnVjdCBt
b2R1bGU7DQogDQogZXh0ZXJuIHN0cnVjdCBrc2V0IG1vZHVsZV9zdWJzeXM7
DQorc3RydWN0IGtlcm5lbF9wYXJhbTsNCiANCiBpbnQgbW9kX3N5c2ZzX2lu
aXQoc3RydWN0IG1vZHVsZSAqbW9kKTsNCiBpbnQgbW9kX3N5c2ZzX3NldHVw
KHN0cnVjdCBtb2R1bGUgKm1vZCwNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21vZHVsZXBhcmFtLmggYi9pbmNsdWRlL2xpbnV4L21vZHVsZXBhcmFt
LmgNCmluZGV4IGM4MzU4OGMuLmU4ZjU5NjAgMTAwNjQ0DQotLS0gYS9pbmNs
dWRlL2xpbnV4L21vZHVsZXBhcmFtLmgNCisrKyBiL2luY2x1ZGUvbGludXgv
bW9kdWxlcGFyYW0uaA0KQEAgLTQsNiArNCw3IEBADQogI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4NCiAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+DQog
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCiANCiAvKiBZb3UgY2FuIG92ZXJyaWRlIHRoaXMgbWFudWFs
bHksIGJ1dCBnZW5lcmFsbHkgdGhpcyBzaG91bGQgbWF0Y2ggdGhlDQogICAg
bW9kdWxlIG5hbWUuICovDQpAQCAtMTMsMTkgKzE0LDEyIEBADQogI2RlZmlu
ZSBNT0RVTEVfUEFSQU1fUFJFRklYIEtCVUlMRF9NT0ROQU1FICIuIg0KICNl
bmRpZg0KIA0KLSNpZmRlZiBNT0RVTEUNCi0jZGVmaW5lIF9fX21vZHVsZV9j
YXQoYSxiKSBfX21vZF8gIyMgYSAjIyBiDQotI2RlZmluZSBfX21vZHVsZV9j
YXQoYSxiKSBfX19tb2R1bGVfY2F0KGEsYikNCi0jZGVmaW5lIF9fTU9EVUxF
X0lORk8odGFnLCBuYW1lLCBpbmZvKQkJCQkJICBcDQotc3RhdGljIGNvbnN0
IGNoYXIgX19tb2R1bGVfY2F0KG5hbWUsX19MSU5FX18pW10JCQkJICBcDQot
ICBfX2F0dHJpYnV0ZV91c2VkX18JCQkJCQkJICBcDQotICBfX2F0dHJpYnV0
ZV9fKChzZWN0aW9uKCIubW9kaW5mbyIpLHVudXNlZCkpID0gX19zdHJpbmdp
ZnkodGFnKSAiPSIgaW5mbw0KLSNlbHNlICAvKiAhTU9EVUxFICovDQotI2Rl
ZmluZSBfX01PRFVMRV9JTkZPKHRhZywgbmFtZSwgaW5mbykNCi0jZW5kaWYN
Ci0jZGVmaW5lIF9fTU9EVUxFX1BBUk1fVFlQRShuYW1lLCBfdHlwZSkJCQkJ
CSAgXA0KKyNkZWZpbmUgX19NT0RVTEVfUEFSTV9UWVBFKG5hbWUsIF90eXBl
KQkJCVwNCiAgIF9fTU9EVUxFX0lORk8ocGFybXR5cGUsIG5hbWUjI3R5cGUs
ICNuYW1lICI6IiBfdHlwZSkNCiANCisjZGVmaW5lIE1PRFVMRV9QQVJNX0RF
U0MoX3Bhcm0sIGRlc2MpCQkJXA0KKyAgX19NT0RVTEVfSU5GTyhwYXJtLCBf
cGFybSwgI19wYXJtICI6IiBkZXNjKQ0KKw0KIHN0cnVjdCBrZXJuZWxfcGFy
YW07DQogDQogLyogUmV0dXJucyAwLCBvciAtZXJybm8uICBhcmcgaXMgaW4g
a3AtPmFyZy4gKi8NCg==

--8323328-289024650-1180271522=:26407
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--8323328-289024650-1180271522=:26407--
