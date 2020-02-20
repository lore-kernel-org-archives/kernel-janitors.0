From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Thu, 20 Feb 2020 13:13:40 +0000
Subject: Re: [for-next][PATCH 12/26] Documentation: bootconfig: Add a doc for extended boot config
Message-Id: <20200220221340.2b66fd2051a5da74775c474b@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
In-Reply-To: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tim Bird <Tim.Bird@sony.com>, Tom Zanussi <tom.zanussi@linux.intel.com>

Hi,

On Thu, 20 Feb 2020 10:10:20 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> I wonder about a few details in the added text.
> 
> 
> …
> > +++ b/Documentation/admin-guide/bootconfig.rst
> …
> > +C onfig File Limitation
> 
> How do you think about to omit a space character at the beginning
> of this line?

That was my mistake. I used restructured text extension for vim
which collapsed all sections and use "space" key to expand.
Accidentally, I run into edit mode and hit "space" to expand it.
(it actually expanded but also put a space there and I missed it...)

Anyway, it has been fixed (pointed by Rundy)

> > +Currently the maximum config size size is 32KB …
> 
> Would you like to avoid a word duplication here?

Oops, still exist. Thanks!


> > +Note: this is not the number of entries but nodes, an entry must consume
> > +more than 2 nodes (a key-word and a value). …
> 
> I find the relevance of the term “nodes” unclear at the moment.

Indeed, "node" is not well defined. What about this?
---
Each key consists of words separated by dot, and value also consists of
values separated by comma. Here, each word and each value is generally
called a "node".
---

> 
> Could an other wording be nicer than the abbreviation “a doc for … config”
> in the commit subject?

OK, I'll try next time. 

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
