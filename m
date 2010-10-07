From: Felipe Balbi <balbi@ti.com>
Date: Thu, 07 Oct 2010 07:54:25 +0000
Subject: Re: [PATCH] usb: makefile cleanup
Message-Id: <20101007075425.GH686@legolas.emea.dhcp.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286417006-32510-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1286417006-32510-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, David Vrabel <david.vrabel@csr.com>, Peter Korsgaard <jacmet@sunsite.dk>, "Balbi, Felipe" <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi,

On Wed, Oct 06, 2010 at 09:03:26PM -0500, matt mooney wrote:
>For all modules, change <module>-objs to <module>-y; remove
>if-statements and replace with lists using the kbuild idiom; move
>flags to the top of the file; and fix alignment while trying to
>maintain the original scheme in each file.
>
>None of the dependencies are modified.
>
>Signed-off-by: matt mooney <mfm@muteddisk.com>
>Acked-by: Sam Ravnborg <sam@ravnborg.org>

for musb parts:

Acked-by: Felipe Balbi <balbi@ti.com>

-- 
balbi
