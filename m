From: "Giangiacomo Mariotti" <giangiacomo.mariotti@gmail.com>
Date: Wed, 08 Nov 2006 21:09:57 +0000
Subject: [KJ] adds check to copy_to_user() in function qeth_arp_query()
Message-Id: <2aac3c260611081309q5f35356eu89f94a7856efdfea@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_29977_8020857.1163020197809"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

------=_Part_29977_8020857.1163020197809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

adds a check to values returned by calls to copy_to_user() in function
qeth_arp_query() in file drivers/s390/net/qeth_main.c

Signed-off-by: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>

-------------------------

------=_Part_29977_8020857.1163020197809
Content-Type: text/plain; 
	name=0001-adding-check-for-return-value-of-copy_to_user.txt; 
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_eu9r6mcf
Content-Disposition: attachment;
	filename="0001-adding-check-for-return-value-of-copy_to_user.txt"

RnJvbSAzYmFmMzc3MjZmMzZmNzZlOTMwNDE1NWZkMmM4YzY5YmE4NDBiOWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHaWFuZ2lhY29tbyBNYXJpb3R0aSA8Z2lhbmdpYWNvbW8ubWFy
aW90dGlAZ21haWwuY29tPgpEYXRlOiBXZWQsIDggTm92IDIwMDYgMTQ6MDI6MTAgKzAxMDAKU3Vi
amVjdDogW1BBVENIXSBhZGRpbmcgY2hlY2sgZm9yIHJldHVybiB2YWx1ZSBvZiBjb3B5X3RvX3Vz
ZXIKCi0tLQogZHJpdmVycy9zMzkwL25ldC9xZXRoX21haW4uYyB8ICAgIDkgKysrKysrLS0tCiAx
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3MzOTAvbmV0L3FldGhfbWFpbi5jIGIvZHJpdmVycy9zMzkwL25ldC9xZXRo
X21haW4uYwppbmRleCA4MzY0ZDU0Li4yMDBjYmJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3MzOTAv
bmV0L3FldGhfbWFpbi5jCisrKyBiL2RyaXZlcnMvczM5MC9uZXQvcWV0aF9tYWluLmMKQEAgLTQ4
NDQsMTIgKzQ4NDQsMTUgQEAgcWV0aF9hcnBfcXVlcnkoc3RydWN0IHFldGhfY2FyZCAqY2FyZCwg
YwogCQkJICAgIigweCV4LyVkKVxuIiwKIAkJCSAgIFFFVEhfQ0FSRF9JRk5BTUUoY2FyZCksIHFl
dGhfYXJwX2dldF9lcnJvcl9jYXVzZSgmcmMpLAogCQkJICAgdG1wLCB0bXApOwotCQljb3B5X3Rv
X3VzZXIodWRhdGEsIHFpbmZvLnVkYXRhLCA0KTsKKwkJdG1wID0gY29weV90b191c2VyKHVkYXRh
LCBxaW5mby51ZGF0YSwgNCk7CiAJfSBlbHNlIHsKLQkJY29weV90b191c2VyKHVkYXRhLCBxaW5m
by51ZGF0YSwgcWluZm8udWRhdGFfbGVuKTsKKwkJdG1wID0gY29weV90b191c2VyKHVkYXRhLCBx
aW5mby51ZGF0YSwgcWluZm8udWRhdGFfbGVuKTsKIAl9CiAJa2ZyZWUocWluZm8udWRhdGEpOwot
CXJldHVybiByYzsKKwlpZih0bXApCisJCXJldHVybiAtRUZBVUxUOworCWVsc2UKKwkJcmV0dXJu
IHJjOwogfQogCiAvKioKLS0gCjEuNC4zLjMKCg==
------=_Part_29977_8020857.1163020197809
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_Part_29977_8020857.1163020197809--
