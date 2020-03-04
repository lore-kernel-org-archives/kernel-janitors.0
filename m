From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 20:50:39 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <alpine.DEB.2.21.2003042145340.2698@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com> <20200304131035.731a3947@lwn.net>
In-Reply-To: <20200304131035.731a3947@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 4 Mar 2020, Jonathan Corbet wrote:

> On Wed,  4 Mar 2020 08:29:50 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > Jonathan, pick pick this patch for doc-next.
> 
> Sigh, I need to work a MAINTAINERS check into my workflow...
>

I getting closer to have zero warnings on the MAINTAINER file matches and 
then, I would set up a bot following the mailing lists to warn when anyone
sends a patch that potentially introduces such warning.
 
> Thanks for fixing these, but ... what tree did you generate the patch
> against?  I doesn't come close to applying to docs-next.
>

My patch was based on next-20200303, probably too much noise on 
MAINTAINERS, such that it does not apply cleanly on docs-next.
If you want, I can send a patch that fits to docs-next. Anyway, merging 
will be similarly difficult later :(

Lukas
