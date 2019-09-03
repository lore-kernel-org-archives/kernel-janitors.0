From: Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 03 Sep 2019 05:31:49 +0000
Subject: Re: [PATCH] staging: exfat: fix uninitialized variable ret
Message-Id: <20190903053149.GA56440@archlinux-threadripper>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830184644.15590-1-colin.king@canonical.com>
In-Reply-To: <20190830184644.15590-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-kernel@vger.kernel.org

On Fri, Aug 30, 2019 at 07:46:44PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there are error return paths in ffsReadFile that
> exit via lable err_out that return and uninitialized error
> return in variable ret. Fix this by initializing ret to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: c48c9f7ff32b ("staging: exfat: add exfat filesystem code to staging")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Clang also warns about this:

drivers/staging/exfat/exfat_super.c:885:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
        if (p_fs->dev_ejected)
            ^~~~~~~~~~~~~~~~~
drivers/staging/exfat/exfat_super.c:892:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/staging/exfat/exfat_super.c:885:2: note: remove the 'if' if its condition is always true
        if (p_fs->dev_ejected)
        ^~~~~~~~~~~~~~~~~~~~~~
drivers/staging/exfat/exfat_super.c:776:9: note: initialize the variable 'ret' to silence this warning
        int ret;
               ^
                = 0
1 warning generated.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
