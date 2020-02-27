From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 27 Feb 2020 19:53:03 +0000
Subject: Re: [PATCH 2/2] Documentation: bootconfig: Add EBNF syntax file
Message-Id: <2390b729-1b0b-26b5-66bc-92e40e3467b1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158278834245.14966.6179457011671073018.stgit@devnote2>
 <158278836196.14966.3881489301852781521.stgit@devnote2>
In-Reply-To: <158278836196.14966.3881489301852781521.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for such a contribution.


> Add an extended Backus–Naur form (EBNF) syntax file for

Can it matter to mention the specific file format specification version
which should be applied finally?

Would you like to refer to any standard variant?


> bootconfig so that user can logically understand how they

Wording alternative “… that users can …”?


> can write correct boot configuration file.

Related development tools provide some benefits then, don't they?



…
> +++ b/Documentation/admin-guide/bootconfig.ebnf
…
> +digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;

Can the specification of such alternatives (or value ranges) become
more compact (depending on a selected standard)?


…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +Here is the boot configuration file syntax written in EBNF.

I suggest to replace the abbreviation “EBNF” by the term “extended Backus–Naur form”
in such a sentence.

Regards,
Markus
