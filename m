From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Thu, 11 Feb 2021 10:20:39 +0000
Subject: Re: [PATCH RESEND] MAINTAINERS: replace non-matching patterns for loongson{2,3}
Message-Id: <20210211102039.GB7985@alpha.franken.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210083812.6126-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210210083812.6126-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@linux-mips.org, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 10, 2021 at 09:38:12AM +0100, Lukas Bulwahn wrote:
> Commit ffe1f9356fbe ("MAINTAINERS: Add Loongson-2/Loongson-3 maintainers")
> adds quite generic file entries for drivers/*/*loongson{2,3}* and
> drivers/*/*/*loongson{2,3}* to be informed on changes to all loongson{2,3}
> files in drivers.
> 
> However, only the pattern 'drivers/*/*loongson2*' matches to one file in
> the repository, i.e., drivers/cpufreq/loongson2_cpufreq.c; all other
> patterns have no file matches.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/*/*/*loongson2*
>   warning: no file matches    F:    drivers/*/*/*loongson3*
>   warning: no file matches    F:    drivers/*/*loongson3*
> 
> As in the last two and half years, no further files and drivers have
> showed up to match those patterns, just name the one file that matches
> explicitly and delete the others without a match.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20210209
> 
> Keguang, Huacai, Jiaxun, please ack.
> 
> Thomas, please pick this minor non-urgent cleanup patch.
> 
>  MAINTAINERS | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
