From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 17 Sep 2012 13:49:15 +0000
Subject: Re: [PATCH v2 5/9] drivers/staging/gdm72xx/gdm_sdio.c: Remove useless kfree
Message-Id: <CA+MoWDqux60EpDHZnjt+MGp0U2qxxBdfWX+hF5XbCkt1zfCU-Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347610518-3099-1-git-send-email-peter.senna@gmail.com>
	<20120917121831.GA23117@kroah.com>
In-Reply-To: <20120917121831.GA23117@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: wharms@bfs.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

> As I already applid your first patch, care to just send an incremental
> patch that makes the change you did here?

I've just sent a patch for that:
[PATCH] drivers/staging/gdm72xx/gdm_sdio.c: Replace kmalloc+memset for kzalloc

-- 
Peter
