From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 11 Dec 2015 18:18:14 +0000
Subject: Re: [PATCH] bpf: constify bpf_verifier_ops structure
Message-Id: <566B1366.8000309@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

On 12/11/2015 06:35 PM, Julia Lawall wrote:
> This bpf_verifier_ops structure is never modified, like the other
> bpf_verifier_ops structures, so declare it as const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks Julia!

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
