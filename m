From: Amelie DELAUNAY <amelie.delaunay@st.com>
Date: Thu, 20 Jun 2019 15:18:03 +0000
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Message-Id: <f0ff1e54-c1b9-4a08-c7ff-2ff545e398c3@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
 <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
 <20190619055816.GF18371@dell>
In-Reply-To: <20190619055816.GF18371@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

T24gNi8xOS8xOSA3OjU4IEFNLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9uIFR1ZSwgMTggSnVuIDIw
MTksIExpbnVzIFRvcnZhbGRzIHdyb3RlOg0KPiANCj4+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0
IDE6MTYgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4NCj4+
Pj4gUmVwb3J0ZWQtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9u
Lm9yZz4NCj4+Pg0KPj4+IElkZWFsbHkgd2UgY2FuIGdldCBhIHJldmlldyB0b28uDQo+Pg0KPj4g
TG9va3MgZmluZSB0byBtZSwgYnV0IG9idmlvdXNseSBzb21lYm9keSBzaG91bGQgYWN0dWFsbHkg
X3Rlc3RfIGl0IHRvby4NCj4gDQo+IEFtZWxpZSwgd291bGQgeW91IGJlIHNvIGtpbmQ/DQo+IA0K
DQpUZXN0ZWQgb24gc3RtMzJtcDE1N2MtZXYxLg0KDQpUZXN0ZWQtYnk6IEFtZWxpZSBEZWxhdW5h
eSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4
