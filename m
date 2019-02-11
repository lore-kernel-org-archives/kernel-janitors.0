From: Nadav Amit <namit@vmware.com>
Date: Mon, 11 Feb 2019 19:12:40 +0000
Subject: Re: [PATCH] vmw_balloon: release lock on error in vmballoon_reset()
Message-Id: <A3173F98-AE61-48DF-8AA8-6757C3C086F7@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184545.GC22106@kadam>
In-Reply-To: <20190211184545.GC22106@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julien Freche <jfreche@vmware.com>, Xavier Deguillard <xdeguillard@vmware.com>, Pv-drivers <Pv-drivers@vmware.com>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

PiBPbiBGZWIgMTEsIDIwMTksIGF0IDEwOjQ1IEFNLCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gV2UgYWRkZWQgc29tZSBsb2NraW5nIHRvIHRo
aXMgZnVuY3Rpb24gYnV0IGZvcmdvdCB0byBkcm9wIHRoZSBsb2NrIG9uDQo+IHRoZXNlIHR3byBl
cnJvciBwYXRocy4gIFRoaXMgYnVnIHdvdWxkIGxlYWQgdG8gYW4gaW1tZWRpYXRlIGRlYWRsb2Nr
Lg0KPiANCj4gRml4ZXM6IGM3YjM2OTBmYjE1MiAoInZtd19iYWxsb29uOiBzdGF0cyByZXdvcmsi
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+DQoNCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQpSZXZpZXdlZC1ieTogTmFkYXYgQW1p
dCA8bmFtaXRAdm13YXJlLmNvbT4NCg0KLS0NCg0KWWVzLCBJIHNjcmV3ZWQgdXAuIFRoYW5rcyBm
b3IgY2F0Y2hpbmcgaXQhDQoNCknigJlsbCBnbyB0byBjaGVjayB3aHkgbXkgZXJyb3IgaW5qZWN0
aW9uIHRlc3RzIGRpZG7igJl0IGNhdGNoIGl0Lg0KDQo
