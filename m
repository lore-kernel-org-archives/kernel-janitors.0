From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 06:05:28 +0000
Subject: Re: [PATCH] Change x86 Machine check handler to use unlocked_iocl instead of ioctl
Message-Id: <20080109060528.GA8202@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B342.2070501@suse.de>
In-Reply-To: <4785B342.2070501@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 10, 2008 at 11:25:14AM +0530, Nikanth Karthikesan wrote:
> The Machine check handler registers ioctl handler that is called
> with the BKL held. Changing to register unlocked_ioctl instead.
> Also mce ioctl handler does not seem to need any lock protection.

Thanks, but I already did that here on my own.

-Andi
