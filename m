From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 25 Feb 2020 10:29:51 +0000
Subject: Re: [for-next][12/26] Documentation: bootconfig: Add a doc for extended boot config
Message-Id: <20200225192951.b7753d3cf31fda2dcaa12fdb@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
        <20200220221340.2b66fd2051a5da74775c474b@kernel.org>
        <5ed96b7b-7485-1ea0-16e2-d39c14ae266d@web.de>
        <20200221191637.e9eed4268ff607a98200628c@kernel.org>
        <5ade73b0-a3e8-e71a-3685-6485f37ac8b7@web.de>
        <20200222131833.56a5be2d36033dc5a77a9f0b@kernel.org>
        <370e675a-598e-71db-8213-f5494b852a71@web.de>
        <20200223005615.79f308e2ca0717132bb2887b@kernel.org>
        <8cc7e621-c5e3-28fa-c789-0bb7c55d77d6@web.de>
        <20200224121302.5b730b519d550eb34da720a5@kernel.org>
        <25dd284f-6122-c01b-ef22-901c3e0bdf37@web.de>
        <20200225154903.f636acde809a304bfccf4995@kernel.org>
        <8c99a63b-b1b9-a1ba-fa2a-38d1573f18b1@web.de>
In-Reply-To: <8c99a63b-b1b9-a1ba-fa2a-38d1573f18b1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tim Bird <Tim.Bird@sony.com>, Tom Zanussi <tom.zanussi@linux.intel.com>

On Tue, 25 Feb 2020 08:56:41 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> >> How do you think about to clarify any additional software design options
> >> around involved data structures?
> >
> > Sorry, what would you mean the "involved data structures" here?
> > Would you mean the usage of APIs or when to use bootconfig or command line?
> 
> Additional system boot parameters can be managed also by a single file.
> The file format will trigger specific parsing efforts.

Maybe. If someone is interested in expanding their command, (e.g. vim)
they can use EBNF to understand syntax, or directly reuse lib/bootconfig.c
which provides a compact parser. :)

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
