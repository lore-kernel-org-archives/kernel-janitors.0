From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 11 Dec 2015 18:19:30 +0000
Subject: Re: [PATCH] bpf: constify bpf_verifier_ops structure
Message-Id: <20151211181929.GB59096@ast-mbp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
 <20151211131256.41097162@gandalf.local.home>
In-Reply-To: <20151211131256.41097162@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

On Fri, Dec 11, 2015 at 01:12:56PM -0500, Steven Rostedt wrote:
> On Fri, 11 Dec 2015 18:35:59 +0100
> Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> 
> > This bpf_verifier_ops structure is never modified, like the other
> > bpf_verifier_ops structures, so declare it as const.
> > 
> > Done with the help of Coccinelle.
> 
> Thanks, I'll add this to my 4.5 queue.

emails crossed. this is also fine with me.

