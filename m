From: Matthew Wilcox <willy@infradead.org>
Date: Fri, 12 Jun 2020 17:00:33 +0000
Subject: Re: [PATCH v2] proc/fd: Remove unnecessary variable initialisations in seq_show()
Message-Id: <20200612170033.GF8681@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612160946.21187-1-pilgrimtao@gmail.com>
 <7fdada40-370d-37b3-3aab-bfbedaa1804f@web.de>
In-Reply-To: <7fdada40-370d-37b3-3aab-bfbedaa1804f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kaitao Cheng <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, Muchun Song <songmuchun@bytedance.com>

T24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMDY6NDU6NTdQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiAnZmlsZXMnIHdpbGwgYmUgaW1tZWRpYXRlbHkgcmVhc3NpZ25lZC4gJ2ZfZmxh
Z3MnIGFuZCAnZmlsZScgd2lsbCBiZQo+ID4gb3ZlcndyaXR0ZW4gaW4gdGhlIGlme30gb3Igc2Vx
X3Nob3coKSBkaXJlY3RseSBleGl0cyB3aXRoIGFuIGVycm9yLgo+ID4gc28gd2UgZG9uJ3QgbmVl
ZCB0byBjb25zdW1lIENQVSByZXNvdXJjZXMgdG8gaW5pdGlhbGl6ZSB0aGVtLgo+IAo+IEkgc3Vn
Z2VzdCB0byBpbXByb3ZlIGFsc28gdGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24uCj4gCj4gKiBTaG91
bGQgdGhlIG1lbnRpb25lZCBpZGVudGlmaWVycyByZWZlciB0byB2YXJpYWJsZXM/Cj4gCj4gKiBX
aWxsIGFub3RoZXIgaW1wZXJhdGl2ZSB3b3JkaW5nIGJlIHByZWZlcnJlZD8KPiAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lktzkx
ZDFiZGY5MjEyZDk0NGQ3NDlhNWM3ZmY2ZmViZGJhMjQxNzcxI24xNTEKPiAKPiAqIEkgcHJvcG9z
ZSB0byBleHRlbmQgdGhlIHBhdGNoIGEgYml0IG1vcmUuCj4gICBIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRvIGNvbnZlcnQgdGhlIGluaXRpYWxpc2F0aW9uIGZvciB0aGUgdmFyaWFibGUg4oCccmV0
4oCdCj4gICBhbHNvIGludG8gYSBsYXRlciBhc3NpZ25tZW50PwoKUGxlYXNlIHN0b3AgY29tbWVu
dGluZyBvbiBwZW9wbGUncyBjaGFuZ2Vsb2dzLiAgWW91IGFkZCBubyB2YWx1ZS4=
