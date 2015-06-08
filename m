From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 08 Jun 2015 20:09:33 +0000
Subject: Re: [PATCH V2 1/2] staging: wilc1000: remove UWORD8
Message-Id: <20150608200933.GA11289@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433376096-12532-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1433376096-12532-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 04, 2015 at 09:01:35AM +0900, chaehyun lim wrote:
> Use u8 instead of UWORD8.
> 
> Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
> ---
> V2 : remove the defintion of UWORD8

Please fix the name issue here as well.

greg k-h
