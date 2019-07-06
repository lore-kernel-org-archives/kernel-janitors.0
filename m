From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 06 Jul 2019 09:28:56 +0000
Subject: Re: [PATCH] staging: speakup: One function call less in speakup_win_enable()
Message-Id: <20190706092856.GA15480@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11f79333-25c3-1ad9-4975-58c64821f3fe@web.de>
 <20190706090019.rivposzrqesodhso@function>
In-Reply-To: <20190706090019.rivposzrqesodhso@function>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 06, 2019 at 11:00:19AM +0200, Samuel Thibault wrote:
> Markus Elfring, le sam. 06 juil. 2019 10:15:30 +0200, a ecrit:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 6 Jul 2019 10:03:56 +0200
> > 
> > Avoid an extra function call by using a ternary operator instead of
> > a conditional statement.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Sorry, but this author/bot is in my kill-file and I no longer accept
patches from them.

And I HATE ternary operators anyway, so it's not like I would take this
patch if it came from someone else :)

thanks,

greg k-h
