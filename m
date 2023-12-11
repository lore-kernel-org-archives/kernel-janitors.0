Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65DC8C8;
	Mon, 11 Dec 2023 18:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223D0C433C7;
	Mon, 11 Dec 2023 18:46:20 +0000 (UTC)
Date: Mon, 11 Dec 2023 13:47:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231211134700.2c90f106@gandalf.local.home>
In-Reply-To: <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Oct 2023 17:38:15 -0600
"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> On 10/18/23 22:11, Dan Carpenter wrote:
> > Yesterday someone on my lists just sent an email looking for kernel
> > tasks.  This was a university student in a kernel programming class.
> > We also have kernel-janitors and outreachy and those people are always
> > asking for small tasks.  
> 
> We have tons of issues waiting to be audited and fixed here:
> 
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You will never run out of fun. :) People just need to sign up.
> 
> That's really a great way to learn and gain experience across the whole
> kernel tree.
>

The difference between this and the KTODO is that the above is bugs that a
bot has discovered, right?

Although I agree that fixing bugs is a great way to learn the kernel, in
some cases people want to create a feature. At least that's a bit more
rewarding.

Currently, while working on adding a feature to the tracing ring buffer,
I've come across several bugs (that I fixed), but also a list of "nice to
haves".

That is, small feature enhancements that make the system better, that I
simply do not have the time to implement. This is where I think KTODO is
useful. If someone wants to add these enhancements, I'd be happy to help
them out (sparingly).

-- Steve
