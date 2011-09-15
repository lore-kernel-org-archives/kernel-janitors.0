From: Chris Peterson <cpeterso@cpeterso.com>
Date: Thu, 15 Sep 2011 06:49:05 +0000
Subject: Re: [PATCH] drivers/isdn/hardware/eicon/platform.h: rename prototype
Message-Id: <CAL+j+jhBFyDgLKjMeSifj2vVQAq_1F9=KsmgYfpth91+zMHDWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1316068573-3337-1-git-send-email-cpeterso@cpeterso.com>
In-Reply-To: <1316068573-3337-1-git-send-email-cpeterso@cpeterso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Sorry, my email's subject should read "rename prototype parameter from
'register' to 'on'" (not 'reg').

chris



On Wed, Sep 14, 2011 at 11:36 PM, Chris Peterson <cpeterso@cpeterso.com> wrote:
> gcc -Wextra warns "‘register’ is not at beginning of declaration" because the
> compiler thinks the parameter has been marked as a 'register' variable, but
> the function prototype intended to name the parameter "register" (which is a
> reserved keyword).
>
> Signed-off-by: Chris Peterson <cpeterso@cpeterso.com>
> ---
>  drivers/isdn/hardware/eicon/platform.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/isdn/hardware/eicon/platform.h b/drivers/isdn/hardware/eicon/platform.h
> index 15d4942..c36fffe 100644
> --- a/drivers/isdn/hardware/eicon/platform.h
> +++ b/drivers/isdn/hardware/eicon/platform.h
> @@ -206,7 +206,7 @@ void PCIread (byte bus, byte func, int offset, void* data, int length, void* pci
>  /*
>  **  I/O Port utilities
>  */
> -int diva_os_register_io_port (void *adapter, int register, unsigned long port,
> +int diva_os_register_io_port (void *adapter, int on, unsigned long port,
>                                unsigned long length, const char* name, int id);
>  /*
>  **  I/O port access abstraction
> --
> 1.7.4.1
>
>
