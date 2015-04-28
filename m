From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 28 Apr 2015 17:21:39 +0000
Subject: Re: [PATCH] KVM: x86: drop unneeded null test
Message-Id: <553FC1A3.70206@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430166934-30834-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430166934-30834-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Gleb Natapov <gleb@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, zhanghy@sangfor.com, jasowang@redhat.com, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

> If the null test is needed, the call to cancel_delayed_work_sync would have
> already crashed.  Normally, the destroy function should only be called
> if the init functoin has succeeded, in which case ioapic is not null.

Does your commit message need a small fix?

Regards,
Markus
