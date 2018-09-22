From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 22 Sep 2018 17:13:35 +0000
Subject: Re: [PATCH] ALSA: usb-audio: ensure that cluster header size is enough
Message-Id: <6146a00b-70b6-cb02-2bd2-77201c07fb80@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180922133831.GA6792@mwanda>
In-Reply-To: <20180922133831.GA6792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jaroslav Kysela <perex@perex.cz>, Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: alsa-devel@alsa-project.org, Michael Drake <michael.drake@codethink.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>

Hello!

On 09/22/2018 04:38 PM, Dan Carpenter wrote:

> I think we need a check to make sure that "hc_header.wLength" is large
> enough for a struct struct uac3_cluster_header_descriptor.

   struct struct? :-)

> Fixes: 9a2fe9b801f5 ("ALSA: usb: initial USB Audio Device Class 3.0 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

[...]

MBR, Sergei
