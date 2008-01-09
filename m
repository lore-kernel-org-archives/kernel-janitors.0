From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 09 Jan 2008 10:20:17 +0000
Subject: Re: [PATCH] Change x86 Machine check handler to use unlocked_iocl
Message-Id: <20080109102017.GA8041@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B342.2070501@suse.de>
In-Reply-To: <4785B342.2070501@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Nikanth Karthikesan <knikanth@suse.de> wrote:

> The Machine check handler registers ioctl handler that is called with 
> the BKL held. Changing to register unlocked_ioctl instead. Also mce 
> ioctl handler does not seem to need any lock protection.
> 
> Change the Machine check handler to use unlocked_ioctl instead of 
> ioctl handler. Also the mce ioctl handler does not need any lock 
> protection.

thanks, applied to x86.git. Mcelog functionality uses cmpxchg so no need 
for the BKL there. The ioctl still being BKL is purely historic and it 
was never relied on.

	Ingo
