From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 28 Feb 2020 10:00:43 +0000
Subject: Re: [PATCH v2] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <57b79bdd-36f1-c8c3-e1d3-7d21db47a8f3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158287861133.18632.12035327305997207220.stgit@devnote2>
 <158287862131.18632.11822701514141299400.stgit@devnote2>
In-Reply-To: <158287862131.18632.11822701514141299400.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/Documentation/admin-guide/bootconfig.rst
…
> +… All sub-keys under "kernel" root key are passed as a part of
> +kernel command line [1]_, and ones under "init" root key are passed as a part
> +of init command line. …

Can an enumeration be clearer for this information?

Will the distinction become more interesting for well-known keys?

Regards,
Markus
