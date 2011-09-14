From: Dan Carpenter <error27@gmail.com>
Date: Wed, 14 Sep 2011 21:25:17 +0000
Subject: Re: [PATCH] drivers: rename some function parameters from 'register'
Message-Id: <20110914212517.GF3789@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1315832341-917-1-git-send-email-cpeterso@cpeterso.com>
In-Reply-To: <1315832341-917-1-git-send-email-cpeterso@cpeterso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 12, 2011 at 08:59:01AM -0400, Chris Peterson wrote:
> Some function prototypes declare an 'int register' parameter. gcc -W warns
> "‘register’ is not at beginning of declaration" because the compiler thinks
> the parameter has been marked as a 'register' variable but the author
> just wanted to name the parameter "register" (which is a reserved keyword).
> 
> Signed-off-by: Chris Peterson <cpeterso@cpeterso.com>

This needs to be broken up into separate patches by file.  The
problem is that you have four maintainers and they each can only
take the chunk that affects their subsystem.

> --- a/drivers/isdn/hardware/eicon/platform.h
> +++ b/drivers/isdn/hardware/eicon/platform.h
> @@ -206,7 +206,7 @@ void PCIread (byte bus, byte func, int offset, void* data, int length, void* pci
>  /*
>  **  I/O Port utilities
>  */
> -int diva_os_register_io_port (void *adapter, int register, unsigned long port,
> +int diva_os_register_io_port (void *adapter, int reg, unsigned long port,
>  				unsigned long length, const char* name, int id);

Instead of using "reg" for this one, it probably would be better to
use "on".  That's how it's named in the .c file.

regards,
dan carpenter

