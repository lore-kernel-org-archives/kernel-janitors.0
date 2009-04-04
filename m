From: Martin Olsson <mnemo@minimum.se>
Date: Sat, 04 Apr 2009 10:49:44 +0000
Subject: [PATCH 1/2] Fix paramater/parameter typo in dmesg and source comments
Message-Id: <49D73B48.9020208@minimum.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040906070805000306010504"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040906070805000306010504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 From 30e68348523decf94480959d45c9b9abbc922059 Mon Sep 17 00:00:00 2001
From: Martin Olsson <martin@minimum.se>
Date: Sat, 4 Apr 2009 12:34:49 +0200
Subject: [PATCH] Correctly spell the word "parameter" in debug print statements.

Signed-off-by: Martin Olsson <martin@minimum.se>
---
  drivers/net/wireless/rndis_wlan.c |    2 +-
  net/netfilter/nf_conntrack_acct.c |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index db91db7..2f632b2 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -584,7 +584,7 @@ static int rndis_set_config_parameter(struct usbnet *dev, char *param,
  	ret = rndis_set_oid(dev, OID_GEN_RNDIS_CONFIG_PARAMETER,
  							infobuf, info_len);
  	if (ret != 0)
-		devdbg(dev, "setting rndis config paramater failed, %d.", ret);
+		devdbg(dev, "setting rndis config parameter failed, %d.", ret);

  	kfree(infobuf);
  	return ret;
diff --git a/net/netfilter/nf_conntrack_acct.c b/net/netfilter/nf_conntrack_acct.c
index 9fe8982..4a1d94a 100644
--- a/net/netfilter/nf_conntrack_acct.c
+++ b/net/netfilter/nf_conntrack_acct.c
@@ -116,7 +116,7 @@ int nf_conntrack_acct_init(struct net *net)
  	if (net_eq(net, &init_net)) {
  #ifdef CONFIG_NF_CT_ACCT
  	printk(KERN_WARNING "CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use\n");
-		printk(KERN_WARNING "nf_conntrack.acct=1 kernel paramater, acct=1 nf_conntrack module option or\n");
+		printk(KERN_WARNING "nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or\n");
  		printk(KERN_WARNING "sysctl net.netfilter.nf_conntrack_acct=1 to enable it.\n");
  #endif

-- 
1.6.0.4


--------------040906070805000306010504
Content-Type: application/mbox;
 name="0002-Correctly-spell-the-word-parameter-in-debug-print.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename*0="0002-Correctly-spell-the-word-parameter-in-debug-print.patch"

RnJvbSAzMGU2ODM0ODUyM2RlY2Y5NDQ4MDk1OWQ0NWM5YjlhYmJjOTIyMDU5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gT2xzc29uIDxtYXJ0aW5AbWluaW11bS5z
ZT4KRGF0ZTogU2F0LCA0IEFwciAyMDA5IDEyOjM0OjQ5ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gQ29ycmVjdGx5IHNwZWxsIHRoZSB3b3JkICJwYXJhbWV0ZXIiIGluIGRlYnVnIHByaW50
IHN0YXRlbWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gT2xzc29uIDxtYXJ0aW5AbWlu
aW11bS5zZT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9ybmRpc193bGFuLmMgfCAgICAy
ICstCiBuZXQvbmV0ZmlsdGVyL25mX2Nvbm50cmFja19hY2N0LmMgfCAgICAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9ybmRpc193bGFuLmMgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9ybmRpc193bGFuLmMKaW5kZXggZGI5MWRiNy4uMmY2MzJiMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mvcm5kaXNfd2xhbi5jCisrKyBiL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL3JuZGlzX3dsYW4uYwpAQCAtNTg0LDcgKzU4NCw3IEBAIHN0YXRpYyBpbnQg
cm5kaXNfc2V0X2NvbmZpZ19wYXJhbWV0ZXIoc3RydWN0IHVzYm5ldCAqZGV2LCBjaGFyICpw
YXJhbSwKIAlyZXQgPSBybmRpc19zZXRfb2lkKGRldiwgT0lEX0dFTl9STkRJU19DT05GSUdf
UEFSQU1FVEVSLAogCQkJCQkJCWluZm9idWYsIGluZm9fbGVuKTsKIAlpZiAocmV0ICE9IDAp
Ci0JCWRldmRiZyhkZXYsICJzZXR0aW5nIHJuZGlzIGNvbmZpZyBwYXJhbWF0ZXIgZmFpbGVk
LCAlZC4iLCByZXQpOworCQlkZXZkYmcoZGV2LCAic2V0dGluZyBybmRpcyBjb25maWcgcGFy
YW1ldGVyIGZhaWxlZCwgJWQuIiwgcmV0KTsKIAogCWtmcmVlKGluZm9idWYpOwogCXJldHVy
biByZXQ7CmRpZmYgLS1naXQgYS9uZXQvbmV0ZmlsdGVyL25mX2Nvbm50cmFja19hY2N0LmMg
Yi9uZXQvbmV0ZmlsdGVyL25mX2Nvbm50cmFja19hY2N0LmMKaW5kZXggOWZlODk4Mi4uNGEx
ZDk0YSAxMDA2NDQKLS0tIGEvbmV0L25ldGZpbHRlci9uZl9jb25udHJhY2tfYWNjdC5jCisr
KyBiL25ldC9uZXRmaWx0ZXIvbmZfY29ubnRyYWNrX2FjY3QuYwpAQCAtMTE2LDcgKzExNiw3
IEBAIGludCBuZl9jb25udHJhY2tfYWNjdF9pbml0KHN0cnVjdCBuZXQgKm5ldCkKIAlpZiAo
bmV0X2VxKG5ldCwgJmluaXRfbmV0KSkgewogI2lmZGVmIENPTkZJR19ORl9DVF9BQ0NUCiAJ
cHJpbnRrKEtFUk5fV0FSTklORyAiQ09ORklHX05GX0NUX0FDQ1QgaXMgZGVwcmVjYXRlZCBh
bmQgd2lsbCBiZSByZW1vdmVkIHNvb24uIFBsZWFzZSB1c2VcbiIpOwotCQlwcmludGsoS0VS
Tl9XQVJOSU5HICJuZl9jb25udHJhY2suYWNjdD0xIGtlcm5lbCBwYXJhbWF0ZXIsIGFjY3Q9
MSBuZl9jb25udHJhY2sgbW9kdWxlIG9wdGlvbiBvclxuIik7CisJCXByaW50ayhLRVJOX1dB
Uk5JTkcgIm5mX2Nvbm50cmFjay5hY2N0PTEga2VybmVsIHBhcmFtZXRlciwgYWNjdD0xIG5m
X2Nvbm50cmFjayBtb2R1bGUgb3B0aW9uIG9yXG4iKTsKIAkJcHJpbnRrKEtFUk5fV0FSTklO
RyAic3lzY3RsIG5ldC5uZXRmaWx0ZXIubmZfY29ubnRyYWNrX2FjY3Q9MSB0byBlbmFibGUg
aXQuXG4iKTsKICNlbmRpZgogCi0tIAoxLjYuMC40Cgo=
--------------040906070805000306010504--
