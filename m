From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 11 Dec 2015 18:18:29 +0000
Subject: Re: [PATCH] bpf: constify bpf_verifier_ops structure
Message-Id: <20151211181828.GA59096@ast-mbp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Steven Rostedt <rostedt@goodmis.org>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

On Fri, Dec 11, 2015 at 06:35:59PM +0100, Julia Lawall wrote:
> This bpf_verifier_ops structure is never modified, like the other
> bpf_verifier_ops structures, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Alexei Starovoitov <ast@kernel.org>

Ingo, can you take it into tip ? Thanks!

