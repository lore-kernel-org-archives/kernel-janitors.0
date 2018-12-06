From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 06 Dec 2018 14:57:48 +0000
Subject: Re: [PATCH][next] drivers: base: remove need for a temporary string for the node name
Message-Id: <20181206145748.GA8360@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129180844.31138-1-colin.king@canonical.com>
In-Reply-To: <20181129180844.31138-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 29, 2018 at 06:08:44PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the node name is being formatting into a temporary string
> node_name, however, kobject_init_and_add allows one to format up
> a node name, so use that instead. This removes the need for the
> node_name string and also cleans up the following warning:
> 
> Fixes clang warning:
> warning: format string is not a string literal (potentially
> insecure) [-Wformat-security]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/base/swnode.c | 5 +----

I don't know where this file comes from.  It's not in my
driver-core-next branch, who is creating it?

thanks,

greg k-h
