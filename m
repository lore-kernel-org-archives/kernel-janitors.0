From: Matthew Wilcox <willy@infradead.org>
Date: Fri, 12 Jun 2020 17:04:31 +0000
Subject: Re: [PATCH v2] proc/fd: Remove unnecessary variable initialisations in seq_show()
Message-Id: <20200612170431.GG8681@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612160946.21187-1-pilgrimtao@gmail.com>
 <7fdada40-370d-37b3-3aab-bfbedaa1804f@web.de>
 <20200612170033.GF8681@bombadil.infradead.org>
 <80794080-138f-d015-39df-36832e9ab5d4@web.de>
In-Reply-To: <80794080-138f-d015-39df-36832e9ab5d4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kaitao Cheng <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, Muchun Song <songmuchun@bytedance.com>

T24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMDc6MDM6NDlQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPj4+ICdmaWxlcycgd2lsbCBiZSBpbW1lZGlhdGVseSByZWFzc2lnbmVkLiAnZl9m
bGFncycgYW5kICdmaWxlJyB3aWxsIGJlCj4gPj4+IG92ZXJ3cml0dGVuIGluIHRoZSBpZnt9IG9y
IHNlcV9zaG93KCkgZGlyZWN0bHkgZXhpdHMgd2l0aCBhbiBlcnJvci4KPiA+Pj4gc28gd2UgZG9u
J3QgbmVlZCB0byBjb25zdW1lIENQVSByZXNvdXJjZXMgdG8gaW5pdGlhbGl6ZSB0aGVtLgo+ID4+
Cj4gPj4gSSBzdWdnZXN0IHRvIGltcHJvdmUgYWxzbyB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4K
PiA+Pgo+ID4+ICogU2hvdWxkIHRoZSBtZW50aW9uZWQgaWRlbnRpZmllcnMgcmVmZXIgdG8gdmFy
aWFibGVzPwo+ID4+Cj4gPj4gKiBXaWxsIGFub3RoZXIgaW1wZXJhdGl2ZSB3b3JkaW5nIGJlIHBy
ZWZlcnJlZD8KPiA+PiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJt
aXR0aW5nLXBhdGNoZXMucnN0P2lktzkxZDFiZGY5MjEyZDk0NGQ3NDlhNWM3ZmY2ZmViZGJhMjQx
NzcxI24xNTEKPiA+Pgo+ID4+ICogSSBwcm9wb3NlIHRvIGV4dGVuZCB0aGUgcGF0Y2ggYSBiaXQg
bW9yZS4KPiA+PiAgIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gY29udmVydCB0aGUgaW5pdGlh
bGlzYXRpb24gZm9yIHRoZSB2YXJpYWJsZSDigJxyZXTigJ0KPiA+PiAgIGFsc28gaW50byBhIGxh
dGVyIGFzc2lnbm1lbnQ/Cj4gPgo+ID4gUGxlYXNlIHN0b3AgY29tbWVudGluZyBvbiBwZW9wbGUn
cyBjaGFuZ2Vsb2dzLiAgWW91IGFkZCBubyB2YWx1ZS4KPiAKPiBXb3VsZCB5b3UgbGlrZSB0byBj
bGFyaWZ5IGNvbmNyZXRlIHNvZnR3YXJlIGRldmVsb3BtZW50IGlkZWFzPwoKWWVzLiAgTGVhcm4g
c29tZXRoaW5nIGRlZXBseSwgdGhlbiB5b3VyIG9waW5pb24gd2lsbCBoYXZlIHZhbHVlLg==
