From: "Giangiacomo Mariotti" <giangiacomo.mariotti@gmail.com>
Date: Mon, 30 Oct 2006 19:29:05 +0000
Subject: [KJ] clean the definition of HANDLE_STACK
Message-Id: <2aac3c260610301129w6f83c555yaea4eb5e8200ea2@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_95724_30584344.1162236545076"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

------=_Part_95724_30584344.1162236545076
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm reposting my previous patch because I changed my e-mail address,so if there
is any problem with it you have my new address.I put the patch in line
and as a  plain text attachment.I hope this new e-mail works better
than the previous one to post code on mailing lists.

Description: clean the definition of HANDLE_STACK in arch/x86_64/kernel/traps.c
                    because it's syntax is misleading.
Signed-off-by: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>

From cadb09c6ef0cf2874b1ed3813ea32848cb8c479c Mon Sep 17 00:00:00 2001
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
-	do while (cond) { \
-		unsigned long addr = *stack++; \
-		if (oops_in_progress ? 		\
-			__kernel_text_address(addr) : \
-			kernel_text_address(addr)) { \
-			/* \
-			 * If the address is either in the text segment of the \
-			 * kernel, or in the region which contains vmalloc'ed \
-			 * memory, it *may* be the address of a calling \
-			 * routine; if so, print it so that someone tracing \
-			 * down the cause of the crash will be able to figure \
-			 * out the call path that was taken. \
-			 */ \
-			ops->address(data, addr);   \
+	do { \
+		while (cond) { \
+			unsigned long addr = *stack++; \
+			if (oops_in_progress ? 		\
+				__kernel_text_address(addr) : \
+				kernel_text_address(addr)) { \
+				/* \
+				* If the address is either in the text \
+				* segment of the kernel, or in the region \
+				* which contains vmalloc'ed memory, it may \
+				* be the address of a calling routine; if \
+				* so, print it so that someone tracing \
+				* down the cause of the crash will be able \
+				* to figure out the call path that \
+				* was taken. \
+				*/ \
+				ops->address(data, addr);   \
+			} \
 		} \
 	} while (0)

-- 
1.4.3.2

------=_Part_95724_30584344.1162236545076
Content-Type: text/plain; name=0001-cleaning-of-HANDLE_STACK-definition.txt; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_etwtqkkf
Content-Disposition: attachment;
	filename="0001-cleaning-of-HANDLE_STACK-definition.txt"

RnJvbSBjYWRiMDljNmVmMGNmMjg3NGIxZWQzODEzZWEzMjg0OGNiOGM0NzljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHaWFuZ2lhY29tbyBNYXJpb3R0aSA8Z2lhbmdpYWNvbW9fbWFy
aW90dGlAeWFob28uY29tPgpEYXRlOiBTdW4sIDI5IE9jdCAyMDA2IDE2OjIyOjAzICswMTAwClN1
YmplY3Q6IFtQQVRDSF0gY2xlYW5pbmcgb2YgSEFORExFX1NUQUNLIGRlZmluaXRpb24KCi0tLQog
YXJjaC94ODZfNjQva2VybmVsL3RyYXBzLmMgfCAgIDMyICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2XzY0L2tlcm5lbC90cmFwcy5jIGIvYXJjaC94ODZf
NjQva2VybmVsL3RyYXBzLmMKaW5kZXggNzgxOTAyMi4uNTU3M2EyMSAxMDA2NDQKLS0tIGEvYXJj
aC94ODZfNjQva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC94ODZfNjQva2VybmVsL3RyYXBzLmMK
QEAgLTI5NywyMCArMjk3LDI0IEBAIHZvaWQgZHVtcF90cmFjZShzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaywKIAkgKiBpdGVyYXRpb24gd2lsbCBldmVudHVhbGx5IHRyaWdnZXIuCiAJICovCiAjZGVm
aW5lIEhBTkRMRV9TVEFDSyhjb25kKSBcCi0JZG8gd2hpbGUgKGNvbmQpIHsgXAotCQl1bnNpZ25l
ZCBsb25nIGFkZHIgPSAqc3RhY2srKzsgXAotCQlpZiAob29wc19pbl9wcm9ncmVzcyA/IAkJXAot
CQkJX19rZXJuZWxfdGV4dF9hZGRyZXNzKGFkZHIpIDogXAotCQkJa2VybmVsX3RleHRfYWRkcmVz
cyhhZGRyKSkgeyBcCi0JCQkvKiBcCi0JCQkgKiBJZiB0aGUgYWRkcmVzcyBpcyBlaXRoZXIgaW4g
dGhlIHRleHQgc2VnbWVudCBvZiB0aGUgXAotCQkJICoga2VybmVsLCBvciBpbiB0aGUgcmVnaW9u
IHdoaWNoIGNvbnRhaW5zIHZtYWxsb2MnZWQgXAotCQkJICogbWVtb3J5LCBpdCAqbWF5KiBiZSB0
aGUgYWRkcmVzcyBvZiBhIGNhbGxpbmcgXAotCQkJICogcm91dGluZTsgaWYgc28sIHByaW50IGl0
IHNvIHRoYXQgc29tZW9uZSB0cmFjaW5nIFwKLQkJCSAqIGRvd24gdGhlIGNhdXNlIG9mIHRoZSBj
cmFzaCB3aWxsIGJlIGFibGUgdG8gZmlndXJlIFwKLQkJCSAqIG91dCB0aGUgY2FsbCBwYXRoIHRo
YXQgd2FzIHRha2VuLiBcCi0JCQkgKi8gXAotCQkJb3BzLT5hZGRyZXNzKGRhdGEsIGFkZHIpOyAg
IFwKKwlkbyB7IFwKKwkJd2hpbGUgKGNvbmQpIHsgXAorCQkJdW5zaWduZWQgbG9uZyBhZGRyID0g
KnN0YWNrKys7IFwKKwkJCWlmIChvb3BzX2luX3Byb2dyZXNzID8gCQlcCisJCQkJX19rZXJuZWxf
dGV4dF9hZGRyZXNzKGFkZHIpIDogXAorCQkJCWtlcm5lbF90ZXh0X2FkZHJlc3MoYWRkcikpIHsg
XAorCQkJCS8qIFwKKwkJCQkqIElmIHRoZSBhZGRyZXNzIGlzIGVpdGhlciBpbiB0aGUgdGV4dCBc
CisJCQkJKiBzZWdtZW50IG9mIHRoZSBrZXJuZWwsIG9yIGluIHRoZSByZWdpb24gXAorCQkJCSog
d2hpY2ggY29udGFpbnMgdm1hbGxvYydlZCBtZW1vcnksIGl0IG1heSBcCisJCQkJKiBiZSB0aGUg
YWRkcmVzcyBvZiBhIGNhbGxpbmcgcm91dGluZTsgaWYgXAorCQkJCSogc28sIHByaW50IGl0IHNv
IHRoYXQgc29tZW9uZSB0cmFjaW5nIFwKKwkJCQkqIGRvd24gdGhlIGNhdXNlIG9mIHRoZSBjcmFz
aCB3aWxsIGJlIGFibGUgXAorCQkJCSogdG8gZmlndXJlIG91dCB0aGUgY2FsbCBwYXRoIHRoYXQg
XAorCQkJCSogd2FzIHRha2VuLiBcCisJCQkJKi8gXAorCQkJCW9wcy0+YWRkcmVzcyhkYXRhLCBh
ZGRyKTsgICBcCisJCQl9IFwKIAkJfSBcCiAJfSB3aGlsZSAoMCkKIAotLSAKMS40LjMuMgoK
------=_Part_95724_30584344.1162236545076
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_Part_95724_30584344.1162236545076--
