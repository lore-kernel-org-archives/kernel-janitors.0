From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 06 Mar 2020 21:17:49 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <alpine.DEB.2.21.2003062214500.5521@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com> <20200304131035.731a3947@lwn.net> <alpine.DEB.2.21.2003042145340.2698@felia> <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
In-Reply-To: <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 4 Mar 2020, Joe Perches wrote:

> On Wed, 2020-03-04 at 21:50 +0100, Lukas Bulwahn wrote:
> > 
> > On Wed, 4 Mar 2020, Jonathan Corbet wrote:
> > 
> > > On Wed,  4 Mar 2020 08:29:50 +0100
> > > Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > > > Jonathan, pick pick this patch for doc-next.
> > > 
> > > Sigh, I need to work a MAINTAINERS check into my workflow...
> > > 
> > 
> > I getting closer to have zero warnings on the MAINTAINER file matches and 
> > then, I would set up a bot following the mailing lists to warn when anyone
> > sends a patch that potentially introduces such warning.
> 
> Hey Lukas.
> 
> I wrote a hacky script that sent emails
> for invalid MAINTAINER F: and X: patterns
> a couple years back.
> 
> I ran it in September 2018 and March 2019.
> 
> It's attached if you want to play with it.
> The email sending bit is commented out.
> 
> The script is used like:
> 
> $ perl ./scripts/get_maintainer.pl --self-test=patterns | \
>   cut -f2 -d: | \
>   while read line ; do \
>     perl ./dump_section.perl $line \
>   done
> 

Thanks, Joe. That is certainly helpful, I will try to make use of it in 
the future; fortunately, there really not too many invalid F: patterns 
left, and I can send the last few patches out myself.

Lukas
 
