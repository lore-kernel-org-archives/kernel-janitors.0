From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Sun, 29 Oct 2006 22:41:51 +0000
Subject: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061029224151.68009.qmail@web90309.mail.mud.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1031393295-1162161711=:62430"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--0-1031393295-1162161711=:62430
Content-Type: multipart/alternative;
    boundary="----------=_1162161856-13510-246"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1162161856-13510-246
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Matthew Wilcox wrote :
>you've wrapped it past the 80 column boundary, so you'd need to fix that..=
....
>you didn't put a signed-off-by on it.
This one is my previous patch modified.
>I don't think the outer do ..... while is necessary anyway.Is there any pr=
oblem
>with just deleting them?
I thought about it,but then I tried to change this misleading code without =
being too
destructive,I thought that the previous author could have had a good reason=
 to
use the do{}while(0).

Description: clean the definition of HANDLE_STACK in arch/x86_64/kernel/tra=
ps.c
                    because it's syntax is misleading.
Signed-off-by: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>

-------

=46rom cadb09c6ef0cf2874b1ed3813ea32848cb8c479c Mon Sep 17 00:00:00 2001
From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Sun, 29 Oct 2006 16:22:03 +0100
Subject: [PATCH] cleaning of HANDLE_STACK definition

---
 arch/x86_64/kernel/traps.c |   32 ++++++++++++++++++--------------
 1 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/x86_64/kernel/traps.c b/arch/x86_64/kernel/traps.c
