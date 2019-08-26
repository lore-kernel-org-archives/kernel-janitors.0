From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Mon, 26 Aug 2019 13:23:07 +0000
Subject: Re: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check
Message-Id: <17ba2fb20a06d3e167005db6a225ef68f6b78777.camel@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826131855.GA6840@mwanda>
In-Reply-To: <20190826131855.GA6840@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>

T24gTW9uLCAyMDE5LTA4LTI2IGF0IDE2OjE4ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgZGV2aWNlX2xpbmtfYWRkKCkgZnVuY3Rpb24gb25seSByZXR1cm5zIE5VTEwgb24gZXJy
b3IsIGl0IGRvZXNuJ3QNCj4gcmV0dXJuIGVycm9yIHBvaW50ZXJzLg0KPiANCj4gRml4ZXM6IDIw
MmFjYzU2NWExZiAoIkFTb0M6IFNPRjogaW14OiBBZGQgaS5NWDggSFcgc3VwcG9ydCIpDQo+IFNp
Z25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCg0K
VGhhbmtzIERhbiEgTmljZSBjYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRh
bmllbC5iYWx1dGFAbnhwLmNvbT4NCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9zb2YvaW14L2lteDgu
YyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL2lteC9pbXg4LmMgYi9zb3Vu
ZC9zb2Mvc29mL2lteC9pbXg4LmMNCj4gaW5kZXggZTUwMmY1ODQyMDdmLi40MWFkM2EzMTA4MDgg
MTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9zb2YvaW14L2lteDguYw0KPiArKysgYi9zb3VuZC9z
b2Mvc29mL2lteC9pbXg4LmMNCj4gQEAgLTIyNyw4ICsyMjcsOCBAQCBzdGF0aWMgaW50IGlteDhf
cHJvYmUoc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2KQ0KPiAgCQkJCQkJRExfRkxBR19TVEFURUxF
U1MgfA0KPiAgCQkJCQkJRExfRkxBR19QTV9SVU5USU1FIHwNCj4gIAkJCQkJCURMX0ZMQUdfUlBN
X0FDVElWRSk7DQo+IC0JCWlmIChJU19FUlIocHJpdi0+bGlua1tpXSkpIHsNCj4gLQkJCXJldCA9
IFBUUl9FUlIocHJpdi0+bGlua1tpXSk7DQo+ICsJCWlmICghcHJpdi0+bGlua1tpXSkgew0KPiAr
CQkJcmV0ID0gLUVOT01FTTsNCj4gIAkJCWRldl9wbV9kb21haW5fZGV0YWNoKHByaXYtPnBkX2Rl
dltpXSwgZmFsc2UpOw0KPiAgCQkJZ290byBleGl0X3Vucm9sbF9wbTsNCj4gIAkJfQ0K
