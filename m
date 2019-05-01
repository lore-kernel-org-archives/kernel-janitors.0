From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 01 May 2019 13:08:25 +0000
Subject: Re: [PATCH][next] kobject: fix dereference before null check on kobj
Message-Id: <20190501130825.GA28441@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190501124317.1759-1-colin.king@canonical.com>
In-Reply-To: <20190501124317.1759-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 01, 2019 at 01:43:17PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The kobj pointer is being null-checked so potentially it could be null,
> however, the ktype declaration before the null check is dereferencing kobj
> hence we have a potential null pointer deference. Fix this by moving the
> assignment of ktype after kobj has been null checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: aa30f47cf666 ("kobject: Add support for default attribute groups to kobj_type")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/kobject.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Nice catch, thanks, will go queue this up now.

greg k-h
