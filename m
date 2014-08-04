From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Mon, 04 Aug 2014 20:13:10 +0000
Subject: [PATCH] arch/powerpc/mm/numa.c: Fix break placement
Message-Id: <1407183190-1397-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, akpm@linux-foundation.org, srivatsa.bhat@linux.vnet.ibm.com, sfr@canb.auug.org.au, qiuxishi@huawei.com, wangyun@linux.vnet.ibm.com, qiudayu@linux.vnet.ibm.com, joe@perches.com, alistair@popple.id.au, rcj@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

QnVnemlsbGE6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWSBNjMx
ClJlcG9ydGVkLWJ5OiBEYXZpZCBCaW5kZXJtYW4gPGRjYjMxNEBob3RtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogQW5kcmV5IFV0a2luIDxhbmRyZXkua3JpZWdlci51dGtpbkBnbWFpbC5jb20+Ci0t
LQogYXJjaC9wb3dlcnBjL21tL251bWEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9udW1h
LmMgYi9hcmNoL3Bvd2VycGMvbW0vbnVtYS5jCmluZGV4IDNiMTgxYjIuLmQzZTlhNzggMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9udW1hLmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL251bWEu
YwpAQCAtNjExLDggKzYxMSw4IEBAIHN0YXRpYyBpbnQgY3B1X251bWFfY2FsbGJhY2soc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuZmIsIHVuc2lnbmVkIGxvbmcgYWN0aW9uLAogCWNhc2UgQ1BVX1VQ
X0NBTkNFTEVEOgogCWNhc2UgQ1BVX1VQX0NBTkNFTEVEX0ZST1pFTjoKIAkJdW5tYXBfY3B1X2Zy
b21fbm9kZShsY3B1KTsKLQkJYnJlYWs7CiAJCXJldCA9IE5PVElGWV9PSzsKKwkJYnJlYWs7CiAj
ZW5kaWYKIAl9CiAJcmV0dXJuIHJldDsKLS0gCjEuOC41LjUKCi0tClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBrZXJuZWwtamFuaXRvcnMi
IGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1v
cmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWlu
Zm8uaHRtbA==
