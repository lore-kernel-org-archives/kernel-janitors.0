From: dinghao.liu@zju.edu.cn
Date: Sun, 31 May 2020 08:23:10 +0000
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
In-Reply-To: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>

PiAKPiA+IEl0J3MgdGhlIHNhbWUgd2hlbiBnbTIwYl9jbGtfbmV3KCkgcmV0dXJucyBmcm9tIGVs
c2V3aGVyZSBmb2xsb3dpbmcgdGhpcyBjYWxsLgo+IAo+IEkgc3VnZ2VzdCB0byByZWNvbnNpZGVy
IHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgc29mdHdhcmUgc2l0dWF0aW9uIG9uY2UgbW9yZS4K
PiBDYW4gaXQgYmUgdGhhdCB0aGUgYWxsb2NhdGVkIGNsb2NrIG9iamVjdCBzaG91bGQgYmUga2Vw
dCB1c2FibGUgZXZlbiBhZnRlcgo+IGEgc3VjY2Vzc2Z1bCByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0
aW9uPwo+IAoKSXQncyBwb3NzaWJsZSB0aGF0IHdlIGV4cGVjdCBhbiB1c2FibGUgY2xrIHBvaW50
ZXIsIHRob3VnaCBJIGNvdWxkIG5vdCBmaW5kCnRoZSBleGFjdCB1c2FnZSB5ZXQuIEZvciBzZWN1
cml0eSwgSSB3aWxsIHJlbGVhc2UgdGhpcyBwb2ludGVyIG9ubHkgb24gZXJyb3IgCnBhdGhzIGlu
IHRoaXMgZnVuY3Rpb24uCgo+IAo+IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKAnEZp
eGVz4oCdIHRvIHRoZSBjb21taXQgbWVzc2FnZT8KPiAKClRoYW5rIHlvdSBmb3IgeW91ciBhZHZp
Y2UhIEkgd2lsbCBhZGQgdGhpcyB0YWcgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiBwYXRjaC4KClJl
Z2FyZHMsCkRpbmdoYW8
