From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 06 Mar 2020 01:51:07 +0000
Subject: Re: [PATCH v5.1] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <20200306105107.afba066a97db1eb12f290aff@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef820445-25c5-a312-57d4-25ff3b4d08cf@infradead.org>
        <158341540688.4236.11231142256496896074.stgit@devnote2>
        <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
In-Reply-To: <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 5 Mar 2020 15:00:14 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> > Changes in v5.1:
> >  - Fix some mistakes (Thanks Randy!)
> 
> Do you need any more reminders for remaining update candidates?

Hmm, no, I don't need it any more at this point. This is good enough.

If you think you have "any more" update candidates, feel free to make
an update "patch" and send to us. That will be the next step.

> …
> > +++ b/Documentation/admin-guide/bootconfig.rst
> …
> > +If you think that kernel/init options become too long to write in boot-loader
> > +configuration file or you want to comment on each option, the boot
> > +configuration may be suitable. …
> 
> Would you like to specify any settings in the boot configuration file
> because the provided storage capacity would be too limited by the kernel command line?

Yes.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
