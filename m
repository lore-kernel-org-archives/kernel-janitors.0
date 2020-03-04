From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Wed, 04 Mar 2020 20:28:46 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <20200304212846.0c79c6da@coco.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
        <20200304131035.731a3947@lwn.net>
In-Reply-To: <20200304131035.731a3947@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Wed, 4 Mar 2020 13:10:35 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed,  4 Mar 2020 08:29:50 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> > Mauro's patch series <cover.1581955849.git.mchehab+huawei@kernel.org>
> > ("[PATCH 00/44] Manually convert filesystem FS documents to ReST")
> > converts many Documentation/filesystems/ files to ReST.
> > 
> > Since then, ./scripts/get_maintainer.pl --self-test complains with 27
> > warnings on Documentation/filesystems/ of this kind:
> > 
> >   warning: no file matches F: Documentation/filesystems/...
> > 
> > Adjust MAINTAINERS entries to all files converted from .txt to .rst in the
> > patch series and address the 27 warnings.
> > 
> > Link: https://lore.kernel.org/linux-erofs/cover.1581955849.git.mchehab+huawei@kernel.org
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Mauro, please ack.
> > Jonathan, pick pick this patch for doc-next.  
> 
> Sigh, I need to work a MAINTAINERS check into my workflow...
> 
> Thanks for fixing these, but ... what tree did you generate the patch
> against?  I doesn't come close to applying to docs-next.

I'm starting to suspect that maybe the best workflow would be to just 
apply the patches at docs-next keeping links broken, and then run
./scripts/documentation-file-ref-check --fix by the end of a merge
window, addressing such breakages.

There are usually lots of churn outside the merge window.

Another alternative would be to split the MAINTAINERS file on a
per-subsystem basis. If I remember well, someone proposed this once at
LKML. I vaguely remember that there were even a patch (or RFC)
adding support for such thing for get_maintainers.pl.

Thanks,
Mauro
