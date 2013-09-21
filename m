From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 21 Sep 2013 23:15:48 +0000
Subject: Re: [PATCH 15/19] staging: Change variable type to bool
Message-Id: <20130921231548.GA2769@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
 <1379802471-30252-15-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-15-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: maxtram95@gmail.com, yamanetoshi@gmail.com, viro@zeniv.linux.org.uk, wfp5p@virginia.edu, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Sep 22, 2013 at 12:27:47AM +0200, Peter Senna Tschudin wrote:
> The variable ownbit_flag is only assigned the values true and false.
> Change its type to bool.
> 
> The simplified semantic patch that find this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> @exists@
> type T;
> identifier b;
> @@
> - T
> + bool
>   b = ...;
>   ... when any
>   b = \(true\|false\)
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  drivers/staging/rtl8187se/r8180_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You sent me 3 patches with the exact same subject: line, which doesn't
bode well for the changelog.  You should update your script to put the
driver name in the subject: to make it more unique and easier to
identify in the future.  I'll fix these 3 up for now.

thanks,

greg k-h
