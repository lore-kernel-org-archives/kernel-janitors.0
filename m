From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 09 Sep 2020 06:35:52 +0000
Subject: Re: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_write_settings()
Message-Id: <nycvar.YFH.7.76.2009090835410.4671@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200824085735.GA208317@mwanda>
In-Reply-To: <20200824085735.GA208317@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 24 Aug 2020, Dan Carpenter wrote:

> This code doesn't check if "settings->startup_profile" is within bounds
> and that could result in an out of bounds array access.  What the code
> does do is it checks if the settings can be written to the firmware, so
> it's possible that the firmware has a bounds check?  It's safer and
> easier to verify when the bounds checking is done in the kernel.
> 
> Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  In the v1 patch I added a check against settings->size but that's
> potentially too strict so it was removed.

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs
