From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 21 Feb 2020 10:16:37 +0000
Subject: Re: [for-next][PATCH 12/26] Documentation: bootconfig: Add a doc for extended boot config
Message-Id: <20200221191637.e9eed4268ff607a98200628c@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
        <20200220221340.2b66fd2051a5da74775c474b@kernel.org>
        <5ed96b7b-7485-1ea0-16e2-d39c14ae266d@web.de>
In-Reply-To: <5ed96b7b-7485-1ea0-16e2-d39c14ae266d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tim Bird <Tim.Bird@sony.com>, Tom Zanussi <tom.zanussi@linux.intel.com>

On Thu, 20 Feb 2020 16:00:23 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> >>> +Currently the maximum config size size is 32KB …
> >>
> >> Would you like to avoid a word duplication here?
> >
> > Oops, still exist.
> 
> Is there a need to separate the number from the following unit?

Sorry, I couldn't understand what you pointed here. Would you mean the
number of file size and nodes?

> > Indeed, "node" is not well defined. What about this?
> > ---
> > Each key consists of words separated by dot, and value also consists of
> > values separated by comma. Here, each word and each value is generally
> > called a "node".
> 
> I have got still understanding difficulties with such an interpretation.
> 
> * Do other contributors find an other word also more appropriate for this use case?

No.

> * How will the influence evolve for naming these items?

Node is used in its API, but from the user's point of view, I think it
is OK to use "key-word" and "value".
Also, since it is hard to count those numbers by manual, I think user
can depend on tools/bootconfig which shows the number of node in the
configuration file now.

> * Is each element just a string (according to specific rules)?

Yes.

> >> Could an other wording be nicer than the abbreviation “a doc for … config”
> >> in the commit subject?
> >
> > OK, I'll try next time.
> 
> Will words like “descriptions”and “configuration”be helpful?

Like "descriptions of ..." ?

Thank you,

> 
> Regards,
> Markus


-- 
Masami Hiramatsu <mhiramat@kernel.org>
