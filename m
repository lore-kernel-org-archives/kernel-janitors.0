From: Borislav Petkov <bp@alien8.de>
Date: Mon, 26 Jun 2017 14:14:52 +0000
Subject: Re: [PATCH] EDAC, pnd2_edac: make function sbi_send static
Message-Id: <20170626141451.xgvrumfobu3ulfqv@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623084855.9197-1-colin.king@canonical.com>
In-Reply-To: <20170623084855.9197-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 23, 2017 at 09:48:55AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function sbi_send is local to just pnd2_edac.c and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'sbi_send' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/edac/pnd2_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
