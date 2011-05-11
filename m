From: Greg KH <greg@kroah.com>
Date: Wed, 11 May 2011 21:09:39 +0000
Subject: Re: [PATCH 09/12] staging: usbip: edit Kconfig and rename CONFIG
Message-Id: <20110511210939.GB4893@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
 <d7a90447e6c03d9e62007325f63d0a0e70654903.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <d7a90447e6c03d9e62007325f63d0a0e70654903.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 01:54:21AM -0700, matt mooney wrote:
> Edit configuration option help text; rename CONFIG options to use a
> USBIP prefix and change COMMON to CORE in both the Kconfig and
> Makefile; edit the menu entries; and edit the driver descriptions.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> I was thinking that renaming the modules would be a good idea. This patch is a
> start in that direction without changing anything in userspace yet. My idea is
> to change usbip_common_mod to usbip-core and usbip to usbip-host. What do you
> think?

That makes more sense, yes, please do so.

thanks,

greg k-h
