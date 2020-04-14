From: Song Liu <songliubraving@fb.com>
Date: Tue, 14 Apr 2020 22:05:12 +0000
Subject: Re: [PATCH -next] bpf: remove set but not used variable 'dst_known'
Message-Id: <C75FACD4-8549-4AD1-BDE6-1F5B47095E4C@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413113703.194287-1-maowenan@huawei.com>
In-Reply-To: <20200413113703.194287-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@chromium.org" <kpsingh@chromium.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

DQoNCj4gT24gQXByIDEzLCAyMDIwLCBhdCA0OjM3IEFNLCBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1
YXdlaS5jb20+IHdyb3RlOg0KPiANCj4gRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlJyB3YXJuaW5nOg0KPiANCj4ga2VybmVsL2JwZi92ZXJpZmllci5jOjU2MDM6MTg6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGRzdF9rbm93buKAmQ0KPiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQ0KPiANCj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IGYx
MTc0Zjc3YjUwYyAoImJwZi92ZXJpZmllcjoNCj4gcmV3b3JrIHZhbHVlIHRyYWNraW5nIikNCg0K
VGhlIGZpeCBtYWtlcyBzZW5zZS4gQnV0IEkgdGhpbmsgZjExNzRmNzdiNTBjIGludHJvZHVjZWQg
ZHN0X2tub3duLCANCnNvIHRoaXMgc3RhdGVtZW50IGlzIG5vdCBhY2N1cmF0ZS4gDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2VpLmNvbT4NCg0K
