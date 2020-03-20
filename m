From: Jonathan Corbet <corbet@lwn.net>
Date: Fri, 20 Mar 2020 23:32:14 +0000
Subject: Re: [PATCH v2] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <20200320173214.1cca3738@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200314175030.10436-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200314175030.10436-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 14 Mar 2020 18:50:30 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Mauro's patch series <cover.1581955849.git.mchehab+huawei@kernel.org>
> ("[PATCH 00/44] Manually convert filesystem FS documents to ReST")
> converts many Documentation/filesystems/ files to ReST.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains with 27
> warnings on Documentation/filesystems/ of this kind:
> 
>   warning: no file matches F: Documentation/filesystems/...
> 
> Adjust MAINTAINERS entries to all files converted from .txt to .rst in the
> patch series and address the 27 warnings.
> 
> Link: https://lore.kernel.org/linux-erofs/cover.1581955849.git.mchehab+huawei@kernel.org
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> v1 -> v2:
> Patch v2 is now based on today's docs-next (now with base-commit below)
> 
> Jonathan, pick pick this patch v2 for docs-next.

I've done that, thanks.

jon
