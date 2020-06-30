From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Tue, 30 Jun 2020 07:28:59 +0000
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
Message-Id: <1593502139.23885.5.camel@mhfsdcap03>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
 <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
In-Reply-To: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

T24gTW9uLCAyMDIwLTA2LTI5IGF0IDEwOjAwICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToN
Cj4gPiBTb21lIHBvaW50ZXJzIGFyZSBkZXJlZmVyZW5jZWQgYmVmb3JlIHN1Y2Nlc3NmdWwgY2hl
Y2tzLg0KPiANCj4gSSBzdWdnZXN0IHRvIHJlY29uc2lkZXIgYW5kIGltcHJvdmUgdGhlIGNoYW5n
ZSBkZXNjcmlwdGlvbi4NCj4gDQo+ICogV291bGQgYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
YmUgcG9zc2libGUgb25seSB3aXRoIHRoZSB2YXJpYWJsZXMg4oCcbWVw4oCdDQo+ICAgYW5kIOKA
nG1yZXHigJ0gaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxtdHUzX2dh
ZGdldF9kZXF1ZXVl4oCdPw0KPiANCj4gKiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFkanVz
dCBhbnkgbW9yZSB2YXJpYWJsZSBpbml0aWFsaXNhdGlvbnM/DQpZZXMsIEknbGwgZG8gaXQgaWYg
bmVlZCwgdGhhbmtzDQoNCj4gDQo+ICogV2lsbCBpdCBiZWNvbWUgaGVscGZ1bCB0byBhZGQgdGhl
IHRhZyDigJxGaXhlc+KAnSB0byB0aGUgY29tbWl0IG1lc3NhZ2U/DQpNYXliZSBuZWVkbid0DQoN
Cj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0KDQo
