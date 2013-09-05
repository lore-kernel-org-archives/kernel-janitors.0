From: Matt Fleming <matt@console-pimps.org>
Date: Thu, 05 Sep 2013 09:59:20 +0000
Subject: Re: [PATCH] efivars: Mark local function as static
Message-Id: <20130905095920.GK28598@console-pimps.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378191380-6048-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1378191380-6048-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bojan Prtvar <prtvar.b@gmail.com>
Cc: matt.fleming@intel.com, linux-efi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 03 Sep, at 08:56:20AM, Bojan Prtvar wrote:
> This fixes the following sparse warning
> drivers/firmware/efi/efivars.c:567:6: warning: symbol 'efivars_sysfs_exit' was not declared. Should it be static?
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  drivers/firmware/efi/efivars.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied, thanks!

-- 
Matt Fleming, Intel Open Source Technology Center
