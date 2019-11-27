From: linmiaohe <linmiaohe@huawei.com>
Date: Wed, 27 Nov 2019 02:21:32 +0000
Subject: Re: [PATCH] KVM: x86/mmu: fix comparison of u8 with -1
Message-Id: <141f8e0da70a400282824a09bcb56501@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126161255.323992-1-colin.king@canonical.com>
In-Reply-To: <20191126161255.323992-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

DQo+IFRoZSBjb21wYXJpc29uIG9mIHRoZSB1OCB2YWx1ZSBfX2VudHJ5LT51IHdpdGggLTEgaXMg
YWx3YXlzIGdvaW5nIHRvIGJlIGZhbHNlIGJlY2F1c2UNCj4gYSBfX2VudHJ5LXUgY2FuIG5ldmVy
IGJlIG5lZ2F0aXZlLg0KDQpzL19fZW50cnktdS9fX2VudHJ5LT51Lw0KDQpUaGFua3MuDQo
