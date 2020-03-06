From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 06 Mar 2020 14:04:06 +0000
Subject: Re: [PATCH v5.1] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <20200306230406.dd9c7358f00f47ff5760c899@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef820445-25c5-a312-57d4-25ff3b4d08cf@infradead.org>
        <158341540688.4236.11231142256496896074.stgit@devnote2>
        <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
        <20200306105107.afba066a97db1eb12f290aff@kernel.org>
        <58f4d6b3-ce3d-d1a5-aa0f-c31c1bbec091@web.de>
In-Reply-To: <58f4d6b3-ce3d-d1a5-aa0f-c31c1bbec091@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 6 Mar 2020 10:34:30 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> > If you think you have "any more" update candidates, feel free to make
> > an update "patch" and send to us.
> 
> I pointed a few change possibilities out already.

I can not respond to requests only for possibility.

> > That will be the next step.
> 
> I got the impression that we are in the process of constructing another patch together
> which will fix known wording weaknesses.

Would you mean the broken EBNF part? Yeah, maybe, but it is another story.
I decided to drop it this time.
You can refine it but please use better format instead of such incomplete one.

> By the way:
> I wonder about the shown version identifier.
> Will the patch numbering need also further considerations?

No.

> >> …
> >>> +++ b/Documentation/admin-guide/bootconfig.rst
> >> …
> >>> +If you think that kernel/init options become too long to write in boot-loader
> >>> +configuration file or you want to comment on each option, the boot
> >>> +configuration may be suitable. …
> >>
> >> Would you like to specify any settings in the boot configuration file
> >> because the provided storage capacity would be too limited by the kernel command line?
> >
> > Yes.
> 
> How will affected places be improved after such an agreement?

Would you please make a patch of new sentence?

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
