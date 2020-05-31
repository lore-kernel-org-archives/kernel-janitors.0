From: dinghao.liu@zju.edu.cn
Date: Sun, 31 May 2020 09:15:27 +0000
Subject: Re: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
In-Reply-To: <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>

PiA+IEkganVzdCBmb3VuZCB0aGF0IGNsayBpcyByZWZlcmVuY2VkIGJ5IHBjbGsgaW4gdGhpcyBm
dW5jdGlvbi4gV2hlbiBjbGsgaXMgZnJlZWQsCj4gPiBwY2xrIHdpbGwgYmUgYWxsb2NhdGVkIGlu
IGdtMjBiX2Nsa19uZXdfc3BlZWRvMCgpLiBUaHVzIHdlIHNob3VsZCBub3QgcmVsZWFzZSBjbGsK
PiA+IGluIHRoaXMgZnVuY3Rpb24gYW5kIHRoZXJlIGlzIG5vIGJ1ZyBoZXJlLgo+IAo+IENhbiB0
aGVyZSBiZSBhIG5lZWQgdG8gcmVsZWFzZSBhIGNsb2NrIG9iamVjdCBhZnRlciBhIGZhaWxlZCBn
azIwYV9jbGtfY3RvcigpIGNhbGw/Cj4gCgpJIHRoaW5rIHRoaXMgbWFpbmx5IGRlcGVuZHMgb24g
cGNsayBwb2ludGVyLiBJdCBzZWVtcyB0aGF0IHRoZSBjYWxsZXIgb2YgCmdtMjBiX2Nsa19uZXco
KSBhbHdheXMgZXhwZWN0cyBwY2xrIHRvIGJlIGFsbG9jYXRlZCB1bmxlc3MgaXQgcmV0dXJucyAt
RU5PTUVNLAp3aGljaCBtZWFucyBremFsbG9jKCkgZmFpbGVkLiBJZiBnazIwYV9jbGtfY3Rvcigp
IG5ldmVyIHJldHVybnMgc3VjaCBhbiBlcnJvciAKY29kZSwgd2UgbWF5IG5lZWQgbm90IHRvIHJl
bGVhc2UgdGhpcyBjbG9jayBvYmplY3QuCgpSZWdhcmRzLApEaW5naGFv
