From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 23 May 2017 05:18:06 +0000
Subject: Re: kernel-trace: Fine-tuning for seven function implementations
Message-Id: <20170523011806.160592bc@vmware.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
        <20170505170607.2555fdcf@gandalf.local.home>
        <71dfc742-c90d-e12b-83a0-424d9c51ac35@users.sourceforge.net>
In-Reply-To: <71dfc742-c90d-e12b-83a0-424d9c51ac35@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 22 May 2017 09:45:27 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> > I wont be touching or even looking at these until after 4.12-rc1 is
> > released. Feel free to reply to this email with a ping in a week or
> > two.  
> 
> *ping*
> 
> How do you think about to give these update suggestions another look?
>

The conversions of the seq_printf()s and friends are fine, but the rest
are not worth the churn. Yes checkpatch may complain about the NULL
compares and the kallocs(), but that's for new code, not for code that
has already been accepted.

-- Steve
