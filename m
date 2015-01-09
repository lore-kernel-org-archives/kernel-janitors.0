From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 09 Jan 2015 13:42:06 +0000
Subject: Re: [patch] HID: roccat: potential out of bounds in pyra_sysfs_write_settings()
Message-Id: <alpine.LNX.2.00.1501091441480.15299@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150109123231.GA25224@mwanda>
In-Reply-To: <20150109123231.GA25224@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 9 Jan 2015, Dan Carpenter wrote:

> This is a static checker fix.  We write some binary settings to the
> sysfs file.  One of the settings is the "->startup_profile".  There
> isn't any checking to make sure it fits into the
> pyra->profile_settings[] array in the profile_activated() function.
> 
> I added a check to pyra_sysfs_write_settings() in both places because
> I wasn't positive that the other callers were correct.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to hid.git#for-3.19/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs
