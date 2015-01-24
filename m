From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Jan 2015 09:26:24 +0000
Subject: Re: [patch] KVM: always initialize *pdata in get_msr()
Message-Id: <20150124092624.GN6456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150123143232.GA4298@mwanda>
 <20150123160803.GA3267@potion.brq.redhat.com>
In-Reply-To: <20150123160803.GA3267@potion.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 23, 2015 at 05:08:03PM +0100, Radim Krčmář wrote:
> This patch will prevent future detection of functional bugs :(

Hm.  You're right.  Smatch should be able to follow the logic.  The code
to handle this is pretty new.  I'll look into why it wasn't working.

regards,
dan carpenter

