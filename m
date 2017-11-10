From: Stephen Hemminger <stephen@networkplumber.org>
Date: Fri, 10 Nov 2017 04:57:19 +0000
Subject: Re: [PATCH] drivers: hv: balloon: remove extraneous assignment to region_start
Message-Id: <20171110135719.4b6d0ae7@shemminger-XPS-13-9360>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171018115212.29111-1-colin.king@canonical.com>
In-Reply-To: <20171018115212.29111-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 18 Oct 2017 12:52:12 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable region_start is assigned twice, the first value is
> never read and redundant, so can be removed.  We can clean up the
> code further by assigning rg_start directly rather than using the
> temporary variable region_start which can then be removed. Cleans
> up the clang warning:
> 
> drivers/hv/hv_balloon.c:976:3: warning: Value stored to 'region_start'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

LGTM

Acked-by: Stephen Hemminger <sthemmin@microsoft.com>


