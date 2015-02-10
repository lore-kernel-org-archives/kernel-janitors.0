From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Feb 2015 22:24:12 +0000
Subject: Re: [PATCH 1/1] staging: android: Remove allocation from declaration line
Message-Id: <20150210222412.GA27072@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210110945.GA17910@sloth>
In-Reply-To: <20150210110945.GA17910@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Arve =?utf-8?B?SGrvv71ubmV277+9Zw==?= <arve@android.com>, Riley Andrews <riandrews@android.com>, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 12:09:45PM +0100, Quentin Lambert wrote:
> This patch removes allocation from declaration line because
> people are known to gloss over declarations.

Then those people should not be reviewing kernel code :)

Seriously, this is unneeded churn, the code is fine as-is.

thanks,

greg k-h
