From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 05 Aug 2015 22:10:58 +0000
Subject: Re: [PATCH v3] firmware: Fix memory leak in error path
Message-Id: <20150805221058.GA22337@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433569695-19348-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433569695-19348-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 06, 2015 at 01:48:15PM +0800, Firo Yang wrote:
> Eliminate a memory leak by unifying the error handling code
> at the end of the function.
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>
> Acked-by: Ming Lei <ming.lei@canonical.com>
> ---
>  drivers/base/firmware_class.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)

Doesn't apply :(
