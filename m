From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 06 Mar 2018 11:09:58 +0000
Subject: Re: [PATCH v2] ipmi: Fix error code in try_smi_init()
Message-Id: <CAK8P3a0LUEVG9HnoCJhYkhjQPnVxTD=DeQzWOg5zCi+mM+yREg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306104011.GA22441@mwanda>
In-Reply-To: <20180306104011.GA22441@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 6, 2018 at 11:40 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If platform_device_alloc() fails, then we should return -ENOMEM instead
> of returning success.  I've also removed the "rv" initialization so that
> GCC can maybe detect if we forget to set it in the future.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Don't initialize "rv" and fix a typo in the commit message

This addresses my comment, so

Acked-by: Arnd Bergmann <arnd@arndb.de>
