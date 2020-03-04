From: Joe Perches <joe@perches.com>
Date: Wed, 04 Mar 2020 20:24:59 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <9c1c1b5e3a59705a501cbb713f1d0e44cc71e788.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
         <20200304131035.731a3947@lwn.net>
In-Reply-To: <20200304131035.731a3947@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2020-03-04 at 13:10 -0700, Jonathan Corbet wrote:
> On Wed,  4 Mar 2020 08:29:50 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
[]
> > ./scripts/get_maintainer.pl --self-test complains with 27
> > warnings on Documentation/filesystems/ of this kind:
> > 
> >   warning: no file matches F: Documentation/filesystems/...
[]
> Sigh, I need to work a MAINTAINERS check into my workflow...

checkpatch already bleats a warning on patches with any
file move or rename.

It would be difficult to impossible to implement a real
pattern verification mechanism in checkpatch though.
