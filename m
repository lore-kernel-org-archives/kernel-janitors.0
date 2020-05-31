From: dinghao.liu@zju.edu.cn
Date: Sun, 31 May 2020 10:42:59 +0000
Subject: Re: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <599cd7d4.dbaba.1726a53da96.Coremail.dinghao.liu@zju.edu.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
 <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
 <d05224e4-d682-de3e-928f-5af7b8597a8d@web.de>
In-Reply-To: <d05224e4-d682-de3e-928f-5af7b8597a8d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>

PiA+IElmIGdrMjBhX2Nsa19jdG9yKCkgbmV2ZXIgcmV0dXJucyBzdWNoIGFuIGVycm9yIGNvZGUs
Cj4gPiB3ZSBtYXkgbmVlZCBub3QgdG8gcmVsZWFzZSB0aGlzIGNsb2NrIG9iamVjdC4KPiAKPiBX
b3VsZCB5b3UgbGlrZSB0byBhY2hpZXZlIGNvbXBsZXRlIGV4Y2VwdGlvbiBoYW5kbGluZwo+IGFs
c28gZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24/Cj4gCgpJdCBzZWVtcyB0aGF0IGl0
J3MgcG9zc2libGUgdG8gZ2V0IC1FTk9NRU0gZnJvbSBnazIwYV9jbGtfY3RvcigpLgpUaGUgY2Fs
bCBjaGFpbiBpcyBhcyBmb2xsb3dzOgpnazIwYV9jbGtfY3RvcigpIDwtIG52a21fY2xrX2N0b3Io
KSA8LSBudmttX25vdGlmeV9pbml0KCkKCldoZW4gbnZrbV9ub3RpZnlfaW5pdCgpIHJldHVybnMg
LUVOT01FTSwgYWxsIG9mIGl0cyBjYWxsZXJzIChhbmQgCmNhbGxlcnMgb2YgY2FsbGVycykgd2ls
bCBiZSBpbmZsdWVuY2VkIGlmIHRoZXJlIGlzIGEgZmFpbGVkCmt6YWxsb2MgaW5zaWRlIHdoaWNo
LiAKCkluIHRoaXMgY2FzZSwgbWF5YmUgd2Ugc2hvdWxkIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUg
b2YgCmdrMjBhX2Nsa19jdG9yKCkgYW5kIHJlbGVhc2UgY2xrIGlmIGl0IHJldHVybnMgLUVOT01F
TS4gCkFuZCBtYW55IG90aGVyIGZ1bmN0aW9ucyBhbHNvIGhhdmUgdGhlIHNhbWUgaXNzdWUgKGUu
Zy4sCmdtMjBiX2Nsa19uZXdfc3BlZWRvMCkuIERvIHlvdSBoYXZlIGFueSBpZGVhIGFib3V0IHRo
aXMgCnByb2JsZW0/CgpSZWdhcmRzLApEaW5naGFv
