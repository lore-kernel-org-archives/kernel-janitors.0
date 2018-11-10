From: Borislav Petkov <bp@alien8.de>
Date: Sat, 10 Nov 2018 15:58:51 +0000
Subject: Re: [PATCH] EDAC: clean an indentation issues, replace spaces for tabs
Message-Id: <20181110155851.GC20023@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181109133757.21471-1-colin.king@canonical.com>
In-Reply-To: <20181109133757.21471-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mark Gross <mark.gross@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ranganathan Desikan <ravi@jetztechnologies.com>, "Arvind R ." <arvino55@gmail.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 09, 2018 at 01:37:57PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to clean up an indentation issues, replacing 7 space chars
> for a tab and also inserting a missing indentation

Pls see section "2) Describe your changes" in

  Documentation/process/submitting-patches.rst

about how to formulate your commit message. Especially this:

"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy to
do frotz", as if you are giving orders to the codebase to change its
behaviour."

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/edac/e752x_edac.c   | 4 ++--
>  drivers/edac/i3000_edac.c   | 4 ++--
>  drivers/edac/i5000_edac.c   | 4 ++--
>  drivers/edac/i7core_edac.c  | 2 +-
>  drivers/edac/i82975x_edac.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)

Anyway, fixed up and applied,
thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
