From: "wanghai (M)" <wanghai38@huawei.com>
Date: Wed, 03 Jun 2020 01:42:41 +0000
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
Message-Id: <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
In-Reply-To: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>

CuWcqCAyMDIwLzYvMyAxOjIwLCBNYXJrdXMgRWxmcmluZyDlhpnpgZM6Cj4+IEZpeCBpdCBieSBh
ZGRpbmcgYSBjYWxsIHRvIGtvYmplY3RfcHV0KCkgaW4gdGhlIGVycm9yIHBhdGggb2YKPj4ga29i
amVjdF9pbml0X2FuZF9hZGQoKS4KPiBUaGFua3MgZm9yIGFub3RoZXIgY29tcGxldGlvbiBvZiB0
aGUgZXhjZXB0aW9uIGhhbmRsaW5nLgo+Cj4gV291bGQgYW4gb3RoZXIgcGF0Y2ggc3ViamVjdCBi
ZSBhIGJpdCBuaWNlcj8KVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UsIEkgd2lsbCBwZXJmZWN0IHRo
aXMgZGVzY3JpcHRpb24gYW5kIHNlbmQgYSB2Mgo+Cj4g4oCmCj4+ICsrKyBiL2RyaXZlcnMvbWlz
Yy9jeGwvc3lzZnMuYwo+PiBAQCAtNjI0LDcgKzYyNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYWZ1X2Nv
bmZpZ19yZWNvcmQgKmN4bF9zeXNmc19hZnVfbmV3X2NyKHN0cnVjdCBjeGxfYWZ1ICphZnUsIGlu
dCBjCj4+ICAgCXJjID0ga29iamVjdF9pbml0X2FuZF9hZGQoJmNyLT5rb2JqLCAmYWZ1X2NvbmZp
Z19yZWNvcmRfdHlwZSwKPj4gICAJCQkJICAmYWZ1LT5kZXYua29iaiwgImNyJWkiLCBjci0+Y3Ip
Owo+PiAgIAlpZiAocmMpCj4+IC0JCWdvdG8gZXJyOwo+PiArCQlnb3RvIGVycjE7Cj4g4oCmCj4K
PiBDYW4gYW4gb3RoZXIgbGFiZWwgYmUgbW9yZSByZWFzb25hYmxlIGhlcmU/Cj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3Q/aWTzNTkyODc3NjVj
MDQ3MTFmZjU0ZmJkMTE2NDUyNzFkOGU1ZmY3NjMjbjQ2NQpJIGp1c3QgdXNlZCB0aGUgb3JpZ2lu
YWwgYXV0aG9yJ3MgbGFiZWwsIHNob3VsZCBJIHJlcGxhY2UgYWxsIGhpcyBsYWJlbHMgCmxpa2Un
ZXJyJywnZXJyMScgd2l0aCByZWFzb25hYmxlIG9uZS4K
