From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 26 Sep 2010 10:00:18 +0000
Subject: Re: [PATCH] touchscreen: tnetv107x: fix input_device leak
Message-Id: <A36AFE1D-1D31-4B93-B569-830215F0FD14@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491587-32707-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285491587-32707-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Cyril Chemparathy <cyril@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sep 26, 2010, at 1:59 AM, Vasiliy Kulikov <segooon@gmail.com> wrote:

> tsc_probe() calls input_free_device() on error, but tsc_remove()
> doesn't.

NAK. It is forbidden to call input_free_device() after unregister.

Thanks. 

-- 
Dmitry

