From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 12 Jul 2010 14:57:07 +0000
Subject: Re: [PATCH] staging: mrst-touchscreen: fix leaks
Message-Id: <20100712160532.0147d9fe@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278946084-30228-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278946084-30228-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Dan Carpenter <error27@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, 12 Jul 2010 18:48:04 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> mrstouch_probe() must unregister input device, free requested IRQ and
> input device in error path.

It does indeed need to do some of this but your patch is versus an older
version of the driver and Dmitry already fixed this - plus a chunk of the
stuff vanished in turning it to a threaded IRQ

