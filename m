From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 17 Jan 2011 12:21:27 +0000
Subject: Re: [PATCH] hid: hid-roccat-koneplus: potential NULL dereference
Message-Id: <alpine.LNX.2.00.1101171321140.26685@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295258925-31288-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1295258925-31288-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 17 Jan 2011, Vasiliy Kulikov wrote:

> kmalloc() may fail, if so return -ENOMEM.
> Also koneplus_init_koneplus_device_struct() should check return code
> of koneplus_get_startup_profile() and propagate its return code.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Applied, thanks Vasiliy.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
