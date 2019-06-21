From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 21 Jun 2019 13:50:07 +0000
Subject: Re: [PATCH][next] lkdtm: remove redundant initialization of ret
Message-Id: <20190621135007.GA27890@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190614094311.24024-1-colin.king@canonical.com>
 <201906201112.AE06471@keescook>
In-Reply-To: <201906201112.AE06471@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 20, 2019 at 11:13:32AM -0700, Kees Cook wrote:
> On Fri, Jun 14, 2019 at 10:43:11AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The variable ret is being initialized with the value -EINVAL however
> > this value is never read and ret is being re-assigned later on. Hence
> > the initialization is redundant and can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks!
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> Greg, can you take this please?

Will do, thanks.

greg k-h
