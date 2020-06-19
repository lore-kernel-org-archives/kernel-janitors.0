From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri, 19 Jun 2020 21:37:33 +0000
Subject: Re: [PATCH v2 RESEND] MAINTAINERS: rectify MMP SUPPORT after moving cputype.h
Message-Id: <20200619213733.GA1105008@furthur.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506053431.7464-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200506053431.7464-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jiri Kosina <trivial@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 06, 2020 at 07:34:31AM +0200, Lukas Bulwahn wrote:
> Commit 32adcaa010fa ("ARM: mmp: move cputype.h to include/linux/soc/")
> added a file entry that does not point to the intended file location.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: linux/soc/mmp/
> 
> Rectify the MAINTAINERS entry now.
> 
> Fixes: 32adcaa010fa ("ARM: mmp: move cputype.h to include/linux/soc/")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Jiri, please pick this patch.

Jiri, I'm wondering if you could apply this? Otherwise maybe Olof could
queue this via arm-soc?

Thanks
Lubo

> v1 & v1-RESEND: was ignored.
> 
> v1 -> v2:
>   - v1 does not apply after reordering MAINTAINERS, i.e., commit 4400b7d68f6e
>   ("MAINTAINERS: sort entries by entry name") and commit 3b50142d8528
>   ("MAINTAINERS: sort field names for all entries").
>   - PATCH v2 applies on v5.7-rc1 now. Please pick v2 instead of v1.
> 
> v2-resend:
>   - still applies on v5.7-rc4 and next-20200505
>   - asking for inclusion through trivial tree, as maintainers are not
>     responding.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db31497..a0fef0c33ba5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11327,7 +11327,7 @@ S:	Odd Fixes
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.git
>  F:	arch/arm/boot/dts/mmp*
>  F:	arch/arm/mach-mmp/
> -F:	linux/soc/mmp/
> +F:	include/linux/soc/mmp/
>  
>  MMP USB PHY DRIVERS
>  R:	Lubomir Rintel <lkundrak@v3.sk>
> -- 
> 2.17.1
> 
