From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 20 Feb 2020 09:10:20 +0000
Subject: Re: [for-next][PATCH 12/26] Documentation: bootconfig: Add a doc for extended boot config
Message-Id: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tim Bird <Tim.Bird@sony.com>, Tom Zanussi <tom.zanussi@linux.intel.com>

I wonder about a few details in the added text.


…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +C onfig File Limitation

How do you think about to omit a space character at the beginning
of this line?


> +Currently the maximum config size size is 32KB …

Would you like to avoid a word duplication here?


> +Note: this is not the number of entries but nodes, an entry must consume
> +more than 2 nodes (a key-word and a value). …

I find the relevance of the term “nodes” unclear at the moment.


Could an other wording be nicer than the abbreviation “a doc for … config”
in the commit subject?

Regards,
Markus
