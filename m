From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Tue, 18 Jan 2005 05:03:37 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41EC98A9.1040407@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer escreveu:
> Hi.
> 
> Removed some finished, invalid, duplicate entries.
> Replaced inline explanation with summary and URL to original post.
> Comments, objections to any change?
> 
> Second stage, that i'm doing now is to put stuff into sections (like it
> is at the beginning of file).
> I'm also thinking about ordering from easiest to hardest.
> Ideas, comments?

I suggest not removing the "finished stuff", just move them to a "finished
as of 2.6.something", as these cases may well come back in the future, say
when something big like infiniband gets merged it can come packed with
those "finished" things 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
