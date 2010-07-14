From: David Brown <davidb@codeaurora.org>
Date: Wed, 14 Jul 2010 22:32:13 +0000
Subject: Re: [PATCH 09/11] staging: msm: formatting of pointers in printk()
Message-Id: <201007141532.14072.davidb@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130717-15755-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279130717-15755-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>, Jiri Kosina <jkosina@suse.cz>, Javier Martinez Canillas <martinez.javier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Wednesday 14 July 2010 11:05:17 Kulikov Vasiliy wrote:

> Use %p instead of %08x in printk().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/comedi/drivers/quatech_daqp_cs.c |    2 +-

Did you mean to have an 'msm:' in the subject?  This driver isn't part
of the msm subsystem?

Thanks,
David Brown

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
