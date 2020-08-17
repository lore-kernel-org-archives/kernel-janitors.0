From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 17 Aug 2020 10:07:10 +0000
Subject: Re: [PATCH] HID: roccat: add bounds checking in kone_sysfs_write_settings()
Message-Id: <nycvar.YFH.7.76.2008171206280.27422@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805095501.GD483832@mwanda>
In-Reply-To: <20200805095501.GD483832@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 5 Aug 2020, Dan Carpenter wrote:

> In the original code we didn't check if the new value for
> "settings->startup_profile" was within bounds that could possibly
> result in an out of bounds array acccess.  What we did was we checked if
> we could write the data to the firmware and it's possibly the firmware
> checks these values but there is no way to know.  It's safer and easier
> to read if we check it in the kernel as well.
> 
> I also added a check to ensure that "settings->size" was correct.  The
> comments say that the only valid value is 36 which is sizeof(struct
> kone_settings).
> 
> Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Stefan, could I please get your Reviewed-by and/or Tested-by, to make sure 
this doesn't unintentionally somehow break userspace?

Thanks,

-- 
Jiri Kosina
SUSE Labs
