From: Joe Perches <joe@perches.com>
Date: Wed, 10 Feb 2021 08:18:27 +0000
Subject: Re: [PATCH] MAINTAINERS: replace non-matching patterns for loongson{2,3}
Message-Id: <aeaa56b9a50444c571a5ab34914d9b4590a9d629.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210075947.15604-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210210075947.15604-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@linux-mips.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2021-02-10 at 08:59 +0100, Lukas Bulwahn wrote:
> Commit ffe1f9356fbe ("MAINTAINERS: Add Loongson-2/Loongson-3 maintainers")
> adds quite generic file entries for drivers/*/*loongson{2,3}* and
> drivers/*/*/*loongson{2,3}* to be informed on changes to all loongson{2,3}
> files in drivers.
> 
> However, only the pattern 'drivers/*/*loongson2*' matches to one file in
> the repository, i.e., drivers/cpufreq/loongson2_cpufreq.c; all other
> patterns have no file matches.

Thank you.  I hope one day it gets applied...

https://lore.kernel.org/linux-mips/20190325212717.27044-1-joe@perches.com/
https://lore.kernel.org/linux-mips/20180928215928.30611-1-joe@perches.com/
https://lore.kernel.org/linux-mips/20180928220034.30697-1-joe@perches.com/
