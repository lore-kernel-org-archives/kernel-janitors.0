From: Darren Hart <dvhart@infradead.org>
Date: Wed, 03 Sep 2014 17:48:15 +0000
Subject: Re: [patch] toshiba_acpi: fix and cleanup toshiba_kbd_bl_mode_store()
Message-Id: <20140903174815.GA7153@vmdeb7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140903114437.GA3359@mwanda>
In-Reply-To: <20140903114437.GA3359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 03, 2014 at 02:44:37PM +0300, Dan Carpenter wrote:
> The current code just returns -EINVAL because mode can't be equal to
> both 1 and 2.
> 
> Also this function is messy so I have cleaned it up:
> 1) Remove initializers like "int time = -1".  Initializing variables to
>    garbage values turns off GCC's uninitialized variable warnings so it
>    can lead to bugs.
> 2) Use kstrtoint() instead of sscanf().
> 3) Use SCI_KBD_MODE_FNZ and SCI_KBD_MODE_AUTO instead of magic numbers 1
>    and 2.
> 4) Don't check for "mode = -1" because that can't happen.
> 5) Preserve the error code from toshiba_kbd_illum_status_set().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
