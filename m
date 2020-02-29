From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 29 Feb 2020 09:00:22 +0000
Subject: Re: [PATCH 2/2] Documentation: bootconfig: Add EBNF syntax file
Message-Id: <c3ea656f-7520-2cb4-7f39-92612343d7bf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158278834245.14966.6179457011671073018.stgit@devnote2>
 <158278836196.14966.3881489301852781521.stgit@devnote2>
In-Reply-To: <158278836196.14966.3881489301852781521.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +Syntax in EBNF
> +--------------
> +
> +Here is the boot configuration file syntax written in EBNF.
> +
> +.. include:: bootconfig.ebnf
> +   :literal:

How do you think about to move the content for this section into another RST file
so that it can be used as a text module?

Would you like to improve the outline and corresponding reuse
for such information any further?

Regards,
Markus
