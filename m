From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 21 Jan 2021 19:44:15 +0000
Subject: Re: [PATCH] arch/Kconfig: update a broken file reference
Message-Id: <20210121144415.7b2ddf3c@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210119095326.13896-1-lukas.bulwahn@gmail.com>
        <20210121114458.614ee8da@lwn.net>
In-Reply-To: <20210121114458.614ee8da@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 21 Jan 2021 11:44:58 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> On Tue, 19 Jan 2021 10:53:26 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> > Commit adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
> > added the config HAVE_64BIT_ALIGNED_ACCESS back into arch/Kconfig with this
> > revert. In the meantime, commit c9b54d6f362c ("docs: move other kAPI
> > documents to core-api") changed ./Documentation/unaligned-memory-access.txt
> > to ./Documentation/core-api/unaligned-memory-access.rst.
> > 
> > Fortunately, ./scripts/documentation-file-ref-check detects this and warns
> > about this broken reference.
> > 
> > Update the file reference in arch/Kconfig.
> > 
> > Fixes: adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on current master and next-20210118
> > 
> > Steven, could you pick this fix to your commit or, at least, ack it so that
> > Jonathan can pick it?  
> 
> I've gone ahead and applied it, thanks.


Thanks Jon!

-- Steve
