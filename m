From: dinghao.liu@zju.edu.cn
Date: Wed, 03 Jun 2020 02:21:47 +0000
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
 <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
 <20200602153900.GW22511@kadam>
In-Reply-To: <20200602153900.GW22511@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>, Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>

Cj4gT24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDE6MTA6MzRQTSArMDIwMCwgTWFya3VzIEVsZnJp
bmcgd3JvdGU6Cj4gPiA+IFRoZSBvcmlnaW5hbCBwYXRjaCB3YXMgYmFzaWNhbGx5IGZpbmUuCj4g
PiAKPiA+IEkgcHJvcG9zZSB0byByZWNvbnNpZGVyIHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUg
c29mdHdhcmUgc2l0dWF0aW9uIG9uY2UgbW9yZS4KPiA+IAo+ID4gKiBTaG91bGQgdGhlIGFsbG9j
YXRlZCBjbG9jayBvYmplY3QgYmUga2VwdCB1c2FibGUgZXZlbiBhZnRlcgo+ID4gICBhIHN1Y2Nl
c3NmdWwgcmV0dXJuIGZyb20gdGhpcyBmdW5jdGlvbj8KPiAKPiBIZWguICBZb3UncmUgcmlnaHQu
ICBUaGUgcGF0Y2ggaXMgZnJlZWluZyAiY2xrIiBvbiB0aGUgc3VjY2VzcyBwYXRoIHNvCj4gdGhh
dCBkb2Vzbid0IHdvcmsuCj4gCgpCZW4gaGFzIGV4cGxhaW5lZCB0aGlzIHByb2JsZW06Cmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMjQ5NTkyLwpTaW5jZSB0aGUgY2Fs
bGVyIHdpbGwgY2hlY2sgInBjbGsiIG9uIGZhaWx1cmUsIHdlIGRvbid0IG5lZWQgdG8gZnJlZQoi
Y2xrIiBpbiBnbTIwYl9jbGtfbmV3KCkgYW5kIEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBubyBsb25n
ZXIgbmVlZGVkLgoKUmVnYXJkcywKRGluZ2hhbw=
