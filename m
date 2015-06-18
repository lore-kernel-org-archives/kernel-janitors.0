From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 18 Jun 2015 04:21:38 +0000
Subject: Re: [PATCH] staging: wilc1000: remove commented code
Message-Id: <20150618042138.GA10796@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434536180-32753-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1434536180-32753-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 17, 2015 at 07:16:20PM +0900, Chaehyun Lim wrote:
> Remove the commented codes using #if 0.
> 
> Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
> ---
> @@ -109,22 +67,6 @@
>  /*****************************************************************************/
>  /* Data Types                                                                */
>  /*****************************************************************************/
> -/* typedef unsigned char	uint8; */
> -/* typedef signed char     int8; */
> -/* typedef unsigned short	uint16; */
> -/* typedef unsigned long   uint32; */
> -/* typedef uint32   Bool; */
> -

That's not a #if 0 block :(

Please don't try to sneak other changes into a patch that says it is
doing something else.

greg k-h
