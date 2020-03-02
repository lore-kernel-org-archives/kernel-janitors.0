From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 02 Mar 2020 09:10:08 +0000
Subject: Re: [PATCH v3] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <385d2d20-5f5d-529f-471c-89d0b4c3efd7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158313621831.3082.9886161529613724376.stgit@devnote2>
 <158313622831.3082.8237132211731864948.stgit@devnote2>
In-Reply-To: <158313622831.3082.8237132211731864948.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +If you think that kernel/init options becomes too long to write in boot-loader
> +configuration file or you want to comment on each option, the boot
> +configuration may be suitable.

I have got still understanding difficulties for this wording.
How do you choose to distribute settings between the mentioned places?


> +Also, some features may depend on the boot configuration, and it has own
> +root key.

Will the key hierarchy need any further clarification?


> + # make O=<builddir> -C tools/bootconfig

Can the order of these parameters matter?


> +The boot configuration syntax is a simple structured key-value.

Would you like to discuss any extensions for such software?

Regards,
Markus
