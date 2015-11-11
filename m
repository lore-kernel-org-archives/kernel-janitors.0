From: Darren Hart <dvhart@infradead.org>
Date: Wed, 11 Nov 2015 06:22:57 +0000
Subject: Re: [patch] asus-wmi: fix error handling in store_sys_wmi()
Message-Id: <20151111062257.GL18221@malice.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151110221816.GC30281@mwanda>
In-Reply-To: <20151110221816.GC30281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 11, 2015 at 01:18:16AM +0300, Dan Carpenter wrote:
> The asus_wmi_get_devstate_simple() returns 0-1 on success.  In theory
> according to static checkers, it can return either -EIO or -ENODEV on
> failure.  Currently the error handling code only handles -ENODEV and
> -EIO is treated as success.  Let's make it handle the -EIO error as
> well.
> 
> It's possible that it can't actually return -EIO and this patch is not
> needed but in that case this patch is harmless and silences a static
> checker warning so it's still worth it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you Dan, queued to testing.

-- 
Darren Hart
Intel Open Source Technology Center
