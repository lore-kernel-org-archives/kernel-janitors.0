Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB1A28
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83491C433C8;
	Wed,  1 Nov 2023 18:17:08 +0000 (UTC)
Date: Wed, 1 Nov 2023 14:17:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gregkh@linuxfoundation.org, keescook@chromium.org, willy@infradead.org,
 senozhatsky@chromium.org, list@mail.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] seq_buf: Export seq_buf_putc() &nd seq_buf_puts()
Message-ID: <20231101141705.4208d441@gandalf.local.home>
In-Reply-To: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  1 Nov 2023 18:59:04 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> seq_buf_putc() has a potential real use-case (link in the patch), but 
> seq_buf_puts() has currently no forseen use-case, so I have split it in 2
> patches if only the 1st one is accepted.
> 
> Christophe JAILLET (2):
>   seq_buf: Export seq_buf_putc()
>   seq_buf: Export seq_buf_puts()
> 
>  lib/seq_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

I can pull these in as I'm getting ready for my pull request to Linus soon
(and just kicked off my testing).

Or do you need them as part of the patch you mentioned? When does that need
to go in? Can it wait till it hits Linus's tree?

-- Steve
