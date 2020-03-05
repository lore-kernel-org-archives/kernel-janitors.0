From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 05 Mar 2020 14:00:14 +0000
Subject: Re: [PATCH v5.1] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef820445-25c5-a312-57d4-25ff3b4d08cf@infradead.org>
 <158341540688.4236.11231142256496896074.stgit@devnote2>
In-Reply-To: <158341540688.4236.11231142256496896074.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Changes in v5.1:
>  - Fix some mistakes (Thanks Randy!)

Do you need any more reminders for remaining update candidates?


…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +If you think that kernel/init options become too long to write in boot-loader
> +configuration file or you want to comment on each option, the boot
> +configuration may be suitable. …

Would you like to specify any settings in the boot configuration file
because the provided storage capacity would be too limited by the kernel command line?

Regards,
Markus
