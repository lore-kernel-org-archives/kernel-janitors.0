From: Harry Wentland <hwentlan@amd.com>
Date: Tue, 08 Oct 2019 14:20:27 +0000
Subject: Re: [PATCH] drm/amdgpu/display: make various arrays static, makes object smaller
Message-Id: <128afe86-e426-3596-4d91-a8cc19e19a21@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007215857.14720-1-colin.king@canonical.com>
 <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
 <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel@perches.com>
In-Reply-To: <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "Wentland, Harry" <Harry.Wentland-5C7GfCeVMHo@public.gmane.org>, "Li, Sun peng (Leo)" <Sunpeng.Li-5C7GfCeVMHo@public.gmane.org>, "Deucher, Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, "Koenig, Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>, "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

T24gMjAxOS0xMC0wOCAxMDowMCBhLm0uLCBKb2UgUGVyY2hlcyB3cm90ZToNCj4gT24gVHVlLCAy
MDE5LTEwLTA4IGF0IDEzOjU2ICswMDAwLCBIYXJyeSBXZW50bGFuZCB3cm90ZToNCj4gW10NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19w
YXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2Vy
LmMNCj4+IFtdDQo+Pj4gQEAgLTI3NDUsNyArMjc0NSw3IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3Vs
dCBiaW9zX2dldF9ib2FyZF9sYXlvdXRfaW5mbygNCj4+PiAgCXN0cnVjdCBiaW9zX3BhcnNlciAq
YnA7DQo+Pj4gIAllbnVtIGJwX3Jlc3VsdCByZWNvcmRfcmVzdWx0Ow0KPj4+ICANCj4+PiAtCWNv
bnN0IHVuc2lnbmVkIGludCBzbG90X2luZGV4X3RvX3ZiaW9zX2lkW01BWF9CT0FSRF9TTE9UU10g
PSB7DQo+Pj4gKwlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHNsb3RfaW5kZXhfdG9fdmJpb3Nf
aWRbTUFYX0JPQVJEX1NMT1RTXSA9IHsNCj4+DQo+PiBXb24ndCB0aGlzIGJyZWFrIHRoZSBtdWx0
aS1HUFUgY2FzZSB3aGVyZSB5b3UnbGwgaGF2ZSBtdWx0aXBsZSBkcml2ZXINCj4+IGluc3RhbmNl
cyB3aXRoIGRpZmZlcmVudCBsYXlvdXQ/DQo+IA0KPiBBcyB0aGUgYXJyYXkgaXMgcmVhZC1vbmx5
LCBob3cgY291bGQgdGhhdCBoYXBwZW4/DQo+IA0KDQpZb3UncmUgcmlnaHQuDQoNClBhdGNoIGlz
DQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoN
CkhhcnJ5DQoNCj4gDQo
