From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 21 Feb 2020 16:43:32 +0000
Subject: Re: [for-next][12/26] Documentation: bootconfig: Add a doc for extended boot config
Message-Id: <5ade73b0-a3e8-e71a-3685-6485f37ac8b7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23e371ca-5df8-3ae3-c685-b01c07b55540@web.de>
 <20200220221340.2b66fd2051a5da74775c474b@kernel.org>
 <5ed96b7b-7485-1ea0-16e2-d39c14ae266d@web.de>
 <20200221191637.e9eed4268ff607a98200628c@kernel.org>
In-Reply-To: <20200221191637.e9eed4268ff607a98200628c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tim Bird <Tim.Bird@sony.com>, Tom Zanussi <tom.zanussi@linux.intel.com>

>> Is there a need to separate the number from the following unit?
>
> Sorry, I couldn't understand what you pointed here.

Can the specification “… size is 32 KiB …”be more appropriate
(besides a small wording adjustment)?


> Like "descriptions of ..." ?

I got another idea also for the provided documentation format.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/admin-guide/bootconfig.rst?id=bee46b309a13ca158c99c325d0408fb2f0db207f#n18

* Will a file format description become helpful in the way of
  an extended Backus–Naur form?

* How will data processing evolve around the added structures?

Regards,
Markus
