From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 27 Feb 2020 19:12:17 +0000
Subject: Re: [PATCH 1/2] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <8514c830-319b-33e9-025a-79d399674fb3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158278834245.14966.6179457011671073018.stgit@devnote2>
 <158278835238.14966.16157216423901327777.stgit@devnote2>
In-Reply-To: <158278835238.14966.16157216423901327777.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +This allows administrators to pass a structured-Key configuration file

Does capitalisation matter here for the word “Key”?


> +If you think that kernel/init options becomes too long to write in boot-loader
> +configuration file or want to comment on each options, you can use this

Can the following wording variant be a bit nicer?

+… or you want to comment on each option, …


> +Also, some subsystem may depend on the boot configuration, and it has own
> +root key.

Would you like to explain the influence of a key hierarchy any further?


> +The boot configuration syntax allows user to merge partially same word keys
>  by brace. For example::

“by braces.
For example::”?


> +The file /proc/bootconfig is a user-space interface to the configuration

“… is an user-…”?


> +Currently the maximum configuration size is 32 KiB and the total number
> +of key-words and values must be under 1024 nodes.

* How were these constraints chosen?

* Can such system limits become more configurable?


> +(Note: Each key consists of words separated by dot, and value also consists
> +of values separated by comma. Here, each word and each value is generally
> +called a "node".)

I would prefer the interpretation that nodes contain corresponding attributes.

How do you think about to add a link to a formal file format description?

Regards,
Markus