index 7819022..5573a21 100644
--- a/arch/x86_64/kernel/traps.c
+++ b/arch/x86_64/kernel/traps.c
@@ -297,20 +297,24 @@ void dump_trace(struct task_struct *tsk,
      * iteration will eventually trigger.
      */
 #define HANDLE_STACK(cond) \
-    do while (cond) { \
-        unsigned long addr =3D *stack++; \
-        if (oops_in_progress ?         \
-            __kernel_text_address(addr) : \
-            kernel_text_address(addr)) { \
-            /* \
-             * If the address is either in the text segment of the \
-             * kernel, or in the region which contains vmalloc'ed \
-             * memory, it *may* be the address of a calling \
-             * routine; if so, print it so that someone tracing \
-             * down the cause of the crash will be able to figure \
-             * out the call path that was taken. \
-             */ \
-            ops->address(data, addr);   \
+    do { \
+        while (cond) { \
+            unsigned long addr =3D *stack++; \
+            if (oops_in_progress ?         \
+                __kernel_text_address(addr) : \
+                kernel_text_address(addr)) { \
+                /* \
+                * If the address is either in the text \
+                * segment of the kernel, or in the region \
+                * which contains vmalloc'ed memory, it may \
+                * be the address of a calling routine; if \
+                * so, print it so that someone tracing \
+                * down the cause of the crash will be able \
+                * to figure out the call path that \
+                * was taken. \
+                */ \
+                ops->address(data, addr);   \
+            } \
         } \
     } while (0)
=20
--=20
1.4.3.2






------------=_1162161856-13510-246
Content-Type: text/html; charset=ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><DEFANGED_style_0 <!-- DIV {margin:0px;} --></DEFANGED_style></=
head><body><div DEFANGED_style=3D"font-family:times new roman, new york, ti=
mes, serif;font-size:12pt"><div>Matthew Wilcox wrote :<br>&gt;you've wrappe=
d it past the 80 column boundary, so you'd need to fix that......<br>&gt;yo=
u didn't put a signed-off-by on it.<br>This one is my previous patch modifi=
ed.<br>&gt;I don't think the outer do ..... while is necessary anyway.Is th=
ere any problem<br>&gt;with just deleting them?<br>I thought about it,but t=
hen I tried to change this misleading code without being too<br>destructive=
,I thought that the previous author could have had a good reason to<br>use =
the do{}while(0).<br><br>Description: clean the definition of HANDLE_STACK =
in arch/x86_64/kernel/traps.c<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; be=
cause it's syntax is misleading.<br>Signed-off-by: Giangiacomo Mariotti
 &lt;giangiacomo_mariotti@yahoo.com&gt;<br><br>-------<br><br>From cadb09c6=
ef0cf2874b1ed3813ea32848cb8c479c Mon Sep 17 00:00:00 2001<br>From: Giangiac=
omo Mariotti &lt;giangiacomo_mariotti@yahoo.com&gt;<br>Date: Sun, 29 Oct 20=
06 16:22:03 +0100<br>Subject: [PATCH] cleaning of HANDLE_STACK definition<b=
r><br>---<br>&nbsp;arch/x86_64/kernel/traps.c |&nbsp;&nbsp; 32 ++++++++++++=
++++++--------------<br>&nbsp;1 files changed, 18 insertions(+), 14 deletio=
ns(-)<br><br>diff --git a/arch/x86_64/kernel/traps.c b/arch/x86_64/kernel/t=
raps.c<br>index 7819022..5573a21 100644<br>--- a/arch/x86_64/kernel/traps.c=
<br>+++ b/arch/x86_64/kernel/traps.c<br>@@ -297,20 +297,24 @@ void dump_tra=
ce(struct task_struct *tsk,<br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;* iteration w=
ill eventually trigger.<br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;*/<br>&nbsp;#defi=
ne HANDLE_STACK(cond) \<br>-&nbsp;&nbsp;&nbsp; do while (cond) { \<br>-&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; unsigned long addr =3D *stack++;
 \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (oops_in_progress ? &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; __kernel_text_address(addr) : \<br>-&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; kernel_text_address(addr)) { \<br>-&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /* \<br>-&nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* If the address is eith=
er in the text segment of the \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;* kernel, or in the region which contains vmalloc'e=
d \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* me=
mory, it *may* be the address of a calling \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* routine; if so, print it so that som=
eone tracing \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;* down the cause of the crash will be able to figure \<br>-&nbsp;&nb=
sp;&nbsp;
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* out the call path that was t=
aken. \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
*/ \<br>-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ops-&gt;a=
ddress(data, addr);&nbsp;&nbsp; \<br>+&nbsp;&nbsp;&nbsp; do { \<br>+&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; while (cond) { \<br>+&nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; unsigned long addr =3D *stack++; \<br>+&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (oops_in_progress=
 ? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; __kernel_text_address(addr)=
 : \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; kernel_text_address(addr)) { \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /* \<br>+&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; * If the address is=
 either in the
 text \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; * segment of the kernel, or in the region \<br>+&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; * which conta=
ins vmalloc'ed memory, it may \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; * be the address of a calling routine;=
 if \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; * so, print it so that someone tracing \<br>+&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; * down the cause o=
f the crash will be able \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; * to figure out the call path that \<br>+&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; *=
 was taken. \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; */ \<br>+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;
 &nbsp;&nbsp;&nbsp; ops-&gt;address(data, addr);&nbsp;&nbsp; \<br>+&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; } \<br>&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; } \<br>&nbsp;&nbsp;&nbsp;&nbsp; } while (0)<br>&nb=
sp;<br>-- <br>1.4.3.2<br><br><br></div></div><br></body></html>
------------=_1162161856-13510-246--

--0-1031393295-1162161711=:62430
Content-Type: text/plain;
	name="=?utf-8?q?0001-cleaning-of-HANDLE=5FSTACK-definition.txt?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="=?utf-8?q?0001-cleaning-of-HANDLE=5FSTACK-definition.txt?="

RnJvbSBjYWRiMDljNmVmMGNmMjg3NGIxZWQzODEzZWEzMjg0OGNiOGM0Nzlj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHaWFuZ2lhY29tbyBN
YXJpb3R0aSA8Z2lhbmdpYWNvbW9fbWFyaW90dGlAeWFob28uY29tPgpEYXRl
OiBTdW4sIDI5IE9jdCAyMDA2IDE2OjIyOjAzICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gY2xlYW5pbmcgb2YgSEFORExFX1NUQUNLIGRlZmluaXRpb24KCi0t
LQogYXJjaC94ODZfNjQva2VybmVsL3RyYXBzLmMgfCAgIDMyICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2XzY0L2tlcm5lbC90cmFwcy5jIGIvYXJjaC94ODZfNjQva2Vy
bmVsL3RyYXBzLmMKaW5kZXggNzgxOTAyMi4uNTU3M2EyMSAxMDA2NDQKLS0t
IGEvYXJjaC94ODZfNjQva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC94ODZf
NjQva2VybmVsL3RyYXBzLmMKQEAgLTI5NywyMCArMjk3LDI0IEBAIHZvaWQg
ZHVtcF90cmFjZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywKIAkgKiBpdGVy
YXRpb24gd2lsbCBldmVudHVhbGx5IHRyaWdnZXIuCiAJICovCiAjZGVmaW5l
IEhBTkRMRV9TVEFDSyhjb25kKSBcCi0JZG8gd2hpbGUgKGNvbmQpIHsgXAot
CQl1bnNpZ25lZCBsb25nIGFkZHIgPSAqc3RhY2srKzsgXAotCQlpZiAob29w
c19pbl9wcm9ncmVzcyA/IAkJXAotCQkJX19rZXJuZWxfdGV4dF9hZGRyZXNz
KGFkZHIpIDogXAotCQkJa2VybmVsX3RleHRfYWRkcmVzcyhhZGRyKSkgeyBc
Ci0JCQkvKiBcCi0JCQkgKiBJZiB0aGUgYWRkcmVzcyBpcyBlaXRoZXIgaW4g
dGhlIHRleHQgc2VnbWVudCBvZiB0aGUgXAotCQkJICoga2VybmVsLCBvciBp
biB0aGUgcmVnaW9uIHdoaWNoIGNvbnRhaW5zIHZtYWxsb2MnZWQgXAotCQkJ
ICogbWVtb3J5LCBpdCAqbWF5KiBiZSB0aGUgYWRkcmVzcyBvZiBhIGNhbGxp
bmcgXAotCQkJICogcm91dGluZTsgaWYgc28sIHByaW50IGl0IHNvIHRoYXQg
c29tZW9uZSB0cmFjaW5nIFwKLQkJCSAqIGRvd24gdGhlIGNhdXNlIG9mIHRo
ZSBjcmFzaCB3aWxsIGJlIGFibGUgdG8gZmlndXJlIFwKLQkJCSAqIG91dCB0
aGUgY2FsbCBwYXRoIHRoYXQgd2FzIHRha2VuLiBcCi0JCQkgKi8gXAotCQkJ
b3BzLT5hZGRyZXNzKGRhdGEsIGFkZHIpOyAgIFwKKwlkbyB7IFwKKwkJd2hp
bGUgKGNvbmQpIHsgXAorCQkJdW5zaWduZWQgbG9uZyBhZGRyID0gKnN0YWNr
Kys7IFwKKwkJCWlmIChvb3BzX2luX3Byb2dyZXNzID8gCQlcCisJCQkJX19r
ZXJuZWxfdGV4dF9hZGRyZXNzKGFkZHIpIDogXAorCQkJCWtlcm5lbF90ZXh0
X2FkZHJlc3MoYWRkcikpIHsgXAorCQkJCS8qIFwKKwkJCQkqIElmIHRoZSBh
ZGRyZXNzIGlzIGVpdGhlciBpbiB0aGUgdGV4dCBcCisJCQkJKiBzZWdtZW50
IG9mIHRoZSBrZXJuZWwsIG9yIGluIHRoZSByZWdpb24gXAorCQkJCSogd2hp
Y2ggY29udGFpbnMgdm1hbGxvYydlZCBtZW1vcnksIGl0IG1heSBcCisJCQkJ
KiBiZSB0aGUgYWRkcmVzcyBvZiBhIGNhbGxpbmcgcm91dGluZTsgaWYgXAor
CQkJCSogc28sIHByaW50IGl0IHNvIHRoYXQgc29tZW9uZSB0cmFjaW5nIFwK
KwkJCQkqIGRvd24gdGhlIGNhdXNlIG9mIHRoZSBjcmFzaCB3aWxsIGJlIGFi
bGUgXAorCQkJCSogdG8gZmlndXJlIG91dCB0aGUgY2FsbCBwYXRoIHRoYXQg
XAorCQkJCSogd2FzIHRha2VuLiBcCisJCQkJKi8gXAorCQkJCW9wcy0+YWRk
cmVzcyhkYXRhLCBhZGRyKTsgICBcCisJCQl9IFwKIAkJfSBcCiAJfSB3aGls
ZSAoMCkKIAotLSAKMS40LjMuMgoK

--0-1031393295-1162161711=:62430
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1031393295-1162161711=:62430--
