From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 06:36:32 +0000
Subject: Re: [PATCH] usb: core: ledtrig-usbport: use octal permission
Message-Id: <20201101063632.GA432136@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201031171930.GA21555@fedora-project>
In-Reply-To: <20201031171930.GA21555@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Christian <nigel.l.christian@gmail.com>
Cc: lee.jones@linaro.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Oct 31, 2020 at 01:19:30PM -0400, Nigel Christian wrote:
> Change read/write for owner permission from symbolic to octal
> to enhance readability. This patch reduces checkpatch warnings 
> for this file to nil.
> 
> see: https://lkml.org/lkml/2016/8/2/1945

Please use lore.kernel.org links for mailing list stuff.

thanks,

greg k-h
